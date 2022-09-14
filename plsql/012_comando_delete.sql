-- Utilizando o comando DELETE no PL/SQL

set serveroutput on;

declare
   l_employee_id employees.employee_id%type := 207;
begin
   delete from employees
    where employee_id = l_employee_id;

   commit;
end;
