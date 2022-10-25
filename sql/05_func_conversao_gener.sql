-- Funções de conversão e Funções Genéricas

-- Utilizando a função TO_CHAR com DATE
select to_char(sysdate, 'dd/mm/yyyy  hh24:mi:ss') "Data e hora"
     , to_char(systimestamp, 'dd/mm/yyyy  hh24:mi:ss tzh') "Data e hora com time zone"
     , to_char(sysdate, 'dd, "de" Month "de" yyyy') "Data extenso com 9 caracter"
     , to_char(sysdate, 'fmdd, "de" Month "de" yyyy') "Data extenso sem espaços"
     , to_char(trunc(sysdate) + 0.99999,'dd/mm/yyyy hh24:mi:ss') "Final do dia"
  from dual;

-- Utilizando a função TO_CHAR com NUMBER
select first_name
     , last_name
     , to_char(salary, 'l999g999d99')
  from employees;

-- Utilizando a Função TO_NUMBER
select to_number('12000,50')
  from dual;

-- Utilizando a Função TO_DATE
select to_date('06/02/2020', 'dd/mm/yyyy')
  from dual;


/** Funções Genéricas **/

-- Utilizando a Função NVL
select last_name
     , salary
     , nvl(commission_pct, 0) commission_pct
     , salary * 12 salario_anual
     , (salary * 12) + (salary * 12 * nvl(commission_pct, 0)) remuneracao_anual
  from employees;

-- Utilizando a Função COALESCE
select coalesce(null, null, 'Expresssão 3')
     , coalesce(null, 'Expressão 2', 'Expresssão 3')
     , coalesce('Expressão 1', 'Expressão 2', 'Expresssão 3')
  from dual;

select last_name
     , employee_id
     , commission_pct
     , manager_id
     , coalesce(
          to_char(commission_pct)
        , to_char(manager_id)
        , 'Sem percentual de comissão e sem gerente') percentual_gerente
  from employees;

-- Utilizando a Função NVL2
select last_name
     , salary
     , commission_pct
     , nvl2(commission_pct, 10, 0) percentual_aterado
  from employees;

-- Utilizando a Função NULLIF
select nullif(1000, 1000)
     , nullif(1000, 2000)
  from dual;

select first_name
     , last_name
     , length(first_name) "Expressão 1"
     , length(last_name) "Expressão 2"
     , nullif(length(first_name), length(last_name)) resultado
  from employees;
