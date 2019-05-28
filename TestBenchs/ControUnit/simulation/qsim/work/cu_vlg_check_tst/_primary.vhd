library verilog;
use verilog.vl_types.all;
entity cu_vlg_check_tst is
    port(
        info            : in     vl_logic_vector(22 downto 0);
        sampler_rx      : in     vl_logic
    );
end cu_vlg_check_tst;
