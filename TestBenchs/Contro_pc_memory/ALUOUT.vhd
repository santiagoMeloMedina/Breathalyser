library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALUOUT is
port(
	clk : in std_logic;
	ao : in std_logic_vector(15 downto 0);
	aout : out std_logic_vector(15 downto 0)
);
end ALUOUT;

architecture arc_ALUOUT of ALUOUT is
signal count : std_logic_vector(1 downto 0) := "00";
signal data : std_logic_vector(15 downto 0);
begin
	process (clk, ao) is
	begin
		if clk = '1' then
			data <= ao;
		end if;
		aout <= data;
	end process;
end arc_ALUOUT;