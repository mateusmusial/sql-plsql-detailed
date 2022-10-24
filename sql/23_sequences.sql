-- Criando Sequences

/* create sequence name_seq
 *    [increment by n]
 *    [start with n]
 *    [maxvalue n | nomaxvalue]
 *    [minvalue n | nominvalue]
 *    [cycle | nocycle]          :quando atigir o num max começa novamente.
 *    [cache n | nocache];
*/
 
-- Exemplo de sequence
create sequence employees_seq
   start with 210
   increment by 1
   nomaxvalue
   nocycle
   nocache;
   
-- Recuperando próximo valor da Sequencia
select employees_seq.nextval
  from dual;

-- Recuperando o valor corrente da Sequencia
select employees_seq.currval
  from dual;
  
-- Removendo uma Sequencia 
-- Caso haja um buraco na numeração e queremos consertar isso
-- devemos remover e criar a sequence novamente do número que parou
drop sequence employees_seq;

-- Usando uma SEQUENCE em um INSERT
insert into employees (employee_id, first_name, last_name, email
                        , phone_number, hire_date, job_id, salary
                        , commission_pct, manager_id, department_id)
   values (employees_seq.nextval, 'Paul', 'Simon', 'PSIMO'
            , '525.342.237', to_date('12/02/2020', 'DD/MM/YYYY'), 
            'IT_PROG', 15000, null, 103, 60);
            
-- Modificando uma SEQUENCE
alter sequence employees_seq
   maxvalue 999999
   cache 20; -- cache de 20 números na memória