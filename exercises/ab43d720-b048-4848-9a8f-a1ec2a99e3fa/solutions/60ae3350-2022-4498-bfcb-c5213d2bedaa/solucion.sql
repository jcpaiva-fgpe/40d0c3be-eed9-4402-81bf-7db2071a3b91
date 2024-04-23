CREATE OR REPLACE FUNCTION gestionar_dept()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$function$
DECLARE
	existe_dept_nombre int;
	nuevo_dept_id int;
BEGIN
	IF TG_OP = 'DELETE' THEN 
	UPDATE EMPLE SET dept_no = -1 where dept_no = OLD.dept_no;
	ELSIF TG_OP = 'INSERT' THEN
	SELECT count(*) INTO existe_dept_nombre
	WHERE nombre = OLD.dnombre;
		IF existe_dept_nombre > 0 THEN
			raise 'Ya existe un departamento con ese nombre';
		ELSE
			SELECT MAX(dept_no)+10
INTO nuevo_dept_id 
FROM DEPARTAMENTOS;
NEW.dept_no := nuevo_dept_id;
		END IF;
	END IF;
	RETURN NEW;
END;
$function$;

CREATE OR REPLACE TRIGGER gestionar_departamento
	BEFORE INSERT OR DELETE
	ON DEPART
	FOR EACH ROW
EXECUTE PROCEDURE gestionar_dept();