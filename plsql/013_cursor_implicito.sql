-- Cursor implícito

-- sql%found - TRUE se o cursor afetou uma linha ou mais
-- sql%notfound - TRUE se o cursor não afetou nenhuma linha
-- sql%isopen

set serveroutput on;

declare
   l_department_id employees.department_id%type := 60;
   l_percentual    number(3)                    := 10;
begin
   update employees
      set salary = salary * (1 + l_percentual / 100)
    where department_id = l_department_id;

   dbms_output.put_line('Número de empregados atualizados: ' || sql%rowcount);

   commit;
end;
