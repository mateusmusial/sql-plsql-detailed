-- Procedures

create or replace procedure insert_employee(
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
begin
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
   when others then
      raise_application_error(-20001, 'Erro Oracle ' || sqlcode || sqlerrm);
end insert_employee;

-- Executando a Procedure
set serveroutput on;
begin
   insert_employee('Mateus', 'Musial', 'MMUSIAL', '572.892.3423', sysdate, 'IT_PROG', 8300, null, 103, 60);
   commit;
end;

-- Podemos executar a Procedure com o comando EXEC
exec insert_employee('Mateus', 'Musial', 'MMUSIAL', '572.892.3423', sysdate, 'IT_PROG', 8300, null, 103, 60);

-- Buscando o empregado inserido
select *
  from employees
 where first_name = 'Mateus';
