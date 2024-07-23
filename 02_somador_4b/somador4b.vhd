--somador4b.vhd
--Somador de 4 bits em vhdl utilizando operadores aritmeticos
--Autor: Augusto Camara

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; -- Para realizar operacoes aritmeticas

--Entity
ENTITY somador4b is
    PORT(
        a,b : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        s : OUT STD_LOGIC_VECTOR (3 DOWNTO 0) --ultima linha sem ponto e virgula
    ); 
END somador4b;

--Architecture
ARCHITECTURE dataflow OF somador4b IS
    BEGIN
        --Operaçoes só podem ser feitas sobre os tipos signed e unsigned
        s <= STD_LOGIC_VECTOR(UNSIGNED(a) + UNSIGNED(b));
        
END dataflow;
