insert into jugadores(jugador_id, nombre, plataforma_preferida, fecha_alta, experiencia)
values(7, 'Andrew', 1, current_timestamp, 'Leyenda');
insert into jugadores_niveles(jugador_id, nivel_id)
values(7, 10);
update jugadores set nombre = 'Andrew Nightingale', experiencia = 'Maestro' 
where jugador_id = 7;
delete from jugadores_niveles where jugador_id = 7;
delete from jugadores where jugador_id = 7;
update jugadores_niveles set nivel_id = 3 where jugador_id = 5;
update jugadores set plataforma_preferida = 2 where jugador_id = 5;
update jugadores set nombre = 'Miguel Ángel', fecha_alta = current_timestamp, experiencia = 'Rookie'
where jugador_id = 6;

select identificador, jugador_nombre, plataforma_preferida, nivel, juegos_jugador, operacion, fecha from auditar_jugador
order by identificador;