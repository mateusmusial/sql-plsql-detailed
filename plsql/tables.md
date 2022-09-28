## Objetos do Usuário

`user_objects` - Objetos do usuário;
`all_objects` - Objetos que o usuário tem permissão;
`dba_objects` - Objetos de todo o banco (apenas DBA).

`user_source` - Consulta código fonte dos objetos do usuário;
`all_source` - Consulta código fonte dos objetos que o usuário tem permissão;
`dba_source` - Código fonte de todos os objetos o banco (apenas DBA).

## Mostrar Erros de Compilação

```sql
show errors procedure name_procedure;

show errors function name_function;

show errors package name_package;
```

`user_errors` - Erros de compilação do usuário;
`all_errors` - Erros de compilação do usuário conectado e que tem privilégios;
`dba_errors` - Erros de todo o banco de dados (apenas DBA).

## Dependências de Objetos

`user_dependencies` - Dependências de objetos do usuário;
`all_dependencies` - Dependências de objetos que o usuário tem permissão;
`dba_dependencies` - Dependências de todos os objetos do banco (apenas DBA).
