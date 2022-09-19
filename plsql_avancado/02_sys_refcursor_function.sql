-- Utilizando SYS_REFCURSOR

-- Criando Function com retorno  SYS_REFCURSOR
create or replace function get_employee(in_employee_id in employees.employee_id%type)
   return sys_refcursor
is
   c_employee sys_refcursor;
begin
   open c_employee for
      select first_name
           , last_name
           , salary
        from employees
       where employee_id = in_employee_id;

   return c_employee;
end get_employee;

-- Referenciando a função
create or replace procedure display_employee(in_employee_id in number) is
   c_employee   sys_refcursor;
   l_first_name employees.first_name%type;
   l_last_name  employees.last_name%type;
   l_salary     employees.salary%type;
begin
   c_employee := get_employee(in_employee_id);

   loop
      fetch c_employee
         into l_first_name
            , l_last_name
            , l_salary;
      exit when c_employee%notfound;

      dbms_output.put_line(
         l_first_name || ' ' ||
         l_last_name ||
         to_char(l_salary, 'l99g999d99')
      );
   end loop;

   close c_employee;
end display_employee;

-- Executando a procedure
set serveroutput on;
set verify off;
execute display_employee(100);
