-- Criando um Scheduler (agendamento)

begin
   dbms_scheduler.create_schedule(
      schedule_name   => 'sch_a_cada_10_segundos'
    , start_date      => to_timestamp('2022-09-28 09:00:00', 'yyyy-mm-dd hh24:mi:ss')
    , repeat_interval => 'freq=secondly;interval=10'
    , end_date        => to_timestamp('2022-09-29 14:00:00', 'yyyy-mm-dd hh24:mi:ss')
    , comments        => 'A cada 10 segundos.'
   );
end;

-- Excluindo um Scheduler
begin
   dbms_scheduler.drop_schedule(
      schedule_name => 'sch_a_cada_10_segundos'
    , force         => true -- não remove se estiver referenciado por um JOB
   );
end;
