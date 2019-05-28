library verilog;
use verilog.vl_types.all;
entity am_vlg_sample_tst is
    port(
        Ain             : in     vl_logic_vector(15 downto 0);
        Bin             : in     vl_logic_vector(15 downto 0);
        operation       : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end am_vlg_sample_tst;
