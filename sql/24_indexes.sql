-- Criando e Gerenciando Índices
--

-- Criando um índice simples
create index employees_last_name_idx 
   on employees (last_name);

-- Criando um índice composto
create index employees_last_name_first_name_idx
   on employees (last_name, first_name);
   
-- Reconstruindo e reorganizando um índice
alter index employees_last_name_first_name_idx rebuild;

-- Removendo um índice
drop index employees_last_name_idx;

-- Consultando índices
select ix.index_name
     , ic.column_position
     , ic.column_name
     , ix.index_type
     , ix.uniqueness
     , ix.status
  from user_indexes ix
  join user_ind_columns ic
    on (ix.index_name = ic.index_name)
   and (ix.table_name = ic.table_name)
 where ix.table_name = 'EMPLOYEES'
 order by ix.index_name
     , ic.column_position;