-- Visões Materializadas agendando atualizações periodicas
--
-- Atualizará todo dia no mesmo horário que a MV foi compilada.

create materialized view employees_mv
   build immediate
   refresh complete on demand
   next sysdate + 1
   enable query rewrite
as
   select emp.employee_id as "ID Empregado"
        , emp.first_name as "Nome"
        , emp.last_name as "Sobrenome"
        , emp.department_id as "ID Departamento"
        , dep.department_name as "Departamento"
        , emp.salary as "Sarlário"
     from employees emp
     join departments dep
       on emp.department_id = dep.department_id
    order by emp.department_id;
