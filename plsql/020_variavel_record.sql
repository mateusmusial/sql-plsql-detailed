-- Variável tipo RECORD
--
-- Temos o atributo %ROWTYPE que cria um RECORD de uma forma mais fácil.

set serveroutput on;
set verify off; -- Desativa a exibição do cod. fonte na saída.

accept g_employee_id prompt 'Digite o ID do empregado: ';

declare
   type r_employee_type is record(
         employee_id  employees.employee_id%type
       , first_name   employees.first_name%type
       , last_name    employees.last_name%type
       , email        employees.email%type
       , phone_number employees.phone_number%type
      );

   r_employee r_employee_type;
begin
   select employee_id
        , first_name
        , last_name
        , email
        , phone_number
     into r_employee
     from employees
    where employee_id = &g_employee_id;

   dbms_output.put_line(
      r_employee.employee_id || ', ' ||
      r_employee.first_name || ', ' ||
      r_employee.last_name || ', ' ||
      r_employee.email || ', ' ||
      r_employee.phone_number
   );
end;
