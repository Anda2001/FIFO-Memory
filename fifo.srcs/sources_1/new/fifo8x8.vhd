----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2022 05:29:50 PM
-- Design Name: 
-- Module Name: fifo8x8 - Behavioral
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

entity fifo8x8 is
    Port ( data_in : in STD_LOGIC_VECTOR (7 downto 0);
           rd : in STD_LOGIC;
           wr : in STD_LOGIC;
           rdinc : in STD_LOGIC;
           wrinc : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (7 downto 0));
end fifo8x8;

architecture Behavioral of fifo8x8 is

type MEM is array(0 to 255) of std_logic_vector(7 downto 0);
signal fifo:MEM := (others => x"0000");
signal wrptr: std_logic_vector(2 downto 0) := "000";
signal rdptr: std_logic_vector(2 downto 0):= "000";

begin

process(clk, rst)
    begin
    if(rst = '1') then

        for i in 0 to 7 loop
            fifo(i)<="00000000";
            data_out <= "00000000";

        end loop; 
        
        wrptr<="000";
        rdptr <= "000";
            
    elsif(rising_edge(clk)) then

        if(rdinc = '1') then 
            rdptr <= rdptr +1;
            data_out <= fifo(conv_integer(rdptr));

        elsif(wrinc = '1') then 
            wrptr <= wrptr+1;
            fifo(conv_integer(wrptr)) <= data_in;

        end if;

end if;
end process;


--wr_ptr: process (clk, rst) 
--begin
--    if rst = '1' then
--	   wrptr <= "000";
--	else if (rising_edge(clk) and rst = '0') then
--		if (wrinc = '1') then 
--			wrptr <= wrptr + 1;
--		end if; 
--	   end if;
--	end if;
	
--end process;


--rd_ptr: process(clk,rst) 
--begin
--	 if rst = '1' then
--             rdptr <= "000";
--     else if (rising_edge(clk) and rst = '0') then
--		if (rdinc = '1') then 
--			rdptr <= rdptr + 1;
--		end if;

--        end if;
--	end if;
--end process;


end Behavioral;
