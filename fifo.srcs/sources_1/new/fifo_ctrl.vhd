----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2022 05:26:02 PM
-- Design Name: 
-- Module Name: fifo_ctrl - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fifo_ctrl is
    Port ( rd : in STD_LOGIC;
           wr : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           rdinc : out STD_LOGIC;
           wrinc : out STD_LOGIC;
           empty : out STD_LOGIC;
           full : out STD_LOGIC);
end fifo_ctrl;

architecture Behavioral of fifo_ctrl is

signal counter: std_logic_vector(3 downto 0):= "0000";
signal empty_s, full_s: std_logic;

begin


process(clk) 
begin
    if counter ="0000" then
        empty_s <= '1' ;
    else 
        empty_s<='0';
    end if;
    
    if counter = "1000" then
        full_s <= '1' ;
    else 
        full_s<='0';
    end if;
end process;
            
process(clk, reset)
    begin
        if reset = '1' then
                counter <= "0000";
                rdinc <= '0';
                wrinc <= '0';
                --empty<='1';
                --full<='0';
         else if rising_edge(clk) then
                    if (rd = '1' and empty_s = '0') then 
                        counter <= counter - 1;
                        --full <= '0';
                        rdinc <= '1';
                     else 
                        rdinc <= '0';
                     end if;
                     
                     if (wr = '1' and full_s = '0') then
                        counter <= counter + 1;
                        --empty <= '0'; 
                        wrinc <= '1';
                     else
                        wrinc <= '0';
                     end if;
             end if;
             end if;

end process;

process(clk)
begin
    empty<=empty_s;
    full <= full_s;
end process;

end Behavioral;
