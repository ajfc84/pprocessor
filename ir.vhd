library ieee;
use ieee.std_logic_1164.all;

entity ir is
	port( clk, ld: IN std_logic;
		nInst: IN std_logic_vector(15 downto 0);
		cInst: OUT std_logic_vector(15 downto 0));
end ir;
architecture beh of ir is
begin
	process(clk)
	begin
		if(clk='1' and clk'event and ld='1')then
			cInst<=nInst;
		end if;
	end process;
end beh;