-- Comandos DML - Manipulando dados 
--

-- Utilizando o Comando INSERT
insert into departments(department_id, department_name, manager_id, location_id)
   values (280, 'Project Management', 103, 1400);
   
insert into departments
   values (290, 'Data Science', null, null);

insert into employees(employee_id, first_name, last_name, email, 
                        phone_number, hire_date, job_id, salary, 
                        commission_pct, department_id)
   values (207, 'Rock', 'Balboa', 'DROCK', '525.342.237',
            'IT_PROG', 7000, null, 103, 60);
 
-- Inserindo linhas a partir de uma Sub-consulta
insert into sales_reps(id, name, salary, commission_pct)
   select employee_id
        , last_name
        , salary
        , commission_pct
     from employees
    where job_id = 'SA_REP';