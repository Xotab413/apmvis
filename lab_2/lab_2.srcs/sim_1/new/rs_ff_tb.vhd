----------------------------------------------------------------------------------
-- Engineer: $emen
-- Company: AssweCan
-- Create Date: 26.09.2023 21:44:13

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rs_ff_tb is
--  Port ( );
end rs_ff_tb;

architecture Behavioral of t_ff_tb is
	component rs_ff is
	port (
		C    : in 	STD_LOGIC;
		S    : in 	STD_LOGIC;
		R    : in 	STD_LOGIC;
		Q	 : out 	STD_LOGIC;
		NOT_Q: out 	STD_LOGIC
	);
	end component rs_ff;

	signal CLK		 : STD_LOGIC := '0';
	signal S         : STD_LOGIC;
	signal R    	 : STD_LOGIC := '1';
	signal Q 		 : STD_LOGIC;
	signal NOT_Q	 : STD_LOGIC;


begin
	UUT_rs: rs_ff port map (C =>CLK, S=>NOT_S, NOT_R=>NOT_R, Q=>Q, NOT_Q=>NOT_Q);


	set_tb: process 
	begin
		NOT_S <= '0';
		wait for 20 ns;
		NOT_S <= '1';
		wait ;
	end process set_tb;

	reset_tb: process 
	begin
		wait for 20 ns;
		NOT_R <= '0';
		wait for 20 ns;
		NOT_R <= '1';
		wait ;
	end process reset_tb;


	T <= not T after 35 ns;



end Behavioral;
