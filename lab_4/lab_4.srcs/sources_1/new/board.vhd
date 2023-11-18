----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.11.2019 00:24:51
-- Design Name: 
-- Module Name: schema - Behavioral
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

library UNISIM;
use UNISIM.vcomponents.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.ALL;

entity board is
    Port ( 
        ledsmain: out std_logic_vector(3 downto 0);
        ledsboard: out std_logic_vector(3 downto 0);
        pushbuttons: in std_logic_vector(4 downto 0);
        dipswitch: in std_logic_vector(3 downto 0);
        --clock diff pair
        sysclk_p: in std_logic;
        sysclk_n: in std_logic
    );
end board;

architecture Behavioral of board is
    component top is
    port (
            OE      : in STD_LOGIC; -- negative
            RCLK    : in STD_LOGIC;
            CCKEN   : in STD_LOGIC; -- negative
            CCLK    : in STD_LOGIC;
            CCLR    : in STD_LOGIC; -- negative

            RCO     : out STD_LOGIC;-- negative
            Q       : out STD_LOGIC_VECTOR (7 DOWNTO 0) 

        );
    end component;
  
    component ibufds
        port (
            i, ib : in std_logic; 
            o : out std_logic
        );
    end component;
    
    component divider is
        port ( 
            CLK_IN : in STD_LOGIC;
            CLK_OUT : out STD_LOGIC
        );
    end component;

    signal CLOCK, NOT_CLOCK: std_logic;
    signal Q : std_logic_vector (7 DOWNTO 0);
    signal CLK_NO_DIV,RCO,RCKEN,RCLK_int : std_logic;
begin


  IBUFDS_inst : IBUFDS

    port map (
       O =>  CLK_NO_DIV,  -- Buffer output
       I =>  sysclk_p,  -- Diff_p buffer input (connect directly to top-level port)
       IB => sysclk_n -- Diff_n buffer input (connect directly to top-level port)
    );

    RCKEN <= (pushbuttons(3));
    
    RCLK_EN: process(RCKEN) begin
        if (RCKEN = '1') then
            RCLK_int <= NOT_CLOCK;
         else 
            RCLK_int <= '0';
         end if;
        
    end process RCLK_EN;
    
    NOT_CLOCK <= not(CLOCK);

    counter: top port map (
        OE => not(pushbuttons(0)), 
        RCLK => RCLK_int, 
        CCKEN=>not(pushbuttons(1)), 
        CCLK=> CLOCK, 
        CCLR=> not pushbuttons(2), 
        RCO => RCO, 
        Q => Q
    );


    ledsmain(0) <= Q(0);
    ledsmain(1) <= Q(1);
    ledsmain(2) <= Q(2);
    ledsmain(3) <= Q(3);
    ledsboard(0) <= Q(4);
    ledsboard(1) <= Q(5);
    ledsboard(2) <= Q(6);
    ledsboard(3) <= Q(7);

    
    div: divider port map (
        CLK_IN => CLK_NO_DIV, 
        CLK_OUT => CLOCK
    );
    
end Behavioral;