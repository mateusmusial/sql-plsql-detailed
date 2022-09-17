-- Criando a package specification

create or replace package employees_api is

   g_min_salary employees.salary%type;

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
   );

   procedure emp_salary_increase(
      in_employee_id in number
    , in_percent     in number
   );

   procedure search_employee(
      in_employee_id in  employees.employee_id%type
    , out_employee   out employees%rowtype
   );

   function get_emp_salary(in_employee_id in number)
      return number;

end employees_api;
