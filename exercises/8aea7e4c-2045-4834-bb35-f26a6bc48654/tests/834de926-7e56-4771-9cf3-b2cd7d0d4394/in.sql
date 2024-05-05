call crear_jugador('Andrew', 'PC', 'Experto', 1500);
call crear_jugador('Yasmina', 'XBOX', 'Intermedio', 999);
call crear_jugador('David', 'PS5', 'Leyenda', 25000);

select j.jugador_id, j.nombre, j.experiencia, case 
		when 
			extract(year from j.fecha_alta) = extract(year from current_timestamp) and
			extract(month from j.fecha_alta) = extract(month from current_timestamp) and 
			extract(day from j.fecha_alta) = extract(day from current_timestamp) and 
			extract(hour from j.fecha_alta) = extract(hour from current_timestamp) and 
			extract(minute from j.fecha_alta) = extract(minute from current_timestamp) and 
			extract(second from j.fecha_alta) = extract(second from current_timestamp)
		then 1 
		else 0 end as fecha_correcta, j.puntos_experiencia, n.nombre as nombre_nivel, p.nombre as plataforma from jugadores j
join jugadores_niveles jn on (j.jugador_id = jn.jugador_id)
join niveles n on (n.nivel_id = jn.nivel_id)
join plataformas p on (p.plataforma_id = j.plataforma_preferida);