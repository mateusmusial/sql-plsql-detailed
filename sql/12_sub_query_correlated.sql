-- Utilizando Sub-Consultas Correlacionadas

-- Salário maior ou igual a média do seu deparamento
select emp1.employee_id
     , emp1.first_name
     , emp1.last_name
     , emp1.department_id
     , emp1.salary
  from employees emp1
 where emp1.salary >= (select avg(salary)
                         from employees emp2
                        where emp1.department_id = emp2.department_id);

-- Sub-Consulta Correlacionada na Cláusula SELECT
select emp.employee_id
     , emp.first_name
     , emp.last_name
     , emp.phone_number
     , emp.department_id
     , (
          select dep.department_name
            from departments dep
           where emp.department_id = dep.department_id
       ) department
     , emp.salary
  from employees emp;
