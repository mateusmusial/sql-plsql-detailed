-- Atributo %ROWTYPE
--
-- É uma forma bem mais fácil de criar um RECORD.

set serveroutput on;
set verify off;

accept g_employee_id prompt 'Digite o ID do empregado: ';
declare
   r_employee employees%rowtype;
begin
   select *
     into r_employee
     from employees
    where employee_id = &g_employee_id;

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