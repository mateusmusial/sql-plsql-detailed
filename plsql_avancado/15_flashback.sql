-- Package DBMS_FLASHBACK

-- Primeiro demos GRANT para usar a package com o usuário admin
grant execute on dbms_flashback to hr;

-- Fazendo alterações no banco
update employees
   set salary = 100
 where job_id = 'IT_PROG';

commit;

-- Utilizando a package pra voltar ao passado
set serveroutput on;
set verify off;
declare
   cursor c_employees is
      select *
        from employees
       where job_id = 'IT_PROG';

   r_employee employees%rowtype;
begin
   dbms_flashback.enable_at_time(sysdate - 30 / 1440); -- voltando 30 minutos atrás
   open c_employees; -- abrindo o cursor com os dados de 30 min atrás
   dbms_flashback.disable; -- voltando ao presente

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
