-- Comando SELECT no PL/SQL

set serveroutput on;

declare
   l_first_name  employees.first_name%type;
   l_last_name   employees.last_name%type;
   l_salary      employees.salary%type;
   l_employee_id employees.employee_id%type := 108;
begin
   -- O comando select deve retornar apenas uma linha.
   select first_name
        , last_name
        , salary
     into l_first_name
        , l_last_name
        , l_salary
     from employees
    where employee_id = l_employee_id;

   dbms_output.put_line(
      'Nome: ' || l_first_name || ' ' || l_last_name ||
      ', Salário:' || to_char(l_salary, 'l999g999d99')
   );
end;

-- Utilizando funções de agregação

declare
   l_job_id     employees.job_id%type := 'IT_PROG';
   l_job_title  jobs.job_title%type;
   l_avg_salary employees.salary%type;
   l_sum_salary employees.salary%type;
begin
   select round(avg(employees.salary), 2)
        , round(sum(employees.salary), 2)
        , jobs.job_title
     into l_avg_salary
        , l_sum_salary
        , l_job_title
     from employees
     join jobs
       on (employees.job_id = jobs.job_id)
    where employees.job_id = l_job_id
    group by jobs.job_title;

   dbms_output.put_line(
      'Cargo: ' || l_job_title ||
      ', Média Salárial:' || to_char(l_avg_salary, 'l999g999d99') ||
      ', Soma dos Salário:' || to_char(l_sum_salary, 'l999g999d99')
   );
end;
