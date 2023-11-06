-- Engineer: $emen
-- Company: AssweCan
-- Create Date: 26.09.2023 21:44:13
-- Module Name: top - Behavioral
-- Project Name: lab_2 & 3

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity top is
	port (
			OE		: in STD_LOGIC;	-- negative
			RCLK	: in STD_LOGIC;
			CCKEN	: in STD_LOGIC; -- negative
			CCLK	: in STD_LOGIC;
			CCLR	: in STD_LOGIC; -- negative

			RCO		: out STD_LOGIC;-- negative
			Q		: out STD_LOGIC_VECTOR (7 DOWNTO 0)	

		);
end top;

architecture Behavioral of top is

	component rs_ff is
		port (
			C    : in 	STD_LOGIC;
			S    : in 	STD_LOGIC;
			R    : in 	STD_LOGIC;
			Q	 : out 	STD_LOGIC;	
			NOT_Q: out 	STD_LOGIC
		);
	end component rs_ff;

	component t_ff is
	port (
			T 	 : in 	STD_LOGIC;
			NOT_S: in 	STD_LOGIC;
			NOT_R: in 	STD_LOGIC;
			Q	 : out 	STD_LOGIC;
			NOT_Q: out 	STD_LOGIC
		);
	end component t_ff;
	signal TNQ_LINE,RSQ_LINE : STD_LOGIC_VECTOR (7 DOWNTO 0);
	signal VCC: STD_LOGIC := '1';
	signal DUMMY: STD_LOGIC;
	signal RCO_int: STD_LOGIC := '1';
	signal TT_LINE : STD_LOGIC_VECTOR (7 DOWNTO 0);
	signal TQ_LINE : STD_LOGIC_VECTOR (7 DOWNTO 0);

	signal Something : STD_LOGIC;
	signal CCLR_buf : STD_LOGIC := '0';

	signal temp,temp1,temp2,temp3,temp4,temp5,temp6: std_logic;
begin

	first_trig_line: for i in 0 to 7 generate
		tff: t_ff port map (
			T =>  not TT_LINE(i),
			NOT_S => VCC,
			NOT_R => CCLR,
			Q => TQ_LINE(i),
			NOT_Q => TNQ_LINE(i)
		);
	end generate first_trig_line;


	line_mkr: process (CCLK)
	variable buf : std_logic;
	
	begin
		buf := CCLK nand ((CCLK) and (not (not (CCKEN) nor (not(TT_LINE(0))))));
		TT_LINE(0) <= buf;
    	TT_LINE(1) <= buf and TQ_LINE(0);
    	
    	-- THIS way won't be work bcs 2 simultaniously transaction in a time, that's why we had delay and a LOT lines of code;3
			--for i in 2 to 7 loop
			--	temp := TT_LINE(i-1);
			--	TT_LINE(i) <=  (temp and TQ_LINE(i-1));
			--end loop;

	end process line_mkr;




	temp <= TT_LINE(1);
	main_prc: process(temp)
	begin
		TT_LINE(2) <=  (temp and TQ_LINE(1));
	end process main_prc;

	temp1 <= TT_LINE(2);
	main_prc_1: process(temp1)
	begin
		TT_LINE(3) <=  (temp1 and TQ_LINE(2));
	end process main_prc_1;




	temp2 <= TT_LINE(3);
	main_prc_2: process(temp2)
	begin
		TT_LINE(4) <=  (temp2 and TQ_LINE(3));
	end process main_prc_2;

	temp3 <= TT_LINE(4);
	main_prc_3: process(temp3)
	begin
		TT_LINE(5) <=  (temp3 and TQ_LINE(4));
	end process main_prc_3;




	temp4 <= TT_LINE(5);
	main_prc_4: process(temp4)
	begin
		TT_LINE(6) <=  (temp4 and TQ_LINE(5));
	end process main_prc_4;

	temp5 <= TT_LINE(6);
	main_prc_5: process(temp5)
	begin
		TT_LINE(7) <=  (temp5 and TQ_LINE(6));
	end process main_prc_5;





	second_trig_line: for i in 0 to 7 generate
		rsff: rs_ff port map (
			C => RCLK,
			S => TQ_LINE(i),
			R => TNQ_LINE(i),
			Q => RSQ_LINE(i),
			NOT_Q => DUMMY
		);
	end generate second_trig_line;	

		
	tri_state_buf: process (RSQ_LINE,OE)
	begin
		for i in 0 to 7 loop
			if (OE = '0') then
				Q(i) <= RSQ_LINE(i);
			else 
				Q(i) <= 'Z';
			end if;
		end loop;
	end process tri_state_buf;

	

	rco_cnt: process (TQ_LINE)
	variable rco_vr : std_logic;
	begin
		rco_vr := TQ_LINE(0);
		for i in 1 to 7 loop
			rco_vr := rco_vr and TQ_LINE(i);
		end loop;
		RCO <= not rco_vr;
	end process rco_cnt;	

end Behavioral;
