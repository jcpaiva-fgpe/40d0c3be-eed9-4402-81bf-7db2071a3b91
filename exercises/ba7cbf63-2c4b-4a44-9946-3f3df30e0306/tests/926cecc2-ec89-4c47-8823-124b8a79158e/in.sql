insert into torneos
values(3, 5, 'Torneo Pokémon Púrpura 2024', '2024-05-15', '2024-05-31');

insert into torneos_participantes 
values(3, 1), (3, 2), (3, 3), (3, 4), (3, 5), (3, 6);

insert into torneos_partidas
values(3, 2, 5, '2024-05-02 15:09:09', '2024-05-02 19:30:23', 6), (3, 2, 5, '2024-05-04 14:15:19', '2024-05-04 16:20:00', 5),
	(3, 2, 5, '2024-05-06 19:18:46', '2024-05-06 21:00:05', 4), (3, 2, 5, '2024-05-08 18:51:18', '2024-05-08 21:09:17', 3),
	(3, 2, 5, '2024-05-11 16:33:41', '2024-05-11 18:55:39', 2), (3, 2, 5, '2024-05-14 21:01:55', '2024-05-14 23:53:59', 1);


select 1 as torneo, obtener_estadisticas_torneo(1)
union
select 2, obtener_estadisticas_torneo(2)
union
select 3, obtener_estadisticas_torneo(3)
order by 1;