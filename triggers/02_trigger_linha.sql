create table employees_log(
   employees_log_id number(11) not null
 , dt_log date default sysdate not null
 , usuario varchar2(30)
 , evento varchar2(20) not null
 , employee_id number(6) not null
 , salary_old number(8, 2)
 , salary_new number(8, 2)
);

alter table employees_log
   add constraint employees_log_pk primary key (employees_log_id);

create sequence employees_log_seq
   start with 1
   increment by 1
   nocache
   nocycle
   nomaxvalue;

create or replace trigger employees_ar_iud
after insert or update of salary or delete on employees for each row
when (new.job_id != 'AD_PRES') -- não criará log para esse
declare
   l_evento      employees_log.evento%type;
   l_employee_id employees_log.employee_id%type;
begin
   case
      when inserting then
         l_evento      := 'INSERT';
         l_employee_id := :new.employee_id;
      when updating then
         l_evento      := 'UPDATE';
         l_employee_id := :new.employee_id;
      else
         l_evento      := 'DELETE';
         l_employee_id := :old.employee_id;
   end case;

   insert into employees_log(
      employees_log_id
    , dt_log
    , usuario
    , evento
    , employee_id
    , salary_old
    , salary_new)
   values (
      employees_log_seq.nextval
    , sysdate
    , user
    , l_evento
    , l_employee_id
    , :old.salary
    , :new.salary);
end employees_ar_iud;
