 CREATE OR REPLACE FUNCTION nuevo_alumno()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$function$
DECLARE
	edad int;
BEGIN	
	SELECT EXTRACT(YEAR from AGE(CURRENT_DATE, NEW.fecha_nac))
	INTO edad;
	IF edad BETWEEN 18 and 25 THEN
		NEW.curso = 1;
		NEW.nivel = 'ESO';
	ELSIF edad BETWEEN 26 and 35 THEN
		NEW.curso = 2;
		NEW.nivel = 'DAI';
	ELSE
		NEW.curso = 2;
		NEW.nivel = 'UNI';
	END IF; 
	RETURN NEW;
END;
$function$;

CREATE OR REPLACE TRIGGER comprobar_nuevo_alumno
	BEFORE INSERT OR UPDATE
	ON ALUM0405
	FOR EACH ROW
EXECUTE PROCEDURE nuevo_alumno();
