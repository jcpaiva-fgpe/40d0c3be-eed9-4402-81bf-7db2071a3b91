CREATE OR REPLACE FUNCTION get_subordinados_departamento(_department_id int)
	RETURNS varchar(30)
	LANGUAGE plpgsql
AS $function$
	DECLARE 
		contador_empleados int;
		valor_devuelto varchar(30);
	BEGIN
		SELECT COUNT(*)
		into
			contador_empleados
		from
			departments join employees using (department_id)
		where
			DEPARTMENT_ID = _department_id;
		
		case contador_empleados
			when 0 then valor_devuelto := 'Sin empleados';
			when 1 then valor_devuelto := 'Solo el jefe';
			else valor_devuelto := contador_empleados - 1;
		end case;
	
		return valor_devuelto;
	END;
$function$
;
