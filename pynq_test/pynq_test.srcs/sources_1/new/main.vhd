----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/12/2021 03:43:48 PM
-- Design Name: 
-- Module Name: main - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
 Port ( 
    led0: out std_logic ;
    led1: out std_logic ;
    led2: out std_logic ;
    led3: out std_logic ; 
    sw_0: in std_logic;
    btn0: in std_logic;
    btn1: in std_logic;
    btn2: in std_logic;
    btn3: in std_logic;
    led4_b: out std_logic;
    led4_g: out std_logic ;
    led4_r: out std_logic;
    led5_r: out std_logic;
    led5_g: out std_logic;
    led5_b: out std_logic;
    sw_1: in std_logic;
    sysclk: in std_logic 
    );
end main;

architecture Behavioral of main is

-- this is for clock 
constant clock_1HZ : natural := 62500000; 
signal ledr : std_logic := '0';
signal ledg : std_logic := '0';
signal ledb : std_logic := '0';
signal count_1Hz : natural range 0 to clock_1HZ;
signal count_led : natural range 0 to 3;

begin
    process
    begin
    case btn0 is
        when '0' => led0 <= '0';
        when '1' => led0 <= '1';
    end case;
    
    case btn1 is
        when '0' => led1 <= '0';
        when '1' => led1 <= '1';
    end case;
    
    case btn2 is
        when '0' => led2 <= '0';
        when '1' => led2 <= '1';
    end case;
    
    case btn3 is
        when '0' => led3 <= '0';
        when '1' => led3 <= '1';
    end case;
    
end process;

 process (sysclk) is
  begin
    if rising_edge(sysclk) then
      if count_1Hz = clock_1HZ-1 then  -- -1, since counter starts at 0
        count_1Hz    <= 0;
        if count_led = 3 then
            count_led <= 0;
        else
            count_led <= count_led + 1;
        end if;
      else
        count_1Hz <= count_1Hz + 1;
      end if;
    end if;
  end process;

process 
begin

    if count_led = 0 then
        led4_r <= '1';
        led5_r <= '1';
        led4_b <= '0';
        led5_b <= '0';
        led4_g <= '0';
        led5_g <= '0';
    elsif count_led = 1 then
        led4_r <= '0';
        led5_r <= '0';
        led4_b <= '1';
        led5_b <= '1';
        led4_g <= '0';
        led5_g <= '0';    
    elsif count_led = 2 then
        led4_r <= '0';
        led5_r <= '0';
        led4_b <= '0';
        led5_b <= '0';
        led4_g <= '1';
        led5_g <= '1';  
    else 
        led4_r <= '1';
        led5_r <= '1';
        led4_b <= '1';
        led5_b <= '1';
        led4_g <= '1';
        led5_g <= '1';  
    end if;
end process;

end Behavioral;
