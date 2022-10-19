-- Operadores SET
--

-- Utilizando o operador UNION
-- Elimina as linhas duplicadas
select employee_id
     , job_id
     , hire_date
     , salary
  from employees
 where department_id in (60, 90, 100)
union
select employee_id
     , job_id
     , hire_date
     , salary
  from employees
 where job_id = 'IT_PROG'
 order by employee_id;
 
-- Utilizando o operador UNION ALL
-- Mantém as linhas duplicadas
select employee_id
     , job_id
     , hire_date
     , salary
  from employees
 where job_id = 'IT_PROG'
union all
select employee_id
     , job_id
     , hire_date
     , salary
  from employees
 where department_id = 60
 order by employee_id;

-- Utilizando operador INTERSECT
-- Retorna as linhas comuns entre o primeiro e o segundo SELECT
select employee_id
     , job_id
  from employees
 where job_id = 'IT_PROG'
intersect
select employee_id
     , job_id
  from employees
 where department_id in (60, 90, 100)
 order by employee_id;
 
-- Utilizando operador MINUS
-- Retorna linhas do primeiro SELECT que não estão no segundo SELECT
select employee_id
     , job_id
  from employees
 where department_id in (60, 90, 100)
minus
select employee_id
     , job_id
  from employees
 where job_id = 'IT_PROG'
 order by employee_id;

-- Utilizando mais de um operador SET
select employee_id
     , job_id
     , hire_date
     , salary
  from employees
 where department_id in (60, 90, 100)
union
select employee_id
     , job_id
     , hire_date
     , salary
  from employees
 where job_id = 'IT_PROG'
intersect
select employee_id
     , job_id
     , hire_date
     , salary
  from employees
 where salary > 10000
order by employee_id;