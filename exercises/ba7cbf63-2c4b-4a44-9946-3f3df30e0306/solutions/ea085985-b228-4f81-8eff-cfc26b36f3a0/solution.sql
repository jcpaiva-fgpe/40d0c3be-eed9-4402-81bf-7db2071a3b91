create or replace function obtener_estadisticas_torneo(_id_torneo int)
returns varchar
language plpgsql 
as $$
	declare 
		nombre_torneo varchar;
		duracion_torneo int;
		resultado varchar = '';
		duracion int = 0;
		partidas int = 0;
		jugadores varchar = '';
		fila_partida_torneo record;
		cur_partidas_torneo cursor(id_torneo int)
		for select tp.comienzo, tp.fin, tp.clasificacion, j.nombre 
			from torneos_partidas tp
			join jugadores j on (j.jugador_id = tp.ganador)
			where tp.torneo_id = id_torneo;
	begin 
		open cur_partidas_torneo(_id_torneo);
		loop
			fetch cur_partidas_torneo into fila_partida_torneo;
			exit when not found;
		
			partidas = partidas + 1;
			duracion = duracion + extract(hour from age(fila_partida_torneo.fin, fila_partida_torneo.comienzo));
			if fila_partida_torneo.clasificacion = 1 then
				jugadores = jugadores || fila_partida_torneo.nombre || '*,';
			else
				jugadores = jugadores || fila_partida_torneo.nombre || ',';
			end if;
		end loop;
		close cur_partidas_torneo;
	
		select nombre, extract(day from age(fecha_fin, fecha_comienzo))
		into nombre_torneo, duracion_torneo
		from torneos where torneo_id = _id_torneo;
	
		resultado = 'Torneo: ' || nombre_torneo 
			|| '; Duración torneo:' || duracion_torneo 
			|| '; Jugadores: ' || jugadores 
			|| '; Partidas: ' || partidas
			|| '; Duración partidas: ' || duracion;
	
		return resultado;
	end;
$$;