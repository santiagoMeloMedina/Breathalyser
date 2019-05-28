library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity module is
port(
	clk : in std_logic;
	main, other : in std_logic_vector(15 downto 0);
	modl : out std_logic_vector(15 downto 0)
);
end module;

architecture arc_module of module is
signal num : std_logic_vector(15 downto 0) := main;
begin
	process(main, other, clk) is
	begin
		if rising_edge(clk) then
			if num >= other then
				num <= num - other;
			else
				modl <= num;
				num <= main;
			end if;
		end if;
	end process;
end arc_module;