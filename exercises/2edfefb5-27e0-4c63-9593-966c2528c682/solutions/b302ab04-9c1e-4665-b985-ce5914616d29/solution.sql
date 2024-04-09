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
