; ModuleID = 'minitest.c'
source_filename = "minitest.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c", Hello!\0A\00", align 1
@key = dso_local global i8* null, align 8
@i = dso_local global i32 0, align 4
@ciphertext = dso_local global i8* null, align 8
@.str.1 = private unnamed_addr constant [18 x i8] c"Enter your name: \00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%19s\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"Enter your text: \00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"%1023s\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"Encrypted text: \00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"%02X\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @greeter(i8* noundef %0) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = call i32 (i8*, ...) @printf(i8* noundef %3)
  %5 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0))
  ret void
}

declare i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @initkey(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = sext i32 %3 to i64
  %5 = call noalias i8* @malloc(i64 noundef %4) #4
  store i8* %5, i8** @key, align 8
  store i32 0, i32* @i, align 4
  br label %6

6:                                                ; preds = %15, %1
  %7 = load i32, i32* @i, align 4
  %8 = load i32, i32* %2, align 4
  %9 = icmp ult i32 %7, %8
  br i1 %9, label %10, label %18

10:                                               ; preds = %6
  %11 = load i8*, i8** @key, align 8
  %12 = load i32, i32* @i, align 4
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds i8, i8* %11, i64 %13
  store i8 65, i8* %14, align 1
  br label %15

15:                                               ; preds = %10
  %16 = load i32, i32* @i, align 4
  %17 = add i32 %16, 1
  store i32 %17, i32* @i, align 4
  br label %6, !llvm.loop !6

18:                                               ; preds = %6
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias i8* @malloc(i64 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @encrypt(i8* noundef %0, i32 noundef %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %4, align 4
  %6 = sext i32 %5 to i64
  %7 = call noalias i8* @malloc(i64 noundef %6) #4
  store i8* %7, i8** @ciphertext, align 8
  store i32 0, i32* @i, align 4
  br label %8

8:                                                ; preds = %31, %2
  %9 = load i32, i32* @i, align 4
  %10 = load i32, i32* %4, align 4
  %11 = icmp ult i32 %9, %10
  br i1 %11, label %12, label %34

12:                                               ; preds = %8
  %13 = load i8*, i8** %3, align 8
  %14 = load i32, i32* @i, align 4
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds i8, i8* %13, i64 %15
  %17 = load i8, i8* %16, align 1
  %18 = sext i8 %17 to i32
  %19 = load i8*, i8** @key, align 8
  %20 = load i32, i32* @i, align 4
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds i8, i8* %19, i64 %21
  %23 = load i8, i8* %22, align 1
  %24 = sext i8 %23 to i32
  %25 = xor i32 %18, %24
  %26 = trunc i32 %25 to i8
  %27 = load i8*, i8** @ciphertext, align 8
  %28 = load i32, i32* @i, align 4
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8* %27, i64 %29
  store i8 %26, i8* %30, align 1
  br label %31

31:                                               ; preds = %12
  %32 = load i32, i32* @i, align 4
  %33 = add i32 %32, 1
  store i32 %33, i32* @i, align 4
  br label %8, !llvm.loop !8

34:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [20 x i8], align 16
  %3 = alloca [1024 x i8], align 16
  store i32 0, i32* %1, align 4
  %4 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0))
  %5 = getelementptr inbounds [20 x i8], [20 x i8]* %2, i64 0, i64 0
  %6 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i8* noundef %5)
  %7 = getelementptr inbounds [20 x i8], [20 x i8]* %2, i64 0, i64 0
  call void @greeter(i8* noundef %7)
  %8 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0))
  %9 = getelementptr inbounds [1024 x i8], [1024 x i8]* %3, i64 0, i64 0
  %10 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0), i8* noundef %9)
  %11 = getelementptr inbounds [1024 x i8], [1024 x i8]* %3, i64 0, i64 0
  %12 = call i64 @strlen(i8* noundef %11) #5
  %13 = trunc i64 %12 to i32
  call void @initkey(i32 noundef %13)
  %14 = getelementptr inbounds [1024 x i8], [1024 x i8]* %3, i64 0, i64 0
  %15 = getelementptr inbounds [1024 x i8], [1024 x i8]* %3, i64 0, i64 0
  %16 = call i64 @strlen(i8* noundef %15) #5
  %17 = trunc i64 %16 to i32
  call void @encrypt(i8* noundef %14, i32 noundef %17)
  %18 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0))
  store i32 0, i32* @i, align 4
  br label %19

19:                                               ; preds = %33, %0
  %20 = load i32, i32* @i, align 4
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds [1024 x i8], [1024 x i8]* %3, i64 0, i64 0
  %23 = call i64 @strlen(i8* noundef %22) #5
  %24 = icmp ult i64 %21, %23
  br i1 %24, label %25, label %36

25:                                               ; preds = %19
  %26 = load i8*, i8** @ciphertext, align 8
  %27 = load i32, i32* @i, align 4
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds i8, i8* %26, i64 %28
  %30 = load i8, i8* %29, align 1
  %31 = sext i8 %30 to i32
  %32 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i32 noundef %31)
  br label %33

33:                                               ; preds = %25
  %34 = load i32, i32* @i, align 4
  %35 = add i32 %34, 1
  store i32 %35, i32* @i, align 4
  br label %19, !llvm.loop !9

36:                                               ; preds = %19
  %37 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0))
  ret i32 0
}

declare i32 @__isoc99_scanf(i8* noundef, ...) #1

; Function Attrs: nounwind readonly willreturn
declare i64 @strlen(i8* noundef) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.0"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
