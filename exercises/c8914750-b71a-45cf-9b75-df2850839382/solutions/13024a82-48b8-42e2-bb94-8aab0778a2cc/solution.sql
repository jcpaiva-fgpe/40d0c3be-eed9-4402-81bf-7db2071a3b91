create or replace function cuantos_torneos(_nombre_jugador varchar)
returns varchar
language plpgsql 
as $$
	declare 
		jugador int;
		torneos int;
	begin 
		select jugador_id 
		into jugador
		from jugadores 
		where nombre = _nombre_jugador;
	
		if not found then
			return 'No existe';
		else 
			select count(*) 
			into torneos 
			from torneos_participantes tp
			join jugadores j on (j.jugador_id = tp.jugador_id)
			where j.nombre = _nombre_jugador;
		
			return cast(torneos as varchar);
		end if;
	end;
$$;