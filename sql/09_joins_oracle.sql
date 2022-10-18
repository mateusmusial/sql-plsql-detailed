-- Joins Sintaxe Oracle

select e.employee_id
     , e.salary
     , j.job_title
     , d.department_name
     , l.city
     , l.state_province
     , l.country_id
  from employees e
     , jobs j
     , departments d
     , locations l
 where (e.job_id = j.job_id)
   and (d.department_id = e.department_id)
   and (d.location_id = l.location_id)
   and e.salary >= 10000
 order by e.employee_id;

-- NonequiJoin Utilizando Sintaxe Oracle
select e.employee_id
     , e.salary
     , j.grade_level
     , j.lowest_sal
     , j.highest_sal
  from employees e
     , job_grades j
 where e.salary between j.lowest_sal and j.highest_sal
 order by e.salary;

-- Outer Join Utilizando Sintaxe Oracle
-- Marcação = só correspondencia, sem marcação = todas linhas
-- Como se fosse um LEFT
select emp.first_name
     , emp.last_name
     , dep.department_id
     , dep.department_name
  from employees emp
     , departments dep
 where emp.department_id = dep.department_id(+)
 order by emp.department_id;

-- Como se fosse um RIGHT
select emp.first_name
     , emp.last_name
     , dep.department_id
     , dep.department_name
  from employees emp
     , departments dep
 where emp.department_id(+) = dep.department_id
 order by emp.first_name;

-- Self-join Utilizando Sintaxe Oracle
select empregado.employee_id "Id empregado"
     , empregado.last_name "Sobrenome empregado"
     , gerente.employee_id "Id gerente"
     , gerente.last_name "Sobrenome gerente"
  from employees empregado
     , employees gerente
 where (empregado.manager_id = gerente.employee_id)
 order by empregado.employee_id;

-- Produto Cartesiano
select e.employee_id
     , e.first_name
     , e.last_name
     , j.job_id
     , j.job_title
  from employees e
     , jobs j;
