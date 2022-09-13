-- Exceções definidas pelo desenvolvedor

set serveroutput on;
set verify off;

accept g_employee_id prompt 'Digite o ID do empregado: ';
declare
   l_first_name  employees.first_name%type;
   l_last_name   employees.last_name%type;
   l_job_id      employees.job_id%type;
   l_employee_id employees.employee_id%type := &g_employee_id;
   e_president   exception;
begin
   select first_name
        , last_name
        , job_id
     into l_first_name
        , l_last_name
        , l_job_id
     from employees
    where employee_id = l_employee_id;

   if l_job_id = 'AD_PRES' then
      raise e_president;
   end if;
exception
   when no_data_found then
      rais_application_error(-20001, 'Empregado não encontrado, id: ' || to_char(l_employee_id));
   when e_president then
      update employees
         set salary = salary * 1.5
       where employee_id = l_employee_id;
       commit;
   when others then
      raise_application_error(-20002, 'Erro Oracle - ' || sqlcode || sqlerrm);
end;