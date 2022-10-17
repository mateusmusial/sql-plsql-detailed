-- Comando SELECT
--
--

-- Descrever tabelas
desc employees;
describe employees;

-- Select de todos os campos
select *
  from employees;

-- Select de alguns campos
select employee_id
     , first_name
     , last_name
     , email
  from employees;

-- Utilizando operadores aritiméticos
select first_name
     , last_name
     , salary
     , salary * 1.15
     , (salary + 100) * 1.15 -- regra de precedência
  from employees;

-- Valores NULL (ausência de valores)
-- operações matemáticas com NULL sempre retornam NULL
select first_name
     , last_name
     , job_id
     , commission_pct
     , commission_pct * 2000
  from employees;

-- Alias de coluna
select first_name as nome
     , last_name sobrenome -- AS opcional
     , email as "Email do Empregado" -- Case sensitive
     , phone_number "Número de telefone"
  from employees;

-- Operadores de concatenação
select employee_id
     , first_name || ' ' || last_name as "Nome Completo"
     , salary
  from employees;

-- Utilizando operadores alternativos para aspas
select department_name || q'[ Department's Manager Id: ]' || manager_id "Departamento e Gerente"
  from departments;

-- Buscando valores distintos (DISTINCT)
select distinct department_id
  from employees;
