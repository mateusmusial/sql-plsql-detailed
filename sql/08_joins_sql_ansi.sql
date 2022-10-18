-- Joins SQL ANSI 1999

-- Utilizando Natural Joins, Cláusula USING, Cláusula ON (INNER Joins)
-- Usado em colunas que tem o mesmo nome e tipo de dado
select employee_id
     , last_name
     , department_id
     , department_name
     , location_id
     , city
  from departments
natural join locations
natural join employees;

select emp.employee_id
     , emp.last_name
     , department_id
     , dep.department_name
     , location_id
     , loc.city
  from employees emp
  join departments dep
 using (department_id)
  join locations loc
 using (location_id);

select emp.employee_id
     , emp.last_name
     , emp.salary
     , emp.department_id
     , dep.location_id
     , loc.city
  from employees emp
  join departments dep
    on (emp.department_id = dep.department_id)
  join locations loc
    on (dep.location_id = loc.location_id)
 where emp.salary between 10000 and 15000;

-- Self Join Utilizando a Cláusula ON
select empregado.employee_id "Id empregado"
     , empregado.last_name "Sobrenome empregado"
     , gerente.employee_id "Id gerente"
     , gerente.last_name "Sobrenome gerente"
  from employees empregado
  join employees gerente
    on (empregado.manager_id = gerente.employee_id)
 order by empregado.employee_id;

-- Nonequijoins
-- Realiza JOIN quando a condição de ligação não é uma igualdade
select emp.employee_id
     , emp.salary
     , jobg.grade_level
     , jobg.lowest_sal
     , jobg.highest_sal
  from employees emp
  join job_grades jobg
    on emp.salary between jobg.lowest_sal and jobg.highest_sal
 order by emp.salary;

-- OUTER Joins (LEFT, RIGHT FULL)
select e.first_name
     , e.last_name
     , d.department_id
     , d.department_name
  from employees e
  left join departments d
    on (e.department_id = d.department_id)
 order by d.department_id;

select d.department_id
     , d.department_name
     , e.first_name
     , e.last_name
  from employees e
 right join departments d
    on (e.department_id = d.department_id)
 order by d.department_id;

select d.department_id
     , d.department_name
     , e.first_name
     , e.last_name
  from employees e
  full join departments d
    on (e.department_id = d.department_id)
 order by d.department_id;

-- Produto Cartesiano (Cross Join)
-- Quando todas as linhas de uma tabela
-- é ligada com todas as linhas de outra tabela
select last_name, department_name
  from employees
 cross join departments;
