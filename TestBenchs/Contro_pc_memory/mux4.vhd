library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity mux4 is
port(
	sgn : in std_logic_vector(2 downto 0);
	first, second, third, fourth : in std_logic_vector(15 downto 0);
	salida : out std_logic_vector(15 downto 0)
);
end mux4;

architecture arc_mux4 of mux4 is
begin
	process(sgn, first, second, third, fourth) is
	begin
		if (sgn = "00") then
			salida <= first;
		elsif (sgn = "01") then
			salida <= second;
		elsif (sgn = "10") then
			salida <= third;
		else
			salida <= fourth;
		end if;
	end process;
end arc_mux4;