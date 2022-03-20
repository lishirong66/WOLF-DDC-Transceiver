// megafunction wizard: %LPM_COMPARE%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: LPM_COMPARE 

// ============================================================
// File Name: compare3.v
// Megafunction Name(s):
// 			LPM_COMPARE
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 18.1.0 Build 625 09/12/2018 SJ Standard Edition
// ************************************************************


//Copyright (C) 2018  Intel Corporation. All rights reserved.
//Your use of Intel Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Intel Program License 
//Subscription Agreement, the Intel Quartus Prime License Agreement,
//the Intel FPGA IP License Agreement, or other applicable license
//agreement, including, without limitation, that your use is for
//the sole purpose of programming logic devices manufactured by
//Intel and sold by Intel or its authorized distributors.  Please
//refer to the applicable agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module compare3 (
	dataa,
	aeb);

	input	[1:0]  dataa;
	output	  aeb;

	wire [1:0] sub_wire0 = 2'h3;
	wire  sub_wire1;
	wire  aeb = sub_wire1;

	lpm_compare	LPM_COMPARE_component (
				.dataa (dataa),
				.datab (sub_wire0),
				.aeb (sub_wire1),
				.aclr (1'b0),
				.agb (),
				.ageb (),
				.alb (),
				.aleb (),
				.aneb (),
				.clken (1'b1),
				.clock (1'b0));
	defparam
		LPM_COMPARE_component.lpm_hint = "ONE_INPUT_IS_CONSTANT=YES",
		LPM_COMPARE_component.lpm_representation = "UNSIGNED",
		LPM_COMPARE_component.lpm_type = "LPM_COMPARE",
		LPM_COMPARE_component.lpm_width = 2;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: AeqB NUMERIC "1"
// Retrieval info: PRIVATE: AgeB NUMERIC "0"
// Retrieval info: PRIVATE: AgtB NUMERIC "0"
// Retrieval info: PRIVATE: AleB NUMERIC "0"
// Retrieval info: PRIVATE: AltB NUMERIC "0"
// Retrieval info: PRIVATE: AneB NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone IV E"
// Retrieval info: PRIVATE: LPM_PIPELINE NUMERIC "0"
// Retrieval info: PRIVATE: Latency NUMERIC "0"
// Retrieval info: PRIVATE: PortBValue NUMERIC "3"
// Retrieval info: PRIVATE: Radix NUMERIC "10"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: SignedCompare NUMERIC "0"
// Retrieval info: PRIVATE: aclr NUMERIC "0"
// Retrieval info: PRIVATE: clken NUMERIC "0"
// Retrieval info: PRIVATE: isPortBConstant NUMERIC "1"
// Retrieval info: PRIVATE: nBit NUMERIC "2"
// Retrieval info: PRIVATE: new_diagram STRING "1"
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: CONSTANT: LPM_HINT STRING "ONE_INPUT_IS_CONSTANT=YES"
// Retrieval info: CONSTANT: LPM_REPRESENTATION STRING "UNSIGNED"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_COMPARE"
// Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "2"
// Retrieval info: USED_PORT: aeb 0 0 0 0 OUTPUT NODEFVAL "aeb"
// Retrieval info: USED_PORT: dataa 0 0 2 0 INPUT NODEFVAL "dataa[1..0]"
// Retrieval info: CONNECT: @dataa 0 0 2 0 dataa 0 0 2 0
// Retrieval info: CONNECT: @datab 0 0 2 0 3 0 0 2 0
// Retrieval info: CONNECT: aeb 0 0 0 0 @aeb 0 0 0 0
// Retrieval info: GEN_FILE: TYPE_NORMAL compare3.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL compare3.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL compare3.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL compare3.bsf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL compare3_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL compare3_bb.v FALSE
// Retrieval info: LIB_FILE: lpm
