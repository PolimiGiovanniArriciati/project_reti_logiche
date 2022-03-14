library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; --� giusto da usare??

entity project_reti_logiche is
    Port(	i_clk: in STD_LOGIC;
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
         --len_seq_set : in std_logic;
         addr_set : in std_logic;
         first_operation : in std_logic;
         op_cycle : in std_logic_vector(1 downto 0);
         out_set : in std_logic;
         write_address_sel : in std_logic;
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
    signal actually_done : std_logic;
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
            o_reg4 when '0',
            'X' when others;

    with first_operation select
        o_first_op2 <= '0' when '1',
            o_reg5 when '0',
            'X' when others;


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

    reg2: process(i_clk, i_rst)
    begin
        if(i_rst = '0') then
            o_reg2 <= '0';
        elsif i_clk'event and i_clk = '1' then
            if(r2_load = '1') then
                o_reg2 <= o_opcycle1;
            end if;
        end if;
    end process;

    reg3: process(i_clk, i_rst)
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
        not(o_reg4) when "01",
        not(o_reg4) when "11",
        'X' when others;

    with sel_out1 select
 o_output1(1) <= o_reg4 when "00",
        o_reg4 when "11",
        not(o_reg4) when "01",
        not(o_reg4) when "10",
        'X' when others;

    sel_out2 <= (o_reg3 & o_reg4);

    with sel_out2 select
 o_output2(0) <= o_reg5 when "00",
        o_reg5 when "10",
        not(o_reg5) when "01",
        not(o_reg5) when "11",
        'X' when others;

    with sel_out2 select
 o_output2(1) <= o_reg5 when "00",
        o_reg5 when "11",
        not(o_reg5) when "01",
        not(o_reg5) when "10",
        'X' when others;

    sel_out3 <= (o_reg5 & o_reg4)    ;

    with sel_out3 select
 o_output3(0) <= o_reg6 when "00",
        o_reg6 when "10",
        not(o_reg6) when "01",
        not(o_reg6) when "11",
        'X' when others;

    with sel_out3 select
 o_output3(1) <= o_reg6 when "00",
        o_reg6 when "11",
        not(o_reg6) when "01",
        not(o_reg6) when "10",
        'X' when others;

    process(i_clk, i_rst)
    begin
        if(i_rst = '0') then
            o_reg7 <= "000000";
        elsif i_clk'event and i_clk = '1' then
            if(r7_load = '1') then
                o_reg7 <= o_output1 & o_output2 & o_output3;
            end if;
        end if;
    end process;

    process(i_clk, i_rst)
    begin
        if(i_rst = '0') then
            o_reg8 <= "0000";
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
    with addr_set select
        mux_len_seq <= i_data when '1',
            o_reg11 when '0',
            "XXXXXXXX" when others;

    sub <= mux_len_seq - "00000001";

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

    actually_done <= '1' when (o_reg11 = "00000000") else '0';



    --Scelta dell'indirizzo di memoria

    sum_add_r <= o_addr_set_r + "0000000000000001";

    reg9: process(i_clk, i_rst)
    begin
        if(i_rst = '0') then
            o_reg9 <= "0000000000000000";
        elsif i_clk'event and i_clk = '1' then
            if(r9_load = '1' and addr_set = '1') then
                o_reg9 <= "0000000000000000";
            elsif(r9_load = '1') then
                o_reg9 <= sum_add_r;
            end if;
        end if;
    end process;

    sum_add_w <= o_addr_set_w + "0000000000000001";

    reg10: process(i_clk, i_rst)
    begin
        if(i_rst = '0') then
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
        o_address <= o_reg9 when '0',
        o_reg10 when '1',
        "XXXXXXXXXXXXXXXX" when others;
end Behavioral;

--FINE ARCHITETTURA DATAPATH

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
             addr_set : in std_logic;
             first_operation : in std_logic;
             op_cycle : in std_logic_vector(1 downto 0);
             out_set : in std_logic;
             write_address_sel : in std_logic;
             o_done : out std_logic;
             o_address : out std_logic_vector(15 downto 0);
             o_en : out std_logic;
             o_we : out std_logic;
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
    signal first_operation : std_logic;
    signal op_cycle : std_logic_vector(1 downto 0);
    signal out_set : std_logic;
    signal write_address_sel : std_logic;
    signal actually_done : std_logic;
    type S is(S0, S1, S2, S3, S4, S5, S6, S7, S8, S9);
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
        addr_set,
        first_operation,
        op_cycle,
        out_set,
        write_address_sel,
        o_done,
        o_address,
        o_en,
        o_we,
        o_data
    );

process(i_clk, i_rst)
begin
    --next_state <= S0;
    if(i_rst = '1') then
        cur_state <= S1;
    elsif i_clk'event and i_clk = '1' then
        cur_state <= next_state;
    end if;
end process;

process(cur_state, i_start, actually_done)
begin
    next_state <= cur_state;
    case cur_state is
        when S0 =>
            if i_rst = '1' then
                next_state <= S1;
            end if;
        when S1 =>
            if i_start = '1' then
                next_state <= S2;
            end if;
        when S2 =>
            next_state <= S3;
        when S3 =>
            if actually_done = '1' then
                next_state <= S4;
            else
                next_state <= S5;
            end if;
        when S4 =>
            next_state <= S1;
        when S5 =>
            next_state <= S6;
        when S6 =>
            next_state <= S7;
        when S7=>
            if actually_done = '0' then
                next_state <= S8;
            else
                next_state <= S1;
            end if;
        when S8=>
            next_state <= S9;
        when S9 =>
            next_state <= S6;
    end case;
end process;

process(cur_state)
begin
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
op_cycle <= "00";
first_operation <= '0';
out_set <= '0';
addr_set <= '0';
o_done <= '0';
o_en <= '0';
o_we <= '0';
o_address <= "0000000000000000";
actually_done <= '0';
case cur_state is
			when S0 => 
			when S1 =>
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
				op_cycle <= "00";
				first_operation <= '0';
				out_set <= '0';
				addr_set <= '0';
				o_we <= '0';
                actually_done <= '0';
				o_done <= '0';
				o_en <= '0';
				write_address_sel <= '0';
				o_address <= "0000000000000000";
			when S2 =>
				addr_set <= '1';
				o_we <= '1';
				o_en <= '1';
				r9_load <= '1';
				r10_load <= '1';
			when S3 =>
				addr_set <= '0';
				r9_load <= '1';
				r10_load <= '0';
				r11_load <= '1';
			when S4 =>
			when S5 =>
				r9_load <= '0';
				r11_load <= '0';
				op_cycle <= "01";
				first_operation <= '1';
				r1_load <= '1';
				r2_load <= '1';
				r3_load <= '1';
				r4_load <= '1';
				r5_load <= '1';
				r6_load <= '1';
				r7_load <= '1';
				first_operation <= '1';
			when S6  =>
				r1_load <= '0';
				op_cycle <= "10";
				first_operation <= '0';
				out_set <= '0';
				r7_load <= '0';
				r8_load <= '1';
				write_address_sel <= '1';
				o_we <= '1';
			when S7 =>
				op_cycle <= "11";
				r6_load <= '0';
				r8_load <= '0';
				out_set <= '1';
				r10_load <= '1';
				r11_load <= '1';
			when S8 =>
				write_address_sel <= '0';
				o_we <= '0';
				r9_load <= '1';
				r11_load <= '0';
			when S9 =>		
				r9_load <= '0';
				r1_load <= '1';
				r2_load <= '1';
				r3_load <= '1';
				r4_load <= '1';
				r5_load <= '1';
				r6_load <= '1';
				r7_load <= '1';
				op_cycle <= "01";
		end case;
	end process;
end Behavioral;