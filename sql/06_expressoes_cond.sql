-- Funções Genéricas

-- Expressão CASE
select last_name
     , job_id
     , salary
     , case job_id
          when 'IT_PROG' then
             1.10 * salary
          when 'ST_CLERK' then
             1.15 * salary
          when 'SA_REP' then
             1.20 * salary
          else
             salary
       end new_salary
  from employees;

-- Utilizando a Função DECODE
select last_name
     , job_id
     , salary
     , DECODE(job_id
        , 'IT_PROG', 1.10 * salary
        , 'ST_CLERK', 1.15 * salary
        , 'SA_REP', 1.20 * salary
        , salary) new_salary
  from employees;
