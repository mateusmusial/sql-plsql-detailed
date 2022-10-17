-- Funções Single Row
--
--

-- Funções de conversão Maiúsculo & Minúsculo
select *
  from employees
 where upper(last_name) = 'KING';

select *
  from employees
 where lower(last_name) = 'king';

select *
  from employees
 where initcap(last_name) = 'King';

-- Funções de Manipulação de Caracteres
select concat(' Curso: ', 'Introdução ORACLE 19c') "Concatenação de strings"
     , substr('Introdução ORACLE 19c', 1, 11) "String posição 1 até 11"
     , length('Introdução ORACLE 19c') "Tamanho"
     , instr('Introdução ORACLE 19c', 'ORACLE') "Posição onde encontrou string"
     , lpad('Mateus', 20, '*') "Nome alinhado a direita"
     , rpad('Mateus', 20, '*') "Nome alinhado a esquerda"
     , replace('Introdução ORACLE 12c', '12c', '19c') "Onde encontrou string subst."
     , trim('*' from '*mmusial@frimesa**') "Remove de ambos os lados"
     , rtrim('*mmusial@frimesa**', '*') "Remove lado direito"
     , ltrim('*mmusial@frimesa**', '*') "Remove lado esquerdo"
  from dual;

-- Funções tipo NUMBER
select round(45.926, 2) "Arredonda 2 digitos, > 5 cima"
     , round(45.423, 0) "Arredonda 0 digitos < 5 baixo"
     , trunc(45.926, 2) "Sem arredondamento 2 digitos"
     , trunc(45.923, 0) "Sem arredondamento"
     , mod(1300, 600) "Resto divisão"
     , abs(-9) "Valor absoluto"
     , sqrt(9) "Raiz quadrada"
  from dual;

-- Função tipo DATE
select sysdate "Data atual"
     , systimestamp "Data com fuso horário"
     , sysdate + 30 "Operações com data"
     , round((sysdate - to_date('10/05/20')) / 7, 0) "Semanas de trabalho"
     , round(months_between(sysdate, '10/05/2020')) "Meses entre duas datas"
     , add_months(sysdate, 3) "Adiciona meses a data"
     , next_day(sysdate, 'friday') "Proximo dia relativo à data"
     , last_day(sysdate) "Último dia do mês"
     , round(to_date('14/10/22'), 'month') "Arredonda <= 15, dia 01 mês"
     , round(to_date('16/07/22'), 'year') "Arredonda > 7, começo prox ano"
     , trunc(sysdate, 'month') "Começo mês atual"
     , trunc(sysdate, 'year') "Começo ano atual"
     , to_char(trunc(sysdate),'dd/mm/yy hh24:mi:ss') "Começo do dia"
  from dual;
