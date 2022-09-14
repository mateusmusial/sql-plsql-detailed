-- Datatypes

set serveroutput on;

declare
   l_numero               number(11, 2)            := 1200.50;
   l_caracter_fixo        char(100)                := 'Texto de tamanho fixo de até 32767 bytes';
   l_caracter_variavel    varchar2(100)            := 'Texto tamanho variável de até 32767 bytes';
   l_boolean              boolean                  := true;
   l_data                 date                     := sysdate;
   l_long                 long                     := 'Texto tamanho variável de até 32767 bytes';
   l_rowid                rowid;
   l_timestamp            timestamp                := systimestamp;
   l_timestamptz          timestamp with time zone := systimestamp;
   l_caract_universal_fix nchar(100)               := 'Texto de tamanho fixo universal de até 32767 bytes';
   l_caract_universal_var nvarchar2(100)           := 'Texto de tamanho variável universal de até 32767 bytes';
   l_inteiro              binary_integer           := 1200;
   l_float                binary_float             := 15000000;
   l_double               binary_double            := 15000000;
begin
   dbms_output.put_line('Numero: ' || l_numero);
   dbms_output.put_line('Caracteres de tamanho fixo: ' || l_caracter_fixo);
   dbms_output.put_line('Caracteres de tamanho variável: ' || l_caracter_variavel);

   if l_boolean = true then
      dbms_output.put_line('Boolean: ' || 'TRUE');
   else
      dbms_output.put_line('Boolean: ' || 'FALSE OR NULL');
   end if;

   dbms_output.put_line('Data: ' || l_data);
   dbms_output.put_line('Long: ' || l_long);

   select rowid
     into l_rowid
     from employees
    where first_name = 'Steven'
      and last_name = 'King';
   dbms_output.put_line('Rowid: ' || l_rowid);

   dbms_output.put_line('Timestamp: ' || l_timestamp);
   dbms_output.put_line('Timespamptz: ' || l_timestamptz);
   dbms_output.put_line('String caracteres tamanho fixo: ' || l_caract_universal_fix);
   dbms_output.put_line('String caracteres tamanho variável: ' || l_caract_universal_var);
   dbms_output.put_line('Número inteiro: ' || l_inteiro);
   dbms_output.put_line('Número float: ' || l_float);
   dbms_output.put_line('Número double: ' || l_double);

end;
