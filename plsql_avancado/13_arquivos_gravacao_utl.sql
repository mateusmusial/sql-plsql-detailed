-- Gravando arquivo de texto na pasta ARQUIVOS no sistema operacional do banco.

-- Conectar com usuário sys e dar permissões:
create or replace directory arquivos as '~/arquivos';
grant read, write on directory arquivos to hr;

-- Gravando texto no arquivo employees.txt
set serveroutput on;
set verify off;

declare
   cursor c_employees is
      select employee_id
           , first_name
           , last_name
           , job_id
           , salary
        from employees;

   l_file utl_file.file_type;
begin
   -- Parâmetros: diretório, arquivo, 'w'-write, buffer arquivo.
   l_file := utl_file.fopen('ARQUIVOS', 'employees.txt', 'w', 32767);

   <<gravar_arquivo>>
   for r_employee in c_employees
   loop
      utl_file.put_line(
         l_file
       , r_employee.employee_id || ';' ||
         r_employee.first_name || ';' ||
         r_employee.last_name || ';' ||
         r_employee.job_id || ';' ||
         r_employee.salary
      );
   end loop gravar_arquivo;

   utl_file.fclose(l_file);

   dbms_output.put_line('Arquivo gerado com sucesso!');
exception
   when utl_file.invalid_path then
      utl_file.fclose(l_file);
      dbms_output.put_line('Diretório Inválido');
   when utl_file.invalid_operation then
      utl_file.fclose(l_file);
      dbms_output.put_line('Operação invalida no arquivo');
   when utl_file.write_error then
      utl_file.fclose(l_file);
      dbms_output.put_line('Erro de gravação no arquivo');
   when utl_file.invalid_mode then
      utl_file.fclose(l_file);
      dbms_output.put_line('Modo de acesso inválido');
   when others then
      utl_file.fclose(l_file);
      dbms_output.put_line('Erro Oracle:' || sqlcode || sqlerrm);
end;
