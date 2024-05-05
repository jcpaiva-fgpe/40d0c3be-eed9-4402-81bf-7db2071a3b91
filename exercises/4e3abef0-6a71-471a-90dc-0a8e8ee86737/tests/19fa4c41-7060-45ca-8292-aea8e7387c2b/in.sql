update torneos set fecha_fin = '2023-12-30' where torneo_id = 1;
update torneos set fecha_fin = '2024-03-20' where torneo_id = 2;
insert into torneos_participantes(torneo_id, jugador_id)
values(1, 4);
insert into torneos_partidas(torneo_id, ganador, juego_id, comienzo, fin, clasificacion) 
values(1, 1, 1, '2023-12-01 14:10:00', '2023-12-01 15:15:00', 5);
update torneos set fecha_fin = '2023-01-05' where torneo_id = 1;
insert into torneos_partidas(torneo_id, ganador, juego_id, comienzo, fin, clasificacion) 
values(1, 4, 1, '2023-12-03 17:15:00', '2023-12-03 18:09:44', 6);
update torneos set fecha_fin = '2023-12-31' where torneo_id = 1;
insert into jugadores(jugador_id, nombre, plataforma_preferida, fecha_alta, experiencia)
values(7, 'Andrew', 1, current_timestamp, 'Leyenda');
insert into torneos_participantes(torneo_id, jugador_id)
values(1, 7);
update torneos set fecha_fin = '2024-01-01' where torneo_id = 1;

select * from torneos order by torneo_id;