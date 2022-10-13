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

## Tipos de Variáveis

(1) `:`          : Usado para substituir uma variável permanentemente em uma sessão
(2) `&`          : Usado para substituir uma variável temporariamente em uma sessão
(3) `&&`         : Usado para substituir uma variável permanentemente em uma sessão
(4) `DEFINE`     : Usado para definir uma variável
(5) `UNDEFINE`   : Usado para indefinir uma variável
(6) `ACCEPT`     : Usado para declarar e aceitar o valor de uma variável permanentemente
(7) `PROMPT`     : Usado para solicitar um valor e também usado com o comando ACCEPT para solicitar um texto
(8) `VARIABLE`   : Usado para declarar uma variável e pode ser usado com o operador ':' para substituir uma variável
