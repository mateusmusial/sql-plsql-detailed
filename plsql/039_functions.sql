-- Funções de Banco de Dados
--
-- FUNCTION sempre retornam apenas um valor, caso retorne mais que um valor ou
-- nenhum valor, considere usar uma PROCEDURE.

create or replace function get_emp_salary(in_employee_id in number)
   return number is
   l_salary employees.salary%type;
begin
   select salary
     into l_salary
     from employees
    where employee_id = in_employee_id;

   return l_salary;
exception
   when no_data_found then
      raise_application_error(-20001, 'Empregado inexistnete!');
   when others then
      raise_application_error(-20002, 'Erro Oracle: ' || sqlcode || sqlerrm);
end get_emp_salary;

-- Executando a function
set serveroutput on;
set verify off;
declare
   l_employee_id employees.employee_id%type := 210;
   l_salary      employees.salary%type;
begin
   l_salary := get_emp_salary(l_employee_id);

   dbms_output.put_line('Salário: ' || l_salary);
end;
