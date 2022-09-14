-- Comando INSERT no PL/SQL

set serveroutput on;

declare

begin
   insert into employees(
      employee_id
    , first_name
    , last_name
    , email
    , phone_number
    , hire_date
    , job_id
    , salary
    , commission_pct
    , manager_id
    , department_id)
   values (
      employees_seq.nextval
    , 'Mateus'
    , 'Musial'
    , 'MMUSIAL'
    , '515.123.42278'
    , sysdate
    , 'IT_PROG'
    , 15000
    , 0.4
    , 103
    , 60);

    commit;
end;
