CREATE OR REPLACE FUNCTION auditar_modificacion()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$function$
DECLARE
  v_cad_inser auditaremple.operacion%TYPE;
BEGIN
	v_cad_inser := TO_CHAR(CURRENT_DATE, 'DD/MM/YY*HH24:MI*') || old.emp_no || '* MODIFICACIÓN *';
	IF NEW.emp_no <> OLD.emp_no THEN 
		v_cad_inser := v_cad_inser || old.emp_no || '*' || new.emp_no;
	END IF;
	IF NEW.apellido <> OLD.apellido THEN 
		v_cad_inser := v_cad_inser || old.apellido || '*' || new.apellido;
	END IF;
	IF NEW.oficio <> OLD.oficio THEN 
		v_cad_inser := v_cad_inser || old.oficio || '*' || new.oficio;
	END IF;
	IF NEW.fecha_alt <> OLD.fecha_alt THEN 
		v_cad_inser := v_cad_inser || old.fecha_alt || '*' || new.fecha_alt;
	END IF;
	IF NEW.salario <> OLD.salario THEN 
		v_cad_inser := v_cad_inser || old.salario || '*' || new.salario;
	END IF;
	IF NEW.comision <> OLD.comision THEN 
		v_cad_inser := v_cad_inser || old.comision || '*' || new.comision;
	END IF;
	IF OLD.dept_no <> NEW.dept_no THEN 
		v_cad_inser := v_cad_inser || old.dept_no || '*' || new.dept_no;
	END IF;
	INSERT INTO auditaremple
	   VALUES (v_cad_inser);
	RETURN NEW;
END;
$function$;

CREATE OR REPLACE TRIGGER auditar_modif
	BEFORE UPDATE 
	ON EMPLE
	FOR EACH ROW
EXECUTE PROCEDURE auditar_modificacion();
