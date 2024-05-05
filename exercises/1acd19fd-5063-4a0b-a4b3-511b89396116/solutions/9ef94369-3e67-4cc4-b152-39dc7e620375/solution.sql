create or replace function fechas_torneo()
returns TRIGGER
language plpgsql 
as $$
	begin
		if (new.fecha_comienzo >= new.fecha_fin) then 
			return null;
		else
			return new;
		end if;
	end;
$$;

create or replace function fechas_partida_torneo()
returns trigger 
language plpgsql
as $$
	declare 
		comienzo_torneo date;
		fin_torneo date;
	begin 
		select fecha_comienzo, fecha_fin 
		into comienzo_torneo, fin_torneo
		from torneos
		where torneo_id = new.torneo_id;
	
		if (new.comienzo < comienzo_torneo or new.fin > fin_torneo or new.comienzo >= new.fin) then 
			return null;
		else
			return new;
		end if;
	end;
$$;
	

create or replace trigger restringir_torneo
before insert 
on torneos
for each row
execute function fechas_torneo();

create or replace trigger restringir_torneos_partidas
before insert 
on torneos_partidas
for each row 
execute function fechas_partida_torneo();