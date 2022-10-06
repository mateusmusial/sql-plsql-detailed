-- Criação de Objetos
create or replace type r_employee as object (
   employee_id    number(6)
 , first_name     varchar2(20)
 , last_name      varchar2(25)
 , email          varchar2(25)
 , phone_number   varchar2(20)
 , hire_date      date
 , job_id         varchar2(10)
 , salary         number(8, 2)
 , commission_pct number(2, 2)
 , manager_id     number(6, 0)
 , department_id  number(4, 0)
);

-- Criação de Table utilizando Tipos no Banco de Dados
create or replace type t_employees_type is table of r_employee;

-- Criando uma Table Function
create or replace function get_employees_table(in_department_id in employees.department_id%type)
   return t_employees_type is
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

   t_employees t_employees_type := t_employees_type();
begin
   for employee in c_employees(in_department_id)
   loop
      t_employees.extend;
      t_employees(t_employees.last) := r_employee(
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
                                       );
   end loop;

   return t_employees;
end;

-- Utilizando a Table Function
select *
  from table(get_employees_table(60));
