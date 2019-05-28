library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity signExtend is
port(
	first : in std_logic_vector(7 downto 0);
	salida : out std_logic_vector(15 downto 0)
);
end signExtend;

architecture arc_signExtend of signExtend is
begin
	process(first) is
	begin
		salida(15 downto 8) <= "00000000";
		salida(7 downto 0) <= first;
	end process;
end arc_signExtend;