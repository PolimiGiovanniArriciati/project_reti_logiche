library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity datapath is
    Port(i_clk : in std_logic;
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
         out_sel : in std_logic;
         write_address_sel : in std_logic;
         actually_done : out std_logic;
         o_address : out std_logic_vector(15 downto 0);
         o_data : out std_logic_vector(7 downto 0));
end datapath;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity project_reti_logiche is
    Port(i_clk: in STD_LOGIC;
         i_rst: in STD_LOGIC;
         i_start: in STD_LOGIC;
         i_data: in STD_LOGIC_VECTOR(7 downto 0);
         o_done: out STD_LOGIC;
         o_address: out STD_LOGIC_vector(15 downto 0);
         o_en: out STD_LOGIC;
         o_we: out STD_LOGIC;
         o_data: out STD_LOGIC_VECTOR(7 downto 0));
end project_reti_logiche;

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
    signal o_first_op1_mux : std_logic;
    signal o_first_op2_mux : std_logic;
    signal o_reg2_mux : std_logic;
    signal o_reg3_mux : std_logic;
    signal o_reg4_mux : std_logic;
    signal o_reg5_mux : std_logic;
    signal o_reg6_mux : std_logic;
    signal o_output1 : std_logic_vector(1 downto 0);
    signal o_output2 : std_logic_vector(1 downto 0);
    signal o_output3 : std_logic_vector(1 downto 0);
    signal sel_out1 : std_logic_vector(1 downto 0);
    signal sel_out2 : std_logic_vector(1 downto 0);
    signal sel_out3 : std_logic_vector(1 downto 0);
    signal sub : std_logic_vector(7 downto 0);
    signal sum_add_w : std_logic_vector(15 downto 0);
    signal sum_add_r : std_logic_vector(15 downto 0);

begin
    reg1: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg1 <= "00000000";
        elsif i_clk'event and i_clk = '1' then
            if(r1_load = '1') then
                o_reg1 <= i_data;
            end if;
        end if;
    end process;

    --------------------------------- Traduzione della parola ---------------------------------
    with first_operation select
 o_first_op1_mux <= '0' when '1',
        o_reg4 when '0',
        'X' when others;

    with first_operation select
 o_first_op2_mux <= '0' when '1',
        o_reg5 when '0',
        'X' when others;


    with op_cycle select
 o_reg2_mux <=   o_first_op1_mux when "01",
        o_reg1(1) when "10",
        o_reg1(4) when "11",
        'X' when others;

    with op_cycle select
 o_reg3_mux <=   o_first_op2_mux when "01",
        o_reg1(2) when "10",
        o_reg1(5) when "11",
        'X' when others;

    with op_cycle select
 o_reg4_mux <=   o_reg1(0) when "01",
        o_reg1(3) when "10",
        o_reg1(6) when "11",
        'X' when others;

    with op_cycle select
 o_reg5_mux <=   o_reg1(1) when "01",
        o_reg1(4) when "10",
        o_reg1(7) when "11",
        'X' when others;

    with op_cycle select
 o_reg6_mux <=   o_reg1(2) when "01",
        o_reg1(5) when "10",
        'X' when others;

    reg2: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg2 <= '0';
        elsif i_clk'event and i_clk = '1' then
            if(r2_load = '1') then
                o_reg2 <= o_reg2_mux;
            end if;
        end if;
    end process;

    reg3: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg3 <= '0';
        elsif i_clk'event and i_clk = '1' then
            if(r3_load = '1') then
                o_reg3 <= o_reg3_mux;
            end if;
        end if;
    end process;

    reg4: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg4 <= '0';
        elsif i_clk'event and i_clk = '1' then
            if(r4_load = '1') then
                o_reg4 <= o_reg4_mux;
            end if;
        end if;
    end process;

    reg5: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg5 <= '0';
        elsif i_clk'event and i_clk = '1' then
            if(r5_load = '1') then
                o_reg5 <= o_reg5_mux;
            end if;
        end if;
    end process;

    reg6: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg6 <= '0';
        elsif i_clk'event and i_clk = '1' then
            if(r6_load = '1') then
                o_reg6 <= o_reg6_mux;
            end if;
        end if;
    end process;

    --------------------------------- parte di "output" del datapath ---------------------------------

    sel_out1 <= o_reg3_mux & o_reg2_mux;

    with sel_out1 select
        o_output1(1) <= o_reg4 when "00",
                o_reg4 when "10",
                not(o_reg4) when "01",
                not(o_reg4) when "11",
                'X' when others;

    with sel_out1 select
        o_output1(0) <= o_reg4 when "00",
                o_reg4 when "11",
                not(o_reg4) when "01",
                not(o_reg4) when "10",
                'X' when others;

    sel_out2 <= (o_reg4_mux & o_reg3_mux);

    with sel_out2 select
        o_output2(1) <= o_reg5 when "00",
                o_reg5 when "10",
                not(o_reg5) when "01",
                not(o_reg5) when "11",
                'X' when others;

    with sel_out2 select
        o_output2(0) <= o_reg5 when "00",
                o_reg5 when "11",
                not(o_reg5) when "01",
                not(o_reg5) when "10",
                'X' when others;

    sel_out3 <= (o_reg5_mux & o_reg4_mux);

    with sel_out3 select
        o_output3(1) <= o_reg6 when "00",
                o_reg6 when "10",
                not(o_reg6) when "01",
                not(o_reg6) when "11",
                'X' when others;

    with sel_out3 select
        o_output3(0) <= o_reg6 when "00",
                o_reg6 when "11",
                not(o_reg6) when "01",
                not(o_reg6) when "10",
                'X' when others;

    reg7: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg7 <= "000000";
        elsif i_clk'event and i_clk = '1' then
            if(r7_load = '1') then
                o_reg7 <= o_output1 & o_output2 & o_output3;
            end if;
        end if;
    end process;

    reg8: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg8 <= "0000";
        elsif i_clk'event and i_clk = '1' then
            if(r8_load = '1') then
                o_reg8 <= o_output2 & o_output3;
            end if;
        end if;
    end process;

    with out_sel select
 o_data <=   o_reg7 & o_output1 when '0',
        o_output1 & o_output2 & o_reg8 when '1',
        "XXXXXXXX" when others;


    --------------------------------- Definizione di actually_done ---------------------------------
    with len_seq_set select
 mux_len_seq <= i_data when '1',
        o_reg11 when '0',
        "XXXXXXXX" when others;

    sub <= mux_len_seq - "00000001";

    reg11: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg11 <= "00000000";
        elsif i_clk'event and i_clk = '1' then
            if(r11_load = '1') then
                o_reg11 <= sub;
            end if;
        end if;
    end process;

    actually_done <= '1' when (o_reg11 = "00000000") else '0';



    --------------------------------- Scelta dell'indirizzo di memoria ---------------------------------

    sum_add_r <= o_reg9 + "0000000000000001";

    reg9: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg9 <= "0000000000000000";
        elsif i_clk'event and i_clk = '1' then
            if(r9_load = '1' and addr_set = '1') then
                o_reg9 <= "0000000000000000";
            elsif(r9_load = '1') then
                o_reg9 <= sum_add_r;
            end if;
        end if;
    end process;

    sum_add_w <= o_reg10 + "0000000000000001";

    reg10: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg10 <= "0000000000000000";
        elsif i_clk'event and i_clk = '1' then
            if(r10_load = '1' and addr_set = '1') then
                o_reg10 <= "0000001111101000";
            elsif(r10_load = '1') then
                o_reg10 <= sum_add_w;
            end if;
        end if;
    end process;


    with write_address_sel select
        o_address <=    o_reg9 when '0',
            o_reg10 when '1',
            "XXXXXXXXXXXXXXXX" when others;
end Behavioral;

--------------------------------- FINE ARCHITETTURA DATAPATH ---------------------------------

architecture Behavioral of project_reti_logiche is
    component datapath is
        Port(i_clk : in std_logic;
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
             out_sel : in std_logic;
             write_address_sel : in std_logic;
             actually_done : out std_logic;
             o_address : out std_logic_vector(15 downto 0);
             o_data : out std_logic_vector(7 downto 0));
    end component;
    signal r1_load : std_logic;
    signal r2_load : std_logic;
    signal r3_load : std_logic;
    signal r4_load : std_logic;
    signal r5_load : std_logic;
    signal r6_load : std_logic;
    signal r7_load : std_logic;
    signal r8_load : std_logic;
    signal r9_load : std_logic;
    signal r10_load : std_logic;
    signal r11_load : std_logic;
    signal addr_set : std_logic;
    signal len_seq_set :std_logic;
    signal first_operation : std_logic;
    signal op_cycle : std_logic_vector(1 downto 0);
    signal out_sel : std_logic;
    signal write_address_sel : std_logic;
    signal actually_done : std_logic;
    type S is(S1, S2, S3, S4, S5, SfirstOperation, S6, S7, S8, S9, StopState, S10);
    signal cur_state, next_state : S;

begin
    DATAPATH0: datapath port map(
            i_clk,
            i_rst,
            i_start,
            i_data,
            r1_load,
            r2_load,
            r3_load,
            r4_load,
            r5_load,
            r6_load,
            r7_load,
            r8_load,
            r9_load,
            r10_load,
            r11_load,
            len_seq_set,
            addr_set,
            first_operation,
            op_cycle,
            out_sel,
            write_address_sel,
            actually_done,
            o_address,
            o_data
        );

    FSM_step: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            cur_state <= S1;
        elsif i_clk'event and i_clk = '1' then
            cur_state <= next_state;
        end if;
    end process;

    FSM_next_state: process(cur_state, i_start, actually_done)
    begin
        next_state <= cur_state;
        case cur_state is
            when S1 =>
                if i_start = '1' then
                    next_state <= S2;
                end if;
            when S2 =>
                next_state <= S3;
            when S3 =>
                next_state <= S4;
            when S4 =>
                    next_state <= S5;
            when S5 => 
                next_state <= S10;
            when S10 =>       
                next_state <= SfirstOperation;
            when SfirstOperation =>
                if actually_done = '1' then
                   next_state <= StopState;
                else
                    next_state <= S6;
                end if;            
            when S6 =>
                next_state <= S7;
            when S7=>
                if actually_done = '1' then 
                    next_state <= StopState;
                else
                    next_state <= S8;
                end if;
            when S8=>
                next_state <= S9;
            when S9 =>
                next_state <= S6;
            when StopState =>
                next_state <= S1;
        end case;
    end process;

    states_signals: process(cur_state)
    begin
        len_seq_set <= '0';
        addr_set <= '0';
        first_operation <= '0';
        r1_load <= '0';
        r2_load <= '0';
        r3_load <= '0';
        r4_load <= '0';
        r5_load <= '0';
        r6_load <= '0';
        r7_load <= '0';
        r8_load <= '0';
        r9_load <= '0';
        r10_load <= '0';
        r11_load <= '0';
        write_address_sel <= '0';
        op_cycle <= "00";
        out_sel <= '0';
        o_en <= '0';
        o_we <= '0';
        o_done <= '0';
        case cur_state is
            when S1 =>
            when S2 =>
                addr_set <= '1';
                r9_load <= '1';
                r10_load <= '1';
                o_en <= '1';
            when S3=> 
                len_seq_set <= '1';
                --r9_load <= '1';
                r11_load <= '1';
                o_en <= '1';
            when S4=>
                len_seq_set <= '1';
                r9_load <= '1';
                r11_load <= '1';
                o_en <= '1';
            when S5 => 
                first_operation <= '1';
                r1_load <= '1';
                o_en <= '1';
            when SfirstOperation =>
                first_operation <= '1';
                r2_load <= '1';
                r3_load <= '1';
                r4_load <= '1';
                r5_load <= '1';
                r6_load <= '1';
                r7_load <= '1';
                op_cycle <= "01";
                o_we <= '1';
                o_en <= '1';
            when S10 =>
                r2_load <= '1';
                r3_load <= '1';
                r4_load <= '1';
                r5_load <= '1';
                r6_load <= '1';
                r7_load <= '1';
                op_cycle <= "01";
                o_we <= '1';
                o_en <= '1';
            when S6  =>
                r2_load <= '1';
                r3_load <= '1';
                r4_load <= '1';
                r5_load <= '1';
                r6_load <= '1';
                r7_load <= '1';
                r8_load <= '1';
                r10_load <= '1';
                write_address_sel <= '1';
                op_cycle <= "10";
                o_we <= '1';
                o_en <= '1';
            when S7 =>
                r2_load <= '1';
                r3_load <= '1';
                r4_load <= '1';
                r5_load <= '1';
                r9_load <= '1';
                r10_load <= '1';
                r11_load <= '1';
                write_address_sel <= '1';
                op_cycle <= "11";
                out_sel <= '1';
                o_we <= '1';
                o_en <= '1';
            when S8 =>
                r2_load <= '1';
                r3_load <= '1';
                r11_load <= '1';
                out_sel <= '1';
                op_cycle <= "01";
                o_en <= '1';
            when S9 =>
                r1_load <= '1';
                r2_load <= '1';
                r3_load <= '1';
                r4_load <= '1';
                r5_load <= '1';
                r6_load <= '1';
                r7_load <= '1';
                op_cycle <= "01";
                o_en <= '1';
            when StopState =>
                o_done <= '1';
        end case;
    end process;
end Behavioral;