-- Multitable Insert
--

-- INSERT ALL Incondicional
-- Cada linha retornada pela consulta será inserida nas duas tabelas
-- incondicionalmente, cada uma com seus respectivos campos
insert all
  into employees_history
values (employee_id, first_name, last_name, hire_date)
  into salary_history
values (employee_id, extract(year from hire_date), extract(month from hire_date), salary, commission_pct)
select *
  from employees
 where hire_date > sysdate - 365;

-- Comando INSERT ALL Condicional
-- Conforme cada condição será inserida as linhas na tabela.
insert all
   when (hire_date > sysdate - 365) then
      into employees_history
    values (employee_id, first_name, last_name, hire_date)
      into salary_history
    values (employee_id, extract(year from hire_date), extract(month from hire_date), salary, commission_pct)

   when (hire_date > sysdate - 365) and (job_id = 'IT_PROG') then
      into it_programmers
    values (employee_id, first_name, last_name, hire_date)

   when (hire_date > sysdate - 365) and department_id in(  select department_id
                                                           from departments
                                                          where location_id in ( select location_id
                                                                                   from locations
                                                                                  where country_id = 'US')) then
      into living_in_us
    values (employee_id, first_name, last_name, hire_date)
select *
  from employees
 where hire_date > sysdate - 365;

-- Comando INSERT FIRST Condicional
insert first
   when salary < 5000 then
      into low_salaries
    values (employee_id, department_id, salary)
   when salary between 5000 and 10000 then
      into average_salaries
    values (employee_id, department_id, salary)
   else
      into high_salaries
    values (employee_id, department_id, salary)
select *
  from employees;

-- Comando INSERT Pivoting
-- Transformando colunas em linhas.
create table job_salaries(
   year     number(4) not null
 , month    number(2) not null
 , it_prog  number(8, 2) not null
 , sa_man   number(8, 2) not null
 , st_man   number(8, 2) not null
);

insert into job_salaries (year, month, it_prog, sa_man, st_man)
values (2015, 9, 31300, 61000, 36400);
insert into job_salaries (year, month, it_prog, sa_man, st_man)
values (2015, 8, 35000, 79500, 37000);
commit;

create table job_sal(
   year           number(4) not null
 , month          number(2) not null
 , job_id         varchar2(10) not null
 , total_salary   number(8, 2) not null
);

insert all
  into job_sal
values (year, month, 'IT_PROG', it_prog)
  into job_sal
values (year, month, 'SA_MAN', sa_man)
  into job_sal
values (year, month, 'ST_MAN', st_man)
select *
  from job_salaries;

select * from job_salaries;
select * from job_sal;
