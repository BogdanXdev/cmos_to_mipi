library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top_tx_dphy is
    port (
        resetn_i : in std_logic;
        ref_px_clk_i : in std_logic;

        cmos_px_data_i : in std_logic_vector(7 downto 0);
        fv_i : in std_logic;
        lv_i : in std_logic;
        dvalid_i : in std_logic;

        clk_p_o : out std_logic;
        clk_n_o : out std_logic;
        mipi_d_p_o : out std_logic;
        mipi_d_n_o : out std_logic;

        pll_lock_o : out std_logic 
    );
end top_tx_dphy;

architecture struct of top_tx_dphy is
    -- p2b
    signal fv_start : std_logic;
    signal fv_end : std_logic;
    signal txfr_req : std_logic;
    signal p2b_byte_data_en : std_logic;
    signal byte_data : std_logic_vector(7 downto 0);

    -- delays
    signal byte_data_en_next_1d : std_logic;
    signal byte_data_en_next_2d : std_logic;
    signal byte_data_en_next_3d : std_logic;
    signal byte_data_en_next_4d : std_logic;
    signal byte_data_en_next_5d : std_logic;
    signal byte_data_en_reg_1d : std_logic;
    signal byte_data_en_reg_2d : std_logic;
    signal byte_data_en_reg_3d : std_logic;
    signal byte_data_en_reg_4d : std_logic;
    signal byte_data_en_reg_5d : std_logic;

    signal byte_data_next_1d : std_logic_vector(7 downto 0);
    signal byte_data_next_2d : std_logic_vector(7 downto 0);
    signal byte_data_next_3d : std_logic_vector(7 downto 0);
    signal byte_data_next_4d : std_logic_vector(7 downto 0);
    signal byte_data_next_5d : std_logic_vector(7 downto 0);
    signal byte_data_reg_1d : std_logic_vector(7 downto 0);
    signal byte_data_reg_2d : std_logic_vector(7 downto 0);
    signal byte_data_reg_3d : std_logic_vector(7 downto 0);
    signal byte_data_reg_4d : std_logic_vector(7 downto 0);
    signal byte_data_reg_5d : std_logic_vector(7 downto 0);

    -- tx dphy 
    signal byte_clk : std_logic;
    signal txfr_en : std_logic;
    signal tx_c2d_rdy : std_logic;
    signal sp_en : std_logic;

    signal sp_en_next_1d : std_logic;
    signal sp_en_reg_1d : std_logic;

    signal lp_en : std_logic;
    signal dt : std_logic_vector(5 downto 0);

    signal wc : std_logic_vector(15 downto 0);
    signal vc : std_logic_vector(1 downto 0);

    signal byte_data_en : std_logic;
    signal tx_dphy_byte_data : std_logic_vector(7 downto 0);

    signal txfr_en_next_1d : std_logic;
    signal txfr_en_reg_1d : std_logic;
    signal pd_dphy : std_logic;
    signal pll_lock : std_logic;
    signal pix2byte_rstn : std_logic;

    -- signals added for pkt header info timing
    signal phdr_xfr_done : std_logic;
    signal vc_tx : std_logic_vector(1 downto 0);
    signal dt_tx : std_logic_vector(5 downto 0);
    signal wc_tx : std_logic_vector(15 downto 0);
    signal lp_en_next_1d :std_logic;
    signal lp_en_reg_1d :std_logic;
    signal phdr_xfr_done_next0 : std_logic;
    signal phdr_xfr_done_reg0 : std_logic;
    signal phdr_xfr_done_next1 : std_logic;
    signal phdr_xfr_done_reg1 : std_logic;
    signal vc_valid_next : std_logic_vector(1 downto 0);
    signal vc_valid_reg : std_logic_vector(1 downto 0);
    signal dt_valid_next : std_logic_vector(5 downto 0);
    signal dt_valid_reg : std_logic_vector(5 downto 0);
    signal wc_valid_next : std_logic_vector(15 downto 0);
    signal wc_valid_reg : std_logic_vector(15 downto 0);

begin

    pll_lock_o <=  pll_lock;
    pd_dphy <= not resetn_i or not pll_lock;
    -- pd_dphy <= not resetn_i;

    regs : process (all)
    begin
        if resetn_i = '0' then 
            byte_data_en_reg_1d <= '0';
            byte_data_en_reg_2d <= '0';
            byte_data_en_reg_3d <= '0';
            byte_data_en_reg_4d <= '0';
            byte_data_en_reg_5d <= '0';

            byte_data_reg_1d <= (others => '0');
            byte_data_reg_2d <= (others => '0');
            byte_data_reg_3d <= (others => '0');
            byte_data_reg_4d <= (others => '0');
            byte_data_reg_5d <= (others => '0');

            sp_en_reg_1d <= '0';

            wc_valid_reg <= (others => '0');
            dt_valid_reg <= (others => '0');
            vc_valid_reg <= (others => '0');
            lp_en_reg_1d <= '0';
            phdr_xfr_done_reg0 <= '0';
            phdr_xfr_done_reg1 <= '0';

        elsif rising_edge(byte_clk) then
            byte_data_en_reg_1d <= byte_data_en_next_1d;
            byte_data_en_reg_2d <= byte_data_en_next_2d;
            byte_data_en_reg_3d <= byte_data_en_next_3d;
            byte_data_en_reg_4d <= byte_data_en_next_4d;
            byte_data_en_reg_5d <= byte_data_en_next_5d;

            byte_data_reg_1d <= byte_data_next_1d;
            byte_data_reg_2d <= byte_data_next_2d;
            byte_data_reg_3d <= byte_data_next_3d;
            byte_data_reg_4d <= byte_data_next_4d;
            byte_data_reg_5d <= byte_data_next_5d;

            sp_en_reg_1d <= sp_en_next_1d;

            wc_valid_reg <= wc_valid_next;
            dt_valid_reg <= dt_valid_next; 
            vc_valid_reg <= vc_valid_next;
            lp_en_reg_1d <= lp_en_next_1d;
            phdr_xfr_done_reg0 <= phdr_xfr_done_next0;           
            phdr_xfr_done_reg1 <= phdr_xfr_done_next1;
        end if;
    end process regs;
    
    wc <= "0000001010000000"; --x280

    -- next state logic for ...d signals
    byte_data_en_next_1d <= p2b_byte_data_en;
    byte_data_en_next_2d <= byte_data_en_reg_1d; 
    byte_data_en_next_3d <= byte_data_en_reg_2d;
    byte_data_en_next_4d <= byte_data_en_reg_3d;
    byte_data_en_next_5d <= byte_data_en_reg_4d;

    byte_data_next_1d <= byte_data;
    byte_data_next_2d <= byte_data_reg_1d;
    byte_data_next_3d <= byte_data_reg_2d;
    byte_data_next_4d <= byte_data_reg_3d;
    byte_data_next_5d <= byte_data_reg_4d;

    sp_en_next_1d <= sp_en;

    process (all) begin
        if fv_start = '1' then
            dt <= (others => '0');
        elsif fv_end = '1' then
            dt <= "000001";
        else
            dt <= "101010"; --2A
        end if;
    end process;
    sp_en <= fv_start or fv_end;
    lp_en <= p2b_byte_data_en and (not byte_data_en_reg_1d);
    
    tx_dphy_byte_data <= byte_data_reg_5d;
    byte_data_en <= byte_data_en_reg_5d;

    lp_en_next_1d <= lp_en;
    phdr_xfr_done_next0 <= phdr_xfr_done;
    phdr_xfr_done_next1 <= phdr_xfr_done_reg0;

    process (all) begin 
        if sp_en = '1' then 
            wc_valid_next <= (others => '0');
            dt_valid_next <= dt;
            vc_valid_next <= vc;
        elsif lp_en = '1' then 
            wc_valid_next <= wc; 
            dt_valid_next <= dt;
            vc_valid_next <= vc;
        else 
            wc_valid_next <= wc_valid_reg; 
            dt_valid_next <= dt_valid_reg;
            vc_valid_next <= vc_valid_reg;
        end if;
    end process;

    wc_tx <= wc_valid_reg when (not(phdr_xfr_done_reg0 and not phdr_xfr_done_reg1) 
        or byte_data_en) else (others => '0');
    dt_tx <= dt_valid_reg when (not(phdr_xfr_done_reg0 and not phdr_xfr_done_reg1) 
        or byte_data_en) else (others => '0');
    vc_tx <= vc_valid_reg when (not(phdr_xfr_done_reg0 and not phdr_xfr_done_reg1) 
        or byte_data_en) else (others => '0');

    --  instances: p2b, txdphy
    
    p2b_raw8_1px_1txline: entity work.p2b port map(
        rst_n_i=> (resetn_i and pix2byte_rstn),
        -- rst_n_i=> resetn_i,
        pix_clk_i=> ref_px_clk_i,
        byte_clk_i=> byte_clk,
        fv_i=> fv_i,
        lv_i=> lv_i,
        dvalid_i=> dvalid_i,
        pix_data0_i=> cmos_px_data_i,
        c2d_ready_i=> tx_c2d_rdy,
        txfr_en_i=> txfr_en,
        fv_start_o=> fv_start,
        fv_end_o=> fv_end, 
        lv_start_o=> open ,
        lv_end_o=> open ,
        txfr_req_o=> txfr_req,
        byte_en_o=> p2b_byte_data_en,
        byte_data_o=> byte_data
    );

    tx_dphy_82mbps_raw8_1px_1txline : entity work.tx_dphy_csi2 port map(
        ref_clk_i=> ref_px_clk_i,
        reset_n_i=> resetn_i,
        usrstdby_i=> not resetn_i,
        pd_dphy_i=> pd_dphy,
        byte_or_pkt_data_i=>  tx_dphy_byte_data,
        byte_or_pkt_data_en_i=> byte_data_en,
        ready_o=> open,
        vc_i=> vc_tx,
        dt_i=> dt_tx,
        wc_i=> wc_tx,
        clk_hs_en_i=> txfr_req,
        d_hs_en_i=> txfr_req,
        pll_lock_o=> pll_lock,
        pix2byte_rstn_o=> pix2byte_rstn, 
        pkt_format_ready_o=> open,
        d_hs_rdy_o=> txfr_en,
        byte_clk_o=> byte_clk,
        c2d_ready_o=> tx_c2d_rdy,
        phdr_xfr_done_o=> phdr_xfr_done,
        ld_pyld_o=> open,
        clk_p_io=> clk_p_o,
        clk_n_io=> clk_n_o,
        d_p_io=> mipi_d_p_o,
        d_n_io=> mipi_d_n_o,
        sp_en_i=> sp_en_reg_1d,
        lp_en_i=> lp_en_reg_1d
    );


end architecture struct;