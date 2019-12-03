library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
 
entity WaveGen_Buzzer is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC; -- clk is >> than 1 kHz, i.e. 100kHz and above
			  switch4: in STD_LOGIC;
			  ARDUINO_IO : out STD_LOGIC_VECTOR(9 downto 0);
			  LEDR : out STD_LOGIC_VECTOR (9 downto 0);
           HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 : out STD_LOGIC_VECTOR (7 downto 0)
          );
end WaveGen_Buzzer;

architecture Behavioral of WaveGen_Buzzer is

	Signal reset_i1, reset_i2 : STD_LOGIC;
	Signal switch_i1, switch_i2 : STD_LOGIC;
	Signal switch2_i1, switch2_i2 : STD_LOGIC;
	Signal switch3_i1, switch3_i2 : STD_LOGIC;
	Signal switch4_i1, switch4_i2 : STD_LOGIC;
	Signal PWM_Out : STD_LOGIC_VECTOR(9 downto 0);

	Component Buzzer is
		Port ( reset : in STD_LOGIC;
				clk : in STD_LOGIC; -- clk is >> than 1 kHz, i.e. 100kHz and above
				switch : in STD_LOGIC;
				PWM_OUT2 : out STD_LOGIC_VECTOR(9 downto 0);
				LEDR : out STD_LOGIC_VECTOR (9 downto 0);
				HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 : out STD_LOGIC_VECTOR (7 downto 0)
				);
	end Component;

	Component registers_stdlogic is
		generic(bits : integer := 1);
		port( 
				clk       : in  std_logic;
				reset     : in  std_logic;
				enable    : in  std_logic;
				d_inputs  : in  std_logic;
				q_outputs : out std_logic	
				);
	end Component;

BEGIN
				
QueenBee: Buzzer
	port map(reset => reset_i2, clk => clk, switch => switch4_i2, PWM_OUT2 => ARDUINO_IO, LEDR => LEDR,
				HEX0 => HEX0, HEX1 => HEX1, HEX2 => HEX2, HEX3 => HEX3, HEX4 => HEX4, HEX5 => HEX5);
				
reset_1: registers_stdlogic
	generic map(bits => 1)
	port map(clk => clk, reset => reset_i2, enable => '1', d_inputs => reset, q_outputs => reset_i1);
				
reset_2: registers_stdlogic
	generic map(bits => 1)
	port map(clk => clk, reset => reset_i2, enable => '1', d_inputs => reset_i1, q_outputs => reset_i2);
				
switch4_1: registers_stdlogic
	generic map(bits => 1)
	port map(clk => clk, reset => reset_i2, enable => '1', d_inputs => switch4, q_outputs => switch4_i1);
				
switch4_2: registers_stdlogic
	generic map(bits => 1)
	port map(clk => clk, reset => reset_i2, enable => '1', d_inputs => switch4_i1, q_outputs => switch4_i2);

END Behavioral;