library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity decoder is
port(
	clck : in std_logic;
	number : in std_logic_vector(15 downto 0);
	display1, display2, display3, display4 : out std_logic_vector(6 downto 0);
	vs : out std_logic_vector(15 downto 0)
);
end decoder;

architecture arc_decoder of decoder is

signal firstnum, secondnum, zeronum, firstnumD, zeronumD, temp : std_logic_vector(15 downto 0);
signal tmp : integer;

component module is
	port(
		clk : in std_logic;
		main, other : in std_logic_vector(15 downto 0);
		modl : out std_logic_vector(15 downto 0)
	);
end component;

component identifier is
port(
	num1, num2, num3 : in std_logic_vector(15 downto 0);
	d1, d2, d3, d4 : out std_logic_vector(6 downto 0)
);
end component;

begin

First: module
	port map(
		clk => clck,
		main => number,
		other => "0000000001100100",
		modl => firstnum
	);

Second: module
	port map(
		clk => clck,
		main => number,
		other => "0000000000001010",
		modl => secondnum
	);
	
Identificador : identifier
	port map(
		num1 => zeronumD,
		num2 => firstnumD,
		num3 => secondnum,
		d1 => display1,
		d2 => display2,
		d3 => display3,
		d4 => display4
	);
	tmp <= to_integer(unsigned((firstnum-secondnum)));
	firstnumD <= std_logic_vector(to_unsigned((tmp/10), firstnum'length));
	temp <= std_logic_vector(to_unsigned((tmp), temp'length));
	zeronumD <= std_logic_vector(to_unsigned((to_integer(unsigned((number-temp)-secondnum))/100), zeronum'length));
	vs <= zeronumD;
	
end arc_decoder;