-- SQL Dinâmico com EXECUTE IMMEDIATE com variável BIND
--
-- Melhora a performace pois não é feito o HARD PARSE assim o oracle utiliza
-- o mesmo plano de execução

create or replace procedure fetch_employees_dyn_bind(
   in_manager_id    in employees.manager_id%type default null
 , in_department_id in employees.department_id%type default null
) as
   type t_employees_type is table of employees%rowtype index by pls_integer;

   t_employees t_employees_type;
   l_sql       varchar2(600) := 'select * from employees where 1=1 ';
begin
   if in_manager_id is not null then
      l_sql := l_sql || ' and manager_id = :manager_id ';
   end if;

   if in_department_id is not null then
      l_sql := l_sql || ' and department_id = :department_id ';
   end if;

   l_sql := l_sql || ' order by employee_id ';

   dbms_output.put_line(l_sql);

   case
      when in_manager_id is not null and in_department_id is not null then
         execute immediate l_sql bulk collect into t_employees using in_manager_id, in_department_id;
      when in_manager_id is not null and in_department_id is null then
         execute immediate l_sql bulk collect into t_employees using in_manager_id;
      when in_manager_id is null and in_department_id is not null then
         execute immediate l_sql bulk collect into t_employees using in_department_id;
      else
         execute immediate l_sql bulk collect into t_employees;
   end case;

   for i in 1..t_employees.COUNT
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
      raise_application_error(-20001, 'Erro Oracle ' || sqlcode || sqlerrm);
end fetch_employees_dyn_bind;

-- Executando a procedure
exec fetch_employees_dyn_bind(in_manager_id => 103, in_department_id => 60);
exec fetch_employees_dyn_bind(in_manager_id => 103);
exec fetch_employees_dyn_bind(in_department_id => 60);
exec fetch_employees_dyn_bind;
