/*  *** Flashback Drop ***  */

-- Criando uma tabela pra deleção
create table emp_copy as
   select *
     from employees;

-- Dropando a tabela
drop table emp_copy;

-- Consultando a Lixeira
select *
  from user_recyclebin;

-- Esvaziar lixeira
purge recyclebin;

-- Restaurando um objeto apartir da lixeira.
flashback table emp_copy to before drop;


/*  *** Flashback Table ***  */


-- Criando uma tabela para deleção
create table emp_it_copy as
   select *
   from employees
   where job_id = 'IT_PROG';

-- Necessário pois quando é feito o flashback, isso pode mudar os rowids
alter table emp_it_copy enable row movement;

/* aguardar alguns minutinhos... */

-- Deletando as linhas da tabela
delete from emp_it_copy;
commit;

-- Restaurando a tabela para posição de 5 minutos atrás
flashback table emp_it_copy to timestamp systimestamp - interval '5' minute;
