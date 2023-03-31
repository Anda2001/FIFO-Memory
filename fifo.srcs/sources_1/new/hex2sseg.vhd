----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2022 05:15:49 PM
-- Design Name: 
-- Module Name: hex2sseg - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hex2sseg is
   Port ( hex : in std_logic_vector (3 downto 0);
       cat : out std_logic_vector (7 downto 0));
end hex2sseg;

architecture Behavioral of hex2sseg is

begin
  
 with hex select
 cat<= "11111001" when "0001",   --1
       "10100100" when "0010",   --2
       "10110000" when "0011",   --3
       "10011001" when "0100",   --4
       "10010010" when "0101",   --5
       "10000010" when "0110",   --6
       "11111000" when "0111",   --7
       "10000000" when "1000",   --8
       "10010000" when "1001",   --9
       "10001000" when "1010",   --A
       "10000011" when "1011",   --b
       "11000110" when "1100",   --C
       "10100001" when "1101",   --d
       "10000110" when "1110",   --E
       "10001110" when "1111",   --F
       "11000000" when others;   --0

end Behavioral;
