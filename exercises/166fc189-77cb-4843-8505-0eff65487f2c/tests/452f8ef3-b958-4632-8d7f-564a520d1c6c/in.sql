update partidas set partida_id = partida_id;
update torneos_partidas set torneo_id = torneo_id;
insert into partidas(partida_id, juego_id, jugador_id, comienzo, fin, ha_ganado) 
values(11, 2, 4, '2024-05-04 18:02:00', '2024-05-04 23:55:30', false);
insert into torneos_partidas(torneo_id, ganador, juego_id, comienzo, fin, clasificacion)
values(2, 4, 2, '2024-05-05 15:05:50', '2024-05-05 19:58:12', 5);

select partida_id, comienzo, fin, duracion from partidas p
union
select torneo_id, comienzo, fin, duracion from torneos_partidas tp
order by 1, 4;