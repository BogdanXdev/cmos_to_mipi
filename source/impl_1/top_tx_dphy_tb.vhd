library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top_tx_dphy_tb is
end entity top_tx_dphy_tb;

architecture sim of top_tx_dphy_tb is

    constant half_period : natural := 5; -- in ns
    constant test_period : natural := 48; -- 1 cycle period
    constant px_in_row : natural := 612;
    constant f_vertical_porch : natural := 1;
    constant b_vertical_porch : natural := 5;
    constant f_horizontal_porch : natural := 10;
    constant b_horizontal_porch : natural := 8;
    constant v_active : natural := 512;
    constant h_active : natural := 640;

    signal resetn_tb : std_logic := '1';
    signal ref_px_clk_tb : std_logic := '0';

    signal cmos_px_data_tb : std_logic_vector(7 downto 0) := (others => '0');
    signal fv_tb : std_logic := '0';
    signal lv_tb : std_logic := '0';
    signal dvalid_tb : std_logic := '0';

    signal clk_p_tb : std_logic;
    signal clk_n_tb : std_logic;
    signal mipi_d_p_tb : std_logic;
    signal mipi_d_n_tb : std_logic;

    signal pll_lock_tb : std_logic;

    signal template_index : natural range 0 to px_in_row - 1; -- flag to communicate with response analyzer

    type test_data_type is record
        stimulus : unsigned(7 downto 0);
        response : unsigned(7 downto 0);
    end record;

    type template_type is array (0 to 8 - 1) of test_data_type;

    signal template : template_type := (
    ("11110000", "11110000"), ("11000011", "11000011"), ("01100110", "01100110"),
        ("00001111", "00001111"), ("00111100", "00111100"),
        ("01010101", "01010101"), ("11111111", "11111111"), ("00000000", "00000000")
    );

    signal h_counter : natural range 0 to 1000000 := 0;
    signal v_counter : natural range 0 to 1000000 := 0;

    component gsr is
        port (
            GSR_N : in std_logic; -- I
            CLK : in std_logic -- I
        );
    end component;
begin

    ref_px_clk_tb <= not ref_px_clk_tb after half_period * 1 ns;

    reset_gen : process
    begin
        resetn_tb <= '0';
        wait for half_period * 2 * 250 ns;
        resetn_tb <= '1';
        wait;
    end process reset_gen;

    vert_counter : process (all)
    begin
        if resetn_tb = '0' then
            v_counter <= 0;
        else
            if rising_edge(ref_px_clk_tb) then
                if h_counter = (f_horizontal_porch + h_active + b_horizontal_porch) then
                    v_counter <= v_counter + 1;
                else
                    v_counter <= v_counter;
                end if;
            end if;
        end if;
    end process vert_counter;

    -- vert_counter : process (all)
    -- begin
    --     if rising_edge(ref_px_clk_tb) then
    --         if resetn_tb = '0' then
    --             v_counter <= 0;
    --         else
    --             if h_counter = (f_horizontal_porch + h_active + b_horizontal_porch) then
    --                 v_counter <= v_counter + 1;
    --             else
    --                 v_counter <= v_counter;
    --             end if;
    --         end if;
    --     end if;
    -- end process vert_counter;

    horiz_counter : process (all)
    begin
        if resetn_tb = '0' then
            h_counter <= 0;
        else
            if rising_edge(ref_px_clk_tb) then
                if h_counter = (f_horizontal_porch + h_active + b_horizontal_porch) then
                    h_counter <= 0;
                else
                    h_counter <= h_counter + 1;
                end if;
            end if;
        end if;
    end process horiz_counter;

    -- horiz_counter : process (all)
    -- begin
    --     if rising_edge(ref_px_clk_tb) then
    --         if resetn_tb = '0' then
    --             h_counter <= 0;
    --         else
    --             if h_counter = (f_horizontal_porch + h_active + b_horizontal_porch) then
    --                 h_counter <= 0;
    --             else
    --                 h_counter <= h_counter + 1;
    --             end if;
    --         end if;
    --     end if;
    -- end process horiz_counter;

    fv_gen : process (all)
    begin
        if v_counter = f_vertical_porch then
            fv_tb <= '1';
        elsif v_counter = (f_vertical_porch + v_active) then
            fv_tb <= '0';
        elsif v_counter = (f_vertical_porch + v_active + b_vertical_porch) then
            fv_tb <= '0';
        end if;
    end process fv_gen;

    lv_gen : process (all)
    begin
        if h_counter = f_horizontal_porch then
            lv_tb <= '1';
        elsif h_counter = (f_horizontal_porch + h_active) then
            lv_tb <= '0';
        elsif h_counter = (f_horizontal_porch + h_active + b_horizontal_porch) then
            lv_tb <= '0';
        end if;
    end process lv_gen;

    dvalid_tb <= lv_tb and fv_tb;

    one_frame_stimulus_generator : process
    begin
        -- frame loop 
        -- line loop 
        --  8 elem array loop 
        wait until v_counter = f_vertical_porch;
        for i in 0 to v_active - 1 loop
            wait until h_counter = f_horizontal_porch;
            for i in 0 to h_active/8 - 1 loop
                for i in 0 to 8 - 1 loop
                    template_index <= i; -- flag for response analyzer 
                    cmos_px_data_tb <= std_logic_vector(template(i).stimulus);
                    wait for test_period * 1 ns;
                end loop;
            end loop;
            report "End of line, no errors";
        end loop;
        report "End of frame, no errors";
        wait;
    end process one_frame_stimulus_generator;

    dut : entity work.top_tx_dphy
        port map(
            resetn_i => resetn_tb,
            ref_px_clk_i => ref_px_clk_tb,

            cmos_px_data_i => cmos_px_data_tb,
            fv_i => fv_tb,
            lv_i => lv_tb,
            dvalid_i => dvalid_tb,

            clk_p_o => clk_p_tb,
            clk_n_o => clk_n_tb,
            mipi_d_p_o => mipi_d_p_tb,
            mipi_d_n_o => mipi_d_n_tb,

            pll_lock_o => pll_lock_tb  
        );

    gsr_inst : GSR
    generic map(
        SYNCMODE => ASYNC
    )
    port map(
        GSR_N => resetn_tb, -- I
        CLK => ref_px_clk_tb-- I
    );

end architecture sim;