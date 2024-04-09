CREATE OR REPLACE FUNCTION get_empleados_count(_department_id int)
	RETURNS int
	LANGUAGE plpgsql
AS $function$
	DECLARE 
		contador_empleados int;
	BEGIN
		SELECT COUNT(*)
		into
			contador_empleados
		from
			employees
		where
			DEPARTMENT_ID = _department_id;
		return contador_empleados;
	END;
$function$
