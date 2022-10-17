-- Utilizando Variáveis de Substituição - &
select *
  from employees
 where employee_id = &employee_id;

-- Utilizando Variáveis de Substituição - &&
-- Define a variável para toda a sessão
select *
  from employees
 where employee_id = &&employee_id;

-- Variáveis de substituição com valores tipo Character e Date
select *
  from employees
 where job_id = '&job_id';

-- Utilizando o comando DEFINE
define minha_var = 101

select *
  from employees
 where employee_id = &minha_var;

define minha_var; -- Mostra o valor da variável
undefine minha_var -- Apaga a variável
