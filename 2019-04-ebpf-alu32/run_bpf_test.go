package main

import (
	"os"
	"testing"
)

var ctx *Context

func TestMain(m *testing.M) {
	var err error

	ctx, err = loadBPF()
	if err != nil {
		panic(err)
	}
	defer ctx.Close()

	rc := m.Run()
	os.Exit(rc)
}

func TestBpfSub64(t *testing.T) {
	tests := []struct {
		A, B uint64
	}{
		{0, 0},
		{1, 0},
		{5, 2},
		{7, 13},

		{(2 << 32) - 1, 0},
		{(2 << 32), 0},
		{(2 << 32) + 1, 0},

		{(2 << 32) + 1, (2 << 32) - 1},
		{(2 << 32) + 1, (2 << 32)},
		{(2 << 32) + 1, (2 << 32) + 1},

		{(2 << 32) + 2, (2 << 32) + 1},
	}

	for _, test := range tests {
		testBpfSub64(t, test.A, test.B)
		testBpfSub64(t, test.B, test.A)
	}
}

func testBpfSub64(t *testing.T, arg0, arg1 uint64) {
	diff, err := runBPF(ctx, arg0, arg1)
	if err != nil {
		t.Fatalf("runBPF(%#x, %#x) failed: %v", arg0, arg1, err)
	}
	want := arg0 - arg1
	if diff != want {
		t.Fatalf("runBPF(%#x, %#x) = %#x, want %#x", arg0, arg1, diff, want)
	}

}
