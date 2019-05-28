library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity PC is
port(
	clk : in std_logic;
	sigwrite : in std_logic;
	entry : in std_logic_vector(15 downto 0);
	salida, s2 : out std_logic_vector(15 downto 0)
);
end PC;

architecture arc_PC of PC is
signal address : std_logic_vector(15 downto 0) := "0000000000000000";
begin
	process (clk, sigwrite, entry, address) is
	begin
		if falling_edge(clk) then
			if (sigwrite = '1') then
				address <= entry;
			end if;
		end if;
		salida <= address;
		s2 <= address;
	end process;
end arc_PC;