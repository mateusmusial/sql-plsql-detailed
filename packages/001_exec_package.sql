-- Referenciando componentes da package

set serveroutput on;
begin
   employees_api.insert_employee(
      'Sandoval'
    , 'Barbosa'
    , 'SBARBOSA'
    , '515.453.6345'
    , sysdate
    , 'IT_PROG'
    , 20000
    , null
    , 103
    , 60);

   commit;
end;

-- Utilizando outro componente da package
declare
   r_employee employees%rowtype;
begin
   employees_api.search_employee(217, r_employee);

   dbms_output.put_line(
      r_employee.employee_id || ', ' ||
      r_employee.first_name || ', ' ||
      r_employee.last_name || ', ' ||
      r_employee.email || ', ' ||
      r_employee.phone_number || ', ' ||
      r_employee.hire_date || ', ' ||
      r_employee.job_id || ', ' ||
      r_employee.salary || ', ' ||
      r_employee.commission_pct || ', ' ||
      r_employee.manager_id || ', ' ||
      r_employee.department_id
   );
end;
