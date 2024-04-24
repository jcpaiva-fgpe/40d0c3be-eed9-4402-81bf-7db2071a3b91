CREATE or replace FUNCTION comprueba_departamento()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
declare 
	departamento_empleado int;
BEGIN
   select department_id 
   into departamento_empleado
   from employees where employee_id = new.employee_id;
  
  if departamento_empleado <> new.department_id then
  	new.department_id = departamento_empleado;
  end if;
  
  return new;
END;
$$;

create or replace TRIGGER comprobar_departamento_historico
before INSERT
ON job_history
FOR EACH ROW
EXECUTE FUNCTION comprueba_departamento();