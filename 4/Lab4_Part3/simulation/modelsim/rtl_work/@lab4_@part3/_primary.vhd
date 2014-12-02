library verilog;
use verilog.vl_types.all;
entity Lab4_Part3 is
    port(
        clock           : in     vl_logic;
        cnt_en          : in     vl_logic;
        sclr            : in     vl_logic;
        q               : out    vl_logic_vector(15 downto 0)
    );
end Lab4_Part3;
