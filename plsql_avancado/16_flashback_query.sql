-- Flashback Query

-- Fazendo alterações no banco
update employees
   set salary = 100
 where job_id = 'IT_PROG';

commit;

-- Utilizando flashback query pra voltar ao passado
set serveroutput on;
set verify off;
declare
   cursor c_employees is
      select *
        from employees as of timestamp (systimestamp - interval '15' minute)
       where job_id = 'IT_PROG';

   r_employee employees%rowtype;
begin
   open c_employees;

   <<revertendo_linhas>>
   loop
      fetch c_employees into r_employee;
      exit when c_employees%notfound;

      update employees
         set salary = r_employee.salary
       where employee_id = r_employee.employee_id;

      dbms_output.put_line(
         'Salário do ' || r_employee.first_name || ' ' || r_employee.last_name ||
         ' redefinido para: ' || r_employee.salary
      );
   end loop revertendo_linhas;

   close c_employees;

   commit;
end;
