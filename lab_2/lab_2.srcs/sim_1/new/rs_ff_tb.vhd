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

architecture Behavioral of rs_ff_tb is
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
	signal S         : STD_LOGIC := '0';
	signal R    	 : STD_LOGIC := '0';
	signal Q 		 : STD_LOGIC ;
	signal NOT_Q	 : STD_LOGIC ;


begin
	UUT_rs: rs_ff port map (C =>CLK, S=>S, R=>R, Q=>Q, NOT_Q=>NOT_Q);


	CLK <= not CLK after 7 ns;

	main_cycle: process
	begin

		wait for 20 ns;
		for S_test in STD_LOGIC range '0' to '1' loop
        	for R_test in STD_LOGIC range '0' to '1' loop
        		S <= S_test;
        		R <= R_test;
        		
        		wait for 15 ns;          

        	end loop;
        end loop;
    end process main_cycle;

end Behavioral;
