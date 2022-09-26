-- Cursor explícito com SQL Dinâmico

set serveroutput on;
set verify off;

create or replace procedure fetch_employees_curs_dyn(
   in_manager_id    in employees.manager_id%type default null
 , in_department_id in employees.department_id%type default null
) is
   type c_employees_type is ref cursor;

   c_employees c_employees_type;
   r_employee  employees%rowtype;
   l_sql       varchar2(600) := 'select * from employees where 1 = 1';
begin
   if in_manager_id is not null then
      l_sql := l_sql || ' and manager_id = :manager_id ';
   end if;
   if in_department_id is not null then
      l_sql := l_sql || ' and department_id = :department_id ';
   end if;

   case
      when in_manager_id is not null and in_department_id is not null then
         open c_employees for l_sql using in_manager_id, in_department_id;
      when in_manager_id is not null and in_department_id is null then
         open c_employees for l_sql using in_manager_id;
      when in_manager_id is null and in_department_id is not null then
         open c_employees for l_sql using in_department_id;
      else
         open c_employees for l_sql;
   end case;

   dbms_output.put_line(l_sql);

   <<show_employees>>
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
         to_char(r_employee.salary, 'l99g999d99') || ', ' ||
         nvl(to_char(r_employee.commission_pct, '90.99'), 'null') || ', ' ||
         r_employee.manager_id || ', ' ||
         r_employee.department_id
      );
   end loop show_employees;

   dbms_output.put_line('Número de empregados recuperados: ' || c_employees%rowcount);

   if c_employees%rowcount = 0 then
      raise no_data_found;
   end if;

   close c_employees;
exception
   when no_data_found then
      raise_application_error(-20004, 'Nenhum dado encontrado, verifique o ID do gerente ou do departamento.');
   when others then
      raise_application_error(-20001, 'Erro Oracle: ' || sqlcode || sqlerrm);
end fetch_employees_curs_dyn;
