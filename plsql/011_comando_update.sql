-- Utilizando o comando UPDATE no PL/SQL

set serveroutput on;

declare
   l_employee_id employees.employee_id%type := 207;
   l_percentual  number(3)                  := 10;
begin
   update employees
      set salary = salary * (1 + l_percentual / 100)
    where employee_id = l_employee_id;

   commit;
end;
