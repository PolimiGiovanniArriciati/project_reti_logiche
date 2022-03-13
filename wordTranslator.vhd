library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; --è giusto da usare??

entity datapath is
    Port(    i_clk : in std_logic;
         i_rst : in std_logic;
         i_start : in std_logic;
         i_data : in std_logic_vector(7 downto 0);
         r1_load : in std_logic;
         r2_load : in std_logic;
         r3_load : in std_logic;
         r4_load : in std_logic;
         r5_load : in std_logic;
         r6_load : in std_logic;
         r7_load : in std_logic;
         r8_load : in std_logic;
         r9_load : in std_logic;
         r10_load : in std_logic;
         r11_load : in std_logic;
         len_seq_set : in std_logic;
         addr_set : in std_logic;
         first_operation : in std_logic;
         op_cycle : in std_logic_vector(1 downto 0);
         out_set : in std_logic;
         o_done : out std_logic;
         o_address : out std_logic_vector(15 downto 0);
         o_en : out std_logic;
         o_we : out std_logic;
         o_data : out std_logic_vector(7 downto 0));
end datapath;

architecture Behavioral of datapath is
    signal o_reg1 : std_logic_vector(7 downto 0);
    signal o_reg2 : std_logic;
    signal o_reg3 : std_logic;
    signal o_reg4 : std_logic;
    signal o_reg5 : std_logic;
    signal o_reg6 : std_logic;
    signal o_reg7 : std_logic_vector(5 downto 0);
    signal o_reg8 : std_logic_vector(3 downto 0);
    signal o_reg9 : std_logic_vector(15 downto 0);
    signal o_reg10 : std_logic_vector(15 downto 0);
    signal o_reg11 : std_logic_vector(7 downto 0);
    signal mux_len_seq : std_logic_vector(7 downto 0);
    signal o_addr_set_w : std_logic_vector(15 downto 0);
    signal o_addr_set_r : std_logic_vector(15 downto 0);
    signal o_first_op : std_logic;
    signal o_first_op2 : std_logic;
    signal o_opcycle1 : std_logic;
    signal o_opcycle2 : std_logic;
    signal o_opcycle3 : std_logic;
    signal o_opcycle4 : std_logic;
    signal o_opcycle5 : std_logic;
    signal o_output1 : std_logic_vector(1 downto 0);
    signal o_output2 : std_logic_vector(1 downto 0);
    signal o_output3 : std_logic_vector(1 downto 0);
    signal sel_out1 : std_logic_vector(1 downto 0);
    signal sel_out2 : std_logic_vector(1 downto 0);
    signal sel_out3 : std_logic_vector(1 downto 0);
    signal sub : std_logic_vector(7 downto 0);
    signal sum_add_w : std_logic_vector(15 downto 0);
    signal sum_add_r : std_logic_vector(15 downto 0);
    signal sel : std_logic;
    
begin

    --inizializzazione del registro 1
    process(i_clk, i_rst) 
    begin
        if(i_rst = '0') then
            o_reg1 <= "00000000";
        elsif i_clk'event and i_clk = '1' then
            if(r1_load = '1') then
                o_reg1 <= i_data;
            end if;
        end if;
    end process;

    --Traduzione della parola

    with first_operation select
 o_first_op <= '0' when '1',
        o_reg4 when '0';

    with first_operation select
 o_first_op2 <= '0' when '1',
        o_reg5 when '0';

    with op_cycle select
 o_opcycle1 <= o_first_op when "01",
        o_reg1(1) when "10",
        o_reg1(4) when "11",
        'X' when others;

    with op_cycle select
 o_opcycle2 <= o_first_op2 when "01",
        o_reg1(2) when "10",
        o_reg1(5) when "11",
        'X' when others;

    with op_cycle select
 o_opcycle3 <= o_reg1(0) when "01",
        o_reg1(3) when "10",
        o_reg1(6) when "11",
        'X' when others;

    with op_cycle select
 o_opcycle4 <= o_reg1(1) when "01",
        o_reg1(4) when "10",
        o_reg1(7) when "11",
        'X' when others;

    with op_cycle select
 o_opcycle5 <= o_reg1(2) when "01",
        o_reg1(5) when "10",
        'X' when others;

    process(i_clk, i_rst)
    begin
        if(i_rst = '0') then
            o_reg2 <= '0';
        elsif i_clk'event and i_clk = '1' then
            if(r2_load = '1') then
                o_reg2 <= o_opcycle1;
            end if;
        end if;
    end process;

    process(i_clk, i_rst)
    begin
        if(i_rst = '0') then
            o_reg3 <= '0';
        elsif i_clk'event and i_clk = '1' then
            if(r2_load = '1') then
                o_reg3 <= o_opcycle2;
            end if;
        end if;
    end process;

    process(i_clk, i_rst)
    begin
        if(i_rst = '0') then
            o_reg4 <= '0';
        elsif i_clk'event and i_clk = '1' then
            if(r2_load = '1') then
                o_reg4 <= o_opcycle3;
            end if;
        end if;
    end process;

    process(i_clk, i_rst)
    begin
        if(i_rst = '0') then
            o_reg5 <= '0';
        elsif i_clk'event and i_clk = '1' then
            if(r2_load = '1') then
                o_reg5 <= o_opcycle4;
            end if;
        end if;
    end process;

    process(i_clk, i_rst)
    begin
        if(i_rst = '0') then
            o_reg6 <= '0';
        elsif i_clk'event and i_clk = '1' then
            if(r2_load = '1') then
                o_reg6 <= o_opcycle5;
            end if;
        end if;
    end process;

    --parte di "output" del datapath

    sel_out1 <= o_reg3 & o_reg2;

    with sel_out1 select
 o_output1(0) <= o_reg4 when "00",
        o_reg4 when "10",
        not o_reg4 when "01",
        not o_reg4 when "11",
        'X' when others;

    with sel_out1 select
 o_output1(1) <= o_reg4 when "00",
        o_reg4 when "11",
        not o_reg4 when "01",
        not o_reg4 when "10",
        'X' when others;

    sel_out2 <= (o_reg3 & o_reg4);

    with sel_out2 select
 o_output2(0) <= o_reg5 when "00",
        o_reg5 when "10",
        not o_reg5 when "01",
        not o_reg5 when "11",
        'X' when others;

    with sel_out2 select
 o_output2(1) <= o_reg5 when "00",
        o_reg5 when "11",
        not o_reg5 when "01",
        not o_reg5 when "10",
        'X' when others;

    sel_out3 <= (o_reg5 & o_reg4)    ;

    with sel_out3 select
 o_output3(0) <= o_reg6 when "00",
        o_reg6 when "10",
        not o_reg6 when "01",
        not o_reg6 when "11",
        'X' when others;

    with sel_out3 select
 o_output3(1) <= o_reg6 when "00",
        o_reg6 when "11",
        not o_reg6 when "01",
        not o_reg6 when "10",
        'X' when others;

    process(i_clk, i_rst)
    begin
        if(i_rst = '0') then
            o_reg7 <= "00000000";
        elsif i_clk'event and i_clk = '1' then
            if(r7_load = '1') then
                o_reg7 <= o_output1 & o_output2 & o_output3;
            end if;
        end if;
    end process;

    process(i_clk, i_rst)
    begin
        if(i_rst = '0') then
            o_reg8 <= "00000000";
        elsif i_clk'event and i_clk = '1' then
            if(r8_load = '1') then
                o_reg8 <= o_output2 & o_output3;
            end if;
        end if;
    end process;

    with out_set select
 o_data <= o_reg7 & o_output1 when '0',
        o_output1 & o_output2 & o_reg8 when '1',
        "XXXXXXXX" when others;


    --Definizione di o_done 

    with len_seq_set select  
    mux_len_seq <= i_data when '1',
        o_reg11 when '0',
        "XXXXXXXX" when others;

    sub <= "11111111" - mux_len_seq;

    process(i_clk, i_rst) 
    begin
        if(i_rst = '0') then
            o_reg11 <= "00000000";
        elsif i_clk'event and i_clk = '1' then
            if(r1_load = '1') then
                o_reg11 <= sub;
            end if;
        end if;
    end process;

    o_done <= '1' when (o_reg11 = "0000000000000000") else '0';



    --Scelta dell'indirizzo di memoria 
    with addr_set select --addr_write
    o_addr_set_w <= "0000001111101000" when '0',
        o_reg10 when '1',
        "XXXXXXXXXXXXXXXX" when others;

    sum_add_w <= o_addr_set_w + "1111111111111111";

    process(i_clk, i_rst)
    begin
        if(i_rst = '0') then
            o_reg10 <= "00000000";
        elsif i_clk'event and i_clk = '1' then
            if(r10_load = '1') then
                o_reg10 <= sum_add_w;
            end if;
        end if;
    end process;


    with addr_set select --addr_read
    o_addr_set_r <= "0000001111101000" when '0',
        o_reg10 when '1',
        "XXXXXXXXXXXXXXXX" when others;

    sum_add_r <= o_addr_set_r + "1111111111111111";

    process(i_clk, i_rst)
    begin
        if(i_rst = '0') then
            o_reg9 <= "00000000";
        elsif i_clk'event and i_clk = '1' then
            if(r9_load = '1') then
                o_reg9 <= sum_add_r;
            end if;
        end if;
    end process;

    sel <= o_we;
    
    with sel select
 o_address <= o_reg9 when '0',
        o_reg10 when '1',
        "XXXXXXXXXXXXXXXX" when others;
end Behavioral;