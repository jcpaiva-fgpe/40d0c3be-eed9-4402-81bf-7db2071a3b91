alter table jugadores add torneos int;
alter table jugadores add mejor_clasificacion int;

create or replace function calcular_datos_torneos()
returns TRIGGER
language plpgsql 
as $$
	declare 
		cantidad_torneos int;
		mejor_clasificacion_jugador int;
	begin
		select count(*) 
		into cantidad_torneos
		from torneos_participantes
		where jugador_id = new.jugador_id;
	
		select min(clasificacion) 
		into mejor_clasificacion_jugador
		from torneos_partidas
		where ganador = new.jugador_id;
	
		new.torneos = cantidad_torneos;
		new.mejor_clasificacion = mejor_clasificacion_jugador;
	
		return new;
	end;
$$;	

create or replace trigger actualizacion_jugador
before update 
on jugadores
for each row
execute function calcular_datos_torneos();