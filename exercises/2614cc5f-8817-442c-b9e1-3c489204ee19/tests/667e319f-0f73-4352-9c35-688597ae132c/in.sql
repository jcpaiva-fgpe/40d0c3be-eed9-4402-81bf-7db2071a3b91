select nombre_torneo, nombre_jugador, duracion_partida from obtener_datos_torneo(1) 
union
select nombre_torneo, nombre_jugador, duracion_partida from obtener_datos_torneo(2)
order by nombre_torneo;