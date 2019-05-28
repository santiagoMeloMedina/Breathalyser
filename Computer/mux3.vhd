library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity mux3 is
port(
	sgn : in std_logic_vector(2 downto 0);
	first, second, third : in std_logic_vector(15 downto 0);
	salida : out std_logic_vector(15 downto 0)
);
end mux3;

architecture arc_mux3 of mux3 is
begin
	process(sgn, first, second, third) is
	begin
		if (sgn = "00") then
			salida <= first;
		elsif (sgn = "01") then
			salida <= second;
		else
			salida <= third;
		end if;
	end process;
end arc_mux3;