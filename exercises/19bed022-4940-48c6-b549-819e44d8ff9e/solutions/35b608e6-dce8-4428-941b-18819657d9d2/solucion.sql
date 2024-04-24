CREATE or replace FUNCTION agregar_dominio_email_empleado()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
   new.email = CONCAT(new.email, '@gmail.es');
   return new;
END;
$$;

CREATE TRIGGER nuevo_empleado
BEFORE INSERT
ON employees
FOR EACH ROW
EXECUTE FUNCTION agregar_dominio_email_empleado();