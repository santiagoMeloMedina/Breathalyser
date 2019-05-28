library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Computer is
port(
	clock : in std_logic;
	visual : out std_logic_vector(15 downto 0)
	
);
end Computer;

architecture arc_Computer of Computer is

component procesador is
	port(
		reloj : in std_logic;
		visual2 : out std_logic_vector(15 downto 0);
		sigread, sigwrite : out std_logic;
		address : out std_logic_vector(15 downto 0);
		data : out std_logic_vector(19 downto 0);
		outdata : in std_logic_vector(19 downto 0)
	);
end component;

component memory is
	port(
		clk : in std_logic;
		sigread, sigwrite : in std_logic;
		address : in std_logic_vector(15	downto 0);
		data : in std_logic_vector(19 downto 0);
		outdata : out std_logic_vector(19 downto 0)
	);
end component;

signal memread, memwrite : std_logic;
signal direccion : std_logic_vector(15 downto 0);
signal datos : std_logic_vector(19 downto 0);
signal instruccion : std_logic_vector(19 downto 0);

begin

Memoria: memory
	port map(
		clk => clock,
		sigread => memread,
		sigwrite => memwrite,
		address => direccion,
		data => datos,
		outdata => instruccion
	);

Procesador: procesador
	port map(
		reloj => clock,
		visual2 => visual,
		sigread => memread,
		sigwrite => memwrite,
		address => direccion,
		data => datos,
		outdata => instruccion
	);
	
end arc_Computer;