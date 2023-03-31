----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2022 05:20:55 PM
-- Design Name: 
-- Module Name: filtr - Behavioral
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

entity filtr is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           d_in : in STD_LOGIC;
           q_out : out STD_LOGIC);
end filtr;

architecture Behavioral of filtr is

	signal Q1 : std_logic;
	signal Q2 : std_logic; 
	signal Q3 : std_logic;

begin

	process(clk)
	begin
	   if rising_edge(clk) then
			if(rst = '1') then
				Q1 <= '0';
				Q2 <= '0';
				Q3 <= '0';
			else
				Q1 <= D_IN;
				Q2 <= Q1;
				Q3 <= Q2;
				
			end if;
		end if;
		
	end process;
	 
	Q_OUT <= Q1 and Q2 and (not Q3);

end Behavioral;
