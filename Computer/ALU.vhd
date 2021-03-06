library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity ALU is
port(
	first, second : in std_logic_vector(15 downto 0);
	sig : in std_logic_vector(3 downto 0);
	result : out std_logic_vector(15 downto 0);
	flag : out std_logic
);
end ALU;


architecture arc_ALU of ALU is

signal mult: std_logic_vector(31 downto 0);

begin

	process(first, second, sig, mult) is
	begin
		result <= "0000000000000000";
		flag <= '0';
		if (sig = "0000") then
			result <= first+second;
		elsif (sig = "0001") then
			result <= first-second;
		elsif (sig = "0010") then
			mult <= first*second;
			result <= mult(15 downto 0);
		elsif (sig = "0011") then
			result <= std_logic_vector(to_unsigned(to_integer(unsigned(first))/to_integer(unsigned(second)), result'length));
		elsif (sig = "0100") then
			if (first = second) then
				flag <= '1';
			else
				flag <= '0';
			end if;
		elsif (sig = "0101") then
			if (first < second) then
				flag <= '1';
			else
				flag <= '0';
			end if;
		elsif (sig = "0110") then
			if (first > second) then
				flag <= '1';
			else
				flag <= '0';
			end if;
		elsif (sig = "1000") then
			result <= first or second;
		elsif (sig = "1001") then
			result <= first and second;
		elsif (sig = "1010") then
			result <= first nor second;
		end if;
			
		
	end process;
	
end arc_ALU;