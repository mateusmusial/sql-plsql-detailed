-- Cursor Explícito com SELECT FOR UPDATE
--
-- FOR UPDATE irá fazer um lock nas linhas recuperadas, isso é muito pouco usado.
-- Isso nos dá a possibilidade de fazer UPDATE ou DELETE usando WHERE CURRENT OF

set serveroutput on;
set verify off;

declare
   cursor c_employees(p_job_id employees.job_id%type) is
      select *
        from employees
       where job_id = p_job_id
      for update; -- lock nas linhas do SELECT

begin
   <<update_salary>>
   for r_employee in c_employees('AD_VP')
   loop
      update employees
         set salary = salary * (1 + 10 / 100)
       where current of c_employees;
       
      dbms_output.put_line('Número de empregados atualizados: ' || c_employees%rowcount);
   end loop update_salary;
end;