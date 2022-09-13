-- Collection VARRAY de Records
--
--

set serveroutput on;
set verify off;

declare
   type t_employees_type is varray(200) of employees%rowtype;

   t_employees t_employees_type := t_employees_type();
begin
   select *
     bulk collect into t_employees
     from employees
    order by employee_id;
    
    dbms_output.put_line('Número de elementos: ' || t_employees.count);

   <<imprime_valores>>
   for i in t_employees.first..t_employees.last
   loop
      dbms_output.put_line(
         t_employees(i).employee_id || ', ' ||
         t_employees(i).first_name || ', ' ||
         t_employees(i).last_name || ', ' ||
         t_employees(i).email || ', ' ||
         t_employees(i).phone_number || ', ' ||
         t_employees(i).hire_date || ', ' ||
         t_employees(i).job_id || ', ' ||
         to_char(t_employees(i).salary, 'l99g999d99') || ', ' ||
         t_employees(i).commission_pct || ', ' ||
         t_employees(i).manager_id || ', ' ||
         t_employees(i).department_id
      );
   end loop imprime_valores;
end;