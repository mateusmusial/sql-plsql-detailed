-- Usando funções no bloco PL/SQL

set serveroutput on;

declare
   l_numero1 number(13, 4);
   l_numero2 number(13, 4);
   l_media   number(13, 4);
begin
   l_numero1 := 5000.82235;
   l_numero2 := 7483.45495;
   l_media   := round((l_numero1 + l_numero2) / 2, 3);

   dbms_output.put_line('Primeiro Número: ' || l_numero1);
   dbms_output.put_line('Segundo Número: ' || l_numero2);
   dbms_output.put_line('Média: ' || to_char(l_media, '99G999G999D999'));
end;