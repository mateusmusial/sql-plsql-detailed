-- Utilizando Sub-consultas Multiple-Column

select e1.employee_id
     , e1.first_name
     , e1.job_id
     , e1.salary
  from employees e1
 where (e1.job_id, e1.salary) in (select e2.job_id
                                       , max(e2.salary)
                                    from employees e2
                                   group by e2.job_id);
