; ModuleID = '1.c'
source_filename = "1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @fun(ptr noundef %0) #0 !dbg !10 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !17, metadata !DIExpression()), !dbg !18
  %3 = call noalias ptr @malloc(i64 noundef 4) #3, !dbg !19
  %4 = load ptr, ptr %2, align 8, !dbg !20
  store ptr %3, ptr %4, align 8, !dbg !21
  %5 = call noalias ptr @malloc(i64 noundef 4) #3, !dbg !22
  %6 = load ptr, ptr %2, align 8, !dbg !23
  store ptr %5, ptr %6, align 8, !dbg !24
  %7 = call noalias ptr @malloc(i64 noundef 4) #3, !dbg !25
  %8 = load ptr, ptr %2, align 8, !dbg !26
  store ptr %7, ptr %8, align 8, !dbg !27
  %9 = load ptr, ptr %2, align 8, !dbg !28
  %10 = load ptr, ptr %9, align 8, !dbg !29
  ret ptr %10, !dbg !30
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

define i8 @foo() {
entry:
  %p1 = alloca i8
  %p2 = alloca i8
  %p3 = alloca i8
  store i8 0, ptr %p3
  br label %while.cond

while.cond:
  br i1 undef, label %if.then, label %if.else

if.then:
  store i8 0, ptr %p1
  br label %if.end

if.else:
  store i8 1, ptr %p2
  br label %if.end

if.end:
  %0 = load i8, ptr %p1
  store i8 2, ptr %p2
  %1 = load i8, ptr %p2
  br label %while.cond
  ret i8 %1
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @fun2() #0 !dbg !31 {
  %1 = alloca ptr, align 8
  call void @llvm.dbg.declare(metadata ptr %1, metadata !34, metadata !DIExpression()), !dbg !35
  %2 = call noalias ptr @malloc(i64 noundef 4) #3, !dbg !36
  store ptr %2, ptr %1, align 8, !dbg !37
  %3 = call noalias ptr @malloc(i64 noundef 4) #3, !dbg !38
  store ptr %3, ptr %1, align 8, !dbg !39
  %4 = call noalias ptr @malloc(i64 noundef 4) #3, !dbg !40
  store ptr %4, ptr %1, align 8, !dbg !41
  %5 = call ptr @fun(ptr noundef %1), !dbg !42
  %6 = load ptr, ptr %1, align 8, !dbg !43
  ret ptr %6, !dbg !44
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 15.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "1.c", directory: "/home/yzp/program-dependence-graph", checksumkind: CSK_MD5, checksum: "4b08e1851bbca40c2285def152469b46")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 2}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"clang version 15.0.0"}
!10 = distinct !DISubprogram(name: "fun", scope: !1, file: !1, line: 3, type: !11, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !15}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!16 = !{}
!17 = !DILocalVariable(name: "q", arg: 1, scope: !10, file: !1, line: 3, type: !15)
!18 = !DILocation(line: 3, column: 19, scope: !10)
!19 = !DILocation(line: 4, column: 10, scope: !10)
!20 = !DILocation(line: 4, column: 6, scope: !10)
!21 = !DILocation(line: 4, column: 8, scope: !10)
!22 = !DILocation(line: 5, column: 10, scope: !10)
!23 = !DILocation(line: 5, column: 6, scope: !10)
!24 = !DILocation(line: 5, column: 8, scope: !10)
!25 = !DILocation(line: 6, column: 10, scope: !10)
!26 = !DILocation(line: 6, column: 6, scope: !10)
!27 = !DILocation(line: 6, column: 8, scope: !10)
!28 = !DILocation(line: 8, column: 13, scope: !10)
!29 = !DILocation(line: 8, column: 12, scope: !10)
!30 = !DILocation(line: 8, column: 5, scope: !10)
!31 = distinct !DISubprogram(name: "fun2", scope: !1, file: !1, line: 11, type: !32, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!32 = !DISubroutineType(types: !33)
!33 = !{!13}
!34 = !DILocalVariable(name: "p", scope: !31, file: !1, line: 12, type: !13)
!35 = !DILocation(line: 12, column: 11, scope: !31)
!36 = !DILocation(line: 13, column: 9, scope: !31)
!37 = !DILocation(line: 13, column: 7, scope: !31)
!38 = !DILocation(line: 14, column: 9, scope: !31)
!39 = !DILocation(line: 14, column: 7, scope: !31)
!40 = !DILocation(line: 15, column: 9, scope: !31)
!41 = !DILocation(line: 15, column: 7, scope: !31)
!42 = !DILocation(line: 16, column: 5, scope: !31)
!43 = !DILocation(line: 17, column: 12, scope: !31)
!44 = !DILocation(line: 17, column: 5, scope: !31)
