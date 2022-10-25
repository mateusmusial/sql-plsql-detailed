## Pesquisar código fonte de Views e MViews

`user_views` - Código fonte das views do usuário;
`all_views` - Código fonte das views do usuário e as que ele tem permissão.

`user_mviews` - Código fonte das mviews do usuário;
`all_mviews` - Código fonte das mviews do usuário e as que ele tem permissão.

## Operadores de Comparação

(1)  `=`                      : Igual a ...
(2)  `>`                      : Maior que ...
(3)  `>=`                     : Maior ou igual a ...
(4)  `<`                      : Menor que ...
(5)  `<=`                     : Menor ou igual a ...
(6)  `<>`, `!=`               : Não é igual a ...
(7)  `BETWEEN ... AND ...`    : Entre dois valores (inclusive)
(8)  `[NOT] IN (...)`         : Qualquer um da lista de valores
(9)  `LIKE '_a%'`             : Encontra um padrão de caracteres
(10) `[NOT] IS NULL`          : Comparação com o valor NULL

## Tipos de Dados para Criação de Tabela

`VARCHAR2(tam)` - Carctere com tamanho variável
`CHAR(tam)` - Caractere com tamanho fixo
`DATE` - Data e hora (dia, mês, ano, hora, minuto, segundo)
`NUMBER(p, s)` - Valor numérico tamanho variável
`LONG` - Caractere tamanho variável de até 2GB (obsoleto)
`CLOB` - Caractere tamanho variável de até 4GB (moderno)
`RAW` - Dados binários, sons, imagens, arquivos.. (obsoleto)
`LONG RAW` - Dados binários, sons, imagens, arquivos.. até 2GB (obsoleto)
`BLOB` - Dados binários de até 4GB (moderno)
`BFILE` - Ponteiro para um arquivo externo ao banco de 4GB
`ROWID` - Enderço único de uma linha na tabela
`BINARY_FLOAT` - Ponto flutuante de 32bits
`BINARY_DOUBLE` - Ponto flutuante de 64bits
`TIMESTAMP` - Data com 9 digitos decimais de segundo
`INTERVAL YEAR TO MONTH` - Intervalo de anos e meses
`INTERVAL DAY TO SECOND` - Intervalo de dias, horas, minutos, segundos


## Sequences

`user_sequences` - Sequências do usuário

## Índices e Constraints

`user_indexes` - Índices da tabela do usuário;
`user_ind_columns` - Colunas que contém os índices criados pelo usuário.

`user_constraints` - Constraints das tabelas do usuário;
`user_cons_columns` - Colunas que contém contraints das tabelas do usuário.


## Visões do Dicionário de Dado

`dictionary` - Tabela que contém todas as visões do dicionário de dados do Oracle.
