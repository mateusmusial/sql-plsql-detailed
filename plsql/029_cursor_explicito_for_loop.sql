-- Cursor explícito usando FOR LOOP
--
-- A maneira mais fácil e mais indicada de se controlar um Cursor

set serveroutput on;
set verify off;

declare
   cursor c_employees is
      select *
        from employees
       order by employee_id;
begin
   <<read_employees>>
   for r_employee in c_employees -- podemos usar a consulta direto aqui
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
