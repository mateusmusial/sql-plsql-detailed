-- Criando e Gerenciando Visões
--

-- Criando uma Visão
create or replace view emp_dept_60_v as
   select employee_id
        , first_name
        , last_name
        , department_id
        , salary
        , commission_pct
     from employees
    where department_id = 60;

-- Criando uma Visão Complexa
-- Não permite comandos DML
create or replace view departments_salary_v (
   department_id
 , department_name
 , minsal
 , maxsal
 , avgsal
) as
   select e.department_id
        , d.department_name
        , min(e.salary)
        , max(e.salary)
        , avg(e.salary)
     from employees e
     join departments d
       on (e.department_id = d.department_id)
    group by e.department_id
        , department_name;

-- Utilizando a cláusula CHECK OPTION
-- Caso feito algum comando DML na view será validado a cláusula WHERE
-- so podendo inserir empregado no departamento 100.
-- Para usar um comando DML temos que ter todas as colunas da tabela na view
-- e a view não pode ser complexa, tem que referênciar apenas uma tabela.
create or replace view emp_dept_100_v as
   select employee_id
        , first_name
        , last_name
        , email
        , phone_number
        , hire_date
        , job_id
        , salary
        , commission_pct
        , manager_id
        , department_id
     from employees
    where department_id = 100
with check option constraint emp_dept_100_v_ck;

insert into emp_dept_100_v
values (240, 'Paulo', 'Silva', 'PSILVA', '5678-9876', sysdate, 'IT_PROG', 2600, null, 108, 90);

-- Utilizando a Cláusula READ ONLY
-- Não conseguimos fazer operações DML na view
create or replace view emp_dept_20_v as
   select employee_id
        , first_name
        , last_name
        , department_id
        , salary
     from employees
    where department_id = 20
with read only;

-- Removendo uma Visão
drop view emp_dept_20_v;
