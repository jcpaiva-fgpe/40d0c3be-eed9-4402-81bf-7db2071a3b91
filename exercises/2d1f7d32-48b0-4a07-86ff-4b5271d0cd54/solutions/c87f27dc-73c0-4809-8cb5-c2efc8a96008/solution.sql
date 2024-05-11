alter table juegos add precio numeric;
alter table partidas add precio numeric;

update juegos set precio = 49.99 where juego_id = 1;
update juegos set precio = 29.99 where juego_id = 2;
update juegos set precio = 59.99 where juego_id = 3;
update juegos set precio = 54.99 where juego_id = 4;
update juegos set precio = 61.99 where juego_id = 5;
update juegos set precio = 0 where juego_id = 6;

update partidas set precio = 3.99 where juego_id = 1;
update partidas set precio = 8.99 where juego_id = 2;
update partidas set precio = 4.50 where juego_id = 3;
update partidas set precio = 6 where juego_id = 4;
update partidas set precio = 2.99 where juego_id = 5;
update partidas set precio = 2.50 where juego_id = 6;

create or replace function obtener_venta_plataforma(_id_plataforma int)
returns varchar
language plpgsql 
as $$
	declare 
		nombre_plataforma varchar;
		resultado varchar = '';
		importe_total numeric(8,2) = 0.00;
		fila_partida record;
		cur_partidas cursor(id_plataforma int)
		for select p.comienzo, p.fin, p.precio as precio_hora
			from partidas p
			join juegos j on (j.juego_id = p.juego_id)
			where j.plataforma = id_plataforma;
		fila_juego record;
		cur_juegos cursor(id_plataforma int)
		for select * from juegos j
			where j.plataforma = id_plataforma;
	begin 
		open cur_juegos(_id_plataforma);
		loop
			fetch cur_juegos into fila_juego;
			exit when not found;
		
			importe_total = importe_total + fila_juego.precio;
		end loop;
		close cur_juegos;
		
		open cur_partidas(_id_plataforma);
		loop
			fetch cur_partidas into fila_partida;
			exit when not found;
		
			importe_total = importe_total + (fila_partida.precio_hora * extract(second from age(fila_partida.fin, fila_partida.comienzo)) / 3600);
		end loop;
		close cur_partidas;
	
		select nombre 
		into nombre_plataforma
		from plataformas where plataforma_id = _id_plataforma;
	
		resultado = nombre_plataforma || ': ' || importe_total || '€';
	
		return resultado;
	end;
$$;