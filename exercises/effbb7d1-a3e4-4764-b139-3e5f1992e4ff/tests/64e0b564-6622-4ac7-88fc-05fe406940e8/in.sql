call crear_entradas_torneo(1);
call crear_entradas_torneo(2);

select * from torneos_entradas
	order by torneo_id, jugador_id;