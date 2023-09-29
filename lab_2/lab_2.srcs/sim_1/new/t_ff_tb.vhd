----------------------------------------------------------------------------------
-- Engineer: $emen
-- Company: AssweCan
-- Create Date: 26.09.2023 21:44:13

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity t_ff_tb is
--  Port ( );
end t_ff_tb;

architecture Behavioral of t_ff_tb is
	component t_ff is
	port (
			T 	 : in 	STD_LOGIC;
			NOT_S: in 	STD_LOGIC;
			NOT_R: in 	STD_LOGIC;
			Q	 : out 	STD_LOGIC;
			NOT_Q: out 	STD_LOGIC
		);
	end component t_ff;

	signal T 		 : STD_LOGIC;
	signal C     	 : STD_LOGIC := '1';
	signal NOT_S     : STD_LOGIC;
	signal NOT_R	 : STD_LOGIC := '1';
	signal Q 		 : STD_LOGIC;
	signal NOT_Q	 : STD_LOGIC;


begin
	tff: t_ff port map (D =>D, C=>C, NOT_S=>NOT_S, NOT_R=>NOT_R, Q=>Q, NOT_Q=>NOT_Q);


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

	C <= not C after 35 ns;
	D <= not D after 10 ns;


end Behavioral;
