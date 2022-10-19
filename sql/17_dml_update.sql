-- Utilizando o comando UPDATE
-- 
-- Sempre colocar a cláusula WHERE caso contrário 
-- atualizará todas as linhas da tabela.

update employees
   set salary = salary * 1.2
 where last_name = 'King';

-- Utilizando o comando UPDATE com Sub-consultas
update employees
   set job_id = (select job_id
                   from employees
                  where employee_id = 141)
     , salary = (select salary
                   from employees
                  where employee_id = 141)
 where employee_id = 140;