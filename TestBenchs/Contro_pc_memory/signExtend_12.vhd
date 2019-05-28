library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity signExtend_12 is
port(
	first : in std_logic_vector(11 downto 0);
	salida : out std_logic_vector(15 downto 0)
);
end signExtend_12;

architecture arc_signExtend_12 of signExtend_12 is
begin
	process(first) is
	begin
		salida(15 downto 12) <= "0000";
		salida(11 downto 0) <= first;
	end process;
end arc_signExtend_12;