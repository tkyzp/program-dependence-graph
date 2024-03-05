; ModuleID = '1.c'
source_filename = "1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @fun(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = call noalias ptr @malloc(i64 noundef 4) #2
  %4 = load ptr, ptr %2, align 8
  store ptr %3, ptr %4, align 8
  %5 = call noalias ptr @malloc(i64 noundef 4) #2
  %6 = load ptr, ptr %2, align 8
  store ptr %5, ptr %6, align 8
  %7 = call noalias ptr @malloc(i64 noundef 4) #2
  %8 = load ptr, ptr %2, align 8
  store ptr %7, ptr %8, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = load ptr, ptr %9, align 8
  ret ptr %10
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @fun2() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca i32, align 4
  %3 = call noalias ptr @malloc(i64 noundef 4) #2
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 4) #2
  store ptr %4, ptr %1, align 8
  %5 = call noalias ptr @malloc(i64 noundef 4) #2
  store ptr %5, ptr %1, align 8
  %6 = load ptr, ptr %1, align 8
  %7 = ptrtoint ptr %6 to i32
  %8 = add nsw i32 %7, 4
  store i32 %8, ptr %2, align 4
  %9 = load ptr, ptr %1, align 8
  %10 = ptrtoint ptr %9 to i32
  %11 = add nsw i32 %10, 1
  %12 = sext i32 %11 to i64
  %13 = inttoptr i64 %12 to ptr
  store ptr %13, ptr %1, align 8
  %14 = call ptr @fun(ptr noundef %1)
  %15 = load ptr, ptr %1, align 8
  ret ptr %15
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.0"}
