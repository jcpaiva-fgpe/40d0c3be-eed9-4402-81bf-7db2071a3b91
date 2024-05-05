create or replace function obtener_datos_torneo(_id_torneo int,
	out nombre_torneo varchar,
	out nombre_jugador varchar,
	out duracion_partida int,
	out clasificacion_partida int)
language plpgsql 
as $$
	begin 
		select t.nombre, j.nombre as jugador, extract(hour from age(tp.fin, tp.comienzo)) as horas,
		tp.clasificacion
		into nombre_torneo, nombre_jugador, duracion_partida, clasificacion_partida
		from torneos t
		join torneos_partidas tp on (tp.torneo_id = t.torneo_id)
		join jugadores j on (j.jugador_id = tp.ganador)
		where tp.clasificacion = 1 and t.torneo_id = _id_torneo;
	end;
$$;