create or replace procedure crear_torneo(_nombre_torneo varchar,
	_nombre_juego varchar,
	_fecha_comienzo date,
	_fecha_fin date,
	_jugador1 int,
	_jugador2 int,
	_jugador3 int,
	_jugador4 int,
	_jugador5 int,
	_jugador6 int)
language plpgsql 
as $$
	declare 
		ultimo_id_torneo int;
		id_juego int;
	begin 
		select max(torneo_id) 
		into ultimo_id_torneo
		from torneos;
		
		select juego_id 
		into id_juego
		from juegos
		where nombre = _nombre_juego;
	
		insert into torneos(torneo_id, juego_id, nombre, fecha_comienzo, fecha_fin)
		values(ultimo_id_torneo + 1, id_juego, _nombre_torneo, _fecha_comienzo, _fecha_fin);
	
		if _jugador1 is not null then
			insert into torneos_participantes(torneo_id, jugador_id)
			values(ultimo_id_torneo + 1, _jugador1);
		end if;
	
		if _jugador2 is not null then
			insert into torneos_participantes(torneo_id, jugador_id)
			values(ultimo_id_torneo + 1, _jugador2);
		end if;
	
		if _jugador3 is not null then
			insert into torneos_participantes(torneo_id, jugador_id)
			values(ultimo_id_torneo + 1, _jugador3);
		end if;
	
		if _jugador4 is not null then
			insert into torneos_participantes(torneo_id, jugador_id)
			values(ultimo_id_torneo + 1, _jugador4);
		end if;
	
		if _jugador5 is not null then
			insert into torneos_participantes(torneo_id, jugador_id)
			values(ultimo_id_torneo + 1, _jugador5);
		end if;
	
		if _jugador6 is not null then
			insert into torneos_participantes(torneo_id, jugador_id)
			values(ultimo_id_torneo + 1, _jugador6);
		end if;
	end;
$$;