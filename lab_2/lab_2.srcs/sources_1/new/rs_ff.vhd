----------------------------------------------------------------------------------
-- Engineer: $emen
-- Company: AssweCan
-- Create Date: 26.09.2023 21:44:13

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity rs_ff is
	port (
			C    : in 	STD_LOGIC;
			S    : in 	STD_LOGIC;
			R    : in 	STD_LOGIC;
			Q	 : out 	STD_LOGIC;
			NOT_Q: out 	STD_LOGIC
		);
end rs_ff;

architecture Behavioral of rs_ff is
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
    
    signal DUMMY,DFF_D : std_logic;
begin
    rsff: d_ff port map (D=>DFF_D, C=>C, NOT_S=>DUMMY, NOT_R=>DUMMY, Q=>Q, NOT_Q=>NOT_Q);

    process (C) 
    begin
        if rising_edge(C) then


            -- Remove 'bad' state
            if ((R = '1' and S = '1') or (R = '0' and S = '0')) then        
                null;
            else
                case (R) is 
                    when '0' => DFF_D <= '0';
                    when others => null;
                end case;
                case (S) is 
                    when '1' => DFF_D <= '1';
                    when others => null;
                end case;
                
            end if;
        end if;

    end process;

end Behavioral;
