--somadorcompleto.vhd
--Somador Completo VHDL
--Autor: Augusto Camara

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

--Entity
ENTITY somador4b is
    PORT(
        a,b : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        cin : IN STD_LOGIC;
        s : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); 
        cout : OUT STD_LOGIC --ultima linha sem ponto e virgula
    ); 
END somador4b;

--Architecture
ARCHITECTURE structure OF somador4b IS
    COMPONENT somadorcompleto IS
        PORT(
            a,b,cin : IN STD_LOGIC;
            s : OUT STD_LOGIC;
            cout : OUT STD_LOGIC --ultima linha sem ponto e virgula
        ); 
    END COMPONENT;
    SIGNAL c1,c2,c3 : STD_LOGIC;

    BEGIN
        u0 : somadorcompleto PORT MAP(a=>A(0), b=>B(0), cin=>CIN, s=>S(0), cout=>(c1));
        u1 : somadorcompleto PORT MAP(a=>A(1), b=>B(1), cin=>c1, s=>S(1), cout=>(c2));
        u2 : somadorcompleto PORT MAP(a=>A(2), b=>B(2), cin=>c2, s=>S(2), cout=>(c3));
        u3 : somadorcompleto PORT MAP(a=>A(3), b=>B(3), cin=>c3, s=>S(0), cout=>(cout));
END structure;
