-- SQL Dinâmico com DBMS_SQL

set serveroutput on;
set verify off;

create or replace procedure update_emp_salary_dyn(
   in_employee_id in employees.employee_id%type
 , in_percentual  in number
) is
   l_cursor_id      integer;
   l_rows_processed integer;
begin
   -- open cursor
   l_cursor_id      := dbms_sql.open_cursor;

   -- parsing comando SQL
   dbms_sql.parse(
      l_cursor_id
    , 'update employees
          set salary = salary * (1 + (:g_percentual / 100))
        where employee_id = :g_employee_id'
    , dbms_sql.native
   );

   -- binding variáveis
   dbms_sql.bind_variable(l_cursor_id, 'g_percentual', in_percentual);
   dbms_sql.bind_variable(l_cursor_id, 'g_employee_id', in_employee_id);

   -- executando o cursor
   l_rows_processed := dbms_sql.execute(l_cursor_id);

   -- close cursor
   dbms_sql.close_cursor(l_cursor_id);
exception
   when others then
      raise_application_error(-20001, 'Erro Oracle ' || sqlcode || sqlerrm);
end;

-- Executando a Procedure
exec update_emp_salary_dyn(109, 10);
