--somadorcompleto.vhd
--Somador Completo VHDL
--Autor: Augusto Camara

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

--Entity
ENTITY somadorcompleto is
    PORT(
        a,b,cin : IN STD_LOGIC;
        s, cout : OUT STD_LOGIC --ultima linha sem ponto e virgula
    ); 
END somadorcompleto;

--Architecture
ARCHITECTURE dataflow OF somadorcompleto IS
    BEGIN
        s <= a XOR b XOR cin;
        cout <= (a AND b) OR (a AND cin) OR (b AND cin);
END dataflow;
