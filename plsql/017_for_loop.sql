-- FOR LOOP

set serveroutput on;

accept g_limite prompt 'Digite o valor limite: ';
declare
   l_inicio number(38) := 1;
   l_fim    number(38) := &g_limite;
begin
   for i in l_inicio..l_fim
   loop
      dbms_output.put_line('Número: ' || to_char(i));
   end loop;
end;
