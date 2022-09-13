-- Comando CASE

set serveroutput on;

accept g_department_id prompt 'Digite o ID do departamento: ';
declare
   l_percentual    number(3);
   l_department_id employees.department_id%type := &g_department_id;
begin
   case l_department_id
      when 80 then
         l_percentual := 10;
      when 20 then
         l_percentual := 15;
      when 60 then
         l_percentual := 20;
      else
         l_percentual := 5;
   end case;

   dbms_output.put_line('ID do Departamento: ' || l_department_id);
   dbms_output.put_line('Percentual: ' || l_percentual);

   update employees
      set salary = salary * (1 + l_percentual / 100)
    where department_id = l_department_id;

   dbms_output.put_line('Número de empregados atualizados: ' || sql%rowcount);

   commit;
end;

-- Outra sintaxe do comando CASE

declare
   l_percentual    number(3);
   l_department_id employees.department_id%type := &g_department_id;
begin
   case
      when l_department_id = 80 then
         l_percentual := 10;
      when l_department_id = 20 then
         l_percentual := 15;
      when l_department_id = 60 then
         l_percentual := 20;
      else
         l_percentual := 5;
   end case;

   dbms_output.put_line('ID do Departamento: ' || l_department_id);
   dbms_output.put_line('Percentual: ' || l_percentual);

   update employees
      set salary = salary * (1 + l_percentual / 100)
    where department_id = l_department_id;

   dbms_output.put_line('Número de empregados atualizados: ' || sql%rowcount);

   commit;
end;