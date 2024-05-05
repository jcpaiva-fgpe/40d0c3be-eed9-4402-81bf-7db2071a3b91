create or replace function restringir_torneos()
returns TRIGGER
language plpgsql 
as $$
	begin
		if (select count(*) from torneos_participantes where torneo_id = old.torneo_id) > 6 then 
			return null;
		elsif exists(
			select * from torneos_participantes tp
			where not exists(
				select * from torneos_partidas pt
				where pt.torneo_id = tp.torneo_id 
				and pt.ganador = tp.jugador_id 
			)) then
			return null;
		else
			return new;
		end if;
	end;
$$;	

create or replace trigger comprobar_torneo
before update 
on torneos
for each row
execute function restringir_torneos();