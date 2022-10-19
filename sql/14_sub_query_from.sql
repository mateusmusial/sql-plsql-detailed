-- Utilizando Sub-Consultas na Cláusula FROM

select empregados.employee_id
     , empregados.first_name
     , empregados.last_name
     , empregados.job_id
     , empregados.salary
     , round(max_salary_job.max_salary, 2) max_salary
     , empregados.salary - round(max_salary_job.max_salary, 2) difference
  from employees empregados
  left join (select e2.job_id
                  , max(e2.salary) max_salary
               from employees e2
              group by e2.job_id) max_salary_job
    on empregados.job_id = max_salary_job.job_id;
