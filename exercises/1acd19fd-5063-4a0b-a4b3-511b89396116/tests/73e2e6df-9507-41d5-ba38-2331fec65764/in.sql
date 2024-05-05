insert into torneos(torneo_id, juego_id, nombre, fecha_comienzo, fecha_fin) 
values(3, 3, 'Torneo Assasins Creed 2024', '2024-05-06', '2024-05-05');
insert into torneos_partidas(torneo_id, ganador, juego_id, comienzo, fin, clasificacion) 
values(3, 2, 3, '2024-05-06 19:00:00', '2024-05-06 18:59:59', 1);
insert into torneos(torneo_id, juego_id, nombre, fecha_comienzo, fecha_fin) 
values(3, 3, 'Torneo Assasins Creed 2024', '2024-05-06', '2024-06-05');
insert into torneos_partidas(torneo_id, ganador, juego_id, comienzo, fin, clasificacion) 
values(3, 3, 3, '2024-05-06 18:59:59', '2024-05-06 17:00:00', 1);
insert into torneos_partidas(torneo_id, ganador, juego_id, comienzo, fin, clasificacion) 
values(3, 3, 3, '2024-05-01 18:00:00', '2024-05-07 19:00:00', 1);
insert into torneos_partidas(torneo_id, ganador, juego_id, comienzo, fin, clasificacion) 
values(3, 3, 3, '2024-05-07 19:59:33', '2024-05-07 23:01:23', 1);

select * from torneos t
join torneos_partidas pt on (pt.torneo_id = t.torneo_id)
where t.torneo_id = 3;