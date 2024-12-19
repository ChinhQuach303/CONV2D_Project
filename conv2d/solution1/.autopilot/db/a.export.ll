; ModuleID = 'E:/hw/conv2d/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@llvm_global_ctors_1 = appending global [0 x void ()*] zeroinitializer
@llvm_global_ctors_0 = appending global [0 x i32] zeroinitializer
@hls_KD_KD_LineBuffe = internal unnamed_addr constant [63 x i8] c"hls::LineBuffer<3, 128, unsigned char, 0>::LineBuffer.1.region\00"
@doConv_str = internal unnamed_addr constant [7 x i8] c"doConv\00"
@RAM_1P_str = internal unnamed_addr constant [7 x i8] c"RAM_1P\00"
@p_str6 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str5 = private unnamed_addr constant [12 x i8] c"hls_label_0\00", align 1
@p_str4 = private unnamed_addr constant [11 x i8] c"KERNEL_BUS\00", align 1
@p_str3 = private unnamed_addr constant [9 x i8] c"CTRL_BUS\00", align 1
@p_str2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define void @doConv([16384 x i8]* %input_image, [16384 x i8]* %output_image, [9 x i8]* %kernel) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap([16384 x i8]* %input_image) nounwind, !map !66
  call void (...)* @_ssdm_op_SpecBitsMap([16384 x i8]* %output_image) nounwind, !map !72
  call void (...)* @_ssdm_op_SpecBitsMap([9 x i8]* %kernel) nounwind, !map !76
  call void (...)* @_ssdm_op_SpecTopModule([7 x i8]* @doConv_str) nounwind
  %lineBuff_val_0 = alloca [128 x i8], align 1
  %lineBuff_val_1 = alloca [128 x i8], align 1
  %lineBuff_val_2 = alloca [128 x i8], align 1
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str2, i32 0, i32 0, [9 x i8]* @p_str3, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2, [1 x i8]* @p_str2) nounwind
  %empty = call i32 (...)* @_ssdm_op_SpecMemCore([9 x i8]* %kernel, [1 x i8]* @p_str6, [7 x i8]* @RAM_1P_str, [1 x i8]* @p_str6, i32 -1, [1 x i8]* @p_str6, [1 x i8]* @p_str6, [1 x i8]* @p_str6, [1 x i8]* @p_str6, [1 x i8]* @p_str6) nounwind
  call void (...)* @_ssdm_op_SpecInterface([9 x i8]* %kernel, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str2, i32 0, i32 0, [11 x i8]* @p_str4, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2, [1 x i8]* @p_str2) nounwind
  %rbegin_i = call i32 (...)* @_ssdm_op_SpecRegionBegin([63 x i8]* @hls_KD_KD_LineBuffe) nounwind
  %rend_i = call i32 (...)* @_ssdm_op_SpecRegionEnd([63 x i8]* @hls_KD_KD_LineBuffe, i32 %rbegin_i) nounwind
  %kernel_addr = getelementptr [9 x i8]* %kernel, i64 0, i64 0
  %kernel_load = load i8* %kernel_addr, align 1
  %tmp_2 = sext i8 %kernel_load to i16
  %kernel_addr_1 = getelementptr [9 x i8]* %kernel, i64 0, i64 1
  %kernel_load_1 = load i8* %kernel_addr_1, align 1
  %tmp_24_0_1 = sext i8 %kernel_load_1 to i16
  %kernel_addr_2 = getelementptr [9 x i8]* %kernel, i64 0, i64 2
  %kernel_load_2 = load i8* %kernel_addr_2, align 1
  %tmp_24_0_2 = sext i8 %kernel_load_2 to i16
  %kernel_addr_3 = getelementptr [9 x i8]* %kernel, i64 0, i64 3
  %kernel_load_3 = load i8* %kernel_addr_3, align 1
  %tmp_24_1 = sext i8 %kernel_load_3 to i16
  %kernel_addr_4 = getelementptr [9 x i8]* %kernel, i64 0, i64 4
  %kernel_load_4 = load i8* %kernel_addr_4, align 1
  %tmp_24_1_1 = sext i8 %kernel_load_4 to i16
  %kernel_addr_5 = getelementptr [9 x i8]* %kernel, i64 0, i64 5
  %kernel_load_5 = load i8* %kernel_addr_5, align 1
  %tmp_24_1_2 = sext i8 %kernel_load_5 to i16
  %kernel_addr_6 = getelementptr [9 x i8]* %kernel, i64 0, i64 6
  %kernel_load_6 = load i8* %kernel_addr_6, align 1
  %tmp_24_2 = sext i8 %kernel_load_6 to i16
  %kernel_addr_7 = getelementptr [9 x i8]* %kernel, i64 0, i64 7
  %kernel_load_7 = load i8* %kernel_addr_7, align 1
  %tmp_24_2_1 = sext i8 %kernel_load_7 to i16
  %kernel_addr_8 = getelementptr [9 x i8]* %kernel, i64 0, i64 8
  %kernel_load_8 = load i8* %kernel_addr_8, align 1
  %tmp_24_2_2 = sext i8 %kernel_load_8 to i16
  br label %1

; <label>:1                                       ; preds = %._crit_edge.i.i.0_ifconv, %0
  %idxpixel = phi i15 [ 0, %0 ], [ %idxpixel_1, %._crit_edge.i.i.0_ifconv ]
  %valOutput = phi i16 [ 0, %0 ], [ %valOutput_2, %._crit_edge.i.i.0_ifconv ]
  %pixConvolved = phi i32 [ 0, %0 ], [ %pixConvolved_1, %._crit_edge.i.i.0_ifconv ]
  %idxRow = phi i32 [ 0, %0 ], [ %idxRow_1, %._crit_edge.i.i.0_ifconv ]
  %col_assign = phi i32 [ 0, %0 ], [ %idxCol_1, %._crit_edge.i.i.0_ifconv ]
  %exitcond4 = icmp eq i15 %idxpixel, -16384
  %empty_5 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 16384, i64 16384, i64 16384) nounwind
  %idxpixel_1 = add i15 %idxpixel, 1
  br i1 %exitcond4, label %.preheader10.preheader, label %._crit_edge.i.i.0_ifconv

.preheader10.preheader:                           ; preds = %1
  %tmp = trunc i16 %valOutput to i8
  br label %.preheader10

._crit_edge.i.i.0_ifconv:                         ; preds = %1
  %tmp_1 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str5) nounwind
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %tmp_8 = zext i32 %col_assign to i64
  %tmp_4 = trunc i32 %col_assign to i16
  %tmp_5 = trunc i32 %idxRow to i9
  %tmp_11_cast = call i16 @_ssdm_op_BitConcatenate.i16.i9.i7(i9 %tmp_5, i7 0)
  %tmp_s = add i16 %tmp_11_cast, %tmp_4
  %tmp_15_cast = sext i16 %tmp_s to i64
  %input_image_addr = getelementptr [16384 x i8]* %input_image, i64 0, i64 %tmp_15_cast
  %pixelin = load i8* %input_image_addr, align 1
  %lineBuff_val_1_addr = getelementptr [128 x i8]* %lineBuff_val_1, i64 0, i64 %tmp_8
  %lineBuff_val_1_load = load i8* %lineBuff_val_1_addr, align 1
  %lineBuff_val_0_addr = getelementptr [128 x i8]* %lineBuff_val_0, i64 0, i64 %tmp_8
  store i8 %lineBuff_val_1_load, i8* %lineBuff_val_0_addr, align 1
  %lineBuff_val_2_addr = getelementptr [128 x i8]* %lineBuff_val_2, i64 0, i64 %tmp_8
  %lineBuff_val_2_load = load i8* %lineBuff_val_2_addr, align 1
  store i8 %lineBuff_val_2_load, i8* %lineBuff_val_1_addr, align 1
  store i8 %pixelin, i8* %lineBuff_val_2_addr, align 1
  %tmp_9 = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %idxRow, i32 1, i32 31)
  %icmp = icmp sgt i31 %tmp_9, 0
  %tmp_10 = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %col_assign, i32 1, i32 31)
  %icmp3 = icmp sgt i31 %tmp_10, 0
  %tmp_6 = icmp slt i32 %col_assign, 126
  %tmp_7 = icmp slt i32 %idxRow, 126
  %tmp1 = and i1 %icmp, %icmp3
  %tmp2 = and i1 %tmp_6, %tmp_7
  %or_cond6 = and i1 %tmp2, %tmp1
  %tmp_11 = zext i32 %pixConvolved to i64
  %lineBuff_val_0_addr_1 = getelementptr [128 x i8]* %lineBuff_val_0, i64 0, i64 %tmp_11
  %lineBuff_val_0_load = load i8* %lineBuff_val_0_addr_1, align 1
  %pix_val = zext i8 %lineBuff_val_0_load to i16
  %window_val_0_0 = mul i16 %tmp_2, %pix_val
  %pixConvolved_2 = add nsw i32 1, %pixConvolved
  %tmp_20_0_1 = zext i32 %pixConvolved_2 to i64
  %lineBuff_val_0_addr_2 = getelementptr [128 x i8]* %lineBuff_val_0, i64 0, i64 %tmp_20_0_1
  %lineBuff_val_0_load_1 = load i8* %lineBuff_val_0_addr_2, align 1
  %pix_val_0_1 = zext i8 %lineBuff_val_0_load_1 to i16
  %window_val_0_1 = mul i16 %tmp_24_0_1, %pix_val_0_1
  %col_assign_1_0_2 = add nsw i32 2, %pixConvolved
  %tmp_20_0_2 = zext i32 %col_assign_1_0_2 to i64
  %lineBuff_val_0_addr_3 = getelementptr [128 x i8]* %lineBuff_val_0, i64 0, i64 %tmp_20_0_2
  %lineBuff_val_0_load_2 = load i8* %lineBuff_val_0_addr_3, align 1
  %pix_val_0_2 = zext i8 %lineBuff_val_0_load_2 to i16
  %window_val_0_2 = mul i16 %tmp_24_0_2, %pix_val_0_2
  %lineBuff_val_1_addr_1 = getelementptr [128 x i8]* %lineBuff_val_1, i64 0, i64 %tmp_11
  %lineBuff_val_1_load_1 = load i8* %lineBuff_val_1_addr_1, align 1
  %pix_val_1 = zext i8 %lineBuff_val_1_load_1 to i16
  %window_val_1_0 = mul i16 %tmp_24_1, %pix_val_1
  %lineBuff_val_1_addr_2 = getelementptr [128 x i8]* %lineBuff_val_1, i64 0, i64 %tmp_20_0_1
  %lineBuff_val_1_load_2 = load i8* %lineBuff_val_1_addr_2, align 1
  %pix_val_1_1 = zext i8 %lineBuff_val_1_load_2 to i16
  %window_val_1_1 = mul i16 %tmp_24_1_1, %pix_val_1_1
  %lineBuff_val_1_addr_3 = getelementptr [128 x i8]* %lineBuff_val_1, i64 0, i64 %tmp_20_0_2
  %lineBuff_val_1_load_3 = load i8* %lineBuff_val_1_addr_3, align 1
  %pix_val_1_2 = zext i8 %lineBuff_val_1_load_3 to i16
  %window_val_1_2 = mul i16 %tmp_24_1_2, %pix_val_1_2
  %lineBuff_val_2_addr_1 = getelementptr [128 x i8]* %lineBuff_val_2, i64 0, i64 %tmp_11
  %lineBuff_val_2_load_1 = load i8* %lineBuff_val_2_addr_1, align 1
  %pix_val_2 = zext i8 %lineBuff_val_2_load_1 to i16
  %window_val_2_0 = mul i16 %tmp_24_2, %pix_val_2
  %lineBuff_val_2_addr_2 = getelementptr [128 x i8]* %lineBuff_val_2, i64 0, i64 %tmp_20_0_1
  %lineBuff_val_2_load_2 = load i8* %lineBuff_val_2_addr_2, align 1
  %pix_val_2_1 = zext i8 %lineBuff_val_2_load_2 to i16
  %window_val_2_1 = mul i16 %tmp_24_2_1, %pix_val_2_1
  %lineBuff_val_2_addr_3 = getelementptr [128 x i8]* %lineBuff_val_2, i64 0, i64 %tmp_20_0_2
  %lineBuff_val_2_load_3 = load i8* %lineBuff_val_2_addr_3, align 1
  %pix_val_2_2 = zext i8 %lineBuff_val_2_load_3 to i16
  %window_val_2_2 = mul i16 %tmp_24_2_2, %pix_val_2_2
  %tmp3 = add i16 %window_val_2_1, %window_val_2_0
  %tmp4 = add i16 %window_val_1_1, %window_val_1_2
  %tmp_12 = trunc i16 %tmp4 to i15
  %tmp_13 = trunc i16 %tmp3 to i15
  %tmp9 = add i16 %tmp3, %tmp4
  %tmp13 = add i16 %window_val_0_0, %window_val_0_1
  %tmp15 = add i16 %window_val_2_2, %window_val_0_2
  %tmp14 = add i16 %window_val_1_0, %tmp15
  %tmp_16 = trunc i16 %tmp14 to i15
  %tmp_17 = trunc i16 %tmp13 to i15
  %tmp12 = add i16 %tmp13, %tmp14
  %tmp_14 = add i15 %tmp_12, %tmp_13
  %tmp_15 = add i15 %tmp_16, %tmp_17
  %valOutput_1 = add i16 %tmp9, %tmp12
  %valOutput_1_cast = add i15 %tmp_15, %tmp_14
  %tmp_18 = call i1 @_ssdm_op_BitSelect.i1.i16.i32(i16 %valOutput_1, i32 15)
  %p_s = select i1 %tmp_18, i15 0, i15 %valOutput_1_cast
  %p_cast = zext i15 %p_s to i16
  %valOutput_2 = select i1 %or_cond6, i16 %p_cast, i16 %valOutput
  %tmp_3 = icmp slt i32 %col_assign, 127
  %idxCol = add nsw i32 1, %col_assign
  %idxRow_2 = add nsw i32 1, %idxRow
  %pixConvolved_1 = select i1 %tmp_3, i32 %pixConvolved_2, i32 0
  %idxRow_1 = select i1 %tmp_3, i32 %idxRow, i32 %idxRow_2
  %idxCol_1 = select i1 %tmp_3, i32 %idxCol, i32 0
  %empty_6 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str5, i32 %tmp_1) nounwind
  br label %1

.preheader10.loopexit:                            ; preds = %.preheader
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader10.preheader
  %row = phi i8 [ 0, %.preheader10.preheader ], [ %row_1, %.preheader10.loopexit ]
  %exitcond1 = icmp eq i8 %row, -128
  %empty_7 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 128, i64 128, i64 128) nounwind
  %row_1 = add i8 %row, 1
  br i1 %exitcond1, label %3, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader10
  %tmp_19 = call i15 @_ssdm_op_BitConcatenate.i15.i8.i7(i8 %row, i7 0)
  %tmp_21_cast = zext i15 %tmp_19 to i16
  br label %.preheader

.preheader:                                       ; preds = %2, %.preheader.preheader
  %col = phi i8 [ %col_1, %2 ], [ 0, %.preheader.preheader ]
  %exitcond = icmp eq i8 %col, -128
  %empty_8 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 128, i64 128, i64 128) nounwind
  %col_1 = add i8 %col, 1
  br i1 %exitcond, label %.preheader10.loopexit, label %2

; <label>:2                                       ; preds = %.preheader
  %tmp_10_cast = zext i8 %col to i16
  %tmp_20 = add i16 %tmp_21_cast, %tmp_10_cast
  %tmp_22_cast = zext i16 %tmp_20 to i64
  %output_image_addr = getelementptr [16384 x i8]* %output_image, i64 0, i64 %tmp_22_cast
  store i8 %tmp, i8* %output_image_addr, align 1
  br label %.preheader

; <label>:3                                       ; preds = %.preheader10
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecPipeline(...) nounwind {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecMemCore(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

declare i9 @_ssdm_op_PartSelect.i9.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i8 @_ssdm_op_PartSelect.i8.i16.i32.i32(i16, i32, i32) nounwind readnone

define weak i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_9 = trunc i32 %empty to i31
  ret i31 %empty_9
}

declare i16 @_ssdm_op_PartSelect.i16.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i15 @_ssdm_op_PartSelect.i15.i16.i32.i32(i16, i32, i32) nounwind readnone

define weak i1 @_ssdm_op_BitSelect.i1.i16.i32(i16, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i16
  %empty_10 = shl i16 1, %empty
  %empty_11 = and i16 %0, %empty_10
  %empty_12 = icmp ne i16 %empty_11, 0
  ret i1 %empty_12
}

define weak i16 @_ssdm_op_BitConcatenate.i16.i9.i7(i9, i7) nounwind readnone {
entry:
  %empty = zext i9 %0 to i16
  %empty_13 = zext i7 %1 to i16
  %empty_14 = shl i16 %empty, 7
  %empty_15 = or i16 %empty_14, %empty_13
  ret i16 %empty_15
}

define weak i15 @_ssdm_op_BitConcatenate.i15.i8.i7(i8, i7) nounwind readnone {
entry:
  %empty = zext i8 %0 to i15
  %empty_16 = zext i7 %1 to i15
  %empty_17 = shl i15 %empty, 7
  %empty_18 = or i15 %empty_17, %empty_16
  ret i15 %empty_18
}

declare void @_ssdm_SpecDependence(...) nounwind

!opencl.kernels = !{!0, !7, !13, !19, !19, !13, !23, !23, !26, !26, !30, !32, !32, !34, !40, !34, !34, !43, !32, !32, !34, !46, !34, !34, !34, !49, !49, !51, !51, !53, !54, !55, !55, !34, !34, !57, !34, !34, !34, !34, !34, !34, !34, !34, !34, !34, !34, !34}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!59}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"uchar [128]*", metadata !"uchar [128]*", metadata !"char*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"input_image", metadata !"output_image", metadata !"kernel"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 1}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"hls::Window<3, 3, short>*"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"window"}
!13 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!15 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!16 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"int"}
!17 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!18 = metadata !{metadata !"kernel_arg_name", metadata !"row", metadata !"col"}
!19 = metadata !{null, metadata !20, metadata !2, metadata !21, metadata !4, metadata !22, metadata !6}
!20 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0}
!21 = metadata !{metadata !"kernel_arg_type", metadata !"short", metadata !"int", metadata !"int"}
!22 = metadata !{metadata !"kernel_arg_name", metadata !"value", metadata !"row", metadata !"col"}
!23 = metadata !{null, metadata !14, metadata !15, metadata !24, metadata !17, metadata !25, metadata !6}
!24 = metadata !{metadata !"kernel_arg_type", metadata !"uchar", metadata !"int"}
!25 = metadata !{metadata !"kernel_arg_name", metadata !"value", metadata !"col"}
!26 = metadata !{null, metadata !27, metadata !9, metadata !28, metadata !11, metadata !29, metadata !6}
!27 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!28 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!29 = metadata !{metadata !"kernel_arg_name", metadata !"col"}
!30 = metadata !{null, metadata !27, metadata !9, metadata !28, metadata !11, metadata !31, metadata !6}
!31 = metadata !{metadata !"kernel_arg_name", metadata !""}
!32 = metadata !{null, metadata !27, metadata !9, metadata !28, metadata !11, metadata !33, metadata !6}
!33 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!34 = metadata !{null, metadata !35, metadata !36, metadata !37, metadata !38, metadata !39, metadata !6}
!35 = metadata !{metadata !"kernel_arg_addr_space"}
!36 = metadata !{metadata !"kernel_arg_access_qual"}
!37 = metadata !{metadata !"kernel_arg_type"}
!38 = metadata !{metadata !"kernel_arg_type_qual"}
!39 = metadata !{metadata !"kernel_arg_name"}
!40 = metadata !{null, metadata !27, metadata !9, metadata !41, metadata !11, metadata !42, metadata !6}
!41 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &"}
!42 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!43 = metadata !{null, metadata !14, metadata !15, metadata !44, metadata !17, metadata !45, metadata !6}
!44 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &", metadata !"int"}
!45 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"i_op"}
!46 = metadata !{null, metadata !14, metadata !15, metadata !47, metadata !17, metadata !48, metadata !6}
!47 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &", metadata !"const ap_int_base<32, true> &"}
!48 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!49 = metadata !{null, metadata !27, metadata !9, metadata !50, metadata !11, metadata !33, metadata !6}
!50 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!51 = metadata !{null, metadata !27, metadata !9, metadata !52, metadata !11, metadata !33, metadata !6}
!52 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &"}
!53 = metadata !{null, metadata !14, metadata !15, metadata !44, metadata !17, metadata !48, metadata !6}
!54 = metadata !{null, metadata !27, metadata !9, metadata !50, metadata !11, metadata !42, metadata !6}
!55 = metadata !{null, metadata !27, metadata !9, metadata !28, metadata !11, metadata !56, metadata !6}
!56 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!57 = metadata !{null, metadata !27, metadata !9, metadata !58, metadata !11, metadata !42, metadata !6}
!58 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<32> &"}
!59 = metadata !{metadata !60, [0 x i32]* @llvm_global_ctors_0}
!60 = metadata !{metadata !61}
!61 = metadata !{i32 0, i32 31, metadata !62}
!62 = metadata !{metadata !63}
!63 = metadata !{metadata !"llvm.global_ctors.0", metadata !64, metadata !"", i32 0, i32 31}
!64 = metadata !{metadata !65}
!65 = metadata !{i32 0, i32 0, i32 1}
!66 = metadata !{metadata !67}
!67 = metadata !{i32 0, i32 7, metadata !68}
!68 = metadata !{metadata !69}
!69 = metadata !{metadata !"input_image", metadata !70, metadata !"unsigned char", i32 0, i32 7}
!70 = metadata !{metadata !71, metadata !71}
!71 = metadata !{i32 0, i32 127, i32 1}
!72 = metadata !{metadata !73}
!73 = metadata !{i32 0, i32 7, metadata !74}
!74 = metadata !{metadata !75}
!75 = metadata !{metadata !"output_image", metadata !70, metadata !"unsigned char", i32 0, i32 7}
!76 = metadata !{metadata !77}
!77 = metadata !{i32 0, i32 7, metadata !78}
!78 = metadata !{metadata !79}
!79 = metadata !{metadata !"kernel", metadata !80, metadata !"char", i32 0, i32 7}
!80 = metadata !{metadata !81}
!81 = metadata !{i32 0, i32 8, i32 1}
