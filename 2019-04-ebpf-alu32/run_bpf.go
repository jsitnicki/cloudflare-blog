package main

import (
	"fmt"
	"os"
	"strconv"
	"syscall"

	"github.com/newtools/ebpf"
)

const (
	SO_ATTACH_BPF = 50
)

const (
	ARG_0 uint32 = iota
	ARG_1
	RES_0
	RES_1
)

func loadBPF() (sockPair [2]int, argsMap *ebpf.Map, err error) {
	coll, err := ebpf.LoadCollection("bpf/filter.o")
	if err != nil {
		return
	}
	defer coll.Close()

	prog := coll.DetachProgram("filter")
	if prog == nil {
		err = fmt.Errorf("program 'filter' not found")
		return
	}
	defer prog.Close()

	argsMap = coll.DetachMap("args")
	if argsMap == nil {
		err = fmt.Errorf("map 'args' not found")
		return
	}

	sockPair, err = syscall.Socketpair(syscall.AF_UNIX, syscall.SOCK_DGRAM, 0)
	if err != nil {
		return
	}

	err = syscall.SetsockoptInt(sockPair[0], syscall.SOL_SOCKET, SO_ATTACH_BPF, prog.FD())
	if err != nil {
		return
	}

	return
}

func runBPF(sockPair [2]int, argsMap *ebpf.Map, arg0, arg1 uint64) (res0, res1 uint64, err error) {
	err = argsMap.Put(ARG_0, arg0)
	if err != nil {
		return
	}
	err = argsMap.Put(ARG_1, arg1)
	if err != nil {
		return
	}

	// Run an empty message through the BPF filter.
	_, err = syscall.Write(sockPair[1], nil)
	if err != nil {
		return
	}
	_, err = syscall.Read(sockPair[0], nil)
	if err != nil {
		return
	}

	_, err = argsMap.Get(RES_0, &res0)
	if err != nil {
		return
	}
	_, err = argsMap.Get(RES_1, &res1)
	if err != nil {
		return
	}

	return
}

func parseArgs() (uint64, uint64) {
	if len(os.Args) < 3 {
		fmt.Fprintf(os.Stderr, "Usage: run-bpf uint64 uint64\n")
		os.Exit(1)
	}

	arg0, err := strconv.ParseUint(os.Args[1], 0, 64)
	if err != nil {
		panic(err)
	}
	arg1, err := strconv.ParseUint(os.Args[2], 0, 64)
	if err != nil {
		panic(err)
	}
	return arg0, arg1
}

func main() {
	arg0, arg1 := parseArgs()

	var (
		sockPair [2]int
		argsMap  *ebpf.Map
	)
	sockPair, argsMap, err := loadBPF()
	if err != nil {
		panic(err)
	}
	defer func() {
		argsMap.Close()
		syscall.Close(sockPair[0])
		syscall.Close(sockPair[1])
	}()

	sum, diff, err := runBPF(sockPair, argsMap, arg0, arg1)
	if err != nil {
		panic(err)
	}

	fmt.Printf("arg0 %20d %#016[1]x\n", arg0)
	fmt.Printf("arg1 %20d %#016[1]x\n", arg1)
	fmt.Printf(" sum %20d %#016[1]x\n", sum)
	fmt.Printf("diff %20d %#016[1]x\n", diff)
}
