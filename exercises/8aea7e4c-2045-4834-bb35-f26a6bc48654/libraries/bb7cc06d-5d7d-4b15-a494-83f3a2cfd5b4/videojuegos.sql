create table plataformas(
	plataforma_id int not null primary key,
	nombre varchar(100)
);

create table jugadores(
	jugador_id int not null primary key,
	nombre varchar(100),
	plataforma_preferida int,
	fecha_alta timestamp,
	experiencia varchar(100)
);

create table niveles(
	nivel_id int not null primary key,
	nombre varchar(100),
	experiencia_anterior int,
	experiencia_requerida int
);

create table jugadores_niveles(
	jugador_id int not null,
	nivel_id int not null,
	constraint pk_jugadores_niveles primary key (jugador_id, nivel_id),
	constraint fk_jugadores_niveles_jugador foreign key (jugador_id) references jugadores,
	constraint fk_jugadores_niveles_nivel foreign key (nivel_id) references niveles
);

create table juegos(
	juego_id int not null primary key,
	nombre varchar(100),
	descripcion varchar(200),
	clasificacion numeric(4,2) check (clasificacion >= 0 and clasificacion <= 10),
	plataforma int,
	duenyo int,
	constraint fk_juegos_plataforma foreign key (plataforma) references plataformas,
	constraint fk_juegos_duenyo foreign key (duenyo) references jugadores
);

create table partidas(
	partida_id int not null primary key,
	juego_id int not null,
	jugador_id int not null,
	comienzo timestamp,
	fin timestamp,
	ha_ganado boolean,
	constraint fk_partidas_jugador foreign key (jugador_id) references jugadores,
	constraint fk_partidas_juego foreign key (juego_id) references juegos
);

create table torneos(
	torneo_id int not null primary key,
	juego_id int not null,
	nombre varchar(100),
	fecha_comienzo date,
	fecha_fin date,
	constraint fk_torneos_juego foreign key (juego_id) references juegos
);

create table torneos_participantes(
	torneo_id int not null,
	jugador_id int not null,
	constraint pk_torneos_participantes primary key (torneo_id, jugador_id),
	constraint fk_torneos_participantes_torneo foreign key (torneo_id) references torneos,
	constraint fk_torneos_participantes_jugador foreign key (jugador_id) references jugadores
);

create table torneos_partidas(
	torneo_id int not null,
	ganador int not null,
	juego_id int not null,
	comienzo timestamp,
	fin timestamp,
	clasificacion int,
	constraint pk_torneos_partidas primary key (torneo_id, ganador, comienzo),
	constraint fk_torneos_partidas_torneo foreign key (torneo_id) references torneos,
	constraint fk_torneos_partidas_ganador foreign key (ganador) references jugadores,
	constraint fk_torneos_partidas_juego foreign key (juego_id) references juegos
);

insert into plataformas 
values(1, 'PC'), (2, 'XBOX'), (3, 'PS4'), (4, 'PS5'), (5, 'PSP'), (6, 'Nintendo Switch'), (7, 'Nintendo 3DS');

insert into jugadores 
values(1, 'Juan Ramón', 2, '2024-01-01 10:00:00', 'Profesional'),
(2, 'Andrés', 3, '2024-03-01 08:50:00', 'Novato'),
(3, 'Francisco', 1, '2022-01-01 16:00:05', 'Experto'),
(4, 'Paula', 5, '2023-12-01', 'Intermedio'),
(5, 'Patricia', 7, '2023-06-15', 'Experto'),
(6, 'Miguel', 5, '2023-10-11', 'Novato');

insert into niveles 
values(1, 'Principiante', 0, 100), (2, 'Rookie', 101, 500), (3, 'Cadete', 501, 1000), (4, 'Sargento', 1001, 2500), 
(5, 'Caballero', 2501, 5000), (6, 'Comandante', 5001, 11000), (7, 'Experto', 11001, 15000), (8, 'Maestro', 15001, 23000),
 (9, 'Épico', 23001, 29000), (10, 'Leyenda', 29000, 999999);

insert into jugadores_niveles 
values(1, 4), (2, 2), (3, 6), (4, 4), (5, 9), (6, 8);

insert into juegos 
values(1, 'Fortnite', 'Juego shooter MMORPG', 8.5, 1, 2), (2, 'World of Warcraft', 'Juego MMORPG de Rol y Fantasía', 9, 1, 4),
(3, 'Assasins Creed', 'Juego de aventura y sigilo', 9.5, 3, 6), (4, 'The Witcher', 'Juego de mundo abierto', 10, 4, 1),
(5, 'Pokémon Púrpura', 'Juego de aventura y estrategia', 8, 6, 5), (6, 'Mario Bros', 'Juego de aventura y superar niveles', 6.5, 7, 3);

insert into partidas 
values(1, 1, 2, '2024-03-01 10:05:36', '2024-03-01 13:01:59', true), (2, 3, 4, '2024-05-01 15:05:55', '2024-05-01 15:59:33', false),
(3, 2, 5, '2024-05-03 19:07:10', '2024-05-03 21:53:47', true), (4, 6, 1, '2024-04-16 14:05:44', '2024-04-16 16:01:01', true),
(5, 2, 1, '2024-05-03 18:10:55', '2024-05-03 21:55:33', false), (6, 6, 4, '2024-03-31 17:01:01', '2024-03-31 18:33:55', false),
(7, 3, 5, '2024-04-19 19:00:01', '2024-04-19 20:58:13', true), (8, 1, 1, '2024-04-01 21:06:36', '2024-04-01 23:59:38', true),
(9, 3, 5, '2024-02-29 12:55:13', '2024-02-29 13:59:48', true), (10, 2, 2, '2024-03-28 08:11:15', '2024-03-28 13:13:41', false);

insert into torneos
values(1, 1, 'Torneo Nacional Fortnite', '2023-12-01', '2023-12-29'), 
(2, 2, 'Torneo Internacional World of Warcraft 2024', '2024-03-01', '2024-03-19');

insert into torneos_participantes 
values(1, 1), (1, 2), (1, 3), (1, 5), (1, 6),
(2, 1), (2, 2), (2, 3), (2, 5);

insert into torneos_partidas
values(1, 2, 1, '2023-12-01 15:09:09', '2023-12-01 18:30:23', 4), (1, 3, 1, '2023-12-03 14:10:30', '2023-12-03 16:50:44', 3),
(1, 6, 1, '2023-12-05 17:10:03', '2023-12-05 19:23:22', 2), (1, 5, 1, '2023-12-28 13:05:33', '2023-12-28 18:19:56', 1),
(2, 5, 2, '2024-03-01 20:11:55', '2024-03-01 23:09:18', 4), (2, 3, 2, '2024-03-07 10:00:01', '2024-03-07 15:34:49', 3),
(2, 2, 2, '2024-03-14 18:19:22', '2024-03-14 22:59:28', 2), (2, 1, 2, '2024-03-19 18:05:33', '2024-03-19 23:44:11', 1);

