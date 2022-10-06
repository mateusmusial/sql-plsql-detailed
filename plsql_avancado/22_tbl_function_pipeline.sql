-- Pipelied Function
--
-- Retorna linhas para a saída da função assim que são criadas,
-- isso faz com que economizamos memória não precisando criar grande collentions

create or replace function get_employees_table_pipeline(in_department_id in employees.department_id%type)
   return t_employees_type
   pipelined
is
   cursor c_employees(p_department_id employees.department_id%type) is
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
        from employees
       where department_id = p_department_id;
begin
   for employee in c_employees(in_department_id)
   loop
      pipe row(
         r_employee( -- Types criado anteriormente
            employee.employee_id
          , employee.first_name
          , employee.last_name
          , employee.email
          , employee.phone_number
          , employee.hire_date
          , employee.job_id
          , employee.salary
          , employee.commission_pct
          , employee.manager_id
          , employee.department_id
         )
      );
   end loop;
end;

-- Utilizando a Pipelined Function
select *
  from table(get_employees_table_pipeline(60));
