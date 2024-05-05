create or replace function obtener_detalles_jugador(_id_jugador int,
	out nombre_jugador varchar,
	out experiencia_jugador varchar,
	out nombre_nivel varchar,
	out cantidad_torneos int)
language plpgsql 
as $$
	declare 
		datos_jugador record;
	begin 
		select j.nombre, j.experiencia, n.nombre as nivel,
		(
			select count(*) from torneos_participantes tp
			where tp.jugador_id = _id_jugador
		) as cantidad_torneos
		into nombre_jugador, experiencia_jugador, nombre_nivel, cantidad_torneos
		from jugadores j
		join jugadores_niveles jn on (jn.jugador_id = j.jugador_id)
		join niveles n on (n.nivel_id = jn.nivel_id)
		where j.jugador_id = _id_jugador;
	end;
$$;