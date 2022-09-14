-- LOOP básico

set serveroutput on;

accept g_limite prompt 'Digite o valor limite: ';
declare
   l_numero number(38) := 1;
   l_limite number(38) := &g_limite;
begin
   loop
      dbms_output.put_line('Número: ' || to_char(l_numero));
      exit when l_numero = l_limite;
      l_numero := l_numero + 1;
   end loop;
end;
