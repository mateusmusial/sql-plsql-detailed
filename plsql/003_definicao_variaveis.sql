-- Definindo Variáveis

set serveroutput on;

declare
   l_numero number(11, 2) := 1228.30;
   l_char   char(2)       := 'PR';
   l_texto  varchar2(60)  := 'Olá, meu nome é Mateus!';
   l_data   date          := '13/09/1994';
begin
   dbms_output.put_line(l_numero);
   dbms_output.put_line(l_char);
   dbms_output.put_line(l_texto);
   dbms_output.put_line(l_data);
end;
