## Jobs

`user_scheduler_job_args` - Argumentos configurado para todos os jobs;
`user_scheduler_job_log` - Informacoes de log de todos os jobs;
`user_scheduler_job_run_details` - Detalhes de execuções de jobs;
`user_scheduler_jobs` - Lista dos jobs agendados.

## Undo

Usuário sys ou admin: verificar os parâmetros do segmento de undo.
Usado para dar flashback no banco, guardando o histórico do mesmo nesse segmento.

```sql
select name, value
  from v$parameter
 where name like '%undo%';
```
