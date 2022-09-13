-- WHILE LOOP

set serveroutput on;

accept g_limite prompt 'Digite o valor limite: ';
declare
   l_numero number(38) := 1;
   l_limite number(38) := &g_limite;
begin
   while l_numero <= l_limite
   loop
      dbms_output.put_line('Número: ' || to_char(l_numero));
      l_numero := l_numero + 1;
   end loop;
end;