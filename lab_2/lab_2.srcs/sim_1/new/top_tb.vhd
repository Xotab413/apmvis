-- Engineer: $emen
-- Company: AssweCan
-- Create Date: 16.10.2023 21:01:13
-- Module Name: top - Behavioral
-- Project Name: lab_2 & 3

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity top_tb is
--  Port ( );
end top_tb;

architecture Behavioral of top_tb is
	component top is 
	port (
			OE		: in STD_LOGIC;	-- negative
			RCLK	: in STD_LOGIC;
			CCKEN	: in STD_LOGIC; -- negative
			CCLK	: in STD_LOGIC;
			CCLR	: in STD_LOGIC; -- negative

			RCO		: out STD_LOGIC;-- negative
			Q		: out STD_LOGIC_VECTOR (7 DOWNTO 0)	

		);
	end component top;

	signal OE,CCLR,RCLK,RCO : STD_LOGIC := '1';
	signal CCLK : STD_LOGIC := '1';
	signal CCKEN: STD_LOGIC := '1';
	signal Q : STD_LOGIC_VECTOR (7 DOWNTO 0);

begin


	UUT: top port map (
		OE => OE, RCLK => RCLK, CCKEN=>CCKEN, CCLK=> CCLK, 
		CCLR=> CCLR, RCO => RCO, Q => Q);


	delay: process
	begin
		wait for 10 ns;
		CCLK <= not CCLK after 10 ns;
		RCLK <= not CCLK;
	end process delay;



	reset_clk: process 
	begin
		--wait for 10 ns;
		CCLR <= '0';
		wait for 10 ns;
		CCLR <= '1';
		wait;
	end process reset_clk;

	cnt_clk: process 
	begin
		wait for 10 ns;
		OE <= '0';
		CCKEN <= '0';
		wait;
	end process cnt_clk;


end Behavioral;
