; ModuleID = 'bpf/sub64_ir.c'
source_filename = "bpf/sub64_ir.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

; Function Attrs: alwaysinline norecurse nounwind readnone
define dso_local i64 @sub64_ir(i64, i64) local_unnamed_addr #0 {
  %3 = trunc i64 %0 to i32
  %4 = trunc i64 %1 to i32
  %5 = sub i32 %3, %4
  %6 = zext i32 %5 to i64
  %7 = lshr i64 %0, 32
  %8 = lshr i64 %1, 32
  %9 = trunc i64 %7 to i32
  %10 = trunc i64 %8 to i32
  %11 = sub i32 %9, %10
  %12 = icmp ult i32 %3, %4
  %13 = zext i1 %12 to i32
  %14 = sub i32 %11, %13
  %15 = zext i32 %14 to i64
  %16 = shl i64 %15, 32
  %17 = or i64 %16, %6
  ret i64 %17
}

attributes #0 = { alwaysinline norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.1 (Fedora 7.0.1-4.fc29)"}
