create table auditar_jugador(
	identificador int not null primary key,
	jugador_nombre varchar(100),
	plataforma_preferida varchar(100),
	nivel varchar(100),
	juegos_jugador varchar(100),
	operacion varchar(50),
	fecha timestamp default current_timestamp,
	usuario varchar(50) default current_user
);

create or replace function insertar_auditoria()
returns TRIGGER
language plpgsql 
as $$
	declare 
		ultimo_identificador_auditoria int;
		plataforma_auditoria varchar;
		nivel_auditoria varchar;
		juegos_auditoria varchar;
	begin
		select coalesce(max(identificador), 0)
		into ultimo_identificador_auditoria
		from auditar_jugador;
	
		if (tg_op = 'INSERT') then
			select nombre 
			into plataforma_auditoria
			from plataformas
			where plataforma_id = new.plataforma_preferida;
		
			select nombre
			into nivel_auditoria
			from jugadores_niveles jn 
			join niveles n on (n.nivel_id = jn.nivel_id)
			where jn.jugador_id = new.jugador_id;
		
			select string_agg(nombre, ', ')
			into juegos_auditoria
			from juegos j
			where j.duenyo = new.jugador_id;
		
			insert into auditar_jugador(identificador, jugador_nombre, 
				plataforma_preferida, nivel, juegos_jugador, operacion)
			values(ultimo_identificador_auditoria + 1, new.nombre,
				plataforma_auditoria, nivel_auditoria, juegos_auditoria, 'INSERCION');
			
			return new;
		elsif (tg_op = 'UPDATE') then
			select nombre 
			into plataforma_auditoria
			from plataformas
			where plataforma_id = old.plataforma_preferida;
		
			select nombre
			into nivel_auditoria
			from jugadores_niveles jn 
			join niveles n on (n.nivel_id = jn.nivel_id)
			where jn.jugador_id = old.jugador_id;
		
			select string_agg(nombre, ', ')
			into juegos_auditoria
			from juegos j
			where j.duenyo = old.jugador_id;
		
			insert into auditar_jugador(identificador, jugador_nombre, 
				plataforma_preferida, nivel, juegos_jugador, operacion)
			values(ultimo_identificador_auditoria + 1, old.nombre,
				plataforma_auditoria, nivel_auditoria, juegos_auditoria, 'ACTUALIZACION');
			
			return new;
		elsif (tg_op = 'DELETE') then
			select nombre 
			into plataforma_auditoria
			from plataformas
			where plataforma_id = old.plataforma_preferida;
		
			select nombre
			into nivel_auditoria
			from jugadores_niveles jn 
			join niveles n on (n.nivel_id = jn.nivel_id)
			where jn.jugador_id = old.jugador_id;
		
			select string_agg(nombre, ', ')
			into juegos_auditoria
			from juegos j
			where j.duenyo = old.jugador_id;
		
			insert into auditar_jugador(identificador, jugador_nombre, 
				plataforma_preferida, nivel, juegos_jugador, operacion)
			values(ultimo_identificador_auditoria + 1, old.nombre,
				plataforma_auditoria, nivel_auditoria, juegos_auditoria, 'ELIMINACION');
			
			return old;
		end if;
	end;
$$;	

create or replace trigger auditar_jugador
before insert or update or delete 
on jugadores
for each row
execute function insertar_auditoria();