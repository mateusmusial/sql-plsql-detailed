-- Lendo um arquivo na pasta ARQUIVOS

set serveroutput on;
set verify off;

declare
   l_file     utl_file.file_type;
   l_registro varchar2(400);
begin
   -- Parâmetros: diretório, arquivo, 'r'-read, buffer arquivo.
   l_file := utl_file.fopen('ARQUIVOS', 'employees.txt', 'r', 32767);

   <<lendo_arquivo>>
   loop
      utl_file.get_line(l_file, l_registro);
      dbms_output.put_line(l_registro);
   end loop lendo_arquivo;
exception
   when no_data_found then
      utl_file.fclose(l_file);
      dbms_output.put_line('Arquivo Texto employees.txt lido com sucesso');
   when utl_file.invalid_path then
      utl_file.fclose(l_file);
      dbms_output.put_line('Diretório Inválido');
   when others then
      utl_file.fclose(l_file);
      dbms_output.put_line('Erro Oracle:' || sqlcode || sqlerrm);
end;
