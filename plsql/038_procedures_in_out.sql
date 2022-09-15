-- Parâmetros IN OUT

-- The IN OUT parameter allows us to pass values into a procedure and get output values from the procedure.
-- This parameter is used if the value of the IN parameter can be changed in the calling program.
--
-- By using IN OUT parameter we can pass values into a parameter and return a value to
-- the calling program using the same parameter.
-- But this is possible only if the value passed to the procedure and output value have a same datatype.
-- This parameter is used if the value of the parameter will be changed in the procedure.

create or replace procedure sum_five(
   io_number in out number
) is
begin
   io_number := io_number + 5;
end;

-- Executando a Procedure
set serveroutput on;
declare
   l_number number(11,2) := 3;
begin
   sum_five(l_number);

   dbms_output.put_line(l_number);
end;
