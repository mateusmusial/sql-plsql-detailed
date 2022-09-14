-- Utilizando o comando IF

set serveroutput on;

accept g_department_id prompt 'Digite o ID do departamento: ';
declare
   l_percentual    number(3);
   l_department_id employees.department_id%type := &g_department_id;
begin
   if l_department_id = 80 then
      l_percentual := 10;
   else
      if l_department_id = 20 then
         l_percentual := 15;
      else
         if l_department_id = 60 then
            l_percentual := 20;
         else
            l_percentual := 5;
         end if;
      end if;
   end if;

   dbms_output.put_line('ID do Departamento: ' || l_department_id);
   dbms_output.put_line('Percentual: ' || l_percentual);

   update employees
      set salary = salary * (1 + l_percentual / 100)
    where department_id = l_department_id;

   dbms_output.put_line('Número de empregados atualizados: ' || sql%rowcount);

   commit;
end;

-- Comando ELSIF

declare
   l_percentual    number(3);
   l_department_id employees.department_id%type := &g_department_id;
begin
   if l_department_id = 80 then
      l_percentual := 10;
   elsif l_department_id = 20 then
      l_percentual := 15;
   elsif l_department_id = 60 then
      l_percentual := 20;
   else
      l_percentual := 5;
   end if;

   dbms_output.put_line('ID do Departamento: ' || l_department_id);
   dbms_output.put_line('Percentual: ' || l_percentual);

   update employees
      set salary = salary * (1 + l_percentual / 100)
    where department_id = l_department_id;

   dbms_output.put_line('Número de empregados atualizados: ' || sql%rowcount);

   commit;
end;
