-- Package DBMS_SCHEDULER
--
-- Agendamentos de programas

create table agenda(
   agenda_id number
 , agenda_data date
);

create sequence agenda_seq
   start with 1
   increment by 1
   nocache
   nomaxvalue
   nocycle;

create or replace procedure insert_date is
begin
   insert into agenda (
      agenda_id
    , agenda_data)
   values (
      agenda_seq.nextval
    , sysdate);
   commit;
end;

begin
   dbms_scheduler.create_program(
      program_name        => 'hr.inserir_data'
    , program_action      => 'hr.insert_date'
    , program_type        => 'stored_procedure'
    , number_of_arguments => 0
    , comments            => 'Insere dados na agenda'
    , enabled             => true
   );

   -- Podemos ativar o scheduler depois de criado.
   dbms_scheduler.enable(name => 'hr.inserir_data');

   -- Para remover o scheduler
   dbms_scheduler.drop_program(
      program_name => 'hr.inserir_data'
    , force        => true
   );

end;
