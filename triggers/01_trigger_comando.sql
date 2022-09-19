create or replace trigger employees_bs_iud
before insert or update or delete on employees
begin
   if to_char(sysdate, 'day') in ('saturday', 'sunday')
      or to_number(to_char(sysdate, 'HH24')) not between 8 and 18
   then
      case
         when inserting then
            raise_application_error(
               -20001
             , 'O cadastro de empregados é permitido apenas em dia de semana e horário comercial.'
            );
         when deleting then
            raise_application_error(
               -20001
             , 'A deleção de empregados é permitido apenas em dia de semana e horário comercial.'
            );
         else -- updating
            raise_application_error(
               -20001
             , 'A atualização de empregados é permitido apenas em dia de semana e horário comercial.'
            );
      end case;
   end if;
end employees_bs_iud;

-- Outro exemplo
create or replace trigger employees_bs_i
before insert on employees
begin
   if to_char(sysdate, 'day') in ('saturday', 'sunday')
      or to_number(to_char(sysdate, 'HH24')) not between 8 and 18
   then
      raise_application_error(
         -20001
       , 'O cadastro de empregados é permitido apenas em dia de semana e horário comercial.'
      );
   end if;
end employees_bs_i;
