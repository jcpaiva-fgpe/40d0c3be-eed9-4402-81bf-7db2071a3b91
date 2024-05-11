create table torneos_entradas(
	torneo_id int,
	jugador_id int,
	nombre_jugador varchar(100),
	fecha_asistencia date,
	codigo_entrada varchar(50)
);

create or replace procedure crear_entradas_torneo(_id_torneo int)
language plpgsql 
as $$
	declare 
		_codigo_entrada varchar;
		fila_participante record;
		cur_participantes cursor(id_torneo int)
		for select p.torneo_id, p.jugador_id, t.nombre, t.fecha_comienzo, j.nombre as nombre_jugador from torneos_participantes p
			join torneos t on (t.torneo_id = p.torneo_id)
			join jugadores j ON (j.jugador_id = p.jugador_id)
			where p.torneo_id  = id_torneo;
	begin 
		open cur_participantes(_id_torneo);
		loop
			fetch cur_participantes into fila_participante;
			exit when not found;
		
			_codigo_entrada = substring(fila_participante.nombre, 1, 1) || substring(fila_participante.nombre_jugador, 1, 1) 
				|| cast(fila_participante.jugador_id as varchar) || to_char(fila_participante.fecha_comienzo, 'DD');
			
			insert into torneos_entradas
			values(fila_participante.torneo_id, fila_participante.jugador_id, fila_participante.nombre_jugador, 
				fila_participante.fecha_comienzo, _codigo_entrada);
		end loop;
		close cur_participantes;
	end;
$$;