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



	function chr2lgck(chr: character) return STD_LOGIC is
    begin
  		case chr is
   			when '0' =>
      			return '0';
    		when '1' =>
      			return '1';
    		when others =>
      			return 'U';
  		end case;
    end;

    procedure skipSpaces(line_data: inout line; numOfspaces: integer) is
    variable char : character;
    begin
    	space_loop: for i in 1 to numOfspaces loop
    		read(line_data, char);
    	end loop space_loop;

    end procedure skipSpaces;




	file test_input : text open read_mode is "F:/some.txt";
	signal OE,CCLR,RCLK : STD_LOGIC := '1';
	signal RCO : STD_LOGIC;
	signal CCLK : STD_LOGIC := '1';
	signal CCKEN: STD_LOGIC := '1';
	signal Q : STD_LOGIC_VECTOR (7 DOWNTO 0);
	shared variable Q_buf : STD_LOGIC_VECTOR (7 DOWNTO 0);
	shared variable OE_buf,CCKEN_buf,CCLR_buf: STD_LOGIC;
	signal some: std_logic;
	signal mutex: std_logic := '0';
	signal starup: std_logic := '0';
begin

	UUT: top port map (
		OE => OE, RCLK => RCLK, CCKEN=>CCKEN, CCLK=> CCLK, 
		CCLR=> CCLR, RCO => RCO, Q => Q);


	--BAD: top port map (
	--	OE => OE, RCLK => RCLK, CCKEN=>CCKEN, CCLK=> CCLK, 
	--	CCLR=> CCLR, RCO => RCO, Q => Q);
	starup <= '1';
	--CCLR <= '1';
		
	process (starup) 
	begin 
		CCLR <= '0';
		mutex <= '1';
	end process;

	--process (Q)
	--begin
	--	if (Q = "1000011") then
	--		mutex <= '1';
	--	end if ;
	--end process;


	delay: process 
	begin
		wait for 10 ns;

		CCLK <= not CCLK after 10 ns;
		RCLK <= not CCLK;
	end process delay;

	--cnt_dis: process
	--begin
	--	wait for 300 ns;
	--	CCKEN <= '1';
	--	wait for 120 ns;
	--	CCKEN <= '0';
	--end process cnt_dis;

	reset_clk: process (mutex)
	begin
		--wait for 10 ns;
		if (mutex = '1') then
			CCLR <= '1';
		end if;
		
		
	end process reset_clk;

	cnt_clk: process 
	begin
		wait for 10 ns;
		OE <= '0';
		CCKEN <= '0';
		wait;

	end process cnt_clk;

  	-- OE, CCKEN, CLR
  	--
	file_tb	: process

	variable time: integer := 0;
	variable inpt_val : character;
	variable line_data: line;
	variable numOfspaces: integer;
	begin
		wait for 10 ns;
		--write(line_data, OE);
		--write(line_data, (CCKEN),right, 2);
		--write(line_data, (CCLR),right, 4);
		--write(line_data, (RCO),right, 5);
		--#write(line_data, Q,right,15);
		--#write(line_data, RCO,right, 2);
		 --write(line_data, std_logic'image(RCO) & " " & std_logic_vector'image(Q));
        --#writeline(test_input, line_data);
		file_chill :  while not endfile(test_input) loop
		        readline(test_input, line_data);
		        read(line_data, OE_buf);
		        skipSpaces(line_data, 7);
		        read(line_data, Q_buf);
		        skipSpaces(line_data, 1);
		        read(line_data, CCKEN_buf);
		        --line_run: for i in line_data'range loop
		        --	read(line_data, inpt_val);
		        --	case (i) is 
		        --		when 1 => OE_buf <= chr2lgck(inpt_val);
		        --		when others => null;

		        --	end case;
		        			
		       	--end loop line_run;


		        --some <= inpt_val(1);
		--        XX_s<= vector_value_XX;
		--        --XX_s(10)<=CLK_S;
		--        if file_line.all'length = 0 or file_line.all(1) = '#' then
  --              	next;
  --          	end if;                        
		--        wait for 10 ns;
		--        time:= time + 10;
		--        if YY_1_s /= YY_2_s then 
		--        	report "[WRONG] Different work on: " & integer'image(time) & "ns";
		--       		notSame <= TRUE;
		--        else
		--        	report "[OK] Expected work on: " & integer'image(time) & "ns";
		--        end if;
	        end loop file_chill;
	 --       if notSame = TRUE then
	 --       	report "[OK] Results are not the same!";
	 --       end if;
	 --       if notSame = FALSE then
	 --           report "[ALL] [OK] All results are the same!";
	 --       end if;       
	        --file_close(test_input);

	       --some <= inpt_val(0);

	end process file_tb;












end Behavioral;
