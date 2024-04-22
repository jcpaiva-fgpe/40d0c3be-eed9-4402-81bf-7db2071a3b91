CREATE OR REPLACE FUNCTION auditar_emp()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$function$
BEGIN
	IF TG_OP = 'DELETE' THEN 
		INSERT INTO auditaremple
		   VALUES (TO_CHAR(CURRENT_DATE, 'DD/MM/YY*HH24:MI*') || 
			old.emp_no || '*' || old.apellido || '* BORRADO ');
	ELSIF TG_OP = 'INSERT' THEN
		INSERT INTO auditaremple
		   VALUES (TO_CHAR(SYSDATE, 'DD/MM/YY*HH24:MI*') || 
			new.emp_no || '*' || new.apellido || '* INSERCIÓN ');
	END IF;
	RETURN NEW;
END;
$function$;

CREATE OR REPLACE TRIGGER auditar_act_emp
	BEFORE INSERT OR DELETE
	ON EMPLE
	FOR EACH ROW
EXECUTE PROCEDURE auditar_emp();
