-- Query para uma lista de valores separados com vírgula usando variavel bind.
select *
  from employees emp
 where instr(nvl(:p_emp_id, emp.employee_id), emp.employee_id) > 0

-- Query para buscar apenas algumas linhas
select emp.*
     , dep.*
  from employees emp
     , departments dep
 where 1 = 1
   and emp.department_id = dep.department_id
   and rownum <= 5;

select *
  from employees fetch first 5 rows only;
