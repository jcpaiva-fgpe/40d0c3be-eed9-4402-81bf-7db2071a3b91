update jugadores set puntos_experiencia = 1000 where jugador_id = 1;
update jugadores set puntos_experiencia = 1600 where jugador_id = 2;
update jugadores set puntos_experiencia = 3999 where jugador_id = 3;
update jugadores set puntos_experiencia = 31000 where jugador_id = 4;
update jugadores set puntos_experiencia = 12512 where jugador_id = 5;
update jugadores set puntos_experiencia = 1 where jugador_id = 6;

select j.jugador_id, j.puntos_experiencia, n.nombre from jugadores j
join jugadores_niveles jn on (jn.jugador_id = j.jugador_id)
join niveles n on (n.nivel_id = jn.nivel_id)
order by j.jugador_id, j.puntos_experiencia;