library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity control is

generic 
	(
		SIZE : integer := 22
	);

port(
	clock : in std_logic;
	sigs : out std_logic_vector(22 downto 0);
	opcode : in std_logic_vector(3 downto 0);
	mdr : out std_logic;
	dz : out std_logic;
	aow : out std_logic;
	br : out std_logic;
	pw : out std_logic;
	id : out std_logic;
	mr : out std_logic;
	mw : out std_logic;
	mtr : out std_logic;
	iw : out std_logic;
	aA : out std_logic;
	rw : out std_logic;
	rd : out std_logic;
	ps: out std_logic_vector(2 downto 0);
	aB: out std_logic_vector(2 downto 0);
	ap : out std_logic_vector(3 downto 0)
	
);
end control;

architecture arc_control of control is
type estados is (FetchS, DecodeS, MemAddrS, MemReadS, MemWriteBackS, MemWriteS, ExecuteS, 
						ALUWriteBackS, ExecuteIS, ALUWriteBackIS, BranchS, JumpS);
signal currentState, NextState: estados;

type table is array(0 to 15) of std_logic_vector(SIZE downto 0);
signal signals : std_logic_vector(SIZE downto 0);
signal data : table := ("00000000000000000000000", "00000000000000000000000",
								"00100000001000000000000",
								"00100000001000000000001",
								"00100000001000000000010",
								"00100000001000000000011",
								"00100000001000000000100",
								"00100000001000000000101",
								"00100000001000000000110",
								"00100000001000000000111",
								"00100000001000000001000",
								"00100000001000000001001",
								"00100000000000000000000",
								"00000000000000000000000", "00000000000000000000000", "00000000000000000000000"
								);
begin
	
	process (clock, opcode, data, CurrentState) is
	begin
		case CurrentState is 
			when FetchS => 
				signals <= "00001010010000000010000";
				NextState <= DecodeS;
			when DecodeS =>
				signals <= "01100000000000000100000";
				if (to_integer(unsigned(opcode)) < 2) then
					NextState <= MemAddrS;
				elsif (to_integer(unsigned(opcode)) > 1 and to_integer(unsigned(opcode)) < 12) then
					NextState <= ExecuteS;
				elsif (to_integer(unsigned(opcode)) = 12) then
					NextState <= ExecuteIS;
				elsif (to_integer(unsigned(opcode)) = 13) then
					NextState <= BranchS;
				else
					NextState <= JumpS;
				end if;
			when MemAddrS =>
				signals <= "00100000001000000100000";
				if (to_integer(unsigned(opcode)) = 0) then
					NextState <= MemReadS;
				else
					NextState <= MemWriteS;
				end if;
			when MemReadS =>
				signals <= "10000110000000000000000";
				NextState <= MemWriteBackS;
			when MemWriteBackS =>
				signals <= "00000000100100000000000";
				NextState <= FetchS;
			when MemWriteS =>
				signals <= "00000101000000000000000";
				NextState <= FetchS;
			when ExecuteS =>
				signals <= data(to_integer(unsigned(opcode)));
				NextState <= ALUWriteBackS;
			when ExecuteIS =>
				signals <= "00100000001000000100000";
				NextState <= ALUWriteBackIS;
			when ALUWriteBackS =>
				signals <= "00000000000110000000000";
				NextState <= FetchS;
			when ALUWriteBackIS =>
				signals <= "00000000000100000000000";
				NextState <= FetchS;
			when BranchS =>
				signals <= "00010000001000010000100";
				NextState <= FetchS;
			when JumpS =>
				signals <= "00001000000000100000000";
				NextState <= FetchS;
		end case;
	end process;
	
	process (clock) is
	begin
		if (rising_edge(clock)) then
			CurrentState <= NextState;
		end if;
	end process;
	
	mdr <= signals(22);
	dz <= signals(21);
	aow <= signals(20);
	br <= signals(19);
	pw <= signals(18);
	id <= signals(17);
	mr <= signals(16);
	mw <= signals(15);
	mtr <= signals(14);
	iw <= signals(13);
	aA <= signals(12);
	rw <= signals(11);
	rd <= signals(10);
	ps <= signals(9 downto 7);
	aB <= signals(6 downto 4);
	ap <= signals(3 downto 0);
	
	sigs <= signals;
	
end arc_control;
