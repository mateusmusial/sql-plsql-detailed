-- Utilizando BFILEs
--
-- Armazenando imagens em uma coluna BFILE localizado fora do banco de dados.

declare
   l_nome_arquivo   varchar2(100) := 'curso-oracle.jpeg';
   l_diretorio      varchar2(100) := 'IMAGENS';
   l_arquivo_origem bfile;
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
       , l_arquivo_origem);
      commit;
   end if;
exception
   when others then
      raise_application_error(-20001, 'Erro Oracle ' || sqlcode || sqlerrm);
end;
