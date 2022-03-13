library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity datapath is
    Port( 	i_clk : in STD_LOGIC;
	        i_rst : in STD_LOGIC;
            i_data : in STD_LOGIC_VECTOR (7 downto 0);
            addr_read_increase : STD_LOGIC;
			read_set : STD_LOGIC;
			addr_write_increase : STD_LOGIC;
			--o_addr_write : STD_LOGIC_VECTOR(15 downto 0);	--di controllo che vadatutto bene con la ALU forse serve un registro qui.
			lenght_sequence_select : STD_LOGIC;
			lenght_sequence_increase : STD_LOGIC;			--anche qui forse serve un registro.
			operation_cycle : STD_LOGIC;
			first_operation : STD_LOGIC;
			r1_load : STD_LOGIC;
			r2_load : STD_LOGIC;
			r3_load : STD_LOGIC;
			r4_load : STD_LOGIC;
			r5_load : STD_LOGIC;
			r6_load : STD_LOGIC;
			r7_load : STD_LOGIC;
			r8_load : STD_LOGIC;
			out_select : STD_LOGIC;
            o_address: out STD_LOGIC_vector(15 downto 0);
            o_done : out STD_LOGIC;
			o_en: out STD_LOGIC;
			o_we: out STD_LOGIC;
			o_data: out STD_LOGIC_VECTOR(7 downto 0)
		);
end datapath;

architecture Behavioral of datapath is
component mux_2_8bit is
	port(	a, b : in STD_LOGIC_VECTOR(7 downto 0);
			s : in STD_LOGIC;
			y : out STD_LOGIC_VECTOR(7 downto 0));			--rinominato speriamo non dia errore
end component;
component mux_2_16bit is
	port(a, b : in STD_LOGIC_VECTOR(15 downto 0);
			s : in STD_LOGIC;
			y : out STD_LOGIC_VECTOR(15 downto 0));
end component;
component mux_4_1bit is
	port(	a, b, c, d : in STD_LOGIC;
			s : in STD_LOGIC_VECTOR(1 downto 0);
			y : out STD_LOGIC);
end component;

signal addr_read : STD_LOGIC_VECTOR (15 downto 0);
signal o_addr_write : STD_LOGIC_VECTOR (15 downto 0);
signal o_mux_write : STD_LOGIC;
signal o_mux_read : STD_LOGIC;
signal mux_read_increase: STD_LOGIC;
signal 
signal 
signal 


begin
MUX0: mux_2_8bit port map(
	a,
	b,
	s,
	y);
MUX1: mux_2_16bit port map(
	a,
	b,
	s,
	y);
MUX2: mux_4_1bit port map(
	a,
	b,
	c,
	d,
	s,
	y);

process(addr_read_increase, read_set)
begin
	with read_sel select
		mux_addr_read <= "0" when '0',
							 addr_read when '1',
							 "X" when others;
	o_addr_read <= addr_read_increase + mux_addr_read;
end process
					









end Behavioral;

entity mux_2_8bit is
	Port(	a, b: in STD_LOGIC_VECTOR(7 downto 0);
			s: in STD_LOGIC;
			y: out STD_LOGIC_VECTOR(7 downto 0));
end entity;
architecture arch0 of mux_2_8bit is
begin
	process(s, a, b)
	begin
		with s select
			y <=	a when '0';
					b when '1';
					"XXXXXXXX" when others,
	end process;
end architecture;


entity mux_2_16bit is
	Port(a, b: in STD_LOGIC_VECTOR(15 downto 0);
		s: in STD_LOGIC;
		y: out STD_LOGIC_VECTOR(15 downto 0));
end entity;
architecture arch1 of mux_2_16bit is
begin
	process(s, a, b)
	begin
		with s select
			y <=	a when '0';
					b when '1';
					"XXXXXXXXXXXXXXXX" when others,
	end process;
end architecture;

entity mux_4_1bit is
	port(	a, b, c, d : in STD_LOGIC;
			s : in STD_LOGIC_VECTOR(1 downto 0);
			y : out STD_LOGIC);
end entity;
architecture arch2 of mux_4_1bit is
begin
	process(s,a,b,c,d)
	begin
		if 		s = "00" then
			y <= a;
		elsif 	s = "01" then
			y <= b;
		elsif 	s = "10" then
			y <= c;
		else
			y <= d;
		end if;
	end process;
end architecture;
