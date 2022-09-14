-- Collection Associative Array
--
-- Array Unidimensional que pode ser indexado por numeros ou caracteres,
-- permitindo buracos na numeração.

set serveroutput on;
set verify off;

declare
   type t_value_type is table of varchar2(100) index by binary_integer;

   t_value t_value_type;
begin
   <<armz_value>>
   for i in 1..10
   loop
      t_value(i) := 'Valor a ser armazenado';
   end loop armz_value;

   <<imp_value>>
   for i in 1..10
   loop
      dbms_output.put_line('Indice: ' || to_char(i) || ', Valor: ' || t_value(i));
   end loop imp_value;
end;
