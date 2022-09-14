-- Collection VARRAY
--
--

set serveroutput on;
set verify off;

declare
   type t_value_type is varray(10) of varchar2(100);

   t_value t_value_type := t_value_type(); -- inicialização
begin
   <<armz_value>>
   for i in 1..10
   loop
      t_value.extend; -- alocação de ocorrência
      t_value(i) := 'Valor a ser armazenado';
   end loop armz_value;

   <<imp_value>>
   for i in 1..10
   loop
      dbms_output.put_line('Indice: ' || to_char(i) || ', Valor: ' || t_value(i));
   end loop imp_value;
end;
