-- --- Seven segment component
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SevenSegment is
    Port ( DP_in                                                 : in  STD_LOGIC_VECTOR (5 downto 0);
           Num_Hex0,Num_Hex1,Num_Hex2,Num_Hex3,Num_Hex4,Num_Hex5 : in  STD_LOGIC_VECTOR (3 downto 0);
           HEX0,HEX1,HEX2,HEX3,HEX4,HEX5                         : out STD_LOGIC_VECTOR (7 downto 0)
          );
end SevenSegment;
architecture Behavioral of SevenSegment is

type Num_Hex_Arr is array (0 to 5) of std_logic_vector(3 downto 0);
type Hex_Arr is array (0 to 5) of std_logic_vector(7 downto 0);

--Note that component declaration comes after architecture and before begin (common source of error).
   Component SevenSegment_decoder is 
      port(  H     : out STD_LOGIC_VECTOR (7 downto 0);
             input : in  STD_LOGIC_VECTOR (3 downto 0);
             DP    : in  STD_LOGIC                               
          );                  
   end  Component;   
   
signal Hex: Hex_Arr;
signal Num_Hex: Num_Hex_Arr;
   
begin

Num_Hex(0) <= Num_Hex0;
Num_Hex(1) <= Num_Hex1;
Num_Hex(2) <= Num_Hex2;
Num_Hex(3) <= Num_Hex3;
Num_Hex(4) <= Num_Hex4;
Num_Hex(5) <= Num_Hex5;

gen_d: for i in 0 to 5 generate
	begin
		decoders: SevenSegment_decoder port map
			
			(H => Hex(i),
			 input => Num_Hex(i),
			 DP => DP_in(i)
			 );
	end generate gen_d;
				
HEX0 <= Hex(0);
HEX1 <= Hex(1);
HEX2 <= Hex(2);
HEX3 <= Hex(3);
HEX4 <= Hex(4);
HEX5 <= Hex(5);


--Note that port mapping begins after begin (common source of error).



--~ decoder0: SevenSegment_decoder  port map 
                                   --~ (H     => Hex0,
                                    --~ input => Num_Hex0,
                                    --~ DP    => DP_in(0)
                                    --~ );
--~ decoder1: SevenSegment_decoder  port map 
                                   --~ (H     => Hex1,
                                    --~ input => Num_Hex1,
                                    --~ DP    => DP_in(1)
                                    --~ );
--~ decoder2: SevenSegment_decoder  port map 
                                   --~ (H     => Hex2,
                                    --~ input => Num_Hex2,
                                    --~ DP    => DP_in(2)
                                    --~ );
--~ decoder3: SevenSegment_decoder port map 
                                   --~ (H     => Hex3,
                                    --~ input => Num_Hex3,
                                    --~ DP    => DP_in(3)
                                    --~ );
--~ decoder4: SevenSegment_decoder  port map 
                                   --~ (H     => Hex4,
                                    --~ input => Num_Hex4,
                                    --~ DP    => DP_in(4)
                                    --~ );
--~ decoder5: SevenSegment_decoder  port map 
                                   --~ (H     => Hex5,
                                    --~ input => Num_Hex5,
                                    --~ DP    => DP_in(5)
                                    --~ );                            
end Behavioral;
