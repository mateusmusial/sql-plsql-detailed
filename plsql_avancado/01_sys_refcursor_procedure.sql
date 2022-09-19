-- Utilizando SYS_REFCURSOR

-- Criando Procedure parâmetro OUT SYS_REFCURSOR
create or replace procedure set_emp_cursor(
   out_c_employees out sys_refcursor
) is
begin
   open out_c_employees for
      select first_name
           , last_name
           , salary
        from employees;
end set_emp_cursor;

-- Procedure referenciando o parâmetro OUT SYS_REFCURSOR
create or replace procedure display_employees is
   c_employees  sys_refcursor;
   l_first_name employees.first_name%type;
   l_last_name  employees.last_name%type;
   l_salary     employees.salary%type;
begin
   set_emp_cursor(c_employees);

   loop
      fetch c_employees
         into l_first_name
            , l_last_name
            , l_salary;
      exit when c_employees%notfound;

      dbms_output.put_line(
         l_first_name || ' ' ||
         l_last_name ||
         to_char(l_salary, 'l99g999d99')
      );
   end loop;

   close c_employees;
end display_employees;

-- Executando a Procedure display_employees
set serveroutput on;
set verify off;
exec display_employees;
