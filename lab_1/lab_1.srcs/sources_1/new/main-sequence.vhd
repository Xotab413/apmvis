----------------------------------------------------------------------------------
-- Company: Chuanjlo
-- Engineer: Semen

----------------------------------------------------------------------------------
-- 13 variants OMG

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;

entity alu_gen_sequence is
    Port (
          S     : in STD_LOGIC_VECTOR (3 DOWNTO 0);
          NOT_A : in STD_LOGIC_VECTOR (3 DOWNTO 0);
          NOT_B : in STD_LOGIC_VECTOR (3 DOWNTO 0);
          M     : in STD_LOGIC;
          C_n   : in STD_LOGIC;
          
          NOT_G,NOT_P,C_n_4,A_evn_B : out STD_LOGIC;
          NOT_F : out STD_LOGIC_VECTOR (3 DOWNTO 0)
          );
end alu_gen_sequence;

architecture synth of alu_gen_sequence is
    SIGNAL TEMP_A: STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL TEMP_B: STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL B     : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL NOT_M : STD_LOGIC;
    
    
-- Procedure for eazyy understanding ))
    procedure and5_2nor (
        signal S        : in STD_LOGIC_VECTOR (3 DOWNTO 0);
        signal B        : in STD_LOGIC;
        signal notB     : in STD_LOGIC;
        signal A        : in STD_LOGIC;
        signal NOR1,NOR2: out STD_LOGIC) is
        
        begin
        
        NOR1 <= (
            (B and S(3) and A) nor (
            A and S(2) and notB)
        );
        
        NOR2 <= not(
            (notB and S(1)) or (
            S(0) and B) or A
        );

   end and5_2nor;
   begin
   
   B <= not NOT_B;
   NOT_M <= not M;
   
   process(TEMP_A,TEMP_B,S)
   begin
    for i in TEMP_A'range loop
        and5_2nor(S, NOT_B(i), B(i), NOT_A(i),TEMP_B(i),TEMP_A(i));
        end loop;
   end process;
   
   --- in GOD we trust .....
   
   NOT_G <= not (
        TEMP_A(3) or (TEMP_B(3) and TEMP_A(2)) or (TEMP_B(3) and TEMP_B(2) and TEMP_A(1)) or ( 
        TEMP_B(3) and TEMP_B(2) and TEMP_B(1) and TEMP_A(0))
   );
  
  process (S,M,C_n)
  begin
    if (S = "0000" and M = '1') then
      NOT_F <= not NOT_A;
    elsif (S = "0000" and M = '0') then
      case (C_n) is
        when '1' => NOT_F <= NOT_A;
        when '0' => NOT_F <= NOT_A + std_logic_vector(to_unsigned(1, 4));
        when others => null;
      end case;
    elsif (S = "0011" and M = '1') then
      NOT_F <= "0000";
    elsif (S = "0011" and M = '0') then
      case (C_n) is
        when '1' => NOT_F <= "1111";
        when '0' => NOT_F <= "0000";
        when others => null;
      end case;
    else
    
  NOT_F(3) <= (
        (TEMP_B(3) xor TEMP_A(3)) xor (not ( (C_n and TEMP_B(0) and TEMP_B(1) and TEMP_B(2) and NOT_M) or 
        (TEMP_B(1) and TEMP_B(2) and TEMP_A(0) and NOT_M ) or (TEMP_B(2) and TEMP_A(1) and NOT_M ) or (TEMP_A(2) and NOT_M))
        )
  );
  
  NOT_F(2) <= (
        (TEMP_B(2) xor TEMP_A(2)) xor ( not ((C_n and TEMP_B(0) and TEMP_B(1) and NOT_M) or (
        TEMP_B(1) and TEMP_A(0) and NOT_M ) or (TEMP_A(1) and NOT_M)))
  );
  
  NOT_F(1) <= (
        (TEMP_B(1) xor TEMP_A(1)) xor (not ((C_n and  TEMP_B(0) and NOT_M) or (TEMP_A(0) and NOT_M)))
  );
  
  NOT_F(0) <= (
        (TEMP_B(0) xor TEMP_A(0)) xor (C_n nand NOT_M)
  );
  
  end if;
  
 end process; 
  
  
  
  
    
end synth;
