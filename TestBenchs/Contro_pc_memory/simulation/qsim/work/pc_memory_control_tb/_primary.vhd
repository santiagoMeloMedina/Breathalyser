library verilog;
use verilog.vl_types.all;
entity pc_memory_control_tb is
    port(
        reloj           : in     vl_logic;
        info            : out    vl_logic_vector(22 downto 0);
        visual          : out    vl_logic_vector(15 downto 0);
        visual2         : out    vl_logic_vector(15 downto 0);
        v3              : out    vl_logic_vector(15 downto 0);
        v4              : out    vl_logic_vector(15 downto 0);
        regvisual       : out    vl_logic_vector(3 downto 0);
        flagv           : out    vl_logic
    );
end pc_memory_control_tb;
