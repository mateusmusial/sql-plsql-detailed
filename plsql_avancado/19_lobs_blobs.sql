-- Utilizando BLOBs (Binary Larger Objects)
--
-- Armazena arquivos binários como imagens, sons e videos dentro do banco de dados

-- Conectado como sys/admin
create directory imagens as '~/imagens';
grant read, write on directory imagens to hr;

-- Criando a tabela
create table job_profiles(
   resume_id       number
 , first_name      varchar2(200)
 , last_name       varchar2(200)
 , profile_picture blob
);

-- Importando uma imagens de um arquivo binário para uma coluna BLOB
declare
   l_arquivo_origem bfile;
   l_blob_destino   blob;
   l_nome_arquivo   varchar2(100) := 'curso-oracle.jpeg';
   l_diretorio      varchar2(100) := 'IMAGENS';
begin
   l_arquivo_origem := bfilename(l_diretorio, l_nome_arquivo);

   if dbms_lob.fileexists(l_arquivo_origem) = 1 then
      insert into job_profiles(
         resume_id
       , first_name
       , last_name
       , profile_picture)
      values (
         1
       , 'Oracle'
       , 'Man'
       , empty_blob())
   returning profile_picture into l_blob_destino;

      dbms_lob.open(l_arquivo_origem, dbms_lob.lob_readonly);
      dbms_lob.loadfromfile(
         l_blob_destino
       , l_arquivo_origem
       , dbms_lob.getlength(l_arquivo_origem)
      );
      dbms_lob.close(l_arquivo_origem);

      commit;
   else
      dbms_output.put_line('Arquivo: ' || l_nome_arquivo || ' não existe!');
   end if;
exception
   when others then
      dbms_lob.close(l_arquivo_origem);
      raise_application_error(-20001, 'Erro Oracle ' || sqlcode || sqlerrm);
end;

-- Exportando uma imagens a partir de uma coluna BLOB para um arquivo do S.O.
declare
   l_arquivo_destino      utl_file.file_type;
   l_buffer               raw(32767);
   l_quantidade           binary_integer := 32767;
   l_posicao              integer        := 1;
   l_blob_origem          blob;
   l_tamanho_blob         integer;
   l_nome_arquivo_destino varchar2(100)  := 'curso-oracle-copia.jpeg';
   l_diretorio_destino    varchar2(100)  := 'IMAGENS';
   l_resume_id            number         := 1;
begin
   select profile_picture
     into l_blob_origem
     from job_profiles
    where resume_id = l_resume_id
   for update;

   l_tamanho_blob    := dbms_lob.getlength(l_blob_origem);
   dbms_output.put_line('Tamanho do arquivo: ' || l_tamanho_blob);

   -- Cria o arquivo binário de destino
   l_arquivo_destino := utl_file.fopen(l_diretorio_destino, l_nome_arquivo_destino, 'wb', 32767);

   <<leitura_escrita>>
   while l_posicao < l_tamanho_blob
   loop
      dbms_lob.read(l_blob_origem, l_quantidade, l_posicao, l_buffer);
      utl_file.put_raw(l_arquivo_destino, l_buffer, true);
      l_posicao := l_posicao + l_quantidade;
   end loop leitura_escrita;

   utl_file.fclose(l_arquivo_destino);
exception
   when others then
      if utl_file.is_open(l_arquivo_destino) then
         utl_file.fclose(l_arquivo_destino);
         raise_application_error(-20001, 'Erro Oracle ' || sqlcode || sqlerrm);
      end if;
end;

-- Exemplo de Atualização de uma coluna BLOB
declare
   l_arquivo_origem bfile;
   l_blob_destino   blob;
   l_nome_arquivo   varchar2(100) := 'pl-especialista.jpg';
   l_diretorio      varchar2(100) := 'IMAGENS';
begin
   l_arquivo_origem := bfilename(l_diretorio, l_nome_arquivo);

   if dbms_lob.fileexists(l_arquivo_origem) = 1 then
      select profile_picture
        into l_blob_destino
        from job_profiles
       where resume_id = 1
      for update;

      dbms_lob.open(l_arquivo_origem, dbms_lob.lob_readonly);
      dbms_lob.trim(l_blob_destino, 0);
      dbms_lob.loadfromfile(l_blob_destino, l_arquivo_origem, dbms_lob.getlength(l_arquivo_origem));
      dbms_lob.close(l_arquivo_origem);

      commit;
   else
      dbms_output.put_line('Arquivo: ' || l_nome_arquivo || ' não existe!');
   end if;
exception
   when others then
      dbms_lob.close(l_nome_arquivo);
      raise_application_error(-20001, 'Erro Oracle ' || sqlcode || sqlerrm);
end;
