library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity tb_Wave_Gen is
end tb_Wave_Gen;

ARCHITECTURE behaviour OF tb_Wave_Gen IS
	constant clk_period: time:=10ns; -- 50 MHz

Component WaveGen_Buzzer is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC; -- clk is >> than 1 kHz, i.e. 100kHz and above
			  switch4: in STD_LOGIC;
			  ARDUINO_IO : out STD_LOGIC_VECTOR(9 downto 0);
			  LEDR : out STD_LOGIC_VECTOR (9 downto 0);
           HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 : out STD_LOGIC_VECTOR (7 downto 0)
          );
end Component;


--Inputs
	signal clk : std_logic;
	signal reset : std_logic;
--Outputsd
	signal LEDR : STD_LOGIC_VECTOR (9 downto 0);
    signal HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 : STD_LOGIC_VECTOR (7 downto 0);
    signal ARDUINO_IO : STD_LOGIC_VECTOR(9 downto 0);
    signal switch4 : STD_LOGIC;


	BEGIN
	WaveGen_Buzzer_ins: WaveGen_Buzzer PORT MAP (
		clk => clk,
		reset => reset,
		switch4 => switch4,
		LEDR => LEDR,
		HEX0 => HEX0,
		HEX1 => HEX1,
		HEX2 => HEX2,
		HEX3 => HEX3,
		HEX4 => HEX4,
		HEX5 => HEX5,
		ARDUINO_IO => ARDUINO_IO
		);
		
	clk_process : process
		begin
			clk<='0';
			wait for clk_period/2;
			clk<='1';
			wait for clk_period/2;
	end process;
	 
	rst_process: process
	begin
		reset<='1';
		wait for 20 ns;
		reset<='1';
		wait for 20 ns;
		reset<='0';
		wait;
	end process;
	
END;

