CREATE or replace FUNCTION comprueba_provincia()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
   if new.state_province is null then
	raise notice 'No se puede crear una localización sin provincia.';
    return null;
   else
    return new;
   end if;
END;
$$;

CREATE TRIGGER comprobar_provincia_localizacion
before INSERT
ON locations
FOR EACH ROW
EXECUTE FUNCTION comprueba_provincia();