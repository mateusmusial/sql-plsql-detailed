-- Sub-Consultas Multiple-Row
--
-- Sub-Consultas que retornam mais que uma linha
-- Operadores: [NOT] IN, ANY, ALL
-- ANY e ALL devem ser precedido por: =, >, >=, <, <=, !=

select employee_id
     , first_name
     , last_name
     , salary
  from employees
 where salary in (select avg(salary)
                    from employees
                   group by department_id);

select employee_id
     , last_name
     , job_id
     , salary
  from employees
 where salary < any (select salary
                       from employees
                      where job_id = 'IT_PROG');

select employee_id
     , last_name
     , job_id
     , salary
  from employees
 where salary < all (select salary
                       from employees
                      where job_id = 'IT_PROG');


-- Utilizando operador EXISTS e NOT EXISTS
select d.department_id
     , d.department_name
  from departments d
 where exists (select e.department_id
                 from employees e
                where d.department_id = e.department_id);

select d.department_id
     , d.department_name
  from departments d
 where not exists (select e.department_id
                     from employees e
                    where d.department_id = e.department_id);
