--ALU.vhd
--Unidade Logica Artimetica em vhdl
--Autor: Augusto Camara

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


--Entity
ENTITY alu is
    PORT(
        a,b : IN STD_LOGIC_VECTOR (7 DOWNTO 0); -- a7 a6 a5 a4 a3 a2 a1 a0 =8b 
        sel : IN STD_LOGIC_VECTOR (2 DOWNTO 0); -- sel2 sel1 sel0 == 3bits (xyz)
        s : OUT STD_LOGIC_VECTOR (7 DOWNTO 0) --ultima linha sem ponto e virgula
    ); 
END alu;

--Architecture
ARCHITECTURE dataflow OF alu IS
    BEGIN
        --with select WHEN
        --a variavel de selecao eh sel
        WITH sel SELECT 
        s<= STD_LOGIC_VECTOR(UNSIGNED(a) + UNSIGNED(b)) WHEN "000", -- nao é final de linha, logo nao é ";" e sim ","
            STD_LOGIC_VECTOR(UNSIGNED(a) - UNSIGNED(b)) WHEN "001",
            STD_LOGIC_VECTOR(UNSIGNED(a) + 1) WHEN "010",
            a WHEN "011",
            a and b WHEN"100",
            a or b WHEN "101",
            a xor b WHEN "110",
            not a WHEN "111",
            "00000000"WHEN others; --condicao nula para zerar todos os bits quando der erro 

END dataflow;
