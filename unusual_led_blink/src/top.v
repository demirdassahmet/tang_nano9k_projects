module top (
    output wire led
);

wire clk_out;
wire clkd_out;
wire osc_to_pll;
wire div1_to_div2;
wire div2_to_div3;
wire div3_to_div4;
wire div4_to_div5;
wire div5_to_div6;

reg reset_reg = 1'b1;

    Gowin_OSC osc (
        .oscout(osc_to_pll) //output oscout
    );

    Gowin_rPLL pll (
        .clkout(clk_out), //output clkout
        .clkoutd(clkd_out), //output clkoutd
        .clkin(osc_to_pll) //input clkin
    );

    Gowin_CLKDIV clkdiv1 (
        .clkout(div1_to_div2), //output clkout
        .hclkin(clkd_out), //input hclkin
        .resetn(reset_reg) //input resetn
    );

    Gowin_CLKDIV clkdiv2 (
        .clkout(div2_to_div3), //output clkout
        .hclkin(div1_to_div2), //input hclkin
        .resetn(reset_reg) //input resetn
    );

    Gowin_CLKDIV clkdiv3 (
        .clkout(div3_to_div4), //output clkout
        .hclkin(div2_to_div3), //input hclkin
        .resetn(reset_reg) //input resetn
    );

    Gowin_CLKDIV clkdiv4 (
        .clkout(div4_to_div5), //output clkout
        .hclkin(div3_to_div4), //input hclkin
        .resetn(reset_reg) //input resetn
    );

    Gowin_CLKDIV clkdiv5 (
        .clkout(div5_to_div6), //output clkout
        .hclkin(div4_to_div5), //input hclkin
        .resetn(reset_reg) //input resetn
    );

    Gowin_CLKDIV clkdiv6 (
        .clkout(led), //output clkout
        .hclkin(div5_to_div6), //input hclkin
        .resetn(reset_reg) //input resetn
    );
endmodule