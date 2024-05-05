create or replace function obtener_datos_jugador(_id_jugador int)
returns varchar
language plpgsql 
as $$
	declare 
		juego varchar;
		partidas_jugadas int;
	begin 
		select nombre 
		into juego
		from juegos
		where duenyo = _id_jugador;
	
		select count(*) 
		into partidas_jugadas
		from partidas 
		where jugador_id = _id_jugador;
	
		return juego || ', ' || partidas_jugadas;
	end;
$$;
