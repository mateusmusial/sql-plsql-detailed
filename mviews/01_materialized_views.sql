-- Visões Materializadas

/* Sintaxe:
 *
 * create materialized view name_mv
 *    build [immedite | deferred]
 *    refresh [fast | complete | force] on [commit | demand]
 *    [[enable | disable] query rewrite]
 *    [on prebuilt table]
 * as
 *    select ...;
*/

-- Criando uma Materialized View
create materialized view department_max_salaries_mv
   build immediate
   refresh complete on demand
   enable query rewrite
as
   select emp.department_id as "ID Departamento"
        , dep.department_name as "Departamento"
        , max(emp.salary) as "Maior Sarlário"
     from employees emp
     join departments dep
       on emp.department_id = dep.department_id
    group by emp.department_id
        , dep.department_name
    order by emp.department_id;

-- Consultando a Materialized View
select *
  from department_max_salaries_mv;
