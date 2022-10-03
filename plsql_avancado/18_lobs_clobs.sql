-- Utilizando CLOBs (Caracter Larger Objects)
--
-- Armazenam string de caracteres unicode dentro do banco de dados
-- Tamanho máximo 4GB - 1B * DB_BLOCK_SIZE
-- DB_BLOCK_SIZE - Parâmetro que define o tamanho do bloco do banco de dados
-- Tamanho entre 8TB e 128TB

-- Criando tabela com CLOB
create table job_resumes (
   resume_id   number
 , first_name  varchar2(200)
 , last_name   varchar2(200)
 , resume      clob
);

-- Inserindo dados na tabela
insert into job_resumes (resume_id, first_name, last_name, resume)
values (1, 'Paul', 'Jones', empty_clob()); -- Inicializa o CLOB criando localizador
commit;

insert into job_resumes (resume_id, first_name, last_name, resume)
values (2, 'Robert', 'Johnson', 'Project Manager - Scrum Master, Porto Alegre, RS, Brasil');
commit;

-- Quando o CLOB for menor que 100KB podemos usar funções SQL normalmente,
-- quando o CLOB maior que isso devemos utilizar a package DBMS_LOB.

-- Consultando dados da tabela
select dbms_lob.substr(resume, 10, 1) substr_10p_s1
     , dbms_lob.getlength(resume) tamanho
     , dbms_lob.substr(resume, dbms_lob.getlength(resume), 1) resume_dbms
     , substr(resume, 1, 30) substr_s1_30p  -- < 100KB
     , length(resume) tamanho_len           -- < 100KB
     , resume
  from job_resumes;

-- Utilizando CLOBs no PL/SQL
create or replace procedure insert_resume(
   in_resume_id in job_resumes.resume_id%type
 , in_resume    in varchar2
) is
   l_resume_localizador clob;
   l_tamanho_texto      number;
   l_deslocamento       number;
begin
   select resume
     into l_resume_localizador
     from job_resumes
    where resume_id = in_resume_id
   for update;

   l_deslocamento  := 1;
   l_tamanho_texto := length(in_resume);
   dbms_lob.write(
      l_resume_localizador
    , l_tamanho_texto
    , l_deslocamento
    , in_resume
   );
   commit;
end;

exec insert_resume(1, 'DBA - Database administrator, Porto Alegre, RS, Brasil ');

-- Exibir resume
create or replace procedure show_resume(
   in_resume_id in job_resumes.resume_id%type
) is
   l_resume_localizador clob;
   l_tamanho_texto      number;
   l_deslocamento       number;
   l_texto              varchar2(32767);
   l_loop               number;
   l_quantidade         number := 1;
   l_exibe              varchar2(240);
begin
   select resume
     into l_resume_localizador
     from job_resumes
    where resume_id = in_resume_id
   for update;

   l_deslocamento  := 1;
   l_tamanho_texto := dbms_lob.getlength(l_resume_localizador);
   dbms_lob.read(
      l_resume_localizador
    , l_tamanho_texto
    , l_deslocamento
    , l_texto
   );

   l_loop          := trunc((length(l_texto)) / 240) + 1;
   for i in 1..l_loop
   loop
      l_exibe      := substr(l_texto, l_quantidade, 240);
      l_quantidade := l_quantidade + 240;

      dbms_output.put_line(l_exibe);
   end loop;
   commit;
end;

set serveroutput on;
exec show_resume(1);
