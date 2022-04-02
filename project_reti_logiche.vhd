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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity datapath is
    Port(
         i_clk : in std_logic;
         i_rst : in std_logic;
         i_start : in std_logic;
         o_address : out std_logic_vector(15 downto 0);
         i_data : in std_logic_vector(7 downto 0);
         o_data : out std_logic_vector(7 downto 0);
         reg_i_data_load : in std_logic;
         reg_last_state_load : in std_logic;
         r7_load : in std_logic;
         r8_load : in std_logic;
         reg_r_addr_load : in std_logic;
         reg_w_addr_load : in std_logic;
         reg_len_seq_load : in std_logic;
         set : in std_logic;
         op_cycle : in std_logic_vector(1 downto 0);
         out_sel : in std_logic;
         rw_address_sel : in std_logic;
         actually_done : out std_logic;
         seq_min_check : in std_logic);
end datapath;

architecture Behavioral of datapath is
    signal o_reg_i_data : std_logic_vector(7 downto 0);
    signal o_reg_last_state : std_logic_vector(1 downto 0);
    signal o_reg7 : std_logic_vector(5 downto 0);
    signal o_reg8 : std_logic_vector(3 downto 0);
    signal o_reg_r_address : std_logic_vector(7 downto 0);
    signal o_reg_w_address : std_logic_vector(15 downto 0);
    signal o_reg_len_seq : std_logic_vector(7 downto 0);
    signal o_last_state_mux : std_logic_vector(1 downto 0);
    signal o_out1_mux : std_logic;
    signal o_out2_mux : std_logic;
    signal o_out3_mux : std_logic;
    signal o_out1 : std_logic_vector(1 downto 0);
    signal o_out2 : std_logic_vector(1 downto 0);
    signal o_out3 : std_logic_vector(1 downto 0);
    signal out1_sel : std_logic_vector(1 downto 0);
    signal out2_sel : std_logic_vector(1 downto 0);
    signal out3_sel : std_logic_vector(1 downto 0);
    signal sum_add_w : std_logic_vector(15 downto 0);
    signal sum_add_r : std_logic_vector(7 downto 0);
    signal mem_sel : std_logic_vector(1 downto 0);
begin
    --------------------------------- Gestione della parola in input ---------------------------------

    reg_i_data: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg_i_data <= "00000000";
        elsif i_clk'event and i_clk = '1' then
            if reg_i_data_load = '1' then
                o_reg_i_data <= i_data;
            end if;
        end if;
    end process;

            

    with op_cycle select
        o_last_state_mux <=   o_reg_last_state when "01",
                        o_reg_i_data(6) & o_reg_i_data(5) when "10",
                        o_reg_i_data(3) & o_reg_i_data(2) when "11",
                        "XX" when others;

    with op_cycle select
         o_out1_mux <=  i_data(7) when "01",
                        o_reg_i_data(4) when "10",
                        o_reg_i_data(1) when "11",
                        'X' when others;

    with op_cycle select
         o_out2_mux <=  i_data(6) when "01",
                        o_reg_i_data(3) when "10",
                        o_reg_i_data(0) when "11",
                        'X' when others;

    with op_cycle select
        o_out3_mux <=   i_data(5) when "01",
                        o_reg_i_data(2) when "10",
                        'X' when others;

    reg_last_state: process(i_clk, i_rst)
    begin
        if(i_rst = '1' or set = '1') then
            o_reg_last_state <= "00";
        elsif i_clk'event and i_clk = '1' then
            if(reg_last_state_load = '1') then
                o_reg_last_state <= o_out1_mux & o_out2_mux;
            end if;
        end if;
    end process;

    --------------------------------- parte di "out" del datapath --------------------------------

    out1_sel <= o_last_state_mux(0) & o_last_state_mux(1);

    with out1_sel select
        o_out1(1) <= o_out1_mux when "00",
                        o_out1_mux when "10",
                        not(o_out1_mux) when "01",
                        not(o_out1_mux) when "11",
                        'X' when others;

    with out1_sel select
        o_out1(0) <= o_out1_mux when "00",
                        o_out1_mux when "11",
                        not(o_out1_mux) when "01",
                        not(o_out1_mux) when "10",
                        'X' when others;

    out2_sel <=  o_out1_mux & o_last_state_mux(0);

    with out2_sel select
        o_out2(1) <= o_out2_mux when "00",
                        o_out2_mux when "10",
                        not(o_out2_mux) when "01",
                        not(o_out2_mux) when "11",
                        'X' when others;

    with out2_sel select
        o_out2(0) <= o_out2_mux when "00",
                        o_out2_mux when "11",
                        not(o_out2_mux) when "01",
                        not(o_out2_mux) when "10",
                        'X' when others;

    out3_sel <= o_out2_mux & o_out1_mux;

    with out3_sel select
        o_out3(1) <= o_out3_mux when "00",
                        o_out3_mux when "10",
                        not(o_out3_mux) when "01",
                        not(o_out3_mux) when "11",
                        'X' when others;

    with out3_sel select
        o_out3(0) <= o_out3_mux when "00",
                        o_out3_mux when "11",
                        not(o_out3_mux) when "01",
                        not(o_out3_mux) when "10",
                        'X' when others;

    reg_out_buffer1: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg7 <= "000000";
        elsif i_clk'event and i_clk = '1' then
            if(r7_load = '1') then
                o_reg7 <= o_out1 & o_out2 & o_out3;
            end if;
        end if;
    end process;

    reg_out_buffer2: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg8 <= "0000";
        elsif i_clk'event and i_clk = '1' then
            if(r8_load = '1') then
                o_reg8 <= o_out2 & o_out3;
            end if;
        end if;
    end process;

    with out_sel select
        o_data <=   o_reg7 & o_out1 when '0',
                    o_reg8 & o_out1 & o_out2 when '1',
                    "XXXXXXXX" when others;

    --------------------------------- Definizione di actually_done ---------------------------------

    reg_len_seq: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg_len_seq <= "00000000";
        elsif i_clk'event and i_clk = '1' then
            if(reg_len_seq_load = '1') then
                o_reg_len_seq <= i_data;
            end if;
        end if;
    end process;

    actually_done <= '1' when (o_reg_len_seq + "0000001") = o_reg_r_address else '0';
    


    --------------------------------- Scelta dell'indirizzo di memoria ---------------------------------

    sum_add_r <= o_reg_r_address + "00000001";

    read_address: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg_r_address <= "00000000";
        elsif i_clk'event and i_clk = '1' then
            if(reg_r_addr_load = '1' and set = '1') then
                o_reg_r_address <= "00000000";
            elsif(reg_r_addr_load = '1') then
                o_reg_r_address <= sum_add_r;
            end if;
        end if;
    end process;

    sum_add_w <= o_reg_w_address + "0000000000000001";

    write_address: process(i_clk, i_rst)
    begin
        if(i_rst = '1') then
            o_reg_w_address <= "0000000000000000";
        elsif i_clk'event and i_clk = '1' then
            if(reg_w_addr_load = '1' and set = '1') then
                o_reg_w_address <= "0000001111101000";
            elsif(reg_w_addr_load = '1') then
                o_reg_w_address <= sum_add_w;
            end if;
        end if;
    end process;
    mem_sel <= rw_address_sel & set;                       
    with mem_sel select
        o_address <=    "00000000" & o_reg_r_address  when "00",
                        "0000000000000000"  when "01",
                        o_reg_w_address when "10",
                        "XXXXXXXXXXXXXXXX" when "11",
                        "XXXXXXXXXXXXXXXX" when others;
end Behavioral;

--------------------------------- FINE ARCHITETTURA DATAPATH ---------------------------------

architecture Behavioral of project_reti_logiche is
    component datapath is
        Port(
             i_clk : in std_logic;
             i_rst : in std_logic;
             i_start : in std_logic;
             o_address : out std_logic_vector(15 downto 0);
             i_data : in std_logic_vector(7 downto 0);
             o_data : out std_logic_vector(7 downto 0);
             reg_i_data_load : in std_logic;
             reg_last_state_load : in std_logic;
             r7_load : in std_logic;
             r8_load : in std_logic;
             reg_r_addr_load : in std_logic;
             reg_w_addr_load : in std_logic;
             reg_len_seq_load : in std_logic;
             set : in std_logic;
             op_cycle : in std_logic_vector(1 downto 0);
             out_sel : in std_logic;
             rw_address_sel : in std_logic;
             actually_done : out std_logic;
             seq_min_check : in std_logic);
    end component;
    type S is(S1, S2, S3, SA, SB, SC, SD, StopState);
    signal cur_state, next_state : S;
    signal seq_min_check : std_logic;
    signal reg_i_data_load : std_logic;
    signal reg_last_state_load : std_logic;
    signal r7_load : std_logic;
    signal r8_load : std_logic;
    signal reg_r_addr_load : std_logic;
    signal reg_w_addr_load : std_logic;
    signal reg_len_seq_load : std_logic;
    signal set : std_logic;
    signal op_cycle : std_logic_vector(1 downto 0);
    signal out_sel : std_logic;
    signal rw_address_sel : std_logic;
    signal actually_done : std_logic;

begin
    DATAPATH0: datapath port map(
            i_clk,
            i_rst,
            i_start,
            o_address,
            i_data,
            o_data,
            reg_i_data_load,
            reg_last_state_load,
            r7_load,
            r8_load,
            reg_r_addr_load,
            reg_w_addr_load,
            reg_len_seq_load,
            set,
            op_cycle,
            out_sel,
            rw_address_sel,
            actually_done,
            seq_min_check);

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
                if actually_done = '1' then
                  next_state <= StopState;
                else
                   next_state <= SA;  
                end if;
      
            when SA =>
                if actually_done = '1' then 
                    next_state <= StopState;
                else
                    next_state <= SB;
                end if;

            when SB =>
                next_state <= SC;
                
            when SC =>
                next_state <= SD;

            when SD =>
                next_state <= SA;

            when StopState =>
                next_state <= S1;
        end case;
    end process;

    states_signals: process(cur_state)
    begin
        set <= '0';
        seq_min_check <= '0';
        reg_i_data_load <= '0';
        reg_last_state_load <= '0';
        r7_load <= '0';
        r8_load <= '0';
        reg_r_addr_load <= '0';
        reg_w_addr_load <= '0';
        reg_len_seq_load <= '0';
        rw_address_sel <= '0';
        op_cycle <= "00";
        out_sel <= '0';
        o_en <= '0';
        o_we <= '0';
        o_done <= '0';
        case cur_state is
            when S1 =>
            
            when S2 =>
                set <= '1';
                reg_r_addr_load <= '1';
                reg_w_addr_load <= '1';
                o_en <= '1';
                
            when S3=>
                seq_min_check <= '1';
                reg_len_seq_load <= '1';
                reg_r_addr_load <= '1';
                o_en <= '1';

            when SA =>
                o_en <= '1';

            when SB =>
                reg_i_data_load <= '1';
                r7_load <= '1';
                out_sel <= '1';
                op_cycle <= "01";
                o_en <= '1';
                
            when SC =>
                reg_i_data_load <= '1';
                r8_load <= '1';
                reg_w_addr_load <= '1';
                rw_address_sel <= '1';
                op_cycle <= "10";
                out_sel <= '0';
                o_we <= '1';
                o_en <= '1';

            when SD  =>
                reg_last_state_load <= '1';
                reg_r_addr_load <= '1';
                reg_w_addr_load <= '1';
                rw_address_sel <= '1';
                op_cycle <= "11";
                out_sel <= '1';
                o_we <= '1';
                o_en <= '1';

            when StopState =>
                o_done <= '1';
        end case;
    end process;
end Behavioral;