CREATE or replace FUNCTION comprueba_provincia()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
   if new.state_province is null then
	raise 'No se puede crear una localización sin provincia.';
   end if;
  
  return new;
END;
$$;

CREATE TRIGGER comprobar_provincia_localizacion
before INSERT
ON locations
FOR EACH ROW
EXECUTE PROCEDURE comprueba_provincia();