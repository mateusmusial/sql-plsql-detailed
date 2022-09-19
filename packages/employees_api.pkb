-- Criando o package body
--
-- Para compilar o package body precisamos primeiro criar o package specification

create or replace package body employees_api is

   procedure insert_employee(
      in_first_name     in employees.first_name%type
    , in_last_name      in employees.last_name%type
    , in_email          in employees.email%type
    , in_phone_number   in employees.phone_number%type
    , in_hire_date      in employees.hire_date%type
    , in_job_id         in employees.job_id%type
    , in_salary         in employees.salary%type
    , in_commission_pct in employees.commission_pct%type
    , in_manager_id     in employees.manager_id%type
    , in_department_id  in employees.department_id%type
   ) is
      -- variáveis
      e_salary_min exception;
   begin
      if in_salary < employees_api.g_min_salary then
         raise e_salary_min;
      end if;

      insert into employees (
         employee_id
       , first_name
       , last_name
       , email
       , phone_number
       , hire_date
       , job_id
       , salary
       , commission_pct
       , manager_id
       , department_id)
      values (
         employees_seq.nextval
       , in_first_name
       , in_last_name
       , in_email
       , in_phone_number
       , in_hire_date
       , in_job_id
       , in_salary
       , in_commission_pct
       , in_manager_id
       , in_department_id);

      dbms_output.put_line('Número de empregados inseridos: ' || sql%rowcount);
   exception
      when e_salary_min then
         raise_application_error(-20003, 'Salário menor que os demais empregados!');
      when others then
         raise_application_error(-20001, 'Erro Oracle ' || sqlcode || sqlerrm);
   end insert_employee;

   procedure emp_salary_increase(
      in_employee_id in number
    , in_percent     in number
   ) is
   -- variáveis
   begin
      update employees
         set salary = salary * (1 + in_percent / 100)
       where employee_id = in_employee_id;

      dbms_output.put_line('Número de empregados atualizados: ' || sql%rowcount);
   exception
      when others then
         raise_application_error(-20001, 'Erro Oracle ' || sqlcode || sqlerrm);
   end emp_salary_increase;

   procedure search_employee(
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

   function get_emp_salary(in_employee_id in number)
      return number is
      l_salary employees.salary%type;
   begin
      select salary
        into l_salary
        from employees
       where employee_id = in_employee_id;

      return l_salary;
   exception
      when no_data_found then
         raise_application_error(-20001, 'Empregado inexistnete!');
      when others then
         raise_application_error(-20002, 'Erro Oracle: ' || sqlcode || sqlerrm);
   end get_emp_salary;

begin
   select min(salary)
     into employees_api.g_min_salary
     from employees;
end employees_api;
