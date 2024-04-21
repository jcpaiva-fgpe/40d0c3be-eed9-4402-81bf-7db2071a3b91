CREATE or replace FUNCTION empleados_antiguedad_1990()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
declare 
	anyo_empleado int;
BEGIN
   select extract(year from hire_date)
   into anyo_empleado
   from employees where employee_id = old.employee_id;
  
   if anyo_empleado < 1995 then
   	raise 'No se pueden eliminar empleados que entraron antes de 1995';  
   end if;
  
   return old;
END;
$$;

CREATE TRIGGER eliminar_empleado
BEFORE DELETE
ON employees
FOR EACH ROW
EXECUTE PROCEDURE empleados_antiguedad_1990();