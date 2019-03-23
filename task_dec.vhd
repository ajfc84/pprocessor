library ieee;
use ieee.std_logic_1164.all;

entity task_dec is
	port( t: IN std_logic_vector(4 downto 1);
		seg: OUT std_logic_vector(6 downto 0));
end task_dec;

architecture beh of task_dec is
begin
	process(t)
	begin
		if(t="1111")then -- Programming
			seg(0)<='0';
			seg(1)<='0';
			seg(2)<='1';
			seg(3)<='1';
			seg(4)<='0';
			seg(5)<='0';
			seg(6)<='0';
		elsif(t="0000")then -- Init
			seg(0)<='1';
			seg(1)<='1';
			seg(2)<='1';
			seg(3)<='1';
			seg(4)<='0';
			seg(5)<='0';
			seg(6)<='1';
		elsif(t="0001")then -- Fetch
			seg(0)<='0';
			seg(1)<='1';
			seg(2)<='1';
			seg(3)<='1';
			seg(4)<='0';
			seg(5)<='0';
			seg(6)<='0';
		elsif(t="0010")then -- Decode
			seg(0)<='1';
			seg(1)<='0';
			seg(2)<='0';
			seg(3)<='0';
			seg(4)<='0';
			seg(5)<='1';
			seg(6)<='0';
		elsif(t="0011")then -- Load
			seg(0)<='1';
			seg(1)<='1';
			seg(2)<='1';
			seg(3)<='0';
			seg(4)<='0';
			seg(5)<='0';
			seg(6)<='1';
		elsif(t="0100")then -- Store
			seg(0)<='0';
			seg(1)<='1';
			seg(2)<='0';
			seg(3)<='0';
			seg(4)<='1';
			seg(5)<='0';
			seg(6)<='0';
		elsif(t="0101")then -- Add
			seg(0)<='0';
			seg(1)<='0';
			seg(2)<='0';
			seg(3)<='1';
			seg(4)<='0';
			seg(5)<='0';
			seg(6)<='0';
		elsif(t="0110")then -- Ld_Const
			seg(0)<='0';
			seg(1)<='1';
			seg(2)<='1';
			seg(3)<='0';
			seg(4)<='0';
			seg(5)<='0';
			seg(6)<='1';
		elsif(t="0111")then -- Sub
			seg(0)<='1';
			seg(1)<='1';
			seg(2)<='1';
			seg(3)<='1';
			seg(4)<='1';
			seg(5)<='1';
			seg(6)<='0';
		elsif((t="1000") or (t="1001"))then -- JPMZ
			seg(0)<='1';
			seg(1)<='0';
			seg(2)<='0';
			seg(3)<='0';
			seg(4)<='1';
			seg(5)<='1';
			seg(6)<='1';
		else -- ?
			seg(0)<='0';
			seg(1)<='0';
			seg(2)<='1';
			seg(3)<='1';
			seg(4)<='0';
			seg(5)<='1';
			seg(6)<='0';
		end if;
	end process;
end beh;