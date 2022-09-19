-- Procedures com parâmetros do tipo OUT

create or replace procedure search_employee(
   in_employee_id in  employees.employee_id%type
 , out_r_employee out employees%rowtype
) is
-- variáveis
begin
   select employee_id
        , first_name
        , last_name
        , email
        , phone_number
        , hire_date
        , job_id
        , salary
        , commission_pct
        , manager_id
        , department_id
     into out_r_employee
     from employees
    where employee_id = in_employee_id;
exception
   when no_data_found then
      raise_application_error(-20001, 'Empregado não encontrado: ' || to_char(in_employee_id));
   when others then
      raise_application_error(-20002, 'Erro Oracle - ' || sqlcode || sqlerrm);
end search_employee;

-- Executando a Procedure
set serveroutput on;
declare
   r_employee employees%rowtype;
begin
   search_employee(210, r_employee);

   dbms_output.put_line(
      r_employee.employee_id || ', ' ||
      r_employee.first_name || ', ' ||
      r_employee.last_name || ', ' ||
      r_employee.email || ', ' ||
      r_employee.phone_number || ', ' ||
      r_employee.hire_date || ', ' ||
      r_employee.job_id || ', ' ||
      r_employee.salary || ', ' ||
      r_employee.commission_pct || ', ' ||
      r_employee.manager_id || ', ' ||
      r_employee.department_id
   );
end;
