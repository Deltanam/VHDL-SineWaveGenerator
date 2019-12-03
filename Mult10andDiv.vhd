library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
 
entity Mult10andDiv is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC; -- clk is >> than 1 kHz, i.e. 100kHz and above
           inputa : in STD_LOGIC_VECTOR(9 downto 0);
			  inputb : in integer := 4096;
			  output: out STD_LOGIC_VECTOR (9 downto 0)
          );
end Mult10andDiv;

architecture Behavioral of Mult10andDiv is	
	Signal Product : Integer;
	constant zeros : Integer := 0;
BEGIN
	process1 : process(clk, reset)
       begin
            if(reset = '1') then
                Product <= zeros;
            elsif (rising_edge(clk)) then
					 Product <= (to_integer(unsigned(inputa))*inputb);
            end if;
        end process;
	output <= std_logic_vector(to_unsigned((Product / 4096),10));
	
END Behavioral;