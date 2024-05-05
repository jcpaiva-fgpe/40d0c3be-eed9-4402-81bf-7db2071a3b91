create or replace procedure marcar_partidas_ganadas(_nombre_jugador varchar, _fecha timestamp)
language plpgsql 
as $$
	declare 
		id_jugador int;
	begin 
		select jugador_id
		into id_jugador
		from jugadores
		where nombre = _nombre_jugador;
	
		update partidas set ha_ganado = true 
		where jugador_id = id_jugador 
		and comienzo < _fecha;
	end;
$$;