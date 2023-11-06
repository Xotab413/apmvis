----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.10.2019 22:56:35
-- Design Name: 
-- Module Name: DIVIDER - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity divider is
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT : out STD_LOGIC);
end divider;

architecture Behavioral of divider is
    signal i: integer := 0;
    signal temp: std_logic := '0';
    
    constant divide_value: integer := 200000000;
begin
    process (CLK_IN)
    begin
        if CLK_IN' event and CLK_IN = '1' then
            if (i = divide_value) then
                i <= 0;
                temp <= not temp;
            else i <= i + 1;
            end if;
        end if;
    end process;
    
    CLK_OUT <= temp;       
end Behavioral;
