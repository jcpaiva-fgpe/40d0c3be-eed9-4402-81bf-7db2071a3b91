delete from torneos_partidas where torneo_id = 1 and clasificacion = 1;
delete from torneos_partidas where torneo_id = 1 and clasificacion = 3;
delete from torneos_partidas where torneo_id = 1 and clasificacion = 4;
delete from torneos_partidas where torneo_id = 1 and clasificacion = 3;
delete from torneos_partidas where torneo_id = 2 and clasificacion = 2;
delete from torneos_partidas where torneo_id = 2 and clasificacion = 4;
delete from torneos_partidas where torneo_id = 2 and clasificacion = 2;

select * from torneos_partidas
order by torneo_id, clasificacion;