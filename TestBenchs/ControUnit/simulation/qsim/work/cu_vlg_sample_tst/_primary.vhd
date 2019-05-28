library verilog;
use verilog.vl_types.all;
entity cu_vlg_sample_tst is
    port(
        code            : in     vl_logic_vector(3 downto 0);
        reloj           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end cu_vlg_sample_tst;
