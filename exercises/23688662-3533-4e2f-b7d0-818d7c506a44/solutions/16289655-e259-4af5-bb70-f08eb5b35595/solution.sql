CREATE OR REPLACE FUNCTION sustituto_por_antiguedad(_department_id int)
	RETURNS varchar(50)
	LANGUAGE plpgsql
AS $function$
	DECLARE 
		_manager_id int;
		valor_devuelto varchar(30);
	BEGIN
		select manager_id
			into _manager_id
			from departments
			where department_id = _department_id;

		select employee_id || ' - ' || last_name || ', ' || first_name
			into valor_devuelto
			from EMPLOYEES E
			where department_id = _department_id
				and HIRE_DATE <= all (
					select hire_date
					from employees
					where DEPARTMENT_ID = _department_id and EMPLOYEE_ID != _manager_id
				)
				and EMPLOYEE_ID != _manager_id;
			
		if valor_devuelto is null then  valor_devuelto := 'Sin sustituto'; end if;
		return valor_devuelto;
	END;
$function$
;
