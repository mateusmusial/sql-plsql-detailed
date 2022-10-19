-- Comandos DDL - Criando e Gerenciando Tabelas
--
--

-- Criando Tabelas
create table projects (
   project_id    number(6) not null
 , project_code  varchar2(10) not null
 , project_name  varchar2(100) not null
 , creation_date date default sysdate not null
 , start_date    date
 , end_date      date
 , status        varchar2(20) not null
 , priority      varchar2(10) not null
 , budget        number(11, 2) not null
 , description   varchar2(400) not null
);

-- Criando uma tabela utilizando uma sub-consulta
create table emp_department_60 as
   select employee_id
        , last_name
        , salary * 12 annual_salary
        , hire_date
     from employees
    where department_id = 60;

-- TRUNCATE TABLE
-- Limpa todos os dados ta tabela
truncate table emp_department_60;

-- DROP TABLE
-- Exclui a tabela
drop table emp_department_60;

-- Alterando a Estrutura da Tabela
--

-- Adicionando uma coluna
alter table projects
   add (department_id number(3) not null);

-- Removendo uma coluna
alter table projects
   drop column department_id;

-- Modificando o tipo de dado da coluna
alter table projects
   modify (project_code varchar2(6));

-- Renomeando uma coluna
alter table projects
   rename column project_name to name_project;

-- READ ONLY
-- Tabela apenas para leitura
alter table employees read only;

-- READ WRITE
-- Tabela para leitura e gravação
alter table employees read write;
