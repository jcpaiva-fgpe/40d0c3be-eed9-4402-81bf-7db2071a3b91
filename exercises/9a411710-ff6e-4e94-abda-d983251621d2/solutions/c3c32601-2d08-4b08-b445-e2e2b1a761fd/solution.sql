alter table torneos add primer_premio int;
alter table torneos add segundo_premio int;
alter table torneos add tercer_premio int;

update torneos set primer_premio=500, segundo_premio=200, tercer_premio=100
	where torneo_id = 1;
update torneos set primer_premio=1000, segundo_premio=300, tercer_premio=100
	where torneo_id = 2;

create or replace function obtener_premios_torneos()
returns varchar
language plpgsql 
as $$
	declare 
		resultado varchar = '';
		jugador_primero varchar;
		jugador_segundo varchar;
		jugador_tercero varchar;
		fila_torneo record;
		cur_torneos cursor
		for select * from torneos;
	begin 
		open cur_torneos;
		loop
			fetch cur_torneos into fila_torneo;
			exit when not found;
		
			select j.nombre from torneos_partidas tp
			into jugador_primero
			join jugadores j on (j.jugador_id = tp.ganador)
			where tp.torneo_id = fila_torneo.torneo_id and tp.clasificacion = 1;
		
			select j.nombre from torneos_partidas tp
			into jugador_segundo
			join jugadores j on (j.jugador_id = tp.ganador)
			where tp.torneo_id = fila_torneo.torneo_id and tp.clasificacion = 2;
		
			select j.nombre from torneos_partidas tp
			into jugador_tercero
			join jugadores j on (j.jugador_id = tp.ganador)
			where tp.torneo_id = fila_torneo.torneo_id and tp.clasificacion = 3;
		
			resultado = resultado || 'Torneo: ' || fila_torneo.nombre 
				|| ', Premios: ' || jugador_primero || ': ' || fila_torneo.primer_premio 
				|| '€, ' || jugador_segundo || ': ' || fila_torneo.segundo_premio 
				|| '€, ' || jugador_tercero || ': ' || fila_torneo.tercer_premio || '€'
				|| ';';
		end loop;
		close cur_torneos;
	
		return resultado;
	end;
$$;