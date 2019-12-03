library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
 
entity Up_Counter is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC; -- clk is >> than 1 kHz, i.e. 100kHz and above
           EN :  in STD_LOGIC;
           increment : in integer;
           index_out : out integer
          );
end Up_Counter;

architecture Behavioral of Up_Counter is

	constant zeros : STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000000000000000000";
	signal index : STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000000000000000000";
	
BEGIN
	count : process(clk, reset)
       begin
            if(reset = '1') then
                index <= zeros;
            elsif (rising_edge(clk)) then
                if (EN = '1') then
                        index <= index + increment;                                        
                end if;
            end if;
        end process;
	index_out <= to_integer(unsigned(index(31 downto 22)));
END Behavioral;
