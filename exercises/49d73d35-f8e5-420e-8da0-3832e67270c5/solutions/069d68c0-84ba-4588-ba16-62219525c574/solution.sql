create or replace function obtener_horas_jugando(_id_jugador int)
returns varchar 
language plpgsql 
as $$
	declare 
		resultado varchar = '';
		suma_horas int = 0;
		fila_juego record;
		cur_juegos cursor(id_jugador int)
		for select p.comienzo, p.fin, j.nombre from partidas p
			join juegos j on (j.juego_id = p.juego_id)
			where p.jugador_id = id_jugador;
	begin 
		open cur_juegos(_id_jugador);
		loop
			fetch cur_juegos into fila_juego;
			exit when not found;
			suma_horas = suma_horas + extract(hour from age(fila_juego.fin, fila_juego.comienzo));
			resultado = resultado || fila_juego.nombre || ',';
		end loop;
		close cur_juegos;
		return cast(suma_horas as varchar) || ':' || resultado;
	end;
$$;