-- Bloco Anônimo

set serveroutput on;

declare
   l_num1  number(11, 2) := 400;
   l_num2  number(11, 2) := 200;
   l_media number(11, 2);
begin
   l_media := (l_num1 + l_num2) / 2;
   dbms_output.put_line('A média é: ' || l_media);
end;
