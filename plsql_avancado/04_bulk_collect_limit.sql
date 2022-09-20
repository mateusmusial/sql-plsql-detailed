-- Bulk Collect com LIMIT
--
-- Programa usado para quando temos uma tabela com muitas linhas,
-- com isso não afetamos a performace do banco.

set serveroutput on;
set verify off;

create or replace procedure update_salary_all_v2(in_percent in number) is
   type t_employee_id_type is table of employees.employee_id%type index by binary_integer;
   cursor c_employee_id is
      select employee_id
        from employees;

   t_employee_id t_employee_id_type;
   co_limit      constant integer(2) := 30;
begin
   open c_employee_id;
   <<update_limited_lines>>
   loop
      fetch c_employee_id
         bulk collect into t_employee_id limit co_limit; -- Limitamos a coleta em 30 linhas
      exit when t_employee_id.count = 0;

      dbms_output.put_line('Linhas recuperadas: ' || t_employee_id.count);

      -- FORALL empacota todos os UPDATES e envia o pacote em 1 única troca de contexto (Context Switch)
      -- Isso melhora a performace do programa
      forall i in t_employee_id.first..t_employee_id.last
         update employees
            set salary = salary * (1 + in_percent / 100)
          where employee_id = t_employee_id(i);

      dbms_output.put_line('Número de empregados atualizados: ' || sql%rowcount);
   end loop update_limited_lines;
   close c_employee_id;
end update_salary_all_v2;
