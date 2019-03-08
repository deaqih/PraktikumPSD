LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ShiftRegister IS
	PORT(
	ENABLE	: IN STD_LOGIC;
	DATA	: IN STD_LOGIC;
	OUTPUT	: OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
	CLEAR	: IN STD_LOGIC);
END ShiftRegister;

ARCHITECTURE Behaviour OF ShiftRegister IS
	CONSTANT CLK_FRQ	: INTEGER := 100e6;
	CONSTANT CLK_PRD	: TIME := 1000 ms / CLK_FRQ;
	SIGNAL CLK		: STD_LOGIC := '0';
	SIGNAL SHIFT_REG	: STD_LOGIC_VECTOR (2 DOWNTO 0);
BEGIN
	CLK <= NOT CLK AFTER CLK_PRD / 2;
	
	PROCESS (CLEAR, CLK, DATA, ENABLE, SHIFT_REG)
	BEGIN
		IF CLEAR = '1'
			THEN SHIFT_REG <= (OTHERS => '0');
		ELSE
			IF ENABLE = '1' AND RISING_EDGE(CLK)
				THEN SHIFT_REG(1 DOWNTO 0) <= SHIFT_REG (2 DOWNTO 1);
				SHIFT_REG(2) <= DATA;
			END IF;
		END IF;

	END PROCESS;
	OUTPUT <= SHIFT_REG;

END Behaviour;
	
