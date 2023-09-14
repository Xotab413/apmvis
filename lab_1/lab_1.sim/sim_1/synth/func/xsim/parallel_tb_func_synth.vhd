-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Thu Sep 14 21:12:59 2023
-- Host        : DESKTOP-M735RSH running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               F:/Data/university/7_sem/apvmis/lab_1/lab_1/lab_1.sim/sim_1/synth/func/xsim/parallel_tb_func_synth.vhd
-- Design      : alu_gen_paralell
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tfbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity alu_gen_paralell is
  port (
    S : in STD_LOGIC_VECTOR ( 3 downto 0 );
    NOT_A : in STD_LOGIC_VECTOR ( 3 downto 0 );
    NOT_B : in STD_LOGIC_VECTOR ( 3 downto 0 );
    M : in STD_LOGIC;
    C_n : in STD_LOGIC;
    NOT_G : out STD_LOGIC;
    NOT_P : out STD_LOGIC;
    C_n_4 : out STD_LOGIC;
    A_evn_B : out STD_LOGIC;
    NOT_F : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of alu_gen_paralell : entity is true;
end alu_gen_paralell;

architecture STRUCTURE of alu_gen_paralell is
  signal C_n_IBUF : STD_LOGIC;
  signal M_IBUF : STD_LOGIC;
  signal NOT_A_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NOT_B_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NOT_F_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NOT_F_OBUF[1]_inst_i_3_n_0\ : STD_LOGIC;
  signal \NOT_F_OBUF[1]_inst_i_4_n_0\ : STD_LOGIC;
  signal \NOT_F_OBUF[3]_inst_i_3_n_0\ : STD_LOGIC;
  signal \NOT_F_OBUF[3]_inst_i_4_n_0\ : STD_LOGIC;
  signal \NOT_F_OBUF[3]_inst_i_5_n_0\ : STD_LOGIC;
  signal NOT_G_OBUF : STD_LOGIC;
  signal NOT_G_OBUF_inst_i_2_n_0 : STD_LOGIC;
  signal S_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_0_in : STD_LOGIC;
  signal p_0_in2_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal p_2_in : STD_LOGIC;
  signal p_4_in : STD_LOGIC;
  signal p_5_in : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \NOT_F_OBUF[0]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \NOT_F_OBUF[3]_inst_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \NOT_F_OBUF[3]_inst_i_4\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of NOT_G_OBUF_inst_i_3 : label is "soft_lutpair0";
begin
A_evn_B_OBUF_inst: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => A_evn_B,
      T => '1'
    );
C_n_4_OBUF_inst: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => C_n_4,
      T => '1'
    );
C_n_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => C_n,
      O => C_n_IBUF
    );
M_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => M,
      O => M_IBUF
    );
\NOT_A_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => NOT_A(0),
      O => NOT_A_IBUF(0)
    );
\NOT_A_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => NOT_A(1),
      O => NOT_A_IBUF(1)
    );
\NOT_A_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => NOT_A(2),
      O => NOT_A_IBUF(2)
    );
\NOT_A_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => NOT_A(3),
      O => NOT_A_IBUF(3)
    );
\NOT_B_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => NOT_B(0),
      O => NOT_B_IBUF(0)
    );
\NOT_B_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => NOT_B(1),
      O => NOT_B_IBUF(1)
    );
\NOT_B_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => NOT_B(2),
      O => NOT_B_IBUF(2)
    );
\NOT_B_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => NOT_B(3),
      O => NOT_B_IBUF(3)
    );
\NOT_F_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => NOT_F_OBUF(0),
      O => NOT_F(0)
    );
\NOT_F_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6696"
    )
        port map (
      I0 => \NOT_F_OBUF[1]_inst_i_4_n_0\,
      I1 => \NOT_F_OBUF[1]_inst_i_3_n_0\,
      I2 => C_n_IBUF,
      I3 => M_IBUF,
      O => NOT_F_OBUF(0)
    );
\NOT_F_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => NOT_F_OBUF(1),
      O => NOT_F(1)
    );
\NOT_F_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9999666699996999"
    )
        port map (
      I0 => p_0_in,
      I1 => p_1_in,
      I2 => \NOT_F_OBUF[1]_inst_i_3_n_0\,
      I3 => C_n_IBUF,
      I4 => M_IBUF,
      I5 => \NOT_F_OBUF[1]_inst_i_4_n_0\,
      O => NOT_F_OBUF(1)
    );
\NOT_F_OBUF[1]_inst_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"47FF"
    )
        port map (
      I0 => S_IBUF(3),
      I1 => NOT_B_IBUF(1),
      I2 => S_IBUF(2),
      I3 => NOT_A_IBUF(1),
      O => p_1_in
    );
\NOT_F_OBUF[1]_inst_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"47FF"
    )
        port map (
      I0 => S_IBUF(3),
      I1 => NOT_B_IBUF(0),
      I2 => S_IBUF(2),
      I3 => NOT_A_IBUF(0),
      O => \NOT_F_OBUF[1]_inst_i_3_n_0\
    );
\NOT_F_OBUF[1]_inst_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0035"
    )
        port map (
      I0 => S_IBUF(1),
      I1 => S_IBUF(0),
      I2 => NOT_B_IBUF(0),
      I3 => NOT_A_IBUF(0),
      O => \NOT_F_OBUF[1]_inst_i_4_n_0\
    );
\NOT_F_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => NOT_F_OBUF(2),
      O => NOT_F(2)
    );
\NOT_F_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6696"
    )
        port map (
      I0 => p_0_in2_in,
      I1 => p_2_in,
      I2 => \NOT_F_OBUF[3]_inst_i_4_n_0\,
      I3 => \NOT_F_OBUF[3]_inst_i_5_n_0\,
      O => NOT_F_OBUF(2)
    );
\NOT_F_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => NOT_F_OBUF(3),
      O => NOT_F(3)
    );
\NOT_F_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6666696969666969"
    )
        port map (
      I0 => p_4_in,
      I1 => p_5_in,
      I2 => \NOT_F_OBUF[3]_inst_i_3_n_0\,
      I3 => \NOT_F_OBUF[3]_inst_i_4_n_0\,
      I4 => p_2_in,
      I5 => \NOT_F_OBUF[3]_inst_i_5_n_0\,
      O => NOT_F_OBUF(3)
    );
\NOT_F_OBUF[3]_inst_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0035"
    )
        port map (
      I0 => S_IBUF(1),
      I1 => S_IBUF(0),
      I2 => NOT_B_IBUF(3),
      I3 => NOT_A_IBUF(3),
      O => p_4_in
    );
\NOT_F_OBUF[3]_inst_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000415"
    )
        port map (
      I0 => NOT_A_IBUF(2),
      I1 => NOT_B_IBUF(2),
      I2 => S_IBUF(0),
      I3 => S_IBUF(1),
      I4 => M_IBUF,
      O => \NOT_F_OBUF[3]_inst_i_3_n_0\
    );
\NOT_F_OBUF[3]_inst_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BFFF"
    )
        port map (
      I0 => M_IBUF,
      I1 => \NOT_F_OBUF[1]_inst_i_3_n_0\,
      I2 => p_1_in,
      I3 => C_n_IBUF,
      O => \NOT_F_OBUF[3]_inst_i_4_n_0\
    );
\NOT_F_OBUF[3]_inst_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0F08"
    )
        port map (
      I0 => p_1_in,
      I1 => \NOT_F_OBUF[1]_inst_i_4_n_0\,
      I2 => M_IBUF,
      I3 => p_0_in,
      O => \NOT_F_OBUF[3]_inst_i_5_n_0\
    );
NOT_G_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => NOT_G_OBUF,
      O => NOT_G
    );
NOT_G_OBUF_inst_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"05151515"
    )
        port map (
      I0 => NOT_G_OBUF_inst_i_2_n_0,
      I1 => p_0_in2_in,
      I2 => p_5_in,
      I3 => p_2_in,
      I4 => p_0_in,
      O => NOT_G_OBUF
    );
NOT_G_OBUF_inst_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => \NOT_F_OBUF[1]_inst_i_4_n_0\,
      I1 => p_5_in,
      I2 => p_2_in,
      I3 => p_1_in,
      I4 => p_4_in,
      O => NOT_G_OBUF_inst_i_2_n_0
    );
NOT_G_OBUF_inst_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0035"
    )
        port map (
      I0 => S_IBUF(1),
      I1 => S_IBUF(0),
      I2 => NOT_B_IBUF(2),
      I3 => NOT_A_IBUF(2),
      O => p_0_in2_in
    );
NOT_G_OBUF_inst_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"47FF"
    )
        port map (
      I0 => S_IBUF(3),
      I1 => NOT_B_IBUF(3),
      I2 => S_IBUF(2),
      I3 => NOT_A_IBUF(3),
      O => p_5_in
    );
NOT_G_OBUF_inst_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"47FF"
    )
        port map (
      I0 => S_IBUF(3),
      I1 => NOT_B_IBUF(2),
      I2 => S_IBUF(2),
      I3 => NOT_A_IBUF(2),
      O => p_2_in
    );
NOT_G_OBUF_inst_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"001D"
    )
        port map (
      I0 => S_IBUF(1),
      I1 => NOT_B_IBUF(1),
      I2 => S_IBUF(0),
      I3 => NOT_A_IBUF(1),
      O => p_0_in
    );
NOT_P_OBUF_inst: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => NOT_P,
      T => '1'
    );
\S_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => S(0),
      O => S_IBUF(0)
    );
\S_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => S(1),
      O => S_IBUF(1)
    );
\S_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => S(2),
      O => S_IBUF(2)
    );
\S_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => S(3),
      O => S_IBUF(3)
    );
end STRUCTURE;
