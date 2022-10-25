-- Criando Sinônimos
--

-- Criando Sinonimos Privados
create synonym departamentos
   for departments;

create synonym dept
   for departments;
   
-- Removendo Sinônimos Privados
drop synonym departamentos;
drop synonym dept;

-- Criando Sinônimos Públicos para Tabelas em outro Schema
-- Apenas SYS/ADMIN podem criar sinônimos publicos ou quem tem o privilégio 
create public synonym departamentos
   for hr.departments;

create public synonym dept
   for hr.departments;

-- Removendo Sinônimos Públicos
-- Apenas SYS/ADMIN
drop public synonym departamentos;
drop public synonym dept;