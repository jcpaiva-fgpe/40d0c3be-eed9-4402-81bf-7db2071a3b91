create or replace function obtener_duracion_partidas_torneo(_id_torneo int)
returns varchar 
language plpgsql 
as $$
	declare 
		resultado varchar = '';
		duracion int = 0;
		sobreduracion int = 0;
		fila_partida record;
		cur_partidas cursor(id_torneo int)
		for select p.comienzo, p.fin from torneos_partidas p
			where p.torneo_id  = id_torneo;
	begin 
		open cur_partidas(_id_torneo);
		loop
			fetch cur_partidas into fila_partida;
			exit when not found;
			duracion = duracion + extract(hour from age(fila_partida.fin, fila_partida.comienzo));
		end loop;
		close cur_partidas;
		
		if duracion > 12 then
			sobreduracion = duracion - 12;
			duracion = 12;
		end if;
	
		return 'Duración: ' || cast(duracion as varchar) || ', Sobreduración: ' || cast(sobreduracion as varchar);
	end;
$$;