-- Bloco Anônimo

set serveroutput on;

declare
   l_texto varchar2(20) := 'Hello World!';
begin
   dbms_output.put_line(l_texto);
exception
   when others then
      dbms_output.put_line('Erro Oracle: ' || sqlcode || sqlerrm);
end;