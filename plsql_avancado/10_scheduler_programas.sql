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
      program_name        => 'prg_inserir_data_agenda'
    , program_action      => 'insert_date'
    , program_type        => 'stored_procedure'
    , number_of_arguments => 0
    , comments            => 'Insere dados na tabela agenda'
    , enabled             => true
   );
end;

-- Podemos ativar o programa depois de criado.
begin
   dbms_scheduler.enable(name => 'prg_inserir_data_agenda');
end;

-- Para remover o scheduler
begin
   dbms_scheduler.drop_program(
      program_name => 'prg_inserir_data_agenda'
    , force        => true
   );
end;
