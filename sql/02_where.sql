-- Restringindo linhas retornadas WHERE
--
--

-- Utilizando a cláusula WHERE
select *
  from employees
 where department_id = 60;

-- Utilizando Strings de caractere na cláusula WHERE
select *
  from employees
 where job_id != 'IT_PROG';

-- Utilizando Strings de caractere com datas na cláusula WHERE
select *
  from employees
 where hire_date = '30/01/04';

-- Utilizando operadores de comparação na cláusula WHERE
select *
  from employees
 where salary >= 10000;

-- Selecionando faixas de valores utilizando o operador BETWEEN
select *
  from employees
 where salary between 10000 and 15000;

-- Selecionando valores dentro de uma lista utilizando o operador IN
select *
  from employees
 where job_id in ('IT_PROG', 'FI_ACCOUNT', 'SA_REP');

-- Utilizando o operador LIKE
select *
  from employees
 where first_name like 'Sa%';

-- Combinando o uso de vários caracteres curinga
select *
  from employees
 where last_name like '_a%';

-- Utilizando a expressão de comparação IS NULL
select *
  from employees
 where manager_id is null;

-- Utilizando o operador AND
select *
  from employees
 where salary >= 5000
   and job_id = 'IT_PROG';

-- Utilizando o operador OR
select *
  from employees
 where salary >= 5000
    or job_id = 'IT_PROG';

-- Utilizando o operador NOT
select *
  from employees
 where job_id not in ('IT_PROG', 'FI_ACCOUNT', 'SA_REP');

-- Utilizando parênteses para sobrepor as regras de precedência
select *
  from employees
 where (job_id = 'SA_REP' or job_id = 'IT_PROG')
   and salary > 10000;

-- Utilizando a cláusula ORDER BY
select *
  from employees
 order by hire_date asc; -- Ordem Ascendente (default)

select *
  from employees
 order by hire_date desc; -- Ordem Descendente

select employee_id
     , last_name
     , salary * 12 salario_anual
  from employees
 order by salario_anual; -- Referenciando ALIAS

select last_name
     , job_id
     , department_id
     , hire_date
  from employees
 order by 4; -- Referenciando a Posição (coluna 4)

select last_name
     , department_id
     , salary
  from employees
 order by department_id, salary desc; -- departamento ASC, salario DESC
