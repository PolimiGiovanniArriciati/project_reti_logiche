--nota: la memoria ha un delay di 2 ns.


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

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



architecture Behavioral of project_reti_logiche is
component datapath is
	Port()

signal addr_read_increase : STD_LOGIC;
signal read_set : STD_LOGIC;
signal addr_write_increase : STD_LOGIC;
signal o_addr_write : STD_LOGIC_VECTOR(15 downto 0);	--di controllo che vadatutto bene con la ALU forse serve un registro qui.
signal lenght_sequence_select : STD_LOGIC;
signal lenght_sequence_increase : STD_LOGIC;			--anche qui forse serve un registro.
signal operation_cycle : STD_LOGIC;
signal first_operation : STD_LOGIC;
signal r1_load : STD_LOGIC;
signal r2_load : STD_LOGIC;
signal r3_load : STD_LOGIC;
signal r4_load : STD_LOGIC;
signal r5_load : STD_LOGIC;
signal r6_load : STD_LOGIC;
signal r7_load : STD_LOGIC;
signal r8_load : STD_LOGIC;
signal out_select : STD_LOGIC;
type S is(S0, S1, S2, S3, S4, S5, S6);
signal cur_state, next_state : S;

begin
	DATAPATH0: datapath port map(
		 i_clk : in std_logic;
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
         o_data : out std_logic_vector(7 downto 0)
    )

	process(i_clk, i_rst)
	begin
		if(i_rst = '1') then
			cur_state <= S0;
		elsif i_clk'event and i_clk = '1' then					
			cur_state <= next_state;
		end if;
	end process;

	process(cur_state, i_start, o_done)
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
				if o_done = '1'
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
				if o_done = '0' then
					next_state <= S8;
				else
					next_state <= S1;
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
		op_cycle <= '00';
		first_operation <= '0';
		out_select <= '0';
		set <= '0';
		o_done <= '0';
		o_en <= '0';
		o_we <= '0';
		o_address <= '0000000000000000';
		case cur_state is:
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
				op_cycle <= '00';
				first_operation <= '0';
				out_select <= '0';
				set <= '0';
				o_done <= '0';
				o_en <= '0';
				write_address_sel <= '0';
				o_address <= '0000000000000000';
			when S2 =>
				set <= '1';
				o_en <= '1';
				r9_load <= '1';
				r10_load <= '1';
			when S3 =>
				set <= '0';
				r9_load <= '1';
				r10_load <= '0';
				r11_load <= '1';
			when S4 =>
			when S5 =>
				r9_load <= '0';
				r11_load <= '0';
				op_cycle <= '01';
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
				op_cycle <= '10';
				first_operation <= '0';
				out_select <= '0';
				r7_load <= '0';
				r8_load <= '1';
				write_address_sel <= '1';
			when S7 =>
				op_cycle <= '11';
				r6_load <= '0';
				r8_load <= '0';
				out_select <= '1';
				r10_load <= '1';
				r11_load <= '1';
			when S8 =>
				write_address_sel => '0';
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
				op_cycle <= '01';
		end case;
	end process;
end Behavioral;

  














