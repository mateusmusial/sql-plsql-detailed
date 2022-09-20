-- Bulk Collect FORALL

set serveroutput on;
set verify off;

create or replace procedure update_salary_all(in_percent in number) is
   type t_employee_id_type is table of employees.employee_id%type index by binary_integer;

   t_employee_id t_employee_id_type;
begin
   select distinct employee_id
     bulk collect into t_employee_id
     from employees;

   dbms_output.put_line('Linhas recuperadas: ' || t_employee_id.count);

   -- FORALL empacota todos os UPDATES e envia o pacote em 1 única troca de contexto (Context Switch)
   -- Isso melhora a performace do programa
   forall i in t_employee_id.first..t_employee_id.last
      update employees
         set salary = salary * (1 + in_percent / 100)
       where employee_id = t_employee_id(i);
end update_salary_all;
