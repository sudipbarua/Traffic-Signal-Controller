----------------------------------------------------------------------------------
--Name: Sudip Barua 
--Create Date: 05/31/2020 09:25:15 PM
-- Design Name: Traffic signal controller
-- Module Name: design_traffic_signal - traffic_signal
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

entity design_traffic_signal is
    Port ( stop : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           p_light : out STD_LOGIC_VECTOR (1 downto 0);
           t_light : out STD_LOGIC_VECTOR (2 downto 0));
end design_traffic_signal;

architecture traffic_signal of design_traffic_signal is

type STATE_TYPE is (s1,s2,s3,s4,s5,s6);
signal state : STATE_TYPE;
signal next_state : STATE_TYPE;
signal set_count : STD_LOGIC;
signal count : integer range 1 to 100;

begin
    REG: process (clk, reset)
    begin
        if reset = '1' then
            state <= s1;
            count <= 0;
        elsif (clk'event and clk='1') then
            state <= next_state;
            if set_count = '1' then
                count <= 0;
            elsif count < 100 then
                count <= count + 1;
            else 
                count <= 0;    
            end if;     
        end if; 
            
    end process REG;
    
    CMB : process (stop, state, count)
    begin
        set_count <= '0';
        next_state <= state;
        
        case state is
            when s1 => 
                if stop = '1' then
                    next_state <= s2;
                    set_count <= '1';
                end if;
            
            when s2 => 
                if count = 40 then
                    next_state <= s3;
                    set_count <= '1';
                end if;    
            
            when s3 => 
                if count = 20 then
                    next_state <= s4;
                    set_count <= '1';
                end if;
            
            when s4 => 
                if count = 100 then
                    next_state <= s5;
                    set_count <= '1';
                end if;
            
            when s5 => 
                if count = 100 then
                    next_state <= s6;
                    set_count <= '1';
                end if;
                
            when s6 => 
                if count = 40 then
                    next_state <= s1;
                    set_count <= '1';
                end if;
            when others => next_state <= s1;
        end case;
     end process CMB;
       
     p_light <= "10" when 
        (state = s1 or state = s2 or state =  s3 or state = s5 or state = s6) else "01";  
     t_light <= "001" when state = s1 else
                "010" when state = s2 else
                "100" when (state = s3 or state = s4 or state = s5) else 
                "110" when state = s6 else
                "100";     
end traffic_signal;
