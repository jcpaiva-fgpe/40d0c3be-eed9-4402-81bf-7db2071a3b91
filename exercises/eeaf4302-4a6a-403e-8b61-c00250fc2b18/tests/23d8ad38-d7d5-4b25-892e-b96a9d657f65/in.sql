call marcar_partidas_ganadas('Juan Ramón', '2024-05-03 19:00:00');
call marcar_partidas_ganadas('Paula', '2024-04-30 18:00:00');
call marcar_partidas_ganadas('Andrés', '2024-03-29 00:00:00');

select j.nombre, p.comienzo, ha_ganado from partidas p
join jugadores j on (j.jugador_id = p.jugador_id)
order by j.nombre, p.comienzo;