----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sudip Barua
-- 
-- Create Date: 05/31/2020 10:47:56 PM
-- Design Name: Test Bench of Traffic signal controller
-- Module Name: tb_traffic_signal_controller - Behavioral
-- Project Name: Traffic signal controller
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

entity tb_traffic_signal_controller is
end tb_traffic_signal_controller;

architecture Behavioral of tb_traffic_signal_controller is
signal stop : STD_LOGIC := '0';
signal clk : STD_LOGIC := '1';
signal reset : STD_LOGIC;
signal p_light : STD_LOGIC_VECTOR (1 downto 0);
signal t_light : STD_LOGIC_VECTOR (2 downto 0);

component design_traffic_signal 
      Port ( stop : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           p_light : out STD_LOGIC_VECTOR (1 downto 0);
           t_light : out STD_LOGIC_VECTOR (2 downto 0));
end component;

begin

DUT: design_traffic_signal
    port map (
    stop => stop,
    clk => clk,
    reset => reset,
    p_light => p_light,
    t_light => t_light);

clk <= not clk after 25ms;

    wev_gen: process
    begin 
        reset <= '1';
        stop <= '1';
        wait for 100 ms;
        reset <= '0';
        wait for 500ms;
        stop <= '0';
        
        wait;   
    end process wev_gen;

end Behavioral;
