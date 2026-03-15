library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity TLC is
Port(
	clk, reset: in std_logic;
	R1, R2, Y1, Y2, G1, G2: out std_logic
);
End TLC;

Architecture archi of TLC is
	Constant timeMax: integer := 5;
	
	Constant timeRG: integer := 5;
	Constant timeRY: integer := 2;
	Constant timeGR: integer := 5;
	Constant timeYR: integer := 2;
	
	TYPE state IS (RG, RY, GR, YR);
	
	Signal current_state, next_state: state;
	
	Signal counter: integer := 0;
	
Begin
	Process(clk, reset)
	Begin
		If (reset= '1') then
			current_state <= RG; counter <= 0;
		elsif rising_edge(clk) then
		
			current_state <= next_state;
			
			case (current_state) is
				when RG =>
					counter <= counter + 1;
					R1 <= '1'; Y1 <= '0'; G1 <= '0';
					R2 <= '0'; Y2 <= '0'; G2 <= '1';
					if (counter = timeRG) then
						counter <= 0; next_state <= RY;
					end if;
				when RY =>
					counter <= counter + 1;
					R1 <= '1'; Y1 <= '0'; G1 <= '0';
					R2 <= '0'; Y2 <= '1'; G2 <= '0';
					if (counter = timeRY) then
						counter <= 0; next_state <= GR;
					end if;
				when GR =>
					counter <= counter + 1;
					R1 <= '0'; Y1 <= '0'; G1 <= '1';
					R2 <= '1'; Y2 <= '0'; G2 <= '0';
					if (counter = timeGR) then
						counter <= 0; next_state <= YR;
					end if;
				when YR =>
					counter <= counter + 1;
					R1 <= '0'; Y1 <= '1'; G1 <= '0';
					R2 <= '1'; Y2 <= '0'; G2 <= '0';
					if (counter = timeYR) then
						counter <= 0; next_state <= RG;
					end if;
			end case;
		end if;
	end process;
end archi;