-- Criando um JOB
begin
   dbms_scheduler.create_job(
      job_name      => 'job_insere_data_agenda'
    , program_name  => 'prg_inserir_data_agenda'
    , schedule_name => 'sch_a_cada_10_segundos'
    , enabled       => true
    , auto_drop     => false
    , comments      => 'Job insere data na agenda'
    , job_style     => 'regular'
   );
end;

-- Habilitando
begin
   dbms_scheduler.enable(name => 'job_insere_data_agenda');
end;
-- Desabilitando
begin
   dbms_scheduler.disable(name => 'job_insere_data_agenda');
end;

-- Removendo um JOB
begin
   dbms_scheduler.drop_job(
      job_name => 'job_insere_data_agenda'
    , force    => true
   );
end;

-- Consultando a tabela agenda
select agenda_id
     , to_char(agenda_data, 'dd/mm/yyyy hh24:mi:ss') agenda_data
  from agenda
 order by agenda_id;
