call crear_torneo('Torneo Nacional Witcher', 'The Witcher', '2024-05-05', '2024-05-31', 1, 2, 3, 4, null, NULL);
call crear_torneo('Torneo Mario Bros Europeo', 'Mario Bros', '2024-06-15', '2024-07-01', null, null, 5, 6, 3, 4);

select * from torneos t
join torneos_participantes tp on (tp.torneo_id = t.torneo_id)
where t.torneo_id in (3,4)
order by t.torneo_id, t.juego_id, tp.jugador_id;