-- Blocos Aninhados

set serveroutput on;

<<bloco1>>
declare
   l_bloco1 varchar2(20) := 'Bloco 1';
begin
   dbms_output.put_line('Referenciando a variável do ' || l_bloco1);

   <<bloco2>>
   declare
      l_bloco2 varchar(20) := 'Bloco 2';
   begin
      dbms_output.put_line('Referenciando a variável do ' || l_bloco1 || ' e ' || l_bloco2);
   end bloco2;

end bloco1;