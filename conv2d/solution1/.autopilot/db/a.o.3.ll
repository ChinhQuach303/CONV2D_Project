; ModuleID = 'E:/hw/conv2d/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@llvm_global_ctors_1 = appending global [0 x void ()*] zeroinitializer ; [#uses=0 type=[0 x void ()*]*]
@llvm_global_ctors_0 = appending global [0 x i32] zeroinitializer ; [#uses=0 type=[0 x i32]*]
@hls_KD_KD_LineBuffe = internal unnamed_addr constant [63 x i8] c"hls::LineBuffer<3, 128, unsigned char, 0>::LineBuffer.1.region\00" ; [#uses=2 type=[63 x i8]*]
@doConv_str = internal unnamed_addr constant [7 x i8] c"doConv\00" ; [#uses=1 type=[7 x i8]*]
@RAM_1P_str = internal unnamed_addr constant [7 x i8] c"RAM_1P\00" ; [#uses=1 type=[7 x i8]*]
@p_str6 = internal unnamed_addr constant [1 x i8] zeroinitializer ; [#uses=7 type=[1 x i8]*]
@p_str5 = private unnamed_addr constant [12 x i8] c"hls_label_0\00", align 1 ; [#uses=2 type=[12 x i8]*]
@p_str4 = private unnamed_addr constant [11 x i8] c"KERNEL_BUS\00", align 1 ; [#uses=1 type=[11 x i8]*]
@p_str3 = private unnamed_addr constant [9 x i8] c"CTRL_BUS\00", align 1 ; [#uses=1 type=[9 x i8]*]
@p_str2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=11 type=[1 x i8]*]
@p_str = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1 ; [#uses=2 type=[10 x i8]*]

; [#uses=1]
declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

; [#uses=47]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=3]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=0]
define void @doConv([16384 x i8]* %input_image, [16384 x i8]* %output_image, [9 x i8]* %kernel) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap([16384 x i8]* %input_image) nounwind, !map !66
  call void (...)* @_ssdm_op_SpecBitsMap([16384 x i8]* %output_image) nounwind, !map !72
  call void (...)* @_ssdm_op_SpecBitsMap([9 x i8]* %kernel) nounwind, !map !76
  call void (...)* @_ssdm_op_SpecTopModule([7 x i8]* @doConv_str) nounwind
  %lineBuff_val_0 = alloca [128 x i8], align 1    ; [#uses=4 type=[128 x i8]*]
  %lineBuff_val_1 = alloca [128 x i8], align 1    ; [#uses=4 type=[128 x i8]*]
  %lineBuff_val_2 = alloca [128 x i8], align 1    ; [#uses=4 type=[128 x i8]*]
  call void @llvm.dbg.value(metadata !{[16384 x i8]* %input_image}, i64 0, metadata !82), !dbg !98 ; [debug line = 4:27] [debug variable = input_image]
  call void @llvm.dbg.value(metadata !{[16384 x i8]* %output_image}, i64 0, metadata !99), !dbg !100 ; [debug line = 5:28] [debug variable = output_image]
  call void @llvm.dbg.value(metadata !{[9 x i8]* %kernel}, i64 0, metadata !101), !dbg !105 ; [debug line = 6:19] [debug variable = kernel]
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str2, i32 0, i32 0, [9 x i8]* @p_str3, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2, [1 x i8]* @p_str2) nounwind, !dbg !106 ; [debug line = 8:1]
  %empty = call i32 (...)* @_ssdm_op_SpecMemCore([9 x i8]* %kernel, [1 x i8]* @p_str6, [7 x i8]* @RAM_1P_str, [1 x i8]* @p_str6, i32 -1, [1 x i8]* @p_str6, [1 x i8]* @p_str6, [1 x i8]* @p_str6, [1 x i8]* @p_str6, [1 x i8]* @p_str6) nounwind ; [#uses=0 type=i32]
  call void (...)* @_ssdm_op_SpecInterface([9 x i8]* %kernel, [10 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str2, i32 0, i32 0, [11 x i8]* @p_str4, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2, [1 x i8]* @p_str2) nounwind
  call void @llvm.dbg.declare(metadata !{[128 x i8]* %lineBuff_val_0}, metadata !108), !dbg !152 ; [debug line = 13:41] [debug variable = lineBuff.val[0]]
  call void @llvm.dbg.declare(metadata !{[128 x i8]* %lineBuff_val_1}, metadata !153), !dbg !152 ; [debug line = 13:41] [debug variable = lineBuff.val[1]]
  call void @llvm.dbg.declare(metadata !{[128 x i8]* %lineBuff_val_2}, metadata !154), !dbg !152 ; [debug line = 13:41] [debug variable = lineBuff.val[2]]
  %rbegin_i = call i32 (...)* @_ssdm_op_SpecRegionBegin([63 x i8]* @hls_KD_KD_LineBuffe) nounwind ; [#uses=1 type=i32]
  %rend_i = call i32 (...)* @_ssdm_op_SpecRegionEnd([63 x i8]* @hls_KD_KD_LineBuffe, i32 %rbegin_i) nounwind ; [#uses=0 type=i32]
  %kernel_addr = getelementptr [9 x i8]* %kernel, i64 0, i64 0, !dbg !155 ; [#uses=1 type=i8*] [debug line = 50:85]
  %kernel_load = load i8* %kernel_addr, align 1, !dbg !155 ; [#uses=1 type=i8] [debug line = 50:85]
  %tmp_2 = sext i8 %kernel_load to i16, !dbg !155 ; [#uses=1 type=i16] [debug line = 50:85]
  %kernel_addr_1 = getelementptr [9 x i8]* %kernel, i64 0, i64 1, !dbg !155 ; [#uses=1 type=i8*] [debug line = 50:85]
  %kernel_load_1 = load i8* %kernel_addr_1, align 1, !dbg !155 ; [#uses=1 type=i8] [debug line = 50:85]
  %tmp_24_0_1 = sext i8 %kernel_load_1 to i16, !dbg !155 ; [#uses=1 type=i16] [debug line = 50:85]
  %kernel_addr_2 = getelementptr [9 x i8]* %kernel, i64 0, i64 2, !dbg !155 ; [#uses=1 type=i8*] [debug line = 50:85]
  %kernel_load_2 = load i8* %kernel_addr_2, align 1, !dbg !155 ; [#uses=1 type=i8] [debug line = 50:85]
  %tmp_24_0_2 = sext i8 %kernel_load_2 to i16, !dbg !155 ; [#uses=1 type=i16] [debug line = 50:85]
  %kernel_addr_3 = getelementptr [9 x i8]* %kernel, i64 0, i64 3, !dbg !155 ; [#uses=1 type=i8*] [debug line = 50:85]
  %kernel_load_3 = load i8* %kernel_addr_3, align 1, !dbg !155 ; [#uses=1 type=i8] [debug line = 50:85]
  %tmp_24_1 = sext i8 %kernel_load_3 to i16, !dbg !155 ; [#uses=1 type=i16] [debug line = 50:85]
  %kernel_addr_4 = getelementptr [9 x i8]* %kernel, i64 0, i64 4, !dbg !155 ; [#uses=1 type=i8*] [debug line = 50:85]
  %kernel_load_4 = load i8* %kernel_addr_4, align 1, !dbg !155 ; [#uses=1 type=i8] [debug line = 50:85]
  %tmp_24_1_1 = sext i8 %kernel_load_4 to i16, !dbg !155 ; [#uses=1 type=i16] [debug line = 50:85]
  %kernel_addr_5 = getelementptr [9 x i8]* %kernel, i64 0, i64 5, !dbg !155 ; [#uses=1 type=i8*] [debug line = 50:85]
  %kernel_load_5 = load i8* %kernel_addr_5, align 1, !dbg !155 ; [#uses=1 type=i8] [debug line = 50:85]
  %tmp_24_1_2 = sext i8 %kernel_load_5 to i16, !dbg !155 ; [#uses=1 type=i16] [debug line = 50:85]
  %kernel_addr_6 = getelementptr [9 x i8]* %kernel, i64 0, i64 6, !dbg !155 ; [#uses=1 type=i8*] [debug line = 50:85]
  %kernel_load_6 = load i8* %kernel_addr_6, align 1, !dbg !155 ; [#uses=1 type=i8] [debug line = 50:85]
  %tmp_24_2 = sext i8 %kernel_load_6 to i16, !dbg !155 ; [#uses=1 type=i16] [debug line = 50:85]
  %kernel_addr_7 = getelementptr [9 x i8]* %kernel, i64 0, i64 7, !dbg !155 ; [#uses=1 type=i8*] [debug line = 50:85]
  %kernel_load_7 = load i8* %kernel_addr_7, align 1, !dbg !155 ; [#uses=1 type=i8] [debug line = 50:85]
  %tmp_24_2_1 = sext i8 %kernel_load_7 to i16, !dbg !155 ; [#uses=1 type=i16] [debug line = 50:85]
  %kernel_addr_8 = getelementptr [9 x i8]* %kernel, i64 0, i64 8, !dbg !155 ; [#uses=1 type=i8*] [debug line = 50:85]
  %kernel_load_8 = load i8* %kernel_addr_8, align 1, !dbg !155 ; [#uses=1 type=i8] [debug line = 50:85]
  %tmp_24_2_2 = sext i8 %kernel_load_8 to i16, !dbg !155 ; [#uses=1 type=i16] [debug line = 50:85]
  br label %1, !dbg !163                          ; [debug line = 28:26]

; <label>:1                                       ; preds = %._crit_edge.i.i.0_ifconv, %0
  %idxpixel = phi i15 [ 0, %0 ], [ %idxpixel_1, %._crit_edge.i.i.0_ifconv ] ; [#uses=2 type=i15]
  %valOutput = phi i16 [ 0, %0 ], [ %valOutput_2, %._crit_edge.i.i.0_ifconv ] ; [#uses=2 type=i16]
  %pixConvolved = phi i32 [ 0, %0 ], [ %pixConvolved_1, %._crit_edge.i.i.0_ifconv ] ; [#uses=3 type=i32]
  %idxRow = phi i32 [ 0, %0 ], [ %idxRow_1, %._crit_edge.i.i.0_ifconv ] ; [#uses=5 type=i32]
  %col_assign = phi i32 [ 0, %0 ], [ %idxCol_1, %._crit_edge.i.i.0_ifconv ] ; [#uses=6 type=i32]
  %exitcond4 = icmp eq i15 %idxpixel, -16384, !dbg !163 ; [#uses=1 type=i1] [debug line = 28:26]
  %empty_5 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 16384, i64 16384, i64 16384) nounwind ; [#uses=0 type=i32]
  %idxpixel_1 = add i15 %idxpixel, 1, !dbg !164   ; [#uses=1 type=i15] [debug line = 28:52]
  br i1 %exitcond4, label %.preheader10.preheader, label %._crit_edge.i.i.0_ifconv, !dbg !163 ; [debug line = 28:26]

.preheader10.preheader:                           ; preds = %1
  %tmp = trunc i16 %valOutput to i8, !dbg !165    ; [#uses=1 type=i8] [debug line = 85:13]
  br label %.preheader10, !dbg !170               ; [debug line = 81:21]

._crit_edge.i.i.0_ifconv:                         ; preds = %1
  %tmp_1 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str5) nounwind, !dbg !171 ; [#uses=1 type=i32] [debug line = 29:6]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind, !dbg !172 ; [debug line = 30:1]
  %tmp_8 = zext i32 %col_assign to i64, !dbg !173 ; [#uses=3 type=i64] [debug line = 32:53]
  %tmp_4 = trunc i32 %col_assign to i16           ; [#uses=1 type=i16]
  %tmp_5 = trunc i32 %idxRow to i9                ; [#uses=1 type=i9]
  %tmp_11_cast = call i16 @_ssdm_op_BitConcatenate.i16.i9.i7(i9 %tmp_5, i7 0), !dbg !173 ; [#uses=1 type=i16] [debug line = 32:53]
  %tmp_s = add i16 %tmp_11_cast, %tmp_4, !dbg !173 ; [#uses=1 type=i16] [debug line = 32:53]
  %tmp_15_cast = sext i16 %tmp_s to i64, !dbg !173 ; [#uses=1 type=i64] [debug line = 32:53]
  %input_image_addr = getelementptr [16384 x i8]* %input_image, i64 0, i64 %tmp_15_cast, !dbg !173 ; [#uses=1 type=i8*] [debug line = 32:53]
  %pixelin = load i8* %input_image_addr, align 1, !dbg !173 ; [#uses=1 type=i8] [debug line = 32:53]
  call void @llvm.dbg.value(metadata !{i8 %pixelin}, i64 0, metadata !174), !dbg !173 ; [debug line = 32:53] [debug variable = pixelin]
  call void @llvm.dbg.value(metadata !{i32 %col_assign}, i64 0, metadata !175) nounwind, !dbg !178 ; [debug line = 638:23@35:9] [debug variable = col]
  call void @llvm.dbg.value(metadata !{i32 %col_assign}, i64 0, metadata !179) nounwind, !dbg !183 ; [debug line = 629:30@863:5@35:9] [debug variable = col]
  %lineBuff_val_1_addr = getelementptr [128 x i8]* %lineBuff_val_1, i64 0, i64 %tmp_8 ; [#uses=2 type=i8*]
  %lineBuff_val_1_load = load i8* %lineBuff_val_1_addr, align 1, !dbg !184 ; [#uses=1 type=i8] [debug line = 729:27@863:5@35:9]
  %lineBuff_val_0_addr = getelementptr [128 x i8]* %lineBuff_val_0, i64 0, i64 %tmp_8 ; [#uses=1 type=i8*]
  store i8 %lineBuff_val_1_load, i8* %lineBuff_val_0_addr, align 1, !dbg !188 ; [debug line = 729:13@863:5@35:9]
  %lineBuff_val_2_addr = getelementptr [128 x i8]* %lineBuff_val_2, i64 0, i64 %tmp_8 ; [#uses=2 type=i8*]
  %lineBuff_val_2_load = load i8* %lineBuff_val_2_addr, align 1, !dbg !184 ; [#uses=1 type=i8] [debug line = 729:27@863:5@35:9]
  store i8 %lineBuff_val_2_load, i8* %lineBuff_val_1_addr, align 1, !dbg !188 ; [debug line = 729:13@863:5@35:9]
  call void @llvm.dbg.value(metadata !{i8 %pixelin}, i64 0, metadata !189) nounwind, !dbg !192 ; [debug line = 641:23@36:9] [debug variable = value]
  call void @llvm.dbg.value(metadata !{i32 %col_assign}, i64 0, metadata !193) nounwind, !dbg !194 ; [debug line = 641:34@36:9] [debug variable = col]
  call void @llvm.dbg.value(metadata !{i8 %pixelin}, i64 0, metadata !195) nounwind, !dbg !199 ; [debug line = 631:30@883:5@36:9] [debug variable = value]
  call void @llvm.dbg.value(metadata !{i32 %col_assign}, i64 0, metadata !200) nounwind, !dbg !201 ; [debug line = 631:41@883:5@36:9] [debug variable = col]
  store i8 %pixelin, i8* %lineBuff_val_2_addr, align 1, !dbg !202 ; [debug line = 765:5@883:5@36:9]
  %tmp_9 = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %idxRow, i32 1, i32 31), !dbg !204 ; [#uses=1 type=i31] [debug line = 39:9]
  %icmp = icmp sgt i31 %tmp_9, 0, !dbg !204       ; [#uses=1 type=i1] [debug line = 39:9]
  %tmp_10 = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %col_assign, i32 1, i32 31), !dbg !204 ; [#uses=1 type=i31] [debug line = 39:9]
  %icmp3 = icmp sgt i31 %tmp_10, 0, !dbg !204     ; [#uses=1 type=i1] [debug line = 39:9]
  %tmp_6 = icmp slt i32 %col_assign, 126, !dbg !204 ; [#uses=1 type=i1] [debug line = 39:9]
  %tmp_7 = icmp slt i32 %idxRow, 126, !dbg !204   ; [#uses=1 type=i1] [debug line = 39:9]
  %tmp1 = and i1 %icmp, %icmp3, !dbg !204         ; [#uses=1 type=i1] [debug line = 39:9]
  %tmp2 = and i1 %tmp_6, %tmp_7, !dbg !204        ; [#uses=1 type=i1] [debug line = 39:9]
  %or_cond6 = and i1 %tmp2, %tmp1, !dbg !204      ; [#uses=1 type=i1] [debug line = 39:9]
  %tmp_11 = zext i32 %pixConvolved to i64, !dbg !205 ; [#uses=3 type=i64] [debug line = 835:5@47:44]
  %lineBuff_val_0_addr_1 = getelementptr [128 x i8]* %lineBuff_val_0, i64 0, i64 %tmp_11 ; [#uses=1 type=i8*]
  %lineBuff_val_0_load = load i8* %lineBuff_val_0_addr_1, align 1, !dbg !208 ; [#uses=1 type=i8] [debug line = 47:44]
  %pix_val = zext i8 %lineBuff_val_0_load to i16, !dbg !208 ; [#uses=1 type=i16] [debug line = 47:44]
  %window_val_0_0 = mul i16 %tmp_2, %pix_val, !dbg !155 ; [#uses=1 type=i16] [debug line = 50:85]
  call void @llvm.dbg.value(metadata !{i16 %window_val_0_0}, i64 0, metadata !209), !dbg !259 ; [debug line = 274:5@573:5@51:21] [debug variable = window.val[0][0]]
  %pixConvolved_2 = add nsw i32 1, %pixConvolved, !dbg !208 ; [#uses=2 type=i32] [debug line = 47:44]
  %tmp_20_0_1 = zext i32 %pixConvolved_2 to i64, !dbg !205 ; [#uses=3 type=i64] [debug line = 835:5@47:44]
  %lineBuff_val_0_addr_2 = getelementptr [128 x i8]* %lineBuff_val_0, i64 0, i64 %tmp_20_0_1 ; [#uses=1 type=i8*]
  %lineBuff_val_0_load_1 = load i8* %lineBuff_val_0_addr_2, align 1, !dbg !208 ; [#uses=1 type=i8] [debug line = 47:44]
  %pix_val_0_1 = zext i8 %lineBuff_val_0_load_1 to i16, !dbg !208 ; [#uses=1 type=i16] [debug line = 47:44]
  %window_val_0_1 = mul i16 %tmp_24_0_1, %pix_val_0_1, !dbg !155 ; [#uses=1 type=i16] [debug line = 50:85]
  call void @llvm.dbg.value(metadata !{i16 %window_val_0_1}, i64 0, metadata !266), !dbg !259 ; [debug line = 274:5@573:5@51:21] [debug variable = window.val[0][1]]
  %col_assign_1_0_2 = add nsw i32 2, %pixConvolved, !dbg !208 ; [#uses=1 type=i32] [debug line = 47:44]
  %tmp_20_0_2 = zext i32 %col_assign_1_0_2 to i64, !dbg !205 ; [#uses=3 type=i64] [debug line = 835:5@47:44]
  %lineBuff_val_0_addr_3 = getelementptr [128 x i8]* %lineBuff_val_0, i64 0, i64 %tmp_20_0_2 ; [#uses=1 type=i8*]
  %lineBuff_val_0_load_2 = load i8* %lineBuff_val_0_addr_3, align 1, !dbg !208 ; [#uses=1 type=i8] [debug line = 47:44]
  %pix_val_0_2 = zext i8 %lineBuff_val_0_load_2 to i16, !dbg !208 ; [#uses=1 type=i16] [debug line = 47:44]
  %window_val_0_2 = mul i16 %tmp_24_0_2, %pix_val_0_2, !dbg !155 ; [#uses=1 type=i16] [debug line = 50:85]
  call void @llvm.dbg.value(metadata !{i16 %window_val_0_2}, i64 0, metadata !267), !dbg !259 ; [debug line = 274:5@573:5@51:21] [debug variable = window.val[0][2]]
  %lineBuff_val_1_addr_1 = getelementptr [128 x i8]* %lineBuff_val_1, i64 0, i64 %tmp_11 ; [#uses=1 type=i8*]
  %lineBuff_val_1_load_1 = load i8* %lineBuff_val_1_addr_1, align 1, !dbg !208 ; [#uses=1 type=i8] [debug line = 47:44]
  %pix_val_1 = zext i8 %lineBuff_val_1_load_1 to i16, !dbg !208 ; [#uses=1 type=i16] [debug line = 47:44]
  %window_val_1_0 = mul i16 %tmp_24_1, %pix_val_1, !dbg !155 ; [#uses=1 type=i16] [debug line = 50:85]
  call void @llvm.dbg.value(metadata !{i16 %window_val_1_0}, i64 0, metadata !268), !dbg !259 ; [debug line = 274:5@573:5@51:21] [debug variable = window.val[1][0]]
  %lineBuff_val_1_addr_2 = getelementptr [128 x i8]* %lineBuff_val_1, i64 0, i64 %tmp_20_0_1 ; [#uses=1 type=i8*]
  %lineBuff_val_1_load_2 = load i8* %lineBuff_val_1_addr_2, align 1, !dbg !208 ; [#uses=1 type=i8] [debug line = 47:44]
  %pix_val_1_1 = zext i8 %lineBuff_val_1_load_2 to i16, !dbg !208 ; [#uses=1 type=i16] [debug line = 47:44]
  %window_val_1_1 = mul i16 %tmp_24_1_1, %pix_val_1_1, !dbg !155 ; [#uses=1 type=i16] [debug line = 50:85]
  call void @llvm.dbg.value(metadata !{i16 %window_val_1_1}, i64 0, metadata !269), !dbg !259 ; [debug line = 274:5@573:5@51:21] [debug variable = window.val[1][1]]
  %lineBuff_val_1_addr_3 = getelementptr [128 x i8]* %lineBuff_val_1, i64 0, i64 %tmp_20_0_2 ; [#uses=1 type=i8*]
  %lineBuff_val_1_load_3 = load i8* %lineBuff_val_1_addr_3, align 1, !dbg !208 ; [#uses=1 type=i8] [debug line = 47:44]
  %pix_val_1_2 = zext i8 %lineBuff_val_1_load_3 to i16, !dbg !208 ; [#uses=1 type=i16] [debug line = 47:44]
  %window_val_1_2 = mul i16 %tmp_24_1_2, %pix_val_1_2, !dbg !155 ; [#uses=1 type=i16] [debug line = 50:85]
  call void @llvm.dbg.value(metadata !{i16 %window_val_1_2}, i64 0, metadata !270), !dbg !259 ; [debug line = 274:5@573:5@51:21] [debug variable = window.val[1][2]]
  %lineBuff_val_2_addr_1 = getelementptr [128 x i8]* %lineBuff_val_2, i64 0, i64 %tmp_11 ; [#uses=1 type=i8*]
  %lineBuff_val_2_load_1 = load i8* %lineBuff_val_2_addr_1, align 1, !dbg !208 ; [#uses=1 type=i8] [debug line = 47:44]
  %pix_val_2 = zext i8 %lineBuff_val_2_load_1 to i16, !dbg !208 ; [#uses=1 type=i16] [debug line = 47:44]
  %window_val_2_0 = mul i16 %tmp_24_2, %pix_val_2, !dbg !155 ; [#uses=1 type=i16] [debug line = 50:85]
  call void @llvm.dbg.value(metadata !{i16 %window_val_2_0}, i64 0, metadata !271), !dbg !259 ; [debug line = 274:5@573:5@51:21] [debug variable = window.val[2][0]]
  %lineBuff_val_2_addr_2 = getelementptr [128 x i8]* %lineBuff_val_2, i64 0, i64 %tmp_20_0_1 ; [#uses=1 type=i8*]
  %lineBuff_val_2_load_2 = load i8* %lineBuff_val_2_addr_2, align 1, !dbg !208 ; [#uses=1 type=i8] [debug line = 47:44]
  %pix_val_2_1 = zext i8 %lineBuff_val_2_load_2 to i16, !dbg !208 ; [#uses=1 type=i16] [debug line = 47:44]
  %window_val_2_1 = mul i16 %tmp_24_2_1, %pix_val_2_1, !dbg !155 ; [#uses=1 type=i16] [debug line = 50:85]
  call void @llvm.dbg.value(metadata !{i16 %window_val_2_1}, i64 0, metadata !272), !dbg !259 ; [debug line = 274:5@573:5@51:21] [debug variable = window.val[2][1]]
  %lineBuff_val_2_addr_3 = getelementptr [128 x i8]* %lineBuff_val_2, i64 0, i64 %tmp_20_0_2 ; [#uses=1 type=i8*]
  %lineBuff_val_2_load_3 = load i8* %lineBuff_val_2_addr_3, align 1, !dbg !208 ; [#uses=1 type=i8] [debug line = 47:44]
  %pix_val_2_2 = zext i8 %lineBuff_val_2_load_3 to i16, !dbg !208 ; [#uses=1 type=i16] [debug line = 47:44]
  %window_val_2_2 = mul i16 %tmp_24_2_2, %pix_val_2_2, !dbg !155 ; [#uses=1 type=i16] [debug line = 50:85]
  call void @llvm.dbg.value(metadata !{i16 %window_val_2_2}, i64 0, metadata !273), !dbg !259 ; [debug line = 274:5@573:5@51:21] [debug variable = window.val[2][2]]
  call void @llvm.dbg.value(metadata !{i16 %window_val_0_0}, i64 0, metadata !274), !dbg !283 ; [debug line = 91:43@60:25] [debug variable = window.val[0][0]]
  call void @llvm.dbg.value(metadata !{i16 %window_val_0_1}, i64 0, metadata !284), !dbg !283 ; [debug line = 91:43@60:25] [debug variable = window.val[0][1]]
  call void @llvm.dbg.value(metadata !{i16 %window_val_0_2}, i64 0, metadata !285), !dbg !283 ; [debug line = 91:43@60:25] [debug variable = window.val[0][2]]
  call void @llvm.dbg.value(metadata !{i16 %window_val_1_0}, i64 0, metadata !286), !dbg !283 ; [debug line = 91:43@60:25] [debug variable = window.val[1][0]]
  call void @llvm.dbg.value(metadata !{i16 %window_val_1_1}, i64 0, metadata !287), !dbg !283 ; [debug line = 91:43@60:25] [debug variable = window.val[1][1]]
  call void @llvm.dbg.value(metadata !{i16 %window_val_1_2}, i64 0, metadata !288), !dbg !283 ; [debug line = 91:43@60:25] [debug variable = window.val[1][2]]
  call void @llvm.dbg.value(metadata !{i16 %window_val_2_0}, i64 0, metadata !289), !dbg !283 ; [debug line = 91:43@60:25] [debug variable = window.val[2][0]]
  call void @llvm.dbg.value(metadata !{i16 %window_val_2_1}, i64 0, metadata !290), !dbg !283 ; [debug line = 91:43@60:25] [debug variable = window.val[2][1]]
  call void @llvm.dbg.value(metadata !{i16 %window_val_2_2}, i64 0, metadata !291), !dbg !283 ; [debug line = 91:43@60:25] [debug variable = window.val[2][2]]
  call void @llvm.dbg.value(metadata !{i16 %window_val_0_0}, i64 0, metadata !292), !dbg !302 ; [debug line = 68:8@98:48@60:25] [debug variable = Window<3, 3, short>.val[0][0]]
  call void @llvm.dbg.value(metadata !{i16 %window_val_0_1}, i64 0, metadata !303), !dbg !302 ; [debug line = 68:8@98:48@60:25] [debug variable = Window<3, 3, short>.val[0][1]]
  call void @llvm.dbg.value(metadata !{i16 %window_val_0_2}, i64 0, metadata !304), !dbg !302 ; [debug line = 68:8@98:48@60:25] [debug variable = Window<3, 3, short>.val[0][2]]
  call void @llvm.dbg.value(metadata !{i16 %window_val_1_0}, i64 0, metadata !305), !dbg !302 ; [debug line = 68:8@98:48@60:25] [debug variable = Window<3, 3, short>.val[1][0]]
  call void @llvm.dbg.value(metadata !{i16 %window_val_1_1}, i64 0, metadata !306), !dbg !302 ; [debug line = 68:8@98:48@60:25] [debug variable = Window<3, 3, short>.val[1][1]]
  call void @llvm.dbg.value(metadata !{i16 %window_val_1_2}, i64 0, metadata !307), !dbg !302 ; [debug line = 68:8@98:48@60:25] [debug variable = Window<3, 3, short>.val[1][2]]
  call void @llvm.dbg.value(metadata !{i16 %window_val_2_0}, i64 0, metadata !308), !dbg !302 ; [debug line = 68:8@98:48@60:25] [debug variable = Window<3, 3, short>.val[2][0]]
  call void @llvm.dbg.value(metadata !{i16 %window_val_2_1}, i64 0, metadata !309), !dbg !302 ; [debug line = 68:8@98:48@60:25] [debug variable = Window<3, 3, short>.val[2][1]]
  call void @llvm.dbg.value(metadata !{i16 %window_val_2_2}, i64 0, metadata !310), !dbg !302 ; [debug line = 68:8@98:48@60:25] [debug variable = Window<3, 3, short>.val[2][2]]
  %tmp3 = add i16 %window_val_2_1, %window_val_2_0, !dbg !301 ; [#uses=2 type=i16] [debug line = 98:48@60:25]
  %tmp4 = add i16 %window_val_1_1, %window_val_1_2, !dbg !301 ; [#uses=2 type=i16] [debug line = 98:48@60:25]
  %tmp_12 = trunc i16 %tmp4 to i15                ; [#uses=1 type=i15]
  %tmp_13 = trunc i16 %tmp3 to i15                ; [#uses=1 type=i15]
  %tmp9 = add i16 %tmp3, %tmp4, !dbg !301         ; [#uses=1 type=i16] [debug line = 98:48@60:25]
  %tmp13 = add i16 %window_val_0_0, %window_val_0_1, !dbg !301 ; [#uses=2 type=i16] [debug line = 98:48@60:25]
  %tmp15 = add i16 %window_val_2_2, %window_val_0_2, !dbg !301 ; [#uses=1 type=i16] [debug line = 98:48@60:25]
  %tmp14 = add i16 %window_val_1_0, %tmp15, !dbg !301 ; [#uses=2 type=i16] [debug line = 98:48@60:25]
  %tmp_16 = trunc i16 %tmp14 to i15               ; [#uses=1 type=i15]
  %tmp_17 = trunc i16 %tmp13 to i15               ; [#uses=1 type=i15]
  %tmp12 = add i16 %tmp13, %tmp14, !dbg !301      ; [#uses=1 type=i16] [debug line = 98:48@60:25]
  %tmp_14 = add i15 %tmp_12, %tmp_13              ; [#uses=1 type=i15]
  %tmp_15 = add i15 %tmp_16, %tmp_17              ; [#uses=1 type=i15]
  %valOutput_1 = add i16 %tmp9, %tmp12, !dbg !301 ; [#uses=1 type=i16] [debug line = 98:48@60:25]
  %valOutput_1_cast = add i15 %tmp_15, %tmp_14, !dbg !281 ; [#uses=1 type=i15] [debug line = 60:25]
  call void @llvm.dbg.value(metadata !{i16 %valOutput_1}, i64 0, metadata !311), !dbg !281 ; [debug line = 60:25] [debug variable = valOutput]
  %tmp_18 = call i1 @_ssdm_op_BitSelect.i1.i16.i32(i16 %valOutput_1, i32 15), !dbg !312 ; [#uses=1 type=i1] [debug line = 61:13]
  %p_s = select i1 %tmp_18, i15 0, i15 %valOutput_1_cast, !dbg !312 ; [#uses=1 type=i15] [debug line = 61:13]
  %p_cast = zext i15 %p_s to i16, !dbg !312       ; [#uses=1 type=i16] [debug line = 61:13]
  %valOutput_2 = select i1 %or_cond6, i16 %p_cast, i16 %valOutput ; [#uses=1 type=i16]
  call void @llvm.dbg.value(metadata !{i32 %pixConvolved_2}, i64 0, metadata !313), !dbg !314 ; [debug line = 66:9] [debug variable = pixConvolved]
  %tmp_3 = icmp slt i32 %col_assign, 127, !dbg !315 ; [#uses=3 type=i1] [debug line = 67:9]
  %idxCol = add nsw i32 1, %col_assign, !dbg !316 ; [#uses=1 type=i32] [debug line = 69:13]
  call void @llvm.dbg.value(metadata !{i32 %idxCol}, i64 0, metadata !318), !dbg !316 ; [debug line = 69:13] [debug variable = idxCol]
  %idxRow_2 = add nsw i32 1, %idxRow, !dbg !319   ; [#uses=1 type=i32] [debug line = 74:13]
  call void @llvm.dbg.value(metadata !{i32 %idxRow_2}, i64 0, metadata !321), !dbg !319 ; [debug line = 74:13] [debug variable = idxRow]
  %pixConvolved_1 = select i1 %tmp_3, i32 %pixConvolved_2, i32 0, !dbg !315 ; [#uses=1 type=i32] [debug line = 67:9]
  call void @llvm.dbg.value(metadata !{i32 %pixConvolved_1}, i64 0, metadata !313), !dbg !315 ; [debug line = 67:9] [debug variable = pixConvolved]
  %idxRow_1 = select i1 %tmp_3, i32 %idxRow, i32 %idxRow_2, !dbg !315 ; [#uses=1 type=i32] [debug line = 67:9]
  call void @llvm.dbg.value(metadata !{i32 %idxRow_1}, i64 0, metadata !321), !dbg !315 ; [debug line = 67:9] [debug variable = idxRow]
  %idxCol_1 = select i1 %tmp_3, i32 %idxCol, i32 0, !dbg !315 ; [#uses=1 type=i32] [debug line = 67:9]
  call void @llvm.dbg.value(metadata !{i32 %idxCol_1}, i64 0, metadata !318), !dbg !315 ; [debug line = 67:9] [debug variable = idxCol]
  %empty_6 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str5, i32 %tmp_1) nounwind, !dbg !322 ; [#uses=0 type=i32] [debug line = 78:5]
  call void @llvm.dbg.value(metadata !{i15 %idxpixel_1}, i64 0, metadata !323), !dbg !164 ; [debug line = 28:52] [debug variable = idxpixel]
  br label %1, !dbg !164                          ; [debug line = 28:52]

.preheader10.loopexit:                            ; preds = %.preheader
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader10.preheader
  %row = phi i8 [ 0, %.preheader10.preheader ], [ %row_1, %.preheader10.loopexit ] ; [#uses=3 type=i8]
  %exitcond1 = icmp eq i8 %row, -128, !dbg !170   ; [#uses=1 type=i1] [debug line = 81:21]
  %empty_7 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 128, i64 128, i64 128) nounwind ; [#uses=0 type=i32]
  %row_1 = add i8 %row, 1, !dbg !324              ; [#uses=1 type=i8] [debug line = 81:34]
  call void @llvm.dbg.value(metadata !{i8 %row_1}, i64 0, metadata !325), !dbg !324 ; [debug line = 81:34] [debug variable = row]
  br i1 %exitcond1, label %3, label %.preheader.preheader, !dbg !170 ; [debug line = 81:21]

.preheader.preheader:                             ; preds = %.preheader10
  %tmp_19 = call i15 @_ssdm_op_BitConcatenate.i15.i8.i7(i8 %row, i7 0) ; [#uses=1 type=i15]
  %tmp_21_cast = zext i15 %tmp_19 to i16, !dbg !326 ; [#uses=1 type=i16] [debug line = 83:25]
  br label %.preheader, !dbg !326                 ; [debug line = 83:25]

.preheader:                                       ; preds = %2, %.preheader.preheader
  %col = phi i8 [ %col_1, %2 ], [ 0, %.preheader.preheader ] ; [#uses=3 type=i8]
  %exitcond = icmp eq i8 %col, -128, !dbg !326    ; [#uses=1 type=i1] [debug line = 83:25]
  %empty_8 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 128, i64 128, i64 128) nounwind ; [#uses=0 type=i32]
  %col_1 = add i8 %col, 1, !dbg !327              ; [#uses=1 type=i8] [debug line = 83:38]
  br i1 %exitcond, label %.preheader10.loopexit, label %2, !dbg !326 ; [debug line = 83:25]

; <label>:2                                       ; preds = %.preheader
  %tmp_10_cast = zext i8 %col to i16, !dbg !165   ; [#uses=1 type=i16] [debug line = 85:13]
  %tmp_20 = add i16 %tmp_21_cast, %tmp_10_cast, !dbg !165 ; [#uses=1 type=i16] [debug line = 85:13]
  %tmp_22_cast = zext i16 %tmp_20 to i64, !dbg !165 ; [#uses=1 type=i64] [debug line = 85:13]
  %output_image_addr = getelementptr [16384 x i8]* %output_image, i64 0, i64 %tmp_22_cast, !dbg !165 ; [#uses=1 type=i8*] [debug line = 85:13]
  store i8 %tmp, i8* %output_image_addr, align 1, !dbg !165 ; [debug line = 85:13]
  call void @llvm.dbg.value(metadata !{i8 %col_1}, i64 0, metadata !328), !dbg !327 ; [debug line = 83:38] [debug variable = col]
  br label %.preheader, !dbg !327                 ; [debug line = 83:38]

; <label>:3                                       ; preds = %.preheader10
  ret void, !dbg !329                             ; [debug line = 88:1]
}

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=2]
define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

; [#uses=2]
define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

; [#uses=1]
define weak void @_ssdm_op_SpecPipeline(...) nounwind {
entry:
  ret void
}

; [#uses=1]
define weak i32 @_ssdm_op_SpecMemCore(...) {
entry:
  ret i32 0
}

; [#uses=3]
define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

; [#uses=2]
define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

; [#uses=3]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=0]
declare i9 @_ssdm_op_PartSelect.i9.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=0]
declare i8 @_ssdm_op_PartSelect.i8.i16.i32.i32(i16, i32, i32) nounwind readnone

; [#uses=2]
define weak i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2) ; [#uses=1 type=i32]
  %empty_9 = trunc i32 %empty to i31              ; [#uses=1 type=i31]
  ret i31 %empty_9
}

; [#uses=0]
declare i16 @_ssdm_op_PartSelect.i16.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=0]
declare i15 @_ssdm_op_PartSelect.i15.i16.i32.i32(i16, i32, i32) nounwind readnone

; [#uses=1]
define weak i1 @_ssdm_op_BitSelect.i1.i16.i32(i16, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i16                    ; [#uses=1 type=i16]
  %empty_10 = shl i16 1, %empty                   ; [#uses=1 type=i16]
  %empty_11 = and i16 %0, %empty_10               ; [#uses=1 type=i16]
  %empty_12 = icmp ne i16 %empty_11, 0            ; [#uses=1 type=i1]
  ret i1 %empty_12
}

; [#uses=1]
define weak i16 @_ssdm_op_BitConcatenate.i16.i9.i7(i9, i7) nounwind readnone {
entry:
  %empty = zext i9 %0 to i16                      ; [#uses=1 type=i16]
  %empty_13 = zext i7 %1 to i16                   ; [#uses=1 type=i16]
  %empty_14 = shl i16 %empty, 7                   ; [#uses=1 type=i16]
  %empty_15 = or i16 %empty_14, %empty_13         ; [#uses=1 type=i16]
  ret i16 %empty_15
}

; [#uses=1]
define weak i15 @_ssdm_op_BitConcatenate.i15.i8.i7(i8, i7) nounwind readnone {
entry:
  %empty = zext i8 %0 to i15                      ; [#uses=1 type=i15]
  %empty_16 = zext i7 %1 to i15                   ; [#uses=1 type=i15]
  %empty_17 = shl i15 %empty, 7                   ; [#uses=1 type=i15]
  %empty_18 = or i15 %empty_17, %empty_16         ; [#uses=1 type=i15]
  ret i15 %empty_18
}

; [#uses=0]
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
!82 = metadata !{i32 786689, metadata !83, metadata !"input_image", null, i32 4, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!83 = metadata !{i32 786478, i32 0, metadata !84, metadata !"doConv", metadata !"doConv", metadata !"_Z6doConvPA128_hS0_Pc", metadata !84, i32 4, metadata !85, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !94, i32 7} ; [ DW_TAG_subprogram ]
!84 = metadata !{i32 786473, metadata !"core.cpp", metadata !"E:\5Chw", null} ; [ DW_TAG_file_type ]
!85 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !86, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!86 = metadata !{null, metadata !87, metadata !87, metadata !92}
!87 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !88} ; [ DW_TAG_pointer_type ]
!88 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1024, i64 8, i32 0, i32 0, metadata !89, metadata !90, i32 0, i32 0} ; [ DW_TAG_array_type ]
!89 = metadata !{i32 786468, null, metadata !"unsigned char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!90 = metadata !{metadata !91}
!91 = metadata !{i32 786465, i64 0, i64 127}      ; [ DW_TAG_subrange_type ]
!92 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !93} ; [ DW_TAG_pointer_type ]
!93 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!94 = metadata !{metadata !95}
!95 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!96 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 131072, i64 8, i32 0, i32 0, metadata !89, metadata !97, i32 0, i32 0} ; [ DW_TAG_array_type ]
!97 = metadata !{metadata !91, metadata !91}
!98 = metadata !{i32 4, i32 27, metadata !83, null}
!99 = metadata !{i32 786689, metadata !83, metadata !"output_image", null, i32 5, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!100 = metadata !{i32 5, i32 28, metadata !83, null}
!101 = metadata !{i32 786689, metadata !83, metadata !"kernel", null, i32 6, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!102 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 72, i64 8, i32 0, i32 0, metadata !93, metadata !103, i32 0, i32 0} ; [ DW_TAG_array_type ]
!103 = metadata !{metadata !104}
!104 = metadata !{i32 786465, i64 0, i64 8}       ; [ DW_TAG_subrange_type ]
!105 = metadata !{i32 6, i32 19, metadata !83, null}
!106 = metadata !{i32 8, i32 1, metadata !107, null}
!107 = metadata !{i32 786443, metadata !83, i32 7, i32 1, metadata !84, i32 0} ; [ DW_TAG_lexical_block ]
!108 = metadata !{i32 790529, metadata !109, metadata !"lineBuff.val[0]", null, i32 13, metadata !149, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!109 = metadata !{i32 786688, metadata !107, metadata !"lineBuff", metadata !84, i32 13, metadata !110, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!110 = metadata !{i32 786434, metadata !111, metadata !"LineBuffer<3, 128, unsigned char, 0>", metadata !112, i32 621, i64 3072, i64 8, i32 0, i32 0, null, metadata !113, i32 0, null, metadata !144} ; [ DW_TAG_class_type ]
!111 = metadata !{i32 786489, null, metadata !"hls", metadata !112, i32 45} ; [ DW_TAG_namespace ]
!112 = metadata !{i32 786473, metadata !"E:/Program/Xilinx/Vivado/2018.1/common/technology/autopilot/hls/hls_video_mem.h", metadata !"E:\5Chw", null} ; [ DW_TAG_file_type ]
!113 = metadata !{metadata !114, metadata !118, metadata !122, metadata !126, metadata !127, metadata !130, metadata !131, metadata !135, metadata !139, metadata !140, metadata !141, metadata !142, metadata !143}
!114 = metadata !{i32 786445, metadata !110, metadata !"val", metadata !112, i32 645, i64 3072, i64 8, i64 0, i32 0, metadata !115} ; [ DW_TAG_member ]
!115 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 3072, i64 8, i32 0, i32 0, metadata !89, metadata !116, i32 0, i32 0} ; [ DW_TAG_array_type ]
!116 = metadata !{metadata !117, metadata !91}
!117 = metadata !{i32 786465, i64 0, i64 2}       ; [ DW_TAG_subrange_type ]
!118 = metadata !{i32 786478, i32 0, metadata !110, metadata !"LineBuffer", metadata !"LineBuffer", metadata !"", metadata !112, i32 623, metadata !119, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 623} ; [ DW_TAG_subprogram ]
!119 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !120, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!120 = metadata !{null, metadata !121}
!121 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !110} ; [ DW_TAG_pointer_type ]
!122 = metadata !{i32 786478, i32 0, metadata !110, metadata !"shift_pixels_up", metadata !"shift_pixels_up", metadata !"_ZN3hls10LineBufferILi3ELi128EhLi0EE15shift_pixels_upEi", metadata !112, i32 629, metadata !123, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 629} ; [ DW_TAG_subprogram ]
!123 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !124, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!124 = metadata !{null, metadata !121, metadata !125}
!125 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!126 = metadata !{i32 786478, i32 0, metadata !110, metadata !"shift_pixels_down", metadata !"shift_pixels_down", metadata !"_ZN3hls10LineBufferILi3ELi128EhLi0EE17shift_pixels_downEi", metadata !112, i32 630, metadata !123, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 630} ; [ DW_TAG_subprogram ]
!127 = metadata !{i32 786478, i32 0, metadata !110, metadata !"insert_bottom_row", metadata !"insert_bottom_row", metadata !"_ZN3hls10LineBufferILi3ELi128EhLi0EE17insert_bottom_rowEhi", metadata !112, i32 631, metadata !128, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 631} ; [ DW_TAG_subprogram ]
!128 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !129, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!129 = metadata !{null, metadata !121, metadata !89, metadata !125}
!130 = metadata !{i32 786478, i32 0, metadata !110, metadata !"insert_top_row", metadata !"insert_top_row", metadata !"_ZN3hls10LineBufferILi3ELi128EhLi0EE14insert_top_rowEhi", metadata !112, i32 632, metadata !128, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 632} ; [ DW_TAG_subprogram ]
!131 = metadata !{i32 786478, i32 0, metadata !110, metadata !"get_col", metadata !"get_col", metadata !"_ZN3hls10LineBufferILi3ELi128EhLi0EE7get_colEPhi", metadata !112, i32 633, metadata !132, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 633} ; [ DW_TAG_subprogram ]
!132 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !133, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!133 = metadata !{null, metadata !121, metadata !134, metadata !125}
!134 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !89} ; [ DW_TAG_pointer_type ]
!135 = metadata !{i32 786478, i32 0, metadata !110, metadata !"getval", metadata !"getval", metadata !"_ZN3hls10LineBufferILi3ELi128EhLi0EE6getvalEii", metadata !112, i32 634, metadata !136, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 634} ; [ DW_TAG_subprogram ]
!136 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !137, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!137 = metadata !{metadata !138, metadata !121, metadata !125, metadata !125}
!138 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !89} ; [ DW_TAG_reference_type ]
!139 = metadata !{i32 786478, i32 0, metadata !110, metadata !"operator()", metadata !"operator()", metadata !"_ZN3hls10LineBufferILi3ELi128EhLi0EEclEii", metadata !112, i32 635, metadata !136, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 635} ; [ DW_TAG_subprogram ]
!140 = metadata !{i32 786478, i32 0, metadata !110, metadata !"shift_up", metadata !"shift_up", metadata !"_ZN3hls10LineBufferILi3ELi128EhLi0EE8shift_upEi", metadata !112, i32 638, metadata !123, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 638} ; [ DW_TAG_subprogram ]
!141 = metadata !{i32 786478, i32 0, metadata !110, metadata !"shift_down", metadata !"shift_down", metadata !"_ZN3hls10LineBufferILi3ELi128EhLi0EE10shift_downEi", metadata !112, i32 639, metadata !123, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 639} ; [ DW_TAG_subprogram ]
!142 = metadata !{i32 786478, i32 0, metadata !110, metadata !"insert_bottom", metadata !"insert_bottom", metadata !"_ZN3hls10LineBufferILi3ELi128EhLi0EE13insert_bottomEhi", metadata !112, i32 640, metadata !128, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 640} ; [ DW_TAG_subprogram ]
!143 = metadata !{i32 786478, i32 0, metadata !110, metadata !"insert_top", metadata !"insert_top", metadata !"_ZN3hls10LineBufferILi3ELi128EhLi0EE10insert_topEhi", metadata !112, i32 641, metadata !128, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 641} ; [ DW_TAG_subprogram ]
!144 = metadata !{metadata !145, metadata !146, metadata !147, metadata !148}
!145 = metadata !{i32 786480, null, metadata !"ROWS", metadata !125, i64 3, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!146 = metadata !{i32 786480, null, metadata !"COLS", metadata !125, i64 128, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!147 = metadata !{i32 786479, null, metadata !"T", metadata !89, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!148 = metadata !{i32 786480, null, metadata !"RESHAPE", metadata !125, i64 0, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!149 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1024, i64 8, i32 0, i32 0, null, metadata !150, i32 0, i32 0} ; [ DW_TAG_array_type ]
!150 = metadata !{metadata !151}
!151 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1024, i64 8, i32 0, i32 0, metadata !89, metadata !116, i32 0, i32 0} ; [ DW_TAG_array_type ]
!152 = metadata !{i32 13, i32 41, metadata !107, null}
!153 = metadata !{i32 790529, metadata !109, metadata !"lineBuff.val[1]", null, i32 13, metadata !149, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!154 = metadata !{i32 790529, metadata !109, metadata !"lineBuff.val[2]", null, i32 13, metadata !149, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!155 = metadata !{i32 50, i32 85, metadata !156, null}
!156 = metadata !{i32 786443, metadata !157, i32 46, i32 17, metadata !84, i32 7} ; [ DW_TAG_lexical_block ]
!157 = metadata !{i32 786443, metadata !158, i32 45, i32 17, metadata !84, i32 6} ; [ DW_TAG_lexical_block ]
!158 = metadata !{i32 786443, metadata !159, i32 44, i32 13, metadata !84, i32 5} ; [ DW_TAG_lexical_block ]
!159 = metadata !{i32 786443, metadata !160, i32 43, i32 13, metadata !84, i32 4} ; [ DW_TAG_lexical_block ]
!160 = metadata !{i32 786443, metadata !161, i32 41, i32 9, metadata !84, i32 3} ; [ DW_TAG_lexical_block ]
!161 = metadata !{i32 786443, metadata !162, i32 29, i32 5, metadata !84, i32 2} ; [ DW_TAG_lexical_block ]
!162 = metadata !{i32 786443, metadata !107, i32 28, i32 5, metadata !84, i32 1} ; [ DW_TAG_lexical_block ]
!163 = metadata !{i32 28, i32 26, metadata !162, null}
!164 = metadata !{i32 28, i32 52, metadata !162, null}
!165 = metadata !{i32 85, i32 13, metadata !166, null}
!166 = metadata !{i32 786443, metadata !167, i32 84, i32 9, metadata !84, i32 14} ; [ DW_TAG_lexical_block ]
!167 = metadata !{i32 786443, metadata !168, i32 83, i32 9, metadata !84, i32 13} ; [ DW_TAG_lexical_block ]
!168 = metadata !{i32 786443, metadata !169, i32 82, i32 5, metadata !84, i32 12} ; [ DW_TAG_lexical_block ]
!169 = metadata !{i32 786443, metadata !107, i32 81, i32 5, metadata !84, i32 11} ; [ DW_TAG_lexical_block ]
!170 = metadata !{i32 81, i32 21, metadata !169, null}
!171 = metadata !{i32 29, i32 6, metadata !161, null}
!172 = metadata !{i32 30, i32 1, metadata !161, null}
!173 = metadata !{i32 32, i32 53, metadata !161, null}
!174 = metadata !{i32 786688, metadata !161, metadata !"pixelin", metadata !84, i32 32, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!175 = metadata !{i32 786689, metadata !176, metadata !"col", metadata !112, i32 33555070, metadata !125, i32 0, metadata !177} ; [ DW_TAG_arg_variable ]
!176 = metadata !{i32 786478, i32 0, metadata !111, metadata !"shift_up", metadata !"shift_up", metadata !"_ZN3hls10LineBufferILi3ELi128EhLi0EE8shift_upEi", metadata !112, i32 638, metadata !123, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !140, metadata !94, i32 861} ; [ DW_TAG_subprogram ]
!177 = metadata !{i32 35, i32 9, metadata !161, null}
!178 = metadata !{i32 638, i32 23, metadata !176, metadata !177}
!179 = metadata !{i32 786689, metadata !180, metadata !"col", metadata !112, i32 33555061, metadata !125, i32 0, metadata !181} ; [ DW_TAG_arg_variable ]
!180 = metadata !{i32 786478, i32 0, metadata !111, metadata !"shift_pixels_up", metadata !"shift_pixels_up", metadata !"_ZN3hls10LineBufferILi3ELi128EhLi0EE15shift_pixels_upEi", metadata !112, i32 629, metadata !123, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !122, metadata !94, i32 716} ; [ DW_TAG_subprogram ]
!181 = metadata !{i32 863, i32 5, metadata !182, metadata !177}
!182 = metadata !{i32 786443, metadata !176, i32 861, i32 92, metadata !112, i32 26} ; [ DW_TAG_lexical_block ]
!183 = metadata !{i32 629, i32 30, metadata !180, metadata !181}
!184 = metadata !{i32 729, i32 27, metadata !185, metadata !181}
!185 = metadata !{i32 786443, metadata !186, i32 727, i32 33, metadata !112, i32 29} ; [ DW_TAG_lexical_block ]
!186 = metadata !{i32 786443, metadata !187, i32 727, i32 5, metadata !112, i32 28} ; [ DW_TAG_lexical_block ]
!187 = metadata !{i32 786443, metadata !180, i32 716, i32 99, metadata !112, i32 27} ; [ DW_TAG_lexical_block ]
!188 = metadata !{i32 729, i32 13, metadata !185, metadata !181}
!189 = metadata !{i32 786689, metadata !190, metadata !"value", metadata !112, i32 33555073, metadata !89, i32 0, metadata !191} ; [ DW_TAG_arg_variable ]
!190 = metadata !{i32 786478, i32 0, metadata !111, metadata !"insert_top", metadata !"insert_top", metadata !"_ZN3hls10LineBufferILi3ELi128EhLi0EE10insert_topEhi", metadata !112, i32 641, metadata !128, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !143, metadata !94, i32 881} ; [ DW_TAG_subprogram ]
!191 = metadata !{i32 36, i32 9, metadata !161, null}
!192 = metadata !{i32 641, i32 23, metadata !190, metadata !191}
!193 = metadata !{i32 786689, metadata !190, metadata !"col", metadata !112, i32 50332289, metadata !125, i32 0, metadata !191} ; [ DW_TAG_arg_variable ]
!194 = metadata !{i32 641, i32 34, metadata !190, metadata !191}
!195 = metadata !{i32 786689, metadata !196, metadata !"value", metadata !112, i32 33555063, metadata !89, i32 0, metadata !197} ; [ DW_TAG_arg_variable ]
!196 = metadata !{i32 786478, i32 0, metadata !111, metadata !"insert_bottom_row", metadata !"insert_bottom_row", metadata !"_ZN3hls10LineBufferILi3ELi128EhLi0EE17insert_bottom_rowEhi", metadata !112, i32 631, metadata !128, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !127, metadata !94, i32 755} ; [ DW_TAG_subprogram ]
!197 = metadata !{i32 883, i32 5, metadata !198, metadata !191}
!198 = metadata !{i32 786443, metadata !190, i32 881, i32 104, metadata !112, i32 24} ; [ DW_TAG_lexical_block ]
!199 = metadata !{i32 631, i32 30, metadata !196, metadata !197}
!200 = metadata !{i32 786689, metadata !196, metadata !"col", metadata !112, i32 50332279, metadata !125, i32 0, metadata !197} ; [ DW_TAG_arg_variable ]
!201 = metadata !{i32 631, i32 41, metadata !196, metadata !197}
!202 = metadata !{i32 765, i32 5, metadata !203, metadata !197}
!203 = metadata !{i32 786443, metadata !196, i32 755, i32 110, metadata !112, i32 25} ; [ DW_TAG_lexical_block ]
!204 = metadata !{i32 39, i32 9, metadata !161, null}
!205 = metadata !{i32 835, i32 5, metadata !206, metadata !208}
!206 = metadata !{i32 786443, metadata !207, i32 832, i32 98, metadata !112, i32 23} ; [ DW_TAG_lexical_block ]
!207 = metadata !{i32 786478, i32 0, metadata !111, metadata !"getval", metadata !"getval", metadata !"_ZN3hls10LineBufferILi3ELi128EhLi0EE6getvalEii", metadata !112, i32 634, metadata !136, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !135, metadata !94, i32 832} ; [ DW_TAG_subprogram ]
!208 = metadata !{i32 47, i32 44, metadata !156, null}
!209 = metadata !{i32 790529, metadata !210, metadata !"window.val[0][0]", null, i32 14, metadata !256, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!210 = metadata !{i32 786688, metadata !107, metadata !"window", metadata !84, i32 14, metadata !211, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!211 = metadata !{i32 786434, metadata !111, metadata !"Window<3, 3, short>", metadata !112, i32 49, i64 144, i64 16, i32 0, i32 0, null, metadata !212, i32 0, null, metadata !253} ; [ DW_TAG_class_type ]
!212 = metadata !{metadata !213, metadata !217, metadata !221, metadata !222, metadata !223, metadata !224, metadata !225, metadata !228, metadata !232, metadata !235, metadata !236, metadata !237, metadata !238, metadata !239, metadata !243, metadata !244, metadata !245, metadata !246, metadata !247, metadata !248, metadata !249, metadata !250, metadata !251, metadata !252}
!213 = metadata !{i32 786445, metadata !211, metadata !"val", metadata !112, i32 84, i64 144, i64 16, i64 0, i32 0, metadata !214} ; [ DW_TAG_member ]
!214 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 144, i64 16, i32 0, i32 0, metadata !215, metadata !216, i32 0, i32 0} ; [ DW_TAG_array_type ]
!215 = metadata !{i32 786468, null, metadata !"short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!216 = metadata !{metadata !117, metadata !117}
!217 = metadata !{i32 786478, i32 0, metadata !211, metadata !"Window", metadata !"Window", metadata !"", metadata !112, i32 51, metadata !218, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 51} ; [ DW_TAG_subprogram ]
!218 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !219, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!219 = metadata !{null, metadata !220}
!220 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !211} ; [ DW_TAG_pointer_type ]
!221 = metadata !{i32 786478, i32 0, metadata !211, metadata !"shift_pixels_left", metadata !"shift_pixels_left", metadata !"_ZN3hls6WindowILi3ELi3EsE17shift_pixels_leftEv", metadata !112, i32 57, metadata !218, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 57} ; [ DW_TAG_subprogram ]
!222 = metadata !{i32 786478, i32 0, metadata !211, metadata !"shift_pixels_right", metadata !"shift_pixels_right", metadata !"_ZN3hls6WindowILi3ELi3EsE18shift_pixels_rightEv", metadata !112, i32 58, metadata !218, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 58} ; [ DW_TAG_subprogram ]
!223 = metadata !{i32 786478, i32 0, metadata !211, metadata !"shift_pixels_up", metadata !"shift_pixels_up", metadata !"_ZN3hls6WindowILi3ELi3EsE15shift_pixels_upEv", metadata !112, i32 59, metadata !218, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 59} ; [ DW_TAG_subprogram ]
!224 = metadata !{i32 786478, i32 0, metadata !211, metadata !"shift_pixels_down", metadata !"shift_pixels_down", metadata !"_ZN3hls6WindowILi3ELi3EsE17shift_pixels_downEv", metadata !112, i32 60, metadata !218, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 60} ; [ DW_TAG_subprogram ]
!225 = metadata !{i32 786478, i32 0, metadata !211, metadata !"insert_pixel", metadata !"insert_pixel", metadata !"_ZN3hls6WindowILi3ELi3EsE12insert_pixelEsii", metadata !112, i32 61, metadata !226, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 61} ; [ DW_TAG_subprogram ]
!226 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !227, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!227 = metadata !{null, metadata !220, metadata !215, metadata !125, metadata !125}
!228 = metadata !{i32 786478, i32 0, metadata !211, metadata !"insert_row", metadata !"insert_row", metadata !"_ZN3hls6WindowILi3ELi3EsE10insert_rowEPsi", metadata !112, i32 62, metadata !229, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 62} ; [ DW_TAG_subprogram ]
!229 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !230, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!230 = metadata !{null, metadata !220, metadata !231, metadata !125}
!231 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !215} ; [ DW_TAG_pointer_type ]
!232 = metadata !{i32 786478, i32 0, metadata !211, metadata !"insert_top_row", metadata !"insert_top_row", metadata !"_ZN3hls6WindowILi3ELi3EsE14insert_top_rowEPs", metadata !112, i32 63, metadata !233, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 63} ; [ DW_TAG_subprogram ]
!233 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !234, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!234 = metadata !{null, metadata !220, metadata !231}
!235 = metadata !{i32 786478, i32 0, metadata !211, metadata !"insert_bottom_row", metadata !"insert_bottom_row", metadata !"_ZN3hls6WindowILi3ELi3EsE17insert_bottom_rowEPs", metadata !112, i32 64, metadata !233, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 64} ; [ DW_TAG_subprogram ]
!236 = metadata !{i32 786478, i32 0, metadata !211, metadata !"insert_col", metadata !"insert_col", metadata !"_ZN3hls6WindowILi3ELi3EsE10insert_colEPsi", metadata !112, i32 65, metadata !229, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 65} ; [ DW_TAG_subprogram ]
!237 = metadata !{i32 786478, i32 0, metadata !211, metadata !"insert_left_col", metadata !"insert_left_col", metadata !"_ZN3hls6WindowILi3ELi3EsE15insert_left_colEPs", metadata !112, i32 66, metadata !233, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 66} ; [ DW_TAG_subprogram ]
!238 = metadata !{i32 786478, i32 0, metadata !211, metadata !"insert_right_col", metadata !"insert_right_col", metadata !"_ZN3hls6WindowILi3ELi3EsE16insert_right_colEPs", metadata !112, i32 67, metadata !233, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 67} ; [ DW_TAG_subprogram ]
!239 = metadata !{i32 786478, i32 0, metadata !211, metadata !"getval", metadata !"getval", metadata !"_ZN3hls6WindowILi3ELi3EsE6getvalEii", metadata !112, i32 68, metadata !240, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 68} ; [ DW_TAG_subprogram ]
!240 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !241, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!241 = metadata !{metadata !242, metadata !220, metadata !125, metadata !125}
!242 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !215} ; [ DW_TAG_reference_type ]
!243 = metadata !{i32 786478, i32 0, metadata !211, metadata !"operator()", metadata !"operator()", metadata !"_ZN3hls6WindowILi3ELi3EsEclEii", metadata !112, i32 69, metadata !240, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 69} ; [ DW_TAG_subprogram ]
!244 = metadata !{i32 786478, i32 0, metadata !211, metadata !"shift_left", metadata !"shift_left", metadata !"_ZN3hls6WindowILi3ELi3EsE10shift_leftEv", metadata !112, i32 72, metadata !218, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 72} ; [ DW_TAG_subprogram ]
!245 = metadata !{i32 786478, i32 0, metadata !211, metadata !"shift_right", metadata !"shift_right", metadata !"_ZN3hls6WindowILi3ELi3EsE11shift_rightEv", metadata !112, i32 73, metadata !218, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 73} ; [ DW_TAG_subprogram ]
!246 = metadata !{i32 786478, i32 0, metadata !211, metadata !"shift_up", metadata !"shift_up", metadata !"_ZN3hls6WindowILi3ELi3EsE8shift_upEv", metadata !112, i32 74, metadata !218, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 74} ; [ DW_TAG_subprogram ]
!247 = metadata !{i32 786478, i32 0, metadata !211, metadata !"shift_down", metadata !"shift_down", metadata !"_ZN3hls6WindowILi3ELi3EsE10shift_downEv", metadata !112, i32 75, metadata !218, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 75} ; [ DW_TAG_subprogram ]
!248 = metadata !{i32 786478, i32 0, metadata !211, metadata !"insert", metadata !"insert", metadata !"_ZN3hls6WindowILi3ELi3EsE6insertEsii", metadata !112, i32 76, metadata !226, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 76} ; [ DW_TAG_subprogram ]
!249 = metadata !{i32 786478, i32 0, metadata !211, metadata !"insert_top", metadata !"insert_top", metadata !"_ZN3hls6WindowILi3ELi3EsE10insert_topEPs", metadata !112, i32 77, metadata !233, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 77} ; [ DW_TAG_subprogram ]
!250 = metadata !{i32 786478, i32 0, metadata !211, metadata !"insert_bottom", metadata !"insert_bottom", metadata !"_ZN3hls6WindowILi3ELi3EsE13insert_bottomEPs", metadata !112, i32 78, metadata !233, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 78} ; [ DW_TAG_subprogram ]
!251 = metadata !{i32 786478, i32 0, metadata !211, metadata !"insert_left", metadata !"insert_left", metadata !"_ZN3hls6WindowILi3ELi3EsE11insert_leftEPs", metadata !112, i32 79, metadata !233, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 79} ; [ DW_TAG_subprogram ]
!252 = metadata !{i32 786478, i32 0, metadata !211, metadata !"insert_right", metadata !"insert_right", metadata !"_ZN3hls6WindowILi3ELi3EsE12insert_rightEPs", metadata !112, i32 80, metadata !233, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !94, i32 80} ; [ DW_TAG_subprogram ]
!253 = metadata !{metadata !145, metadata !254, metadata !255}
!254 = metadata !{i32 786480, null, metadata !"COLS", metadata !125, i64 3, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!255 = metadata !{i32 786479, null, metadata !"T", metadata !215, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!256 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 16, i64 16, i32 0, i32 0, null, metadata !257, i32 0, i32 0} ; [ DW_TAG_array_type ]
!257 = metadata !{metadata !258}
!258 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 48, i64 16, i32 0, i32 0, metadata !215, metadata !216, i32 0, i32 0} ; [ DW_TAG_array_type ]
!259 = metadata !{i32 274, i32 5, metadata !260, metadata !262}
!260 = metadata !{i32 786443, metadata !261, i32 264, i32 110, metadata !112, i32 22} ; [ DW_TAG_lexical_block ]
!261 = metadata !{i32 786478, i32 0, metadata !111, metadata !"insert_pixel", metadata !"insert_pixel", metadata !"_ZN3hls6WindowILi3ELi3EsE12insert_pixelEsii", metadata !112, i32 61, metadata !226, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !225, metadata !94, i32 264} ; [ DW_TAG_subprogram ]
!262 = metadata !{i32 573, i32 5, metadata !263, metadata !265}
!263 = metadata !{i32 786443, metadata !264, i32 571, i32 104, metadata !112, i32 21} ; [ DW_TAG_lexical_block ]
!264 = metadata !{i32 786478, i32 0, metadata !111, metadata !"insert", metadata !"insert", metadata !"_ZN3hls6WindowILi3ELi3EsE6insertEsii", metadata !112, i32 76, metadata !226, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !248, metadata !94, i32 571} ; [ DW_TAG_subprogram ]
!265 = metadata !{i32 51, i32 21, metadata !156, null}
!266 = metadata !{i32 790529, metadata !210, metadata !"window.val[0][1]", null, i32 14, metadata !256, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!267 = metadata !{i32 790529, metadata !210, metadata !"window.val[0][2]", null, i32 14, metadata !256, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!268 = metadata !{i32 790529, metadata !210, metadata !"window.val[1][0]", null, i32 14, metadata !256, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!269 = metadata !{i32 790529, metadata !210, metadata !"window.val[1][1]", null, i32 14, metadata !256, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!270 = metadata !{i32 790529, metadata !210, metadata !"window.val[1][2]", null, i32 14, metadata !256, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!271 = metadata !{i32 790529, metadata !210, metadata !"window.val[2][0]", null, i32 14, metadata !256, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!272 = metadata !{i32 790529, metadata !210, metadata !"window.val[2][1]", null, i32 14, metadata !256, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!273 = metadata !{i32 790529, metadata !210, metadata !"window.val[2][2]", null, i32 14, metadata !256, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!274 = metadata !{i32 790533, metadata !275, metadata !"window.val[0][0]", null, i32 91, metadata !280, i32 0, metadata !281} ; [ DW_TAG_arg_variable_field_ro ]
!275 = metadata !{i32 786689, metadata !276, metadata !"window", metadata !84, i32 16777307, metadata !279, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!276 = metadata !{i32 786478, i32 0, metadata !84, metadata !"sumWindow", metadata !"sumWindow", metadata !"_Z9sumWindowPN3hls6WindowILi3ELi3EsEE", metadata !84, i32 91, metadata !277, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !94, i32 92} ; [ DW_TAG_subprogram ]
!277 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !278, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!278 = metadata !{metadata !215, metadata !279}
!279 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !211} ; [ DW_TAG_pointer_type ]
!280 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !256} ; [ DW_TAG_pointer_type ]
!281 = metadata !{i32 60, i32 25, metadata !282, null}
!282 = metadata !{i32 786443, metadata !161, i32 59, i32 9, metadata !84, i32 8} ; [ DW_TAG_lexical_block ]
!283 = metadata !{i32 91, i32 43, metadata !276, metadata !281}
!284 = metadata !{i32 790533, metadata !275, metadata !"window.val[0][1]", null, i32 91, metadata !280, i32 0, metadata !281} ; [ DW_TAG_arg_variable_field_ro ]
!285 = metadata !{i32 790533, metadata !275, metadata !"window.val[0][2]", null, i32 91, metadata !280, i32 0, metadata !281} ; [ DW_TAG_arg_variable_field_ro ]
!286 = metadata !{i32 790533, metadata !275, metadata !"window.val[1][0]", null, i32 91, metadata !280, i32 0, metadata !281} ; [ DW_TAG_arg_variable_field_ro ]
!287 = metadata !{i32 790533, metadata !275, metadata !"window.val[1][1]", null, i32 91, metadata !280, i32 0, metadata !281} ; [ DW_TAG_arg_variable_field_ro ]
!288 = metadata !{i32 790533, metadata !275, metadata !"window.val[1][2]", null, i32 91, metadata !280, i32 0, metadata !281} ; [ DW_TAG_arg_variable_field_ro ]
!289 = metadata !{i32 790533, metadata !275, metadata !"window.val[2][0]", null, i32 91, metadata !280, i32 0, metadata !281} ; [ DW_TAG_arg_variable_field_ro ]
!290 = metadata !{i32 790533, metadata !275, metadata !"window.val[2][1]", null, i32 91, metadata !280, i32 0, metadata !281} ; [ DW_TAG_arg_variable_field_ro ]
!291 = metadata !{i32 790533, metadata !275, metadata !"window.val[2][2]", null, i32 91, metadata !280, i32 0, metadata !281} ; [ DW_TAG_arg_variable_field_ro ]
!292 = metadata !{i32 790533, metadata !293, metadata !"Window<3, 3, short>.val[0][0]", null, i32 68, metadata !280, i32 0, metadata !301} ; [ DW_TAG_arg_variable_field_ro ]
!293 = metadata !{i32 786689, metadata !294, metadata !"this", metadata !112, i32 16777284, metadata !279, i32 64, metadata !295} ; [ DW_TAG_arg_variable ]
!294 = metadata !{i32 786478, i32 0, metadata !111, metadata !"getval", metadata !"getval", metadata !"_ZN3hls6WindowILi3ELi3EsE6getvalEii", metadata !112, i32 68, metadata !240, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !239, metadata !94, i32 490} ; [ DW_TAG_subprogram ]
!295 = metadata !{i32 98, i32 48, metadata !296, null}
!296 = metadata !{i32 786443, metadata !297, i32 97, i32 9, metadata !84, i32 19} ; [ DW_TAG_lexical_block ]
!297 = metadata !{i32 786443, metadata !298, i32 96, i32 9, metadata !84, i32 18} ; [ DW_TAG_lexical_block ]
!298 = metadata !{i32 786443, metadata !299, i32 95, i32 5, metadata !84, i32 17} ; [ DW_TAG_lexical_block ]
!299 = metadata !{i32 786443, metadata !300, i32 94, i32 5, metadata !84, i32 16} ; [ DW_TAG_lexical_block ]
!300 = metadata !{i32 786443, metadata !276, i32 92, i32 1, metadata !84, i32 15} ; [ DW_TAG_lexical_block ]
!301 = metadata !{i32 98, i32 48, metadata !296, metadata !281}
!302 = metadata !{i32 68, i32 8, metadata !294, metadata !301}
!303 = metadata !{i32 790533, metadata !293, metadata !"Window<3, 3, short>.val[0][1]", null, i32 68, metadata !280, i32 0, metadata !301} ; [ DW_TAG_arg_variable_field_ro ]
!304 = metadata !{i32 790533, metadata !293, metadata !"Window<3, 3, short>.val[0][2]", null, i32 68, metadata !280, i32 0, metadata !301} ; [ DW_TAG_arg_variable_field_ro ]
!305 = metadata !{i32 790533, metadata !293, metadata !"Window<3, 3, short>.val[1][0]", null, i32 68, metadata !280, i32 0, metadata !301} ; [ DW_TAG_arg_variable_field_ro ]
!306 = metadata !{i32 790533, metadata !293, metadata !"Window<3, 3, short>.val[1][1]", null, i32 68, metadata !280, i32 0, metadata !301} ; [ DW_TAG_arg_variable_field_ro ]
!307 = metadata !{i32 790533, metadata !293, metadata !"Window<3, 3, short>.val[1][2]", null, i32 68, metadata !280, i32 0, metadata !301} ; [ DW_TAG_arg_variable_field_ro ]
!308 = metadata !{i32 790533, metadata !293, metadata !"Window<3, 3, short>.val[2][0]", null, i32 68, metadata !280, i32 0, metadata !301} ; [ DW_TAG_arg_variable_field_ro ]
!309 = metadata !{i32 790533, metadata !293, metadata !"Window<3, 3, short>.val[2][1]", null, i32 68, metadata !280, i32 0, metadata !301} ; [ DW_TAG_arg_variable_field_ro ]
!310 = metadata !{i32 790533, metadata !293, metadata !"Window<3, 3, short>.val[2][2]", null, i32 68, metadata !280, i32 0, metadata !301} ; [ DW_TAG_arg_variable_field_ro ]
!311 = metadata !{i32 786688, metadata !107, metadata !"valOutput", metadata !84, i32 25, metadata !215, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!312 = metadata !{i32 61, i32 13, metadata !282, null}
!313 = metadata !{i32 786688, metadata !107, metadata !"pixConvolved", metadata !84, i32 18, metadata !125, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!314 = metadata !{i32 66, i32 9, metadata !161, null}
!315 = metadata !{i32 67, i32 9, metadata !161, null}
!316 = metadata !{i32 69, i32 13, metadata !317, null}
!317 = metadata !{i32 786443, metadata !161, i32 68, i32 9, metadata !84, i32 9} ; [ DW_TAG_lexical_block ]
!318 = metadata !{i32 786688, metadata !107, metadata !"idxCol", metadata !84, i32 16, metadata !125, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!319 = metadata !{i32 74, i32 13, metadata !320, null}
!320 = metadata !{i32 786443, metadata !161, i32 72, i32 9, metadata !84, i32 10} ; [ DW_TAG_lexical_block ]
!321 = metadata !{i32 786688, metadata !107, metadata !"idxRow", metadata !84, i32 17, metadata !125, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!322 = metadata !{i32 78, i32 5, metadata !161, null}
!323 = metadata !{i32 786688, metadata !162, metadata !"idxpixel", metadata !84, i32 28, metadata !125, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!324 = metadata !{i32 81, i32 34, metadata !169, null}
!325 = metadata !{i32 786688, metadata !169, metadata !"row", metadata !84, i32 81, metadata !125, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!326 = metadata !{i32 83, i32 25, metadata !167, null}
!327 = metadata !{i32 83, i32 38, metadata !167, null}
!328 = metadata !{i32 786688, metadata !167, metadata !"col", metadata !84, i32 83, metadata !125, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!329 = metadata !{i32 88, i32 1, metadata !107, null}
