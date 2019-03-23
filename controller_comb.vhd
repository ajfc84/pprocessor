library ieee;
use ieee.std_logic_1164.all;

entity controller_comb is
	port( z: IN std_logic;
		ir: IN std_logic_vector(3 downto 0);
		s: IN std_logic_vector(4 downto 1);
		pc_clr, pc_inc, ir_ld, data_rd, data_wr, reg_rd, reg_wr1, reg_wr2, inst_wr, clk_p, data_addr, reg_addr1, reg_addr2, const_addr, pc_add: OUT std_logic;
		n: OUT std_logic_vector(4 downto 1);
		alu_op: OUT std_logic_vector(3 downto 0));
end controller_comb;

architecture beh of controller_comb is
begin
	n(4)<=(not(s(4)) and not(s(3)) and s(2) and not(s(1)) and not(ir(3)) and ir(2) and not(ir(1)) and ir(0)) or (z and s(4) and not(s(3)) and not(s(2)) and not(s(1)));
	n(3)<=(not(s(4)) and not(s(3)) and s(2) and not(s(1)) and not(ir(3)) and not(ir(2)) and not(ir(1)) and ir(0)) or (not(s(4)) and not(s(3)) and s(2) and not(s(1)) and not(ir(3)) and not(ir(2)) and ir(1) and not(ir(0))) or (not(s(4)) and not(s(3)) and s(2) and not(s(1)) and not(ir(3)) and not(ir(2)) and ir(1) and ir(0)) or (not(s(4)) and not(s(3)) and s(2) and not(s(1)) and not(ir(3)) and ir(2) and not(ir(1)) and not(ir(0)));
	n(2)<=(not(s(4)) and not(s(3)) and not(s(2)) and s(1)) or (not(s(4)) and not(s(3)) and s(2) and not(s(1)) and not(ir(3)) and not(ir(2)) and not(ir(1)) and not(ir(0))) or (not(s(4)) and not(s(3)) and s(2) and not(s(1)) and not(ir(3)) and not(ir(2)) and ir(1) and ir(0)) or (not(s(4)) and not(s(3)) and s(2) and not(s(1)) and not(ir(3)) and ir(2) and not(ir(1)) and not(ir(0)));
	n(1)<=(not(s(4)) and not(s(3)) and not(s(2)) and not(s(1))) or (not(s(4)) and not(s(3)) and s(2) and not(s(1)) and not(ir(3)) and not(ir(2)) and not(ir(1)) and not(ir(0))) or (not(s(4)) and not(s(3)) and s(2) and not(s(1)) and not(ir(3)) and not(ir(2)) and ir(1) and not(ir(0))) or (not(s(4)) and not(s(3)) and s(2) and not(s(1)) and not(ir(3)) and ir(2) and not(ir(1)) and not(ir(0))) or (not(s(4)) and not(s(3)) and s(2) and s(1)) or (not(s(4)) and s(3) and not(s(2)) and not(s(1))) or (not(s(4)) and s(3) and not(s(2)) and s(1)) or (not(s(4)) and s(3) and s(2) and not(s(1))) or (not(s(4)) and s(3) and s(2) and s(1)) or (s(4) and not(s(3)) and not(s(2)) and not(s(1)) and not(z)) or (s(4) and not(s(3)) and not(s(2)) and not(s(1)) and z) or (s(4) and not(s(3)) and not(s(2)) and s(1));
	pc_clr<=not(s(4)) and not(s(3)) and not(s(2)) and not(s(1));
	pc_inc<=not(s(4)) and not(s(3)) and not(s(2)) and s(1);
	ir_ld<=not(s(4)) and not(s(3)) and not(s(2)) and s(1);
	data_rd<=not(s(4)) and not(s(3)) and s(2) and s(1);
	data_wr<=(not(s(4)) and s(3) and not(s(2)) and not(s(1)));
	reg_rd<=(not(s(4)) and s(3) and not(s(2)) and not(s(1))) or (not(s(4)) and s(3) and not(s(2)) and s(1)) or (not(s(4)) and s(3) and s(2) and s(1)) or ( s(4) and not(s(3)) and not(s(2)) and not(s(1)) and not(z)) or ( s(4) and not(s(3)) and not(s(2)) and not(s(1)) and z);
	reg_wr1<=(not(s(4)) and not(s(3)) and s(2) and s(1)) or (not(s(4)) and s(3) and not(s(2)) and s(1))or (not(s(4)) and s(3) and s(2) and s(1));
	reg_wr2<=(not(s(4)) and s(3) and s(2) and not(s(1)));
	inst_wr<=s(4) and s(3) and s(2) and s(1);
	clk_p<=s(4) and s(3) and s(2) and s(1);
	data_addr<=not(s(4)) and s(3) and not(s(2)) and not(s(1));
	reg_addr1<=(not(s(4)) and not(s(3)) and s(2) and s(1)) or (not(s(4)) and s(3) and not(s(2)) and s(1)) or (not(s(4)) and s(3) and s(2) and s(1)) or ( s(4) and not(s(3)) and not(s(2)) and not(s(1)) and not(z)) or ( s(4) and not(s(3)) and not(s(2)) and not(s(1)) and z);
	reg_addr2<=(not(s(4)) and s(3) and not(s(2)) and s(1))or (not(s(4)) and s(3) and s(2) and s(1));
	const_addr<=not(s(4)) and s(3) and s(2) and not(s(1));
	alu_op(3)<='0';
	alu_op(2)<='0';
	alu_op(1)<=not(s(4)) and s(3) and s(2) and s(1);
	alu_op(0)<=not(s(4)) and s(3) and not(s(2)) and s(1);
	pc_add<=(s(4) and not(s(3)) and not(s(2)) and s(1));
end beh;
