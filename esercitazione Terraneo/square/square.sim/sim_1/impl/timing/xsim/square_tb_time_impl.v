// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Tue Nov 26 09:35:08 2019
// Host        : fede-hp running 64-bit Ubuntu 19.04
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /home/fede/square/square.sim/sim_1/impl/timing/xsim/square_tb_time_impl.v
// Design      : square
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a200tfbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module datapath
   (D,
    o_data_OBUF,
    CLK,
    AR,
    out,
    \i_data[7] );
  output [2:0]D;
  output [7:0]o_data_OBUF;
  input CLK;
  input [0:0]AR;
  input [2:0]out;
  input [7:0]\i_data[7] ;

  wire [7:0]A;
  wire [0:0]AR;
  wire CLK;
  wire [2:0]D;
  wire \FSM_sequential_next_state_reg[2]_i_3_n_0 ;
  wire [7:0]\i_data[7] ;
  wire [7:0]mux_reg3;
  wire [7:0]o_data_OBUF;
  wire \o_reg2[0]_i_10_n_0 ;
  wire \o_reg2[0]_i_1_n_0 ;
  wire \o_reg2[0]_i_3_n_0 ;
  wire \o_reg2[0]_i_4_n_0 ;
  wire \o_reg2[0]_i_5_n_0 ;
  wire \o_reg2[0]_i_6_n_0 ;
  wire \o_reg2[0]_i_7_n_0 ;
  wire \o_reg2[0]_i_8_n_0 ;
  wire \o_reg2[0]_i_9_n_0 ;
  wire \o_reg2[12]_i_2_n_0 ;
  wire \o_reg2[12]_i_3_n_0 ;
  wire \o_reg2[12]_i_4_n_0 ;
  wire \o_reg2[12]_i_5_n_0 ;
  wire \o_reg2[4]_i_2_n_0 ;
  wire \o_reg2[4]_i_3_n_0 ;
  wire \o_reg2[4]_i_4_n_0 ;
  wire \o_reg2[4]_i_5_n_0 ;
  wire \o_reg2[4]_i_6_n_0 ;
  wire \o_reg2[4]_i_7_n_0 ;
  wire \o_reg2[4]_i_8_n_0 ;
  wire \o_reg2[4]_i_9_n_0 ;
  wire \o_reg2[8]_i_2_n_0 ;
  wire \o_reg2[8]_i_3_n_0 ;
  wire \o_reg2[8]_i_4_n_0 ;
  wire \o_reg2[8]_i_5_n_0 ;
  wire [15:0]o_reg2_reg;
  wire \o_reg2_reg[0]_i_2_n_0 ;
  wire \o_reg2_reg[0]_i_2_n_4 ;
  wire \o_reg2_reg[0]_i_2_n_5 ;
  wire \o_reg2_reg[0]_i_2_n_6 ;
  wire \o_reg2_reg[0]_i_2_n_7 ;
  wire \o_reg2_reg[12]_i_1_n_4 ;
  wire \o_reg2_reg[12]_i_1_n_5 ;
  wire \o_reg2_reg[12]_i_1_n_6 ;
  wire \o_reg2_reg[12]_i_1_n_7 ;
  wire \o_reg2_reg[4]_i_1_n_0 ;
  wire \o_reg2_reg[4]_i_1_n_4 ;
  wire \o_reg2_reg[4]_i_1_n_5 ;
  wire \o_reg2_reg[4]_i_1_n_6 ;
  wire \o_reg2_reg[4]_i_1_n_7 ;
  wire \o_reg2_reg[8]_i_1_n_0 ;
  wire \o_reg2_reg[8]_i_1_n_4 ;
  wire \o_reg2_reg[8]_i_1_n_5 ;
  wire \o_reg2_reg[8]_i_1_n_6 ;
  wire \o_reg2_reg[8]_i_1_n_7 ;
  wire \o_reg3[3]_i_2_n_0 ;
  wire \o_reg3[4]_i_2_n_0 ;
  wire \o_reg3[5]_i_2_n_0 ;
  wire [7:0]o_reg3_reg__0;
  wire [2:0]out;
  wire r1_load;
  wire r3_load;
  wire [2:0]\NLW_o_reg2_reg[0]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_o_reg2_reg[12]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_o_reg2_reg[4]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_o_reg2_reg[8]_i_1_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h3535353535353505)) 
    \FSM_sequential_next_state_reg[0]_i_1 
       (.I0(out[0]),
        .I1(out[2]),
        .I2(out[1]),
        .I3(o_reg3_reg__0[6]),
        .I4(\FSM_sequential_next_state_reg[2]_i_3_n_0 ),
        .I5(o_reg3_reg__0[7]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h5554FFFF55540000)) 
    \FSM_sequential_next_state_reg[1]_i_1 
       (.I0(out[2]),
        .I1(o_reg3_reg__0[6]),
        .I2(\FSM_sequential_next_state_reg[2]_i_3_n_0 ),
        .I3(o_reg3_reg__0[7]),
        .I4(out[1]),
        .I5(out[0]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0001FF00)) 
    \FSM_sequential_next_state_reg[2]_i_1 
       (.I0(o_reg3_reg__0[6]),
        .I1(\FSM_sequential_next_state_reg[2]_i_3_n_0 ),
        .I2(o_reg3_reg__0[7]),
        .I3(out[2]),
        .I4(out[1]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FSM_sequential_next_state_reg[2]_i_3 
       (.I0(o_reg3_reg__0[4]),
        .I1(o_reg3_reg__0[2]),
        .I2(o_reg3_reg__0[0]),
        .I3(o_reg3_reg__0[1]),
        .I4(o_reg3_reg__0[3]),
        .I5(o_reg3_reg__0[5]),
        .O(\FSM_sequential_next_state_reg[2]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hAEAAA2AA)) 
    \o_data_OBUF[0]_inst_i_1 
       (.I0(o_reg2_reg[0]),
        .I1(out[2]),
        .I2(out[1]),
        .I3(out[0]),
        .I4(o_reg2_reg[8]),
        .O(o_data_OBUF[0]));
  LUT5 #(
    .INIT(32'hAEAAA2AA)) 
    \o_data_OBUF[1]_inst_i_1 
       (.I0(o_reg2_reg[1]),
        .I1(out[2]),
        .I2(out[1]),
        .I3(out[0]),
        .I4(o_reg2_reg[9]),
        .O(o_data_OBUF[1]));
  LUT5 #(
    .INIT(32'hAEAAA2AA)) 
    \o_data_OBUF[2]_inst_i_1 
       (.I0(o_reg2_reg[2]),
        .I1(out[2]),
        .I2(out[1]),
        .I3(out[0]),
        .I4(o_reg2_reg[10]),
        .O(o_data_OBUF[2]));
  LUT5 #(
    .INIT(32'hAEAAA2AA)) 
    \o_data_OBUF[3]_inst_i_1 
       (.I0(o_reg2_reg[3]),
        .I1(out[2]),
        .I2(out[1]),
        .I3(out[0]),
        .I4(o_reg2_reg[11]),
        .O(o_data_OBUF[3]));
  LUT5 #(
    .INIT(32'hAEAAA2AA)) 
    \o_data_OBUF[4]_inst_i_1 
       (.I0(o_reg2_reg[4]),
        .I1(out[2]),
        .I2(out[1]),
        .I3(out[0]),
        .I4(o_reg2_reg[12]),
        .O(o_data_OBUF[4]));
  LUT5 #(
    .INIT(32'hAEAAA2AA)) 
    \o_data_OBUF[5]_inst_i_1 
       (.I0(o_reg2_reg[5]),
        .I1(out[2]),
        .I2(out[1]),
        .I3(out[0]),
        .I4(o_reg2_reg[13]),
        .O(o_data_OBUF[5]));
  LUT5 #(
    .INIT(32'hAEAAA2AA)) 
    \o_data_OBUF[6]_inst_i_1 
       (.I0(o_reg2_reg[6]),
        .I1(out[2]),
        .I2(out[1]),
        .I3(out[0]),
        .I4(o_reg2_reg[14]),
        .O(o_data_OBUF[6]));
  LUT5 #(
    .INIT(32'hAEAAA2AA)) 
    \o_data_OBUF[7]_inst_i_1 
       (.I0(o_reg2_reg[7]),
        .I1(out[2]),
        .I2(out[1]),
        .I3(out[0]),
        .I4(o_reg2_reg[15]),
        .O(o_data_OBUF[7]));
  LUT3 #(
    .INIT(8'h04)) 
    \o_reg1[7]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(out[2]),
        .O(r1_load));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg1_reg[0] 
       (.C(CLK),
        .CE(r1_load),
        .CLR(AR),
        .D(\i_data[7] [0]),
        .Q(A[0]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg1_reg[1] 
       (.C(CLK),
        .CE(r1_load),
        .CLR(AR),
        .D(\i_data[7] [1]),
        .Q(A[1]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg1_reg[2] 
       (.C(CLK),
        .CE(r1_load),
        .CLR(AR),
        .D(\i_data[7] [2]),
        .Q(A[2]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg1_reg[3] 
       (.C(CLK),
        .CE(r1_load),
        .CLR(AR),
        .D(\i_data[7] [3]),
        .Q(A[3]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg1_reg[4] 
       (.C(CLK),
        .CE(r1_load),
        .CLR(AR),
        .D(\i_data[7] [4]),
        .Q(A[4]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg1_reg[5] 
       (.C(CLK),
        .CE(r1_load),
        .CLR(AR),
        .D(\i_data[7] [5]),
        .Q(A[5]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg1_reg[6] 
       (.C(CLK),
        .CE(r1_load),
        .CLR(AR),
        .D(\i_data[7] [6]),
        .Q(A[6]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg1_reg[7] 
       (.C(CLK),
        .CE(r1_load),
        .CLR(AR),
        .D(\i_data[7] [7]),
        .Q(A[7]));
  LUT2 #(
    .INIT(4'h2)) 
    \o_reg2[0]_i_1 
       (.I0(out[0]),
        .I1(out[2]),
        .O(\o_reg2[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00006000)) 
    \o_reg2[0]_i_10 
       (.I0(A[0]),
        .I1(o_reg2_reg[0]),
        .I2(out[0]),
        .I3(out[1]),
        .I4(out[2]),
        .O(\o_reg2[0]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \o_reg2[0]_i_3 
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(A[3]),
        .O(\o_reg2[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \o_reg2[0]_i_4 
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(A[2]),
        .O(\o_reg2[0]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \o_reg2[0]_i_5 
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(A[1]),
        .O(\o_reg2[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \o_reg2[0]_i_6 
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(A[0]),
        .O(\o_reg2[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00006000)) 
    \o_reg2[0]_i_7 
       (.I0(A[3]),
        .I1(o_reg2_reg[3]),
        .I2(out[0]),
        .I3(out[1]),
        .I4(out[2]),
        .O(\o_reg2[0]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h00006000)) 
    \o_reg2[0]_i_8 
       (.I0(A[2]),
        .I1(o_reg2_reg[2]),
        .I2(out[0]),
        .I3(out[1]),
        .I4(out[2]),
        .O(\o_reg2[0]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h00006000)) 
    \o_reg2[0]_i_9 
       (.I0(A[1]),
        .I1(o_reg2_reg[1]),
        .I2(out[0]),
        .I3(out[1]),
        .I4(out[2]),
        .O(\o_reg2[0]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \o_reg2[12]_i_2 
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(o_reg2_reg[15]),
        .O(\o_reg2[12]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \o_reg2[12]_i_3 
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(o_reg2_reg[14]),
        .O(\o_reg2[12]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \o_reg2[12]_i_4 
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(o_reg2_reg[13]),
        .O(\o_reg2[12]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \o_reg2[12]_i_5 
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(o_reg2_reg[12]),
        .O(\o_reg2[12]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \o_reg2[4]_i_2 
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(A[7]),
        .O(\o_reg2[4]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \o_reg2[4]_i_3 
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(A[6]),
        .O(\o_reg2[4]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \o_reg2[4]_i_4 
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(A[5]),
        .O(\o_reg2[4]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \o_reg2[4]_i_5 
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(A[4]),
        .O(\o_reg2[4]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h00006000)) 
    \o_reg2[4]_i_6 
       (.I0(A[7]),
        .I1(o_reg2_reg[7]),
        .I2(out[0]),
        .I3(out[1]),
        .I4(out[2]),
        .O(\o_reg2[4]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00006000)) 
    \o_reg2[4]_i_7 
       (.I0(A[6]),
        .I1(o_reg2_reg[6]),
        .I2(out[0]),
        .I3(out[1]),
        .I4(out[2]),
        .O(\o_reg2[4]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h00006000)) 
    \o_reg2[4]_i_8 
       (.I0(A[5]),
        .I1(o_reg2_reg[5]),
        .I2(out[0]),
        .I3(out[1]),
        .I4(out[2]),
        .O(\o_reg2[4]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h00006000)) 
    \o_reg2[4]_i_9 
       (.I0(A[4]),
        .I1(o_reg2_reg[4]),
        .I2(out[0]),
        .I3(out[1]),
        .I4(out[2]),
        .O(\o_reg2[4]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \o_reg2[8]_i_2 
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(o_reg2_reg[11]),
        .O(\o_reg2[8]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \o_reg2[8]_i_3 
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(o_reg2_reg[10]),
        .O(\o_reg2[8]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \o_reg2[8]_i_4 
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(o_reg2_reg[9]),
        .O(\o_reg2[8]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \o_reg2[8]_i_5 
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(o_reg2_reg[8]),
        .O(\o_reg2[8]_i_5_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg2_reg[0] 
       (.C(CLK),
        .CE(\o_reg2[0]_i_1_n_0 ),
        .CLR(AR),
        .D(\o_reg2_reg[0]_i_2_n_7 ),
        .Q(o_reg2_reg[0]));
  CARRY4 \o_reg2_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\o_reg2_reg[0]_i_2_n_0 ,\NLW_o_reg2_reg[0]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\o_reg2[0]_i_3_n_0 ,\o_reg2[0]_i_4_n_0 ,\o_reg2[0]_i_5_n_0 ,\o_reg2[0]_i_6_n_0 }),
        .O({\o_reg2_reg[0]_i_2_n_4 ,\o_reg2_reg[0]_i_2_n_5 ,\o_reg2_reg[0]_i_2_n_6 ,\o_reg2_reg[0]_i_2_n_7 }),
        .S({\o_reg2[0]_i_7_n_0 ,\o_reg2[0]_i_8_n_0 ,\o_reg2[0]_i_9_n_0 ,\o_reg2[0]_i_10_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg2_reg[10] 
       (.C(CLK),
        .CE(\o_reg2[0]_i_1_n_0 ),
        .CLR(AR),
        .D(\o_reg2_reg[8]_i_1_n_5 ),
        .Q(o_reg2_reg[10]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg2_reg[11] 
       (.C(CLK),
        .CE(\o_reg2[0]_i_1_n_0 ),
        .CLR(AR),
        .D(\o_reg2_reg[8]_i_1_n_4 ),
        .Q(o_reg2_reg[11]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg2_reg[12] 
       (.C(CLK),
        .CE(\o_reg2[0]_i_1_n_0 ),
        .CLR(AR),
        .D(\o_reg2_reg[12]_i_1_n_7 ),
        .Q(o_reg2_reg[12]));
  CARRY4 \o_reg2_reg[12]_i_1 
       (.CI(\o_reg2_reg[8]_i_1_n_0 ),
        .CO(\NLW_o_reg2_reg[12]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\o_reg2_reg[12]_i_1_n_4 ,\o_reg2_reg[12]_i_1_n_5 ,\o_reg2_reg[12]_i_1_n_6 ,\o_reg2_reg[12]_i_1_n_7 }),
        .S({\o_reg2[12]_i_2_n_0 ,\o_reg2[12]_i_3_n_0 ,\o_reg2[12]_i_4_n_0 ,\o_reg2[12]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg2_reg[13] 
       (.C(CLK),
        .CE(\o_reg2[0]_i_1_n_0 ),
        .CLR(AR),
        .D(\o_reg2_reg[12]_i_1_n_6 ),
        .Q(o_reg2_reg[13]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg2_reg[14] 
       (.C(CLK),
        .CE(\o_reg2[0]_i_1_n_0 ),
        .CLR(AR),
        .D(\o_reg2_reg[12]_i_1_n_5 ),
        .Q(o_reg2_reg[14]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg2_reg[15] 
       (.C(CLK),
        .CE(\o_reg2[0]_i_1_n_0 ),
        .CLR(AR),
        .D(\o_reg2_reg[12]_i_1_n_4 ),
        .Q(o_reg2_reg[15]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg2_reg[1] 
       (.C(CLK),
        .CE(\o_reg2[0]_i_1_n_0 ),
        .CLR(AR),
        .D(\o_reg2_reg[0]_i_2_n_6 ),
        .Q(o_reg2_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg2_reg[2] 
       (.C(CLK),
        .CE(\o_reg2[0]_i_1_n_0 ),
        .CLR(AR),
        .D(\o_reg2_reg[0]_i_2_n_5 ),
        .Q(o_reg2_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg2_reg[3] 
       (.C(CLK),
        .CE(\o_reg2[0]_i_1_n_0 ),
        .CLR(AR),
        .D(\o_reg2_reg[0]_i_2_n_4 ),
        .Q(o_reg2_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg2_reg[4] 
       (.C(CLK),
        .CE(\o_reg2[0]_i_1_n_0 ),
        .CLR(AR),
        .D(\o_reg2_reg[4]_i_1_n_7 ),
        .Q(o_reg2_reg[4]));
  CARRY4 \o_reg2_reg[4]_i_1 
       (.CI(\o_reg2_reg[0]_i_2_n_0 ),
        .CO({\o_reg2_reg[4]_i_1_n_0 ,\NLW_o_reg2_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\o_reg2[4]_i_2_n_0 ,\o_reg2[4]_i_3_n_0 ,\o_reg2[4]_i_4_n_0 ,\o_reg2[4]_i_5_n_0 }),
        .O({\o_reg2_reg[4]_i_1_n_4 ,\o_reg2_reg[4]_i_1_n_5 ,\o_reg2_reg[4]_i_1_n_6 ,\o_reg2_reg[4]_i_1_n_7 }),
        .S({\o_reg2[4]_i_6_n_0 ,\o_reg2[4]_i_7_n_0 ,\o_reg2[4]_i_8_n_0 ,\o_reg2[4]_i_9_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg2_reg[5] 
       (.C(CLK),
        .CE(\o_reg2[0]_i_1_n_0 ),
        .CLR(AR),
        .D(\o_reg2_reg[4]_i_1_n_6 ),
        .Q(o_reg2_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg2_reg[6] 
       (.C(CLK),
        .CE(\o_reg2[0]_i_1_n_0 ),
        .CLR(AR),
        .D(\o_reg2_reg[4]_i_1_n_5 ),
        .Q(o_reg2_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg2_reg[7] 
       (.C(CLK),
        .CE(\o_reg2[0]_i_1_n_0 ),
        .CLR(AR),
        .D(\o_reg2_reg[4]_i_1_n_4 ),
        .Q(o_reg2_reg[7]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg2_reg[8] 
       (.C(CLK),
        .CE(\o_reg2[0]_i_1_n_0 ),
        .CLR(AR),
        .D(\o_reg2_reg[8]_i_1_n_7 ),
        .Q(o_reg2_reg[8]));
  CARRY4 \o_reg2_reg[8]_i_1 
       (.CI(\o_reg2_reg[4]_i_1_n_0 ),
        .CO({\o_reg2_reg[8]_i_1_n_0 ,\NLW_o_reg2_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\o_reg2_reg[8]_i_1_n_4 ,\o_reg2_reg[8]_i_1_n_5 ,\o_reg2_reg[8]_i_1_n_6 ,\o_reg2_reg[8]_i_1_n_7 }),
        .S({\o_reg2[8]_i_2_n_0 ,\o_reg2[8]_i_3_n_0 ,\o_reg2[8]_i_4_n_0 ,\o_reg2[8]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg2_reg[9] 
       (.C(CLK),
        .CE(\o_reg2[0]_i_1_n_0 ),
        .CLR(AR),
        .D(\o_reg2_reg[8]_i_1_n_6 ),
        .Q(o_reg2_reg[9]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h2E)) 
    \o_reg3[0]_i_1 
       (.I0(\i_data[7] [0]),
        .I1(out[1]),
        .I2(o_reg3_reg__0[0]),
        .O(mux_reg3[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h99F0)) 
    \o_reg3[1]_i_1 
       (.I0(o_reg3_reg__0[1]),
        .I1(o_reg3_reg__0[0]),
        .I2(\i_data[7] [1]),
        .I3(out[1]),
        .O(mux_reg3[1]));
  LUT5 #(
    .INIT(32'hA9A9FF00)) 
    \o_reg3[2]_i_1 
       (.I0(o_reg3_reg__0[2]),
        .I1(o_reg3_reg__0[0]),
        .I2(o_reg3_reg__0[1]),
        .I3(\i_data[7] [2]),
        .I4(out[1]),
        .O(mux_reg3[2]));
  LUT6 #(
    .INIT(64'hFFFF0000AAA9AAA9)) 
    \o_reg3[3]_i_1 
       (.I0(o_reg3_reg__0[3]),
        .I1(o_reg3_reg__0[1]),
        .I2(o_reg3_reg__0[0]),
        .I3(o_reg3_reg__0[2]),
        .I4(\i_data[7] [3]),
        .I5(\o_reg3[3]_i_2_n_0 ),
        .O(mux_reg3[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \o_reg3[3]_i_2 
       (.I0(out[2]),
        .I1(out[1]),
        .O(\o_reg3[3]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h99F0)) 
    \o_reg3[4]_i_1 
       (.I0(o_reg3_reg__0[4]),
        .I1(\o_reg3[4]_i_2_n_0 ),
        .I2(\i_data[7] [4]),
        .I3(out[1]),
        .O(mux_reg3[4]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \o_reg3[4]_i_2 
       (.I0(o_reg3_reg__0[2]),
        .I1(o_reg3_reg__0[0]),
        .I2(o_reg3_reg__0[1]),
        .I3(o_reg3_reg__0[3]),
        .O(\o_reg3[4]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h99F0)) 
    \o_reg3[5]_i_1 
       (.I0(o_reg3_reg__0[5]),
        .I1(\o_reg3[5]_i_2_n_0 ),
        .I2(\i_data[7] [5]),
        .I3(out[1]),
        .O(mux_reg3[5]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \o_reg3[5]_i_2 
       (.I0(o_reg3_reg__0[3]),
        .I1(o_reg3_reg__0[1]),
        .I2(o_reg3_reg__0[0]),
        .I3(o_reg3_reg__0[2]),
        .I4(o_reg3_reg__0[4]),
        .O(\o_reg3[5]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h99F0)) 
    \o_reg3[6]_i_1 
       (.I0(o_reg3_reg__0[6]),
        .I1(\FSM_sequential_next_state_reg[2]_i_3_n_0 ),
        .I2(\i_data[7] [6]),
        .I3(out[1]),
        .O(mux_reg3[6]));
  LUT3 #(
    .INIT(8'h0E)) 
    \o_reg3[7]_i_1 
       (.I0(out[0]),
        .I1(out[1]),
        .I2(out[2]),
        .O(r3_load));
  LUT5 #(
    .INIT(32'hA9A9FF00)) 
    \o_reg3[7]_i_2 
       (.I0(o_reg3_reg__0[7]),
        .I1(\FSM_sequential_next_state_reg[2]_i_3_n_0 ),
        .I2(o_reg3_reg__0[6]),
        .I3(\i_data[7] [7]),
        .I4(out[1]),
        .O(mux_reg3[7]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg3_reg[0] 
       (.C(CLK),
        .CE(r3_load),
        .CLR(AR),
        .D(mux_reg3[0]),
        .Q(o_reg3_reg__0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg3_reg[1] 
       (.C(CLK),
        .CE(r3_load),
        .CLR(AR),
        .D(mux_reg3[1]),
        .Q(o_reg3_reg__0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg3_reg[2] 
       (.C(CLK),
        .CE(r3_load),
        .CLR(AR),
        .D(mux_reg3[2]),
        .Q(o_reg3_reg__0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg3_reg[3] 
       (.C(CLK),
        .CE(r3_load),
        .CLR(AR),
        .D(mux_reg3[3]),
        .Q(o_reg3_reg__0[3]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg3_reg[4] 
       (.C(CLK),
        .CE(r3_load),
        .CLR(AR),
        .D(mux_reg3[4]),
        .Q(o_reg3_reg__0[4]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg3_reg[5] 
       (.C(CLK),
        .CE(r3_load),
        .CLR(AR),
        .D(mux_reg3[5]),
        .Q(o_reg3_reg__0[5]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg3_reg[6] 
       (.C(CLK),
        .CE(r3_load),
        .CLR(AR),
        .D(mux_reg3[6]),
        .Q(o_reg3_reg__0[6]));
  FDCE #(
    .INIT(1'b0)) 
    \o_reg3_reg[7] 
       (.C(CLK),
        .CE(r3_load),
        .CLR(AR),
        .D(mux_reg3[7]),
        .Q(o_reg3_reg__0[7]));
endmodule

(* ECO_CHECKSUM = "32808cf3" *) 
(* NotValidForBitStream *)
module square
   (i_clk,
    i_res,
    i_start,
    o_done,
    i_data,
    o_data,
    o_addr,
    o_en,
    o_we);
  input i_clk;
  input i_res;
  input i_start;
  output o_done;
  input [7:0]i_data;
  output [7:0]o_data;
  output [1:0]o_addr;
  output o_en;
  output o_we;

  wire DATAPATH0_n_0;
  wire DATAPATH0_n_1;
  wire DATAPATH0_n_2;
  wire \FSM_sequential_next_state_reg[2]_i_2_n_0 ;
  (* RTL_KEEP = "yes" *) wire [2:0]cur_state;
  wire i_clk;
  wire i_clk_IBUF;
  wire i_clk_IBUF_BUFG;
  wire [7:0]i_data;
  wire [7:0]i_data_IBUF;
  wire i_res;
  wire i_res_IBUF;
  wire i_start;
  wire i_start_IBUF;
  wire [2:0]next_state;
  wire [1:0]o_addr;
  wire [1:0]o_addr_OBUF;
  wire [7:0]o_data;
  wire [7:0]o_data_OBUF;
  wire o_done;
  wire o_done_OBUF;
  wire o_en;
  wire o_en_OBUF;
  wire o_we;
  wire o_we_OBUF;

initial begin
 $sdf_annotate("square_tb_time_impl.sdf",,,,"tool_control");
end
  datapath DATAPATH0
       (.AR(i_res_IBUF),
        .CLK(i_clk_IBUF_BUFG),
        .D({DATAPATH0_n_0,DATAPATH0_n_1,DATAPATH0_n_2}),
        .\i_data[7] (i_data_IBUF),
        .o_data_OBUF(o_data_OBUF),
        .out(cur_state));
  (* FSM_ENCODED_STATES = "s0:000,s1:001,s2:010,s5:101,s6:110,s3:011,s4:100" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_cur_state_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_res_IBUF),
        .D(next_state[0]),
        .Q(cur_state[0]));
  (* FSM_ENCODED_STATES = "s0:000,s1:001,s2:010,s5:101,s6:110,s3:011,s4:100" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_cur_state_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_res_IBUF),
        .D(next_state[1]),
        .Q(cur_state[1]));
  (* FSM_ENCODED_STATES = "s0:000,s1:001,s2:010,s5:101,s6:110,s3:011,s4:100" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_cur_state_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_res_IBUF),
        .D(next_state[2]),
        .Q(cur_state[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_next_state_reg[0] 
       (.CLR(1'b0),
        .D(DATAPATH0_n_2),
        .G(\FSM_sequential_next_state_reg[2]_i_2_n_0 ),
        .GE(1'b1),
        .Q(next_state[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_next_state_reg[1] 
       (.CLR(1'b0),
        .D(DATAPATH0_n_1),
        .G(\FSM_sequential_next_state_reg[2]_i_2_n_0 ),
        .GE(1'b1),
        .Q(next_state[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_next_state_reg[2] 
       (.CLR(1'b0),
        .D(DATAPATH0_n_0),
        .G(\FSM_sequential_next_state_reg[2]_i_2_n_0 ),
        .GE(1'b1),
        .Q(next_state[2]));
  LUT4 #(
    .INIT(16'h7F7E)) 
    \FSM_sequential_next_state_reg[2]_i_2 
       (.I0(cur_state[2]),
        .I1(cur_state[0]),
        .I2(cur_state[1]),
        .I3(i_start_IBUF),
        .O(\FSM_sequential_next_state_reg[2]_i_2_n_0 ));
  BUFG i_clk_IBUF_BUFG_inst
       (.I(i_clk_IBUF),
        .O(i_clk_IBUF_BUFG));
  IBUF i_clk_IBUF_inst
       (.I(i_clk),
        .O(i_clk_IBUF));
  IBUF \i_data_IBUF[0]_inst 
       (.I(i_data[0]),
        .O(i_data_IBUF[0]));
  IBUF \i_data_IBUF[1]_inst 
       (.I(i_data[1]),
        .O(i_data_IBUF[1]));
  IBUF \i_data_IBUF[2]_inst 
       (.I(i_data[2]),
        .O(i_data_IBUF[2]));
  IBUF \i_data_IBUF[3]_inst 
       (.I(i_data[3]),
        .O(i_data_IBUF[3]));
  IBUF \i_data_IBUF[4]_inst 
       (.I(i_data[4]),
        .O(i_data_IBUF[4]));
  IBUF \i_data_IBUF[5]_inst 
       (.I(i_data[5]),
        .O(i_data_IBUF[5]));
  IBUF \i_data_IBUF[6]_inst 
       (.I(i_data[6]),
        .O(i_data_IBUF[6]));
  IBUF \i_data_IBUF[7]_inst 
       (.I(i_data[7]),
        .O(i_data_IBUF[7]));
  IBUF i_res_IBUF_inst
       (.I(i_res),
        .O(i_res_IBUF));
  IBUF i_start_IBUF_inst
       (.I(i_start),
        .O(i_start_IBUF));
  OBUF \o_addr_OBUF[0]_inst 
       (.I(o_addr_OBUF[0]),
        .O(o_addr[0]));
  LUT3 #(
    .INIT(8'h02)) 
    \o_addr_OBUF[0]_inst_i_1 
       (.I0(cur_state[2]),
        .I1(cur_state[1]),
        .I2(cur_state[0]),
        .O(o_addr_OBUF[0]));
  OBUF \o_addr_OBUF[1]_inst 
       (.I(o_addr_OBUF[1]),
        .O(o_addr[1]));
  LUT3 #(
    .INIT(8'h20)) 
    \o_addr_OBUF[1]_inst_i_1 
       (.I0(cur_state[0]),
        .I1(cur_state[1]),
        .I2(cur_state[2]),
        .O(o_addr_OBUF[1]));
  OBUF \o_data_OBUF[0]_inst 
       (.I(o_data_OBUF[0]),
        .O(o_data[0]));
  OBUF \o_data_OBUF[1]_inst 
       (.I(o_data_OBUF[1]),
        .O(o_data[1]));
  OBUF \o_data_OBUF[2]_inst 
       (.I(o_data_OBUF[2]),
        .O(o_data[2]));
  OBUF \o_data_OBUF[3]_inst 
       (.I(o_data_OBUF[3]),
        .O(o_data[3]));
  OBUF \o_data_OBUF[4]_inst 
       (.I(o_data_OBUF[4]),
        .O(o_data[4]));
  OBUF \o_data_OBUF[5]_inst 
       (.I(o_data_OBUF[5]),
        .O(o_data[5]));
  OBUF \o_data_OBUF[6]_inst 
       (.I(o_data_OBUF[6]),
        .O(o_data[6]));
  OBUF \o_data_OBUF[7]_inst 
       (.I(o_data_OBUF[7]),
        .O(o_data[7]));
  OBUF o_done_OBUF_inst
       (.I(o_done_OBUF),
        .O(o_done));
  LUT3 #(
    .INIT(8'h08)) 
    o_done_OBUF_inst_i_1
       (.I0(cur_state[2]),
        .I1(cur_state[1]),
        .I2(cur_state[0]),
        .O(o_done_OBUF));
  OBUF o_en_OBUF_inst
       (.I(o_en_OBUF),
        .O(o_en));
  LUT3 #(
    .INIT(8'h0E)) 
    o_en_OBUF_inst_i_1
       (.I0(cur_state[0]),
        .I1(cur_state[2]),
        .I2(cur_state[1]),
        .O(o_en_OBUF));
  OBUF o_we_OBUF_inst
       (.I(o_we_OBUF),
        .O(o_we));
  LUT2 #(
    .INIT(4'h2)) 
    o_we_OBUF_inst_i_1
       (.I0(cur_state[2]),
        .I1(cur_state[1]),
        .O(o_we_OBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
