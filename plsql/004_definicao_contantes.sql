-- Definindo Constantes

set serveroutput on;

declare
   co_pi constant number(11, 8) := 3.14785;
begin
   co_pi := 3.15; -- Erro!
   dbms_output.put_line(co_pi);
end;