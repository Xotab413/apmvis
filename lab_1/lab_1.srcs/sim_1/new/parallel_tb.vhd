

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use STD.TEXTIO.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity parallel_tb is
--  Port ( );
end parallel_tb;

architecture Behavioral of parallel_tb is
    component alu_gen_paralell 
            Port (
          S     : in STD_LOGIC_VECTOR (3 DOWNTO 0);
          NOT_A : in STD_LOGIC_VECTOR (3 DOWNTO 0);
          NOT_B : in STD_LOGIC_VECTOR (3 DOWNTO 0);
          M     : in STD_LOGIC;
          C_n   : in STD_LOGIC;
          
          NOT_G,NOT_P,C_n_4,A_evn_B : out STD_LOGIC;
          NOT_F : out STD_LOGIC_VECTOR (3 DOWNTO 0)
          );
      end component;
      
      --constant passed : string(1 to 6) := "passed";
      --constant error : string(1 to 11) := "TEST FAILED";
     -- Internal components 
     
      signal S     :  STD_LOGIC_VECTOR (3 DOWNTO 0);
      signal NOT_A :  STD_LOGIC_VECTOR (3 DOWNTO 0);
      signal NOT_B :  STD_LOGIC_VECTOR (3 DOWNTO 0);
      signal M     :  STD_LOGIC;
      signal C_n   :  STD_LOGIC;
      signal NOT_F :  STD_LOGIC_VECTOR (3 DOWNTO 0);
      
      
begin
    UUT:  alu_gen_paralell port map (S=>S, NOT_A=>NOT_A, NOT_B=>NOT_B, M=>M, C_n=>C_n, NOT_F=>NOT_F);
  
  M <= '0';
  C_n <= '1';
  
  S <= "0011";
  NOT_A <= std_logic_vector(conv_unsigned(12, 4)); --- 10
  NOT_B <= std_logic_vector(conv_unsigned(5, 4));   --- 3
  
  
  

--  test_case: process
--  begin
--    for i in 0 to 16 loop
--        for k in 0 to 16 loop
--            for j in 0 to 1 loop
--                wait for 10 ns;
----                NOT_A <= std_logic_vector(conv_unsigned(10, 4));
----                NOT_B <= std_logic_vector(conv_unsigned(3, 4));
----                wait for 10 ns;
----                S <= std_logic_vector(conv_unsigned(9, 4));
                
--                if (not(NOT_A xor NOT_B) = NOT_F) then
--                    report passed;
--                    else
--                    report error severity failure;
--                    end if;
--        end loop;
--        end loop;
--    end loop;
--  end process;














end Behavioral;
