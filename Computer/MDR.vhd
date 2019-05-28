library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity MDR is
port(
	clk : in std_logic;
	ao : in std_logic_vector(19 downto 0);
	aout : out std_logic_vector(15 downto 0)
);
end MDR;

architecture arc_MDR of MDR is
signal data : std_logic_vector(15 downto 0);
begin
	process (clk, ao) is
	begin
		if clk = '1' then
			data <= ao(15 downto 0);
		end if;
		aout <= data;
	end process;
end arc_MDR;