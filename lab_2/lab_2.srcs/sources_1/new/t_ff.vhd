----------------------------------------------------------------------------------
-- Engineer: $emen
-- Company: AssweCan
-- Create Date: 26.09.2023 21:44:13

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity t_ff is
	port (
			T 	 : in 	STD_LOGIC;
			NOT_S: in 	STD_LOGIC;
			NOT_R: in 	STD_LOGIC;
			Q	 : out 	STD_LOGIC;
			NOT_Q: out 	STD_LOGIC
		);
end t_ff;


architecture Behavioral of t_ff is
 component d_ff is
	port (
			D 	 : in 	STD_LOGIC;
			C 	 : in 	STD_LOGIC;
			NOT_S: in 	STD_LOGIC;
			NOT_R: in 	STD_LOGIC;
			Q	 : out 	STD_LOGIC;
			NOT_Q: out 	STD_LOGIC
		);
 end component d_ff;
 signal NOT_Q_dff: STD_LOGIC;
begin
	tff: d_ff port map (D =>NOT_Q_dff, C=>T, NOT_S=>NOT_S, NOT_R=>NOT_R, Q=>Q, NOT_Q=>NOT_Q_dff);

	NOT_Q <= NOT_Q_dff;
end Behavioral;
