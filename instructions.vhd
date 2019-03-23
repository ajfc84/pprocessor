library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity instructions is
	port(clk, wr: IN std_logic;
		addr: IN std_logic_vector(3 downto 0);
		wdata: IN std_logic_vector(15 downto 0);
		rdata: OUT std_logic_vector(15 downto 0));
end instructions;

architecture beh of instructions is
	type regs16b_type is
		array(0 to 15) of std_logic_vector(15 downto 0);
	signal regs16b: regs16b_type;
begin
	process(clk)
	begin
		if(clk='1' and clk'event)then
			if(wr='1')then
				regs16b(conv_integer(addr))<=wdata;
				rdata<="ZZZZZZZZZZZZZZZZ";
			elsif(wr='0')then
				rdata<=regs16b(conv_integer(addr));
			end if;
		end if;
	end process;
end beh;