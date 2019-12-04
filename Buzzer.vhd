library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
 
entity Buzzer is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC; -- clk is >> than 1 kHz, i.e. 100kHz and above
			  switch : in STD_LOGIC;
			  PWM_OUT2 : out STD_LOGIC_VECTOR(9 downto 0);
			  LEDR : out STD_LOGIC_VECTOR (9 downto 0);
           HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 : out STD_LOGIC_VECTOR (7 downto 0)
          );
end Buzzer;

architecture Behavioral of Buzzer is

	SIGNAL amplitude_i : integer;
	SIGNAL slow_clk2 : STD_LOGIC;
	SIGNAL divisor_i2 : natural;
	SIGNAL index_i, index_amp, index_freq, increment, index_i2: integer;
	SIGNAL duty_cycle_i : STD_LOGIC_VECTOR(9 downto 0);

	Component Voltmeter is
			Port ( clk                          : in  STD_LOGIC;
					reset                         : in  STD_LOGIC;
					LEDR                          : out STD_LOGIC_VECTOR (9 downto 0);
					HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 : out STD_LOGIC_VECTOR (7 downto 0);
					distance							  : out STD_LOGIC_VECTOR (12 downto 0);
					index,distance2					:  OUT   integer
					);
	end Component;
	
	Component BuzzFreq_Lookup IS
			PORT	( clk       :  IN    STD_LOGIC;                                
					reset       :  IN    STD_LOGIC;                                
					index      	:  IN    integer;                           
					Increment   :  OUT   integer
					);
	END Component;
	
	Component BuzzAmp_Lookup IS
   PORT(
      clk            :  IN    STD_LOGIC;                                
      reset          :  IN    STD_LOGIC;                                
      index      	 	:  IN    integer;                           
      amplitude      :  OUT   integer
		);
	END Component;
	
	Component RegisterInt is
	port (SI: in integer;
			Q: out integer;
			clk, EN, reset: in std_logic);
	END Component;
	
	Component Up_Counter is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC; -- clk is >> than 1 kHz, i.e. 100kHz and above
           EN :  in STD_LOGIC;
           increment : in integer;
           index_out : out integer
          );
	end Component;
	
	Component Sine_Lookup IS
   PORT(
      clk            :  IN    STD_LOGIC;                                
      reset          :  IN    STD_LOGIC;                                
      index      	 	:  IN    integer;                           
      duty_cycle     :  OUT   STD_LOGIC_VECTOR(9 downto 0)
		);
	END Component;
	
	Component Mult10andDiv is
   Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC; -- clk is >> than 1 kHz, i.e. 100kHz and above
           inputa: in STD_LOGIC_VECTOR(9 downto 0);
			  inputb : in integer;
			  output: out STD_LOGIC_VECTOR (9 downto 0)
          );
	end Component;
	
BEGIN

Voltron: Voltmeter
	port map(clk => clk, reset => reset, LEDR => LEDR,
				 HEX0 => HEX0, HEX1 => HEX1, HEX2 => HEX2, HEX3 => HEX3, HEX4 => HEX4, HEX5 => HEX5,
				 distance2 => index_i);	
	
FreqLUT: BuzzFreq_Lookup
	port map(clk => clk, reset => reset, index => index_freq, Increment => increment);

AmpLUT: BuzzAmp_Lookup
	port map(clk => clk, reset => reset, index => index_amp, amplitude => amplitude_i);

IndexRegAmp: RegisterInt
	port map(SI => index_i, Q => index_amp, clk => clk, EN => switch, reset => reset);

IndexRegFreq: RegisterInt
	port map(SI => index_i, Q => index_freq, clk => clk, EN => not switch, reset => reset);

Counterupper: Up_Counter
	port map(reset => reset, clk => clk, EN => '1', increment => increment, index_out => index_i2);
	
SineLUT: Sine_Lookup
	port map(clk => clk, reset => reset, index => index_i2, duty_cycle => duty_cycle_i);
	
DivUnit: Mult10andDiv
	port map(reset => reset, clk => clk, inputa => duty_cycle_i, inputb => amplitude_i, output => PWM_OUT2);

END Behavioral;