-- Criando e Gerenciando Constraints
--

-- Definindo CONTRAINT a nível de tabela
create table projects (
   project_id    number(6) not null
 , project_code  varchar2(10) not null
 , project_name  varchar2(100) not null
 , department_id number(4) not null
 , creation_date date default sysdate not null
 , start_date    date
 , end_date      date
 , status        varchar2(20) not null
 , priority      varchar2(10) not null
 , budget        number(11, 2) not null
 , description   varchar2(400) not null
 , constraint projects_project_id_pk primary key (project_id)
 , constraint projects_project_code_uk unique (project_code)
 , constraint projects_department_id_fk foreign key (department_id)
      references departments (department_id)
 , constraint projects_budget_ck check (budget > 0)
);

-- Adicionando uma Constraint a uma Tabela

-- Default NO ACTION, ON DELETE CASCADE, ON DELETE SET NULL
alter table projects
   add constraint projects_department_id_fk foreign key (department_id)
      references departments (department_id) on delete cascade;

alter table projects
   add constraint projects_project_id_pk primary key (project_id);

-- Removendo uma Constraint a uma Tabela
alter table projects
   drop constraint projects_department_id_fk;

alter table projects
   drop constraint projects_project_id_pk cascade;

-- Desabilitando uma Constraint
alter table projects
   disable constraint projects_department_id_fk;

alter table projects
   disable constraint projects_project_id_pk cascade;

-- Habilitando uma Constraint
alter table projects
   enable constraint projects_department_id_fk;

alter table projects
   enable constraint projects_project_id_pk;

-- Consultando Constraints pelo Dicionário de Dados
desc user_constraints;
desc user_cons_columns;

select co.constraint_name
     , co.constraint_type
     , co.search_condition
     , co.r_constraint_name
     , co.delete_rule
     , cc.column_name
     , cc.position
     , co.status
  from user_constraints co
  join user_cons_columns cc
    on (co.constraint_name = cc.constraint_name)
   and (co.table_name = cc.table_name)
 where co.table_name = 'PROJECTS'
 order by co.constraint_name
     , cc.position;
