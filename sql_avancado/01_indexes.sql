-- Índices
--

-- Criação de Índeces Únicos
-- São criados índices únicos automaticamente quando definimos uma CONSTRAINT de
--    PRIMARY KEY ou de UNIQUE para uma tabela.
-- Para colunas FOREIGN KEY é necessário criar o índice manualmente, isso é
--    fortemente recomendado pela Oracle.
drop index emp_phone_ix;
create unique index emp_phone_ix on employees(phone_number);

select *
  from employees
 where phone_number = '515.127.4565'; -- Unique Scan

-- Criação de índices não únicos (B-tree)
--
-- Permitem valores duplicado para o índice, são criados pelo desenvolvedor.
-- É o valor DEFAULT se nada for especificado na criação do índice.
-- Recomendado para colunas de alta cadinalidade (muitos valores distintos para o índice).
-- Árvore binária inverida.
drop index emp_name_ix;
create index emp_name_ix on employees(last_name, first_name);

select *
  from employees
 where last_name = 'Taylor'; -- Range Scan

drop index emp_job_ix;
create index emp_job_ix on employees(job_id);
alter index emp_job_ix rebuild;

select *
  from employees
 where job_id = 'IT_PROG'; -- Range Scan

-- Criação de índices Bitmap
--
-- Recomendado para colunas de baixa cardinalidade (poucos valores distintos).
-- Índice recomendado para tabelas com pouco uso de comando DML, tabelas de BI.
-- Cria fisicamente um mapa de bits para cada valor da coluna.
drop index emp_department_ix;
create bitmap index emp_department_ix on employees(department_id);

select *
from employees
where department_id = 50;

-- Índice baseado em função
create index emp_upper_fname_ix on employees(upper(first_name));

select *
  from employees
 where upper(first_name) = 'MATEUS';

-- Ativar e Desativar índices.
alter index emp_department_ix invisible;
alter index emp_department_ix visible;
