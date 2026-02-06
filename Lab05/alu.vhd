library IEEE; use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD_UNSIGNED.ALL;
entity alu is
  port(a, b:       in     STD_LOGIC_VECTOR(31 downto 0);
       ALUControl: in     STD_LOGIC_VECTOR(2  downto 0);
       ALUResultout:  out STD_LOGIC_VECTOR(31 downto 0);
       Zero:       out    STD_LOGIC);
end;

architecture behave of alu is
signal ALUResult, condinvb, sum: STD_LOGIC_VECTOR(31 downto 0);
begin
  condinvb <= not b when Alucontrol(0)='1' else b;
  sum <= a + condinvb + Alucontrol(0);
  process(a,b,ALUControl,sum) begin
    case Alucontrol is
      when "000" =>  ALUResult <= sum;
      when "001" =>  ALUResult <= sum;
      when "010" =>  ALUResult <= a and b;
      when "011" =>  ALUResult <= a or b;        
      when "101" =>  ALUResult <= (0 => sum(31), others => '0');
      when others => ALUResult <= (others => 'X');
    end case;
  end process;
  ALUResultout <= ALUResult;
  Zero <= '1' when ALUResult = X"00000000" else '0';
end;
