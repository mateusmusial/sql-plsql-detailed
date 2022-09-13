-- Variável BIND

set serveroutput on;

variable g_media number;

declare
   l_numero1 number(11, 2) := 2000;
   l_numero2 number(11, 2) := 5000;
begin
   :g_media := (l_numero1 + l_numero2) / 2;
   dbms_output.put_line('Média: ' || to_char(:g_media));
exception
   when others then
      dbms_output.put_line('Erro Oracle: ' || sqlcode || sqlerrm);
end;