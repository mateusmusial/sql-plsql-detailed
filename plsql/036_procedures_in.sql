-- Parâmetros do tipo IN

create or replace procedure emp_salary_increase(
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

-- Executando a Procedure
set serveroutput on;
begin
   emp_salary_increase(210, 10);
   commit;
end;

-- Consultando alterações
select *
from employees
where first_name = 'Mateus';
