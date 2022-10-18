-- Funções de Grupo e Criação de Grupos

-- Utilizando as Funções AVG e SUM
select avg(salary) "Média salarial"
     , sum(salary) "Soma salário"
     -- Utilizando as Funções MIN e MAX
     , min(hire_date) "Menor data"
     , max(hire_date) "Maior data"
     , min(salary) "Menor salário"
     , max(salary) "Maior salário"
     -- Utilizando a Função COUNT
     , count(*) "Contagem de empregados"
     , count(commission_pct) "Contagem != null"
     , count(nvl(commission_pct, 0)) "Contagem com null"
     -- Utilizando a Função COUNT com DISTINCT
     , count(distinct department_id) "Contagem de dep. diferentes"
     -- Funções de Grupo e valores NULOS e Tratamento de NULOS
     , avg(commission_pct) "Média sem null"
     , avg(nvl(commission_pct, 0)) "Média com null"
  from employees;

/*** Criando e Selecionando Grupos ***/

-- Colunas que não tem funções de grupo tem que
-- estar na cláusula GROUP BY
select job_id
     , department_id
     , round(avg(salary), 2) "Média salarial"
     , sum(salary) "Soma salarial"
  from employees
 group by department_id
     , job_id
 order by department_id;

-- Restringindo Grupos utilizando a cláusula HAVING
-- Cláusula HAVING restringe colunas que tem funções de grupo
select department_id
     , max(salary)
  from employees
 group by department_id
having max(salary) > 10000;

select job_id
     , sum(salary) "Total"
  from employees
 where job_id != 'SA_REP'
 group by job_id
having sum(salary) > 10000
 order by sum(salary);

-- Aninhando Funções de Grupo
select round(max(avg(salary)), 2) "Maior média salarial"
  from employees
 group by department_id;
