library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity procesador is
port(
	reloj : in std_logic;
	--info : out std_logic_vector(22 downto 0);
	visual2 : out std_logic_vector(15 downto 0);
	
	sigread, sigwrite : out std_logic;
	address : out std_logic_vector(15 downto 0);
	data : out std_logic_vector(19 downto 0);
	outdata : in std_logic_vector(19 downto 0)
);
end procesador;

architecture arc_processor of procesador is

component PC is
	port(
		clk : in std_logic;
		sigwrite : in std_logic;
		entry : in std_logic_vector(15 downto 0);
		salida, s2 : out std_logic_vector(15 downto 0)
	);
end component;

component control is
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
end component;

component ALU is
	port(
		first, second : in std_logic_vector(15 downto 0);
		sig : in std_logic_vector(3 downto 0);
		result : out std_logic_vector(15 downto 0);
		flag : out std_logic
	);
end component;

component instructions is
port(
	sigwrite : in std_logic;
	in_direccion : in std_logic_vector(19 downto 0);
	opcode : out std_logic_vector(3 downto 0); 
	r1, r2, r3 : out std_logic_vector(3 downto 0);
	inmidiate : out std_logic_vector(7 downto 0);
	out_direccion : out std_logic_vector(11 downto 0)
);
end component;

component Static is
	port(
		nuevo : in std_logic_vector(15 downto 0);
		ABstatic : out std_logic_vector(15 downto 0)
	);
end component;

component registerfile is
	port(
		clk : in std_logic;
		sign : in std_logic;
		read1, read2, writereg : in std_logic_vector(3 downto 0);
		writedata : in std_logic_vector(15 downto 0);
		regdata1, regdata2, s2 : out std_logic_vector(15 downto 0)
	);
end component;

component mux2 is
	port(
		sgn : in std_logic;
		first, second : in std_logic_vector(15 downto 0);
		salida : out std_logic_vector(15 downto 0)
	);
end component;

component mux4 is
	port(
		sgn : in std_logic_vector(2 downto 0);
		first, second, third, fourth : in std_logic_vector(15 downto 0);
		salida : out std_logic_vector(15 downto 0)
	);
end component;

component mux3 is
port(
	sgn : in std_logic_vector(2 downto 0);
	first, second, third : in std_logic_vector(15 downto 0);
	salida : out std_logic_vector(15 downto 0)
);
end component;

component mux2_4 is
	port(
		sgn : in std_logic;
		first, second : in std_logic_vector(3 downto 0);
		salida : out std_logic_vector(3 downto 0)
	);
end component;

component ALUOUT is
	port(
		clk : in std_logic;
		ao : in std_logic_vector(15 downto 0);
		aout : out std_logic_vector(15 downto 0)
	);
end component;

component signExtend is
	port(
		first : in std_logic_vector(7 downto 0);
		salida : out std_logic_vector(15 downto 0)
	);
end component;

component signExtend_12 is
	port(
		first : in std_logic_vector(11 downto 0);
		salida : out std_logic_vector(15 downto 0)
	);
end component;

component MDR is
	port(
		clk : in std_logic;
		ao : in std_logic_vector(19 downto 0);
		aout : out std_logic_vector(15 downto 0)
	);
end component;

-- Signals for Unit Control
signal pcwrite, memread, memwrite, irwrite, regwrite, alusrcA, regdst, memtoreg, iord, aowrite, dorz, branch, memdreg : std_logic;
signal alusrcB, pcsrc: std_logic_vector(2 downto 0);
signal aluop : std_logic_vector(3 downto 0);

-- Pc salida y entrada, memoria direccion entrada y isntruccion salida
signal direccion, counter : std_logic_vector(15 downto 0);
signal instruccion : std_logic_vector(19 downto 0);

-- A circuit cable signal
signal forA, forB, fromA, fromB : std_logic_vector(15 downto 0);

-- Registers from instruction register
signal registro1, registro2, registro3, registrowrite : std_logic_vector(3 downto 0);
signal outreg1, outreg2, datareg : std_logic_vector(15 downto 0);
signal inmediato : std_logic_vector(7 downto 0);
signal jumpinmediato : std_logic_vector(11 downto 0);
signal opcodigo : std_logic_vector(3 downto 0);

-- Alu entradas y salida, aluoutstay es cable de aluout que guarda dato por un clock
signal muxPcA, muxIJ1B : std_logic_vector(15 downto 0);
signal aluouttmp, aluoutstay : std_logic_vector(15 downto 0);

-- Multiplexor Pc-Branch-Jump
signal muxPcJB : std_logic_vector(15 downto 0);

-- Extending vector
signal extended, ejump: std_logic_vector(15 downto 0);

-- Multiplexor Pc-Mem
signal muxPM : std_logic_vector(15 downto 0);

-- Memory data register
signal memoryreg : std_logic_vector(15 downto 0);

-- Multiplexor between A and Alu
signal muxAZ : std_logic_vector(15 downto 0);

-- Flag de branch
signal flagb : std_logic;

begin

ControlUnit: control
	port map(
		clock => reloj,
		sigs => info,
		opcode => opcodigo, -- opcodigo,
		mdr => memdreg,
		dz => dorz,
		br => branch,
		pw => pcwrite,
		mr => memread,
		mw => memwrite,
		ap => aluop,
		iw => irwrite,
		rw => regwrite,
		aA => alusrcA,
		aB => alusrcB,
		ps => pcsrc,
		rd => regdst,
		mtr => memtoreg,
		id => iord,
		aow => aowrite
	);
	
PcMem: mux2
	port map(
		sgn => iord,
		first => direccion, -- Dato a escribir desde alu
		second => aluoutstay, -- Dato a escribir de memoria
		salida => muxPM
	);

ProgramCounter: PC
	port map(
		clk => reloj,
		sigwrite => pcwrite or (branch and flagb),
		entry => muxPcJB,
		salida => direccion
	);

AluComp: ALU
	port map(
		first => muxAZ, -- From A circuit cable (direccion or out registro 1)
		second => muxIJ1B, -- From B circuit cable (out registro 2, 1)
		sig => aluop, 
		result => aluouttmp,
		flag => flagb
	);

InstructionRegister: instructions
	port map(
		sigwrite => irwrite,
		in_direccion => instruccion,
		opcode => opcodigo,
		r1 => registro1,
		r2 => registro2,
		r3 => registro3,
		inmidiate => inmediato,
		out_direccion => jumpinmediato
	);

InsReg: mux2_4
	port map(
		sgn => regdst,
		first => registro2,
		second => registro3,
		salida => registrowrite
	);

AOMReg: mux2
	port map(
		sgn => memtoreg,
		first => aluoutstay, -- Dato a escribir desde alu
		second => memoryreg, -- Dato a escribir de memoria
		salida => datareg
	);

MemDataReg: MDR
	port map(
		clk => memdreg,
		ao => instruccion,
		aout => memoryreg
	);

RegisterFileComp: registerfile
	port map(
		clk => reloj,
		sign => regwrite,
		read1 => registro1,
		read2 => registro2,
		writereg => registrowrite,
		writedata => datareg,
		regdata1 => forA,
		regdata2 => forB,
		s2 => visual2
	);

A: Static
	port map(
		nuevo => forA,
		ABstatic => fromA
	);

B: Static
	port map(
		nuevo => forB,
		ABstatic => fromB
	);

PcRegA: mux2
	port map(
		sgn => alusrcA,
		first => direccion, -- direccion from pc
		second => fromA, -- salida registro 1 register file
		salida => muxPcA
	);

MuxAZero: mux2
	port map(
		sgn => dorz, -- data or zero signal
		first => muxPcA, -- direccion from pc
		second => "0000000000000000", -- salida registro 1 register file
		salida => muxAZ
	);

Extendido: signExtend
	port map(
		first => inmediato,
		salida => extended
	);

InmJmpRegB: mux4
	port map(
		sgn => alusrcB,
		first => fromB,
		second => "0000000000000001",
		third => extended,
		fourth => "0000000000000000",
		salida => muxIJ1B
	);

Extendido2: signExtend_12
	port map(
		first => jumpinmediato,
		salida => ejump
	);

PcJB: mux3
	port map(
		sgn => pcsrc,
		first => aluouttmp,
		second => aluoutstay,
		third => ejump,
		salida => muxPcJB
	);

AluOutComp: ALUOUT
	port map(
		clk => aowrite,
		ao => aluouttmp,
		aout => aluoutstay
	);

	instruccion <= outdata;
	sigread <= memread;
	sigwrite <= memwrite;
	address <= muxPM;
	data(19 downto 16) <= "0000";
	data(15 downto 0) <= fromB;
	
	
end arc_processor;