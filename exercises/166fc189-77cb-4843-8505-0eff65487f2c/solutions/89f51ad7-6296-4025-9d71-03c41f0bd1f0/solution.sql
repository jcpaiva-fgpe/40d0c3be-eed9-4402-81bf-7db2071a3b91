alter table partidas add duracion int;
alter table torneos_partidas add duracion int;

create or replace function duracion_partidas()
returns TRIGGER
language plpgsql 
as $$
	begin
		new.duracion = extract(minute from age(new.fin, new.comienzo));
		return new;
	end;
$$;

create or replace trigger calcular_duraciones
before insert or update 
on partidas
for each row
execute function duracion_partidas();

create or replace trigger calcular_duraciones_torneo
before insert or update 
on torneos_partidas
for each row 
execute function duracion_partidas();