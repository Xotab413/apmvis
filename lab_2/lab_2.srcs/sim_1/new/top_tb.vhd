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
use ieee.std_logic_textio.all;
use std.textio.all;

entity top_tb is
	generic (PERIOD : time := 20 ns);
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



function vec2string ( a: std_logic_vector) return string is
	variable b : string (1 to a'length) := (others => NUL);
	variable stri : integer := 1; 
	begin
	    for i in a'range loop
	        b(stri) := std_logic'image(a((i)))(2); -- (1) will return ''
	   		stri := stri+1;
	    end loop;
	return b;
	end function vec2string;


    procedure skipSpaces(line_data: inout line; numOfspaces: integer) is
    variable char : character;
    begin
    	space_loop: for i in 1 to numOfspaces loop
    		read(line_data, char);
    	end loop space_loop;

    end procedure skipSpaces;



    -- /#| OE | CCKEN | CCLR | RCO | Q_file | #\ 
	file test_input : text open read_mode is "F:/lab3_inpt.txt";

	signal OE,CCLR,RCLK : STD_LOGIC := '1';
	signal RCO : STD_LOGIC;
	signal CCLK : STD_LOGIC := '1';
	signal CCKEN: STD_LOGIC := '1';
	signal Q : STD_LOGIC_VECTOR (7 DOWNTO 0);
	shared variable Q_buf : STD_LOGIC_VECTOR (7 DOWNTO 0);
	shared variable OE_buf,CCKEN_buf,CCLR_buf: STD_LOGIC;
begin

	UUT: top port map (
		OE => OE, RCLK => RCLK, CCKEN=>CCKEN, CCLK=> CCLK, 
		CCLR=> CCLR, RCO => RCO, Q => Q);


	CCLK <= not CCLK after PERIOD/2; -- freerun clk
	RCLK <= not CCLK;				 -- for register line
	-- Notice that we can use our rclk in main tb to provide output from 1/2 lines, but i'm so lazy-bazy ;3

	--main_tb_pr: process 
	--begin
	--	OE <= '0';
	--	CCLR <= '0';
	--	wait for PERIOD/2;
	--	CCLR <= '1';
	--	wait for PERIOD;

	--	-- cnt MAHN
	--	CCKEN <= '0';
	--	wait for PERIOD*5;

	--	--disable_cnt )
	--	CCKEN <= '1';
	--	wait for PERIOD*4;

	--	-- cnt MANN part-2
	--	CCKEN <= '0';
	--	wait for PERIOD*5;

	--	-- CLEAR MANN
	--	CCLR <= '0';
	--	wait for PERIOD/2;
	--	CCLR <= '1';
	--	wait for PERIOD*3;

	--	-- Z - state CHEECK
	--	OE <= '1';
	--	wait for PERIOD*2;

	--	wait;
	--end process main_tb_pr;


	--file_wr: process

	--variable line_data: line;
	--begin
	--	wait for PERIOD/2;
	--	write(line_data, OE);
	--	write(line_data, (CCKEN),right, 2);
	--	write(line_data, (CCLR),right, 2);
	--	write(line_data, (RCO),right, 2);

	--	write(line_data, (Q),right, 16);

	--	writeline(test_input, line_data);
		
	--end process file_wr;

	file_rd: process

	variable OE_f,CCKEN_f,CCLR_f,RCO_f : STD_LOGIC;
	variable Q_f: STD_LOGIC_VECTOR (7 DOWNTO 0);
	variable line_data: line;
	variable line_num : integer := 0;
	begin

		file_chill :  while not endfile(test_input) loop

		    line_num := line_num + 1;
		    readline(test_input, line_data);

		    if line_data.all'length = 0 or line_data.all(1) = '/' then
                next;
            end if;

		    read(line_data, OE_f);
		    skipSpaces(line_data, 1);
		    read(line_data, CCKEN_f);
		    skipSpaces(line_data, 1);
		    read(line_data, CCLR_f);

		    skipSpaces(line_data, 1);
		    read(line_data, RCO_f);

		    skipSpaces(line_data, 8);
		    read(line_data, Q_f);

		    OE <= OE_f;
		    CCKEN <= CCKEN_f;
		    CCLR <= CCLR_f;

		  	wait for PERIOD/2;


			assert (Q = Q_f)
                report "Q_f failed. "
                        & "Expected: " & vec2string(Q)
                        & ". Actual: " & vec2string(Q_f)
                        & ". Line: " & integer'image(line_num)
                severity ERROR;

            assert (RCO = RCO_f)
                report "RCO_f failed. "
                        & "Expected: " & std_logic'image(RCO)
                        & ". Actual: " & std_logic'image(RCO_f)
                        & ". Line: " & integer'image(line_num)
                severity ERROR;    

		end loop file_chill;
		file_close(test_input);


	end process file_rd;
end Behavioral;
