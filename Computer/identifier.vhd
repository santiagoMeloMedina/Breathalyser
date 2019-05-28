library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity identifier is
port(
	num1, num2, num3 : in std_logic_vector(15 downto 0);
	d1, d2, d3, d4 : out std_logic_vector(6 downto 0)
);
end identifier;

architecture arc_identifier of identifier is
type segments is array (0 to 9) of std_logic_vector(6 downto 0);
signal codes : segments := ("0000001", "1001111", "0010010", "0000110", "1001100", 
										"0100100", "0100000", "0001111", "0000000", "0001100"); -- Son invertidos
begin

	d1 <= codes(to_integer(unsigned(num1)));
	d2 <= codes(to_integer(unsigned(num2)));
	d3 <= "1110111";
	d4 <= codes(to_integer(unsigned(num3)));

end arc_identifier;