-- Query para uma lista de valores separados com vírgula usando variavel bind.
select *
  from employees emp
 where instr(nvl(:p_emp_id, emp.employee_id), emp.employee_id) > 0
