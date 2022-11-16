-- Comando MERGE
--
-- Usado para comparar uma tabela de origem com uma tabela de destino
-- Atualizar ou deletar linhas correspondentes existentes na tabela destino
-- ou se não exitir linhas correspondetes inserir uma nova linha na tabela.

merge into employees_copy cp
using employees emp
   on (cp.employee_id = emp.employee_id)
 when matched then
      update set
           cp.first_name = emp.first_name
         , cp.last_name = emp.last_name
         , cp.email = emp.email
         , cp.phone_number = emp.phone_number
         , cp.hire_date = emp.hire_date
         , cp.job_id = emp.job_id
         , cp.salary = emp.salary
         , cp.commission_pct = emp.commission_pct
         , cp.manager_id = emp.manager_id
         , cp.department_id = emp.department_id
      delete where department_id is null
 when not matched then
      insert values (
               emp.employee_id
             , emp.first_name
             , emp.last_name
             , emp.email
             , emp.phone_number
             , emp.hire_date
             , emp.job_id
             , emp.salary
             , emp.commission_pct
             , emp.manager_id
             , emp.department_id);
