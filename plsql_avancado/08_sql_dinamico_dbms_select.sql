-- SQL Dinamico - DBMS_SQL

-- Comando SELECT

set serveroutput on;
set verify off;
declare
   l_cursor_id  integer;
   l_row_count  number;
   l_first_name varchar2(30);
   l_last_name  varchar2(30);
begin
   l_cursor_id := dbms_sql.open_cursor;

   dbms_sql.parse(
      l_cursor_id
    , 'select first_name
            , last_name
         from employees'
    , dbms_sql.native
   );

   -- id cursor, posição coluna, variavel armazenamento, tamanho
   dbms_sql.define_column(l_cursor_id, 1, l_first_name, 30);
   dbms_sql.define_column(l_cursor_id, 2, l_last_name, 30);

   l_row_count := dbms_sql.execute_and_fetch(l_cursor_id);

   loop
      exit when dbms_sql.fetch_rows(l_cursor_id) = 0;

      dbms_sql.column_value(l_cursor_id, 1, l_first_name);
      dbms_sql.column_value(l_cursor_id, 2, l_last_name);

      dbms_output.put_line(l_first_name || ', ' || l_first_name);
   end loop;

   dbms_sql.close_cursor(l_cursor_id);
end;
