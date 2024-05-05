select jugador_id, obtener_datos_jugador(jugador_id)
from jugadores 
group by jugador_id 
order by jugador_id;