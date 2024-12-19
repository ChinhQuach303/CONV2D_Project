set C_TypeInfoList {{ 
"doConv" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"input_image": [[], {"array": [ {"array": [ {"scalar": "unsigned char"}, [128]]}, [128]]}] }, {"output_image": [[], {"array": [ {"array": [ {"scalar": "unsigned char"}, [128]]}, [128]]}] }, {"kernel": [[], {"array": [ {"scalar": "char"}, [9]]}] }],[],""]
}}
set moduleName doConv
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {doConv}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_image int 8 regular {array 16384 { 1 3 } 1 1 }  }
	{ output_image int 8 regular {array 16384 { 0 3 } 0 1 }  }
	{ kernel int 8 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "input_image", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "input_image","cData": "unsigned char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 127,"step" : 1},{"low" : 0,"up" : 127,"step" : 1}]}]}]} , 
 	{ "Name" : "output_image", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "output_image","cData": "unsigned char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 127,"step" : 1},{"low" : 0,"up" : 127,"step" : 1}]}]}]} , 
 	{ "Name" : "kernel", "interface" : "axi_slave", "bundle":"KERNEL_BUS","type":"ap_memory","bitwidth" : 8, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "kernel","cData": "char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 8,"step" : 1}]}]}], "offset" : {"in":16}, "offset_end" : {"in":31}} ]}
# RTL Port declarations: 
set portNum 44
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ input_image_address0 sc_out sc_lv 14 signal 0 } 
	{ input_image_ce0 sc_out sc_logic 1 signal 0 } 
	{ input_image_q0 sc_in sc_lv 8 signal 0 } 
	{ output_image_address0 sc_out sc_lv 14 signal 1 } 
	{ output_image_ce0 sc_out sc_logic 1 signal 1 } 
	{ output_image_we0 sc_out sc_logic 1 signal 1 } 
	{ output_image_d0 sc_out sc_lv 8 signal 1 } 
	{ s_axi_CTRL_BUS_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BUS_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BUS_AWADDR sc_in sc_lv 4 signal -1 } 
	{ s_axi_CTRL_BUS_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BUS_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BUS_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_CTRL_BUS_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_CTRL_BUS_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BUS_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BUS_ARADDR sc_in sc_lv 4 signal -1 } 
	{ s_axi_CTRL_BUS_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BUS_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BUS_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_CTRL_BUS_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_CTRL_BUS_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BUS_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BUS_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
	{ s_axi_KERNEL_BUS_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_KERNEL_BUS_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_KERNEL_BUS_AWADDR sc_in sc_lv 5 signal -1 } 
	{ s_axi_KERNEL_BUS_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_KERNEL_BUS_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_KERNEL_BUS_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_KERNEL_BUS_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_KERNEL_BUS_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_KERNEL_BUS_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_KERNEL_BUS_ARADDR sc_in sc_lv 5 signal -1 } 
	{ s_axi_KERNEL_BUS_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_KERNEL_BUS_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_KERNEL_BUS_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_KERNEL_BUS_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_KERNEL_BUS_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_KERNEL_BUS_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_KERNEL_BUS_BRESP sc_out sc_lv 2 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_CTRL_BUS_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "AWADDR" },"address":[{"name":"doConv","role":"start","value":"0","valid_bit":"0"},{"name":"doConv","role":"continue","value":"0","valid_bit":"4"},{"name":"doConv","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_CTRL_BUS_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "AWVALID" } },
	{ "name": "s_axi_CTRL_BUS_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "AWREADY" } },
	{ "name": "s_axi_CTRL_BUS_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "WVALID" } },
	{ "name": "s_axi_CTRL_BUS_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "WREADY" } },
	{ "name": "s_axi_CTRL_BUS_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "WDATA" } },
	{ "name": "s_axi_CTRL_BUS_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "WSTRB" } },
	{ "name": "s_axi_CTRL_BUS_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "ARADDR" },"address":[{"name":"doConv","role":"start","value":"0","valid_bit":"0"},{"name":"doConv","role":"done","value":"0","valid_bit":"1"},{"name":"doConv","role":"idle","value":"0","valid_bit":"2"},{"name":"doConv","role":"ready","value":"0","valid_bit":"3"},{"name":"doConv","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_CTRL_BUS_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "ARVALID" } },
	{ "name": "s_axi_CTRL_BUS_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "ARREADY" } },
	{ "name": "s_axi_CTRL_BUS_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "RVALID" } },
	{ "name": "s_axi_CTRL_BUS_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "RREADY" } },
	{ "name": "s_axi_CTRL_BUS_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "RDATA" } },
	{ "name": "s_axi_CTRL_BUS_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "RRESP" } },
	{ "name": "s_axi_CTRL_BUS_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "BVALID" } },
	{ "name": "s_axi_CTRL_BUS_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "BREADY" } },
	{ "name": "s_axi_CTRL_BUS_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL_BUS", "role": "interrupt" } },
	{ "name": "s_axi_KERNEL_BUS_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "KERNEL_BUS", "role": "AWADDR" },"address":[{"name":"kernel","role":"data","value":"16"}] },
	{ "name": "s_axi_KERNEL_BUS_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "KERNEL_BUS", "role": "AWVALID" } },
	{ "name": "s_axi_KERNEL_BUS_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "KERNEL_BUS", "role": "AWREADY" } },
	{ "name": "s_axi_KERNEL_BUS_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "KERNEL_BUS", "role": "WVALID" } },
	{ "name": "s_axi_KERNEL_BUS_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "KERNEL_BUS", "role": "WREADY" } },
	{ "name": "s_axi_KERNEL_BUS_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "KERNEL_BUS", "role": "WDATA" } },
	{ "name": "s_axi_KERNEL_BUS_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "KERNEL_BUS", "role": "WSTRB" } },
	{ "name": "s_axi_KERNEL_BUS_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "KERNEL_BUS", "role": "ARADDR" },"address":[] },
	{ "name": "s_axi_KERNEL_BUS_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "KERNEL_BUS", "role": "ARVALID" } },
	{ "name": "s_axi_KERNEL_BUS_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "KERNEL_BUS", "role": "ARREADY" } },
	{ "name": "s_axi_KERNEL_BUS_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "KERNEL_BUS", "role": "RVALID" } },
	{ "name": "s_axi_KERNEL_BUS_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "KERNEL_BUS", "role": "RREADY" } },
	{ "name": "s_axi_KERNEL_BUS_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "KERNEL_BUS", "role": "RDATA" } },
	{ "name": "s_axi_KERNEL_BUS_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "KERNEL_BUS", "role": "RRESP" } },
	{ "name": "s_axi_KERNEL_BUS_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "KERNEL_BUS", "role": "BVALID" } },
	{ "name": "s_axi_KERNEL_BUS_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "KERNEL_BUS", "role": "BREADY" } },
	{ "name": "s_axi_KERNEL_BUS_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "KERNEL_BUS", "role": "BRESP" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "input_image_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "input_image", "role": "address0" }} , 
 	{ "name": "input_image_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_image", "role": "ce0" }} , 
 	{ "name": "input_image_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "input_image", "role": "q0" }} , 
 	{ "name": "output_image_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "output_image", "role": "address0" }} , 
 	{ "name": "output_image_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_image", "role": "ce0" }} , 
 	{ "name": "output_image_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_image", "role": "we0" }} , 
 	{ "name": "output_image_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "output_image", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
		"CDFG" : "doConv",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "65808", "EstimateLatencyMax" : "65808",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "0",
		"Port" : [
			{"Name" : "input_image", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output_image", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "kernel", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.doConv_CTRL_BUS_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.doConv_KERNEL_BUS_s_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lineBuff_val_0_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lineBuff_val_1_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lineBuff_val_2_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.doConv_mac_muladdeOg_U1", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.doConv_mac_muladdeOg_U2", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.doConv_mac_muladdeOg_U3", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.doConv_mac_muladdeOg_U4", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.doConv_mac_muladdfYi_U5", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	doConv {
		input_image {Type I LastRead 10 FirstWrite -1}
		output_image {Type O LastRead -1 FirstWrite 13}
		kernel {Type I LastRead 8 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "65808", "Max" : "65808"}
	, {"Name" : "Interval", "Min" : "65809", "Max" : "65809"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	input_image { ap_memory {  { input_image_address0 mem_address 1 14 }  { input_image_ce0 mem_ce 1 1 }  { input_image_q0 mem_dout 0 8 } } }
	output_image { ap_memory {  { output_image_address0 mem_address 1 14 }  { output_image_ce0 mem_ce 1 1 }  { output_image_we0 mem_we 1 1 }  { output_image_d0 mem_din 1 8 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
