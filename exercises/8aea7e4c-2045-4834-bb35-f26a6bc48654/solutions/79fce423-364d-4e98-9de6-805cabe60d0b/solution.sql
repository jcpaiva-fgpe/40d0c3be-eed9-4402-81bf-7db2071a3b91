alter table jugadores add puntos_experiencia int not null default 0;

create or replace procedure crear_jugador(_nombre_jugador varchar,
	_plataforma_preferida varchar,
	_experiencia_jugando varchar,
	_puntos_experiencia int)
language plpgsql 
as $$
	declare 
		ultimo_id_jugador int;
		nivel int;
		plataforma int;
	begin 
		select max(jugador_id)
		into ultimo_id_jugador
		from jugadores;
	
		select plataforma_id 
		into plataforma
		from plataformas 
		where nombre = _plataforma_preferida;
		
		select nivel_id from niveles 
		into nivel
		where experiencia_anterior <= _puntos_experiencia
		and experiencia_requerida >= _puntos_experiencia;
	
		insert into jugadores(jugador_id, nombre, plataforma_preferida, fecha_alta, experiencia, puntos_experiencia)
		values(ultimo_id_jugador + 1, _nombre_jugador, plataforma, current_timestamp, _experiencia_jugando, _puntos_experiencia);
		insert into jugadores_niveles(jugador_id, nivel_id)
		values(ultimo_id_jugador + 1, nivel);
	end;
$$;