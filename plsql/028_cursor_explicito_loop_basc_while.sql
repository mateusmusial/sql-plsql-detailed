-- Cursor Explícito
--
-- Consultas que retornam mais que uma linha,
-- e é controlado diretamente pelo programador

-- Controlando o Cursor Explícito com Loop Básico
set serveroutput on;
set verify off;

declare
   cursor c_employees is
      select *
        from employees
       order by employee_id;

   r_employee c_employees%rowtype;
begin
   open c_employees;

   loop
      fetch c_employees into r_employee;
      exit when c_employees%notfound;

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
   end loop;

   close c_employees;
end;

-- Controlando um Cursor Explícito com While Loop
declare
   cursor c_employees is
      select *
        from employees;

   r_employee c_employees%rowtype;
begin
   open c_employees;
   fetch c_employees into r_employee;

   while c_employees%found
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
      fetch c_employees into r_employee;
   end loop;

   close c_employees;
end;
