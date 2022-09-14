-- Exceções Pré-definidas pelo Oracle
--
--

set serveroutput on;
set verify off;

accept g_employee_id prompt 'Digite o ID do empregado';
declare
   l_first_name  employees.first_name%type;
   l_last_name   employees.last_name%type;
   l_employee_id employees.employee_id%type := &g_employee_id;
begin
   select first_name
        , last_name
     into l_first_name
        , l_last_name
     from employees
    where employee_id = l_employee_id;

   dbms_output.put_line('Empregado: ' || l_first_name || ' ' || l_last_name);
exception
   when no_data_found then
      raise_application_error(-20001, 'Empregado não encontrado: ' || to_char(l_employee_id));
   when others then
      raise_application_error(-20002, 'Erro Oracle - ' || sqlcode || sqlerrm);
end;
