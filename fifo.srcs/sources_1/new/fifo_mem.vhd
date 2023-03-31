----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2022 04:10:06 PM
-- Design Name: 
-- Module Name: fifo_mem - Behavioral
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

entity fifo_mem is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           anode : out std_logic_vector(3 downto 0);
		   seg : out std_logic_vector (7 downto 0);
		   btn_rd: in STD_LOGIC;
		   btn_wr: in std_logic;
		   data_in : in std_logic_vector(7 downto 0);
		   led: out std_logic_vector(1 downto 0));
		   
end fifo_mem;

architecture Behavioral of fifo_mem is

component seven_seg is
	port ( clk, rst : in std_logic;
    data : in std_logic_vector (7 downto 0);
    sseg : out std_logic_vector (7 downto 0);
    an : out std_logic_vector (3 downto 0));
end component;

component filtr is
   Port ( clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        d_in : in STD_LOGIC;
        q_out : out STD_LOGIC);
end component;

component fifo_ctrl is
    Port ( rd : in STD_LOGIC;
       wr : in STD_LOGIC;
       clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       rdinc : out STD_LOGIC;
       wrinc : out STD_LOGIC;
       empty : out STD_LOGIC;
       full : out STD_LOGIC);
end component;

component fifo8x8 is
   Port ( data_in : in STD_LOGIC_VECTOR (7 downto 0);
        rd : in STD_LOGIC;
        wr : in STD_LOGIC;
        rdinc : in STD_LOGIC;
        wrinc : in STD_LOGIC;
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        data_out : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal rd, wr, rdinc, wrinc: std_logic;
signal empty_signal: std_logic := '1';
signal full_signal: std_logic := '0';
signal data_out : std_logic_vector( 7 downto 0);

begin


    filtr1: filtr port map ( clk, reset, btn_rd, rd);
    filtr2: filtr port map ( clk, reset, btn_wr, wr);
    fifo_ctrl1: fifo_ctrl port map (rd, wr, clk, reset, rdinc, wrinc, led(0), led(1));
    fifo: fifo8x8 port map (data_in, rd, wr, rdinc, wrinc, clk, reset, data_out);
    display: seven_seg port map (clk, reset, data_out, seg, anode);

--    process(clk)
--        begin 
--            empty<=empty_signal;
--            full<=full_signal;
--    end process;

--process(clk, reset)
--    begin
--    if reset = '1' then
--        led(0) <= '1';
--        led(1) <= '0';
--    else
--        if empty_signal = '1' then 
--            led(0) <= '1';
--        else 
--            led(0) <= '0';
--        end if;
        
--        if full_signal = '1' then 
--            led(1) <= '1';
--        else 
--            led(1) <= '0';
--        end if;
--      end if;
--    end process;
  
end Behavioral;
