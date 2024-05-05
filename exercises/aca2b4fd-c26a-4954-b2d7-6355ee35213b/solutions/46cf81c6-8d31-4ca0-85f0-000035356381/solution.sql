create or replace function restringir_clasificaciones()
returns TRIGGER
language plpgsql 
as $$
	begin
		if old.clasificacion <> (select max(clasificacion) from torneos_partidas where torneo_id = old.torneo_id) then 
			return null;
		else
			return old;
		end if;
	end;
$$;	

create or replace trigger comprobar_clasificacion
before delete 
on torneos_partidas
for each row
execute function restringir_clasificaciones();