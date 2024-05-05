alter table jugadores add puntos_experiencia int not null default 0;

create or replace function actualizar_experiencia_jugador()
returns TRIGGER
language plpgsql 
as $$
	declare 	
		nivel int;
	begin
		select nivel_id 
		into nivel
		from niveles
		where experiencia_anterior <= new.puntos_experiencia
		and experiencia_requerida >= new.puntos_experiencia;
	
		update jugadores_niveles set nivel_id = nivel
		where jugador_id = new.jugador_id;
	
		return new;
	end;
$$;	

create or replace trigger comprobar_experiencia
before update 
on jugadores
for each row
execute function actualizar_experiencia_jugador();