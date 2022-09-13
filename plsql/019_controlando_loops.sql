-- Controlando LOOPs aninhados

set serveroutput on;

declare
   l_total number(38) := 1;
begin
   <<loop1>>
   for i in 1..8
   loop
      <<loop2>>
      for j in 1..8
      loop
         dbms_output.put_line(to_char(i) || ', ' || to_char(j));
         exit loop1 when i = 1 and j = 6;
      end loop loop2;
   end loop loop1;
end;