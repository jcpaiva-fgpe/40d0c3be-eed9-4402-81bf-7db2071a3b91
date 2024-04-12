-- ------------
-- Ejercicio 1
-- ------------
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

-- ------------
-- Ejercicio 2
-- ------------
select get_empleados_count(30) as dep_30, get_empleados_count(90) as dep_90;

-- ------------
-- Ejercicio 3
-- ------------
SELECT department_id, get_empleados_count(department_id) as n_empleados from EMPLOYEES E
group by DEPARTMENT_ID
order by n_empleados desc;

-- ------------
-- Ejercicio 4
-- ------------

CREATE OR REPLACE FUNCTION antiguedad(_first_name VARCHAR(20), _last_name VARCHAR(25))
	RETURNS integer
	LANGUAGE plpgsql
AS $function$
	declare
		antiguedad integer;
	BEGIN
		select extract(year from age(CURRENT_DATE, hire_date)) into antiguedad
		from employees
		where last_name = _last_name and first_name = _first_name;
	
		return antiguedad;
	END;
$function$
;
-- ------------
-- Ejercicio 5
-- ------------
CREATE OR REPLACE FUNCTION get_empleados_count(_department_id int)
	RETURNS int
	LANGUAGE plpgsql
AS $function$
	DECLARE 
		contador_empleados int;
	BEGIN
		if _department_id is NULL then
	        contador_empleados := null;
	    else
			SELECT COUNT(*)
			into
				contador_empleados
			from
				employees
			where
				DEPARTMENT_ID = _department_id;
	    end if;
		return contador_empleados;
	END;
$function$
;

