-- Tipos de Atualizações de Visões Materializadas
--
--

-- Fast Refresh
--
-- É necessário criar uma Materialized View Log da tabela master que guarda
-- as alterações que aconteceu na tabela para posteriormente atualizar apenas
-- o que foi alterado na tabela master.
-- OBS: MV complexas (com subconsultas) não podem ser "refresh fast on commit"
create materialized view log on employees;

create materialized view sales_manager_mv
   build immediate
   refresh fast on commit -- Irá atualizar a cada commit da tabela master
as
   select *
     from employees
    where job_id = 'SA_MAN';

-- Consultando a MV
select *
  from sales_manager_mv;

-- Inserindo dados na tabela employees e fazendo commit
insert into employees
values (
   employees_seq.nextval
 , 'Carlos'
 , 'Brown'
 , 'CBROWN'
 , '015.02.22315'
 , sysdate
 , 'SA_MAN'
 , 10000
 , null
 , 102
 , 60);
commit;

-- Complete Refresh
--
--
-- Limpa toda a tabela e faz uma nova carga a partir da consulta definida na MV.
-- OBS: podemos definir subconsultas para esse tipo de refresh
create materialized view emp_dep_max_salaries_mv
   build immediate
   refresh complete on demand
   enable query rewrite
as
   select dep.department_name, emp.*
     from employees emp
     join departments dep
       on emp.department_id = dep.department_id
    where ( emp.department_id, emp.salary ) in ( select department_id
                                                      , max(salary) max_salary
                                                   from employees
                                                  group by department_id )
    order by emp.department_id, emp.salary;

-- Consultando a MV
select *
  from emp_dep_max_salaries_mv;

-- Force Refresh
--
--
-- Opção default para a o tipo de atualização.
-- Oracle executará o FAST refresh se possível, caso contrário executará um COMPLETE refresh.
create materialized view it_programmers_mv
   build immediate
   refresh force on commit
   enable query rewrite
as
   select *
     from employees
    where job_id = 'IT_PROG'
    order by department_id;

-- Consultando a MV
select *
  from it_programmers_mv;
