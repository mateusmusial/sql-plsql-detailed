-- Cursor Explícito com Parâmetros

set serveroutput on;
set verify off;

declare
   cursor c_employees(
      p_department_id employees.department_id%type
    , p_job_id        employees.job_id%type
   ) is
      select *
        from employees
       where department_id = p_department_id
         and job_id = p_job_id
       order by hire_date;
begin
   <<read_employees>>
   for r_employee in c_employees(60, 'IT_PROG')
   loop
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
   end loop read_employees;
end;