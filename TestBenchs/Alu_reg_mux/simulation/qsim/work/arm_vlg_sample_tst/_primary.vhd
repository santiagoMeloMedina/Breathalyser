library verilog;
use verilog.vl_types.all;
entity arm_vlg_sample_tst is
    port(
        operation       : in     vl_logic_vector(3 downto 0);
        reg1            : in     vl_logic_vector(3 downto 0);
        reg2            : in     vl_logic_vector(3 downto 0);
        reg3            : in     vl_logic_vector(3 downto 0);
        reloj           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end arm_vlg_sample_tst;
