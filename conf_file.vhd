library ieee;
library gate;
use ieee.std_logic_1164.ALL;

configuration conf_gates of gates_struc is 
	for gates_struc_arch
		--use gate.ALL;
		for hx1 : HXOR use entity gate.hxor_e(hxor_arch);
		end for;
	end for;
end conf_gates;
