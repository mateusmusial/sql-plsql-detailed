-- Sub-Consultas Single-Row
--
-- Sub-consultas que retoram apenas uma linha
-- Operadores: =, >, >=, <, <=, !=

-- Quais empregados possuem o salário maior que
-- a média dos salários dos programadores?
select first_name
     , last_name
     , job_id
     , salary
  from employees
 where salary > (select avg(salary)
                   from employees
                  where job_id = 'IT_PROG');

-- Utilizando Sub-consultas na Cláusula HAVING
select e1.department_id
     , max(e1.salary) max_salary
  from employees e1
 group by e1.department_id
having max(salary) < (select avg(e2.salary)
                        from employees e2
                       where 1 = 1);

-- Sub-consultas que não retornam nenhuma linha será NULL
select employee_id
     , first_name
     , last_name
  from employees
 where last_name = (select last_name
                      from employees
                     where last_name = 'Suzuki');
