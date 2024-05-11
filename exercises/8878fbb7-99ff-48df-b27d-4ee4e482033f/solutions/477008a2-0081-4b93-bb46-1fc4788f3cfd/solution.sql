create or replace function obtener_juegos_jugados_juntos(_id_jugador int)
returns varchar
language plpgsql 
as $$
	declare 
		resultado varchar = '';
		solapamientos int;
		nombre_jugador varchar;
		fila_partida record;
		cur_partidas cursor(id_jugador int)
		for select p.comienzo, p.fin, j.nombre from partidas p
			join jugadores j on (j.jugador_id = p.jugador_id)
			where p.jugador_id = id_jugador
			order by p.comienzo;
	begin 
		open cur_partidas(_id_jugador);
		loop
			fetch cur_partidas into fila_partida;
			exit when not found;
		
			select count(*) 
			into solapamientos
			from partidas 
			where ((comienzo <= fila_partida.comienzo and fin >= fila_partida.comienzo)
				or (comienzo >= fila_partida.comienzo and fin <= fila_partida.fin))
				and jugador_id <> _id_jugador;
			
			if (solapamientos > 0) then
				resultado = resultado || 'Jugador: ' || fila_partida.nombre 
					|| ', Fechas: ' || fila_partida.comienzo || '-' 
					|| fila_partida.fin || ', Solapamientos: ' 
					|| solapamientos || ', ';
			end if;
		end loop;
		close cur_partidas;
	
		if (resultado = '') then
			select nombre 
			into nombre_jugador
			from jugadores where jugador_id = _id_jugador;
			resultado = 'Jugador: ' || nombre_jugador || ', Sin solapamientos';
		end if;
		return resultado;
	end;
$$;