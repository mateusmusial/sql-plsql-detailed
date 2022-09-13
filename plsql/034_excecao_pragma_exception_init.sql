-- Pragma Exception Init

set serveroutput on;
set verify off;

declare
   l_first_name     employees.first_name%type   := 'Robert';
   l_last_name      employees.last_name%type    := 'Ford';
   l_job_id         employees.job_id%type       := 'XX_YYYY';
   l_phone_number   employees.phone_number%type := '650.511.9844';
   l_email          employees.email%type        := 'RFORD';
   e_fk_inexistente exception;
   pragma exception_init(e_fk_inexistente, -2291);
begin
   insert into employees (
      employee_id
    , first_name
    , last_name
    , phone_number
    , email
    , hire_date
    , job_id)
   values (
      employees_seq.nextval
    , l_first_name
    , l_last_name
    , l_phone_number
    , l_email
    , sysdate
    , l_job_id);
    commit;
exception
   when e_fk_inexistente then
      raise_application_error(-20003, 'Job inexistente!');
   when others then
      raise_application_error(-20002, 'Erro Oracle - ' || sqlcode || sqlerrm);
end;