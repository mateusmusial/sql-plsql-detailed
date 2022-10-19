-- Cláusula FOR UPDATE no comando SELECT
--
-- SELECT com lock nas linhas recuperadas
-- As linhas são liberadas após o COMMIT

select employee_id, salary, commission_pct, job_id
  from employees
 where job_id = 'SA_REP'
for update
 order by employee_id;

commit;

select e.employee_id, e.salary, e.commission_pct
  from employees e
  join departments d
 using (department_id)
 where job_id = 'ST_CLERK'
   and location_id = 1500
for update of e.salary
 order by e.employee_id;

commit;