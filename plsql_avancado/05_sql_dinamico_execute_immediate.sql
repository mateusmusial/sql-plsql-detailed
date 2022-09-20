-- SQL Dinâmico com EXECUTE IMMEDIATE

create or replace procedure fetch_employees_dyn(
   in_manager_id    in employees.manager_id%type default null -- caso não passado valor
 , in_department_id in employees.department_id%type default null
) is
   type t_employees_type is table of employees%rowtype index by pls_integer;

   t_employees t_employees_type;
   l_sql       varchar2(600) := 'select * from employees where 1=1';
begin
   if in_manager_id is not null then
      l_sql := l_sql || ' and manager_id = ' || in_manager_id;
   end if;

   if in_department_id is not null then
      l_sql := l_sql || ' and department_id = ' || in_department_id;
   end if;

   dbms_output.put_line(l_sql);

   execute immediate l_sql
      bulk collect into t_employees;

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
         nvl(to_char(t_employees(i).commission_pct, '90.99'), 'null') || ', ' ||
         t_employees(i).manager_id || ', ' ||
         t_employees(i).department_id
      );
   end loop;
exception
   when others then
      raise_application_error(-20001, 'Erro Oracle: ' || sqlcode || sqlerrm);
end fetch_employees_dyn;

-- Executando a Procedure
set serveroutput on;
set verify off;
exec fetch_employees_dyn(in_manager_id => 103);
exec fetch_employees_dyn(in_manager_id => 103, in_department_id => 60);
exec fetch_employees_dyn(in_department_id => 80);
