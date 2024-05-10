create or replace function get_estudiantes_solicitudes(p_nif varchar)
    returns text
    language plpgsql
as $$
declare
    nombres text default '';
    fila_solicitud record;
    cur_solicitudes cursor(p_nif varchar)
        for select nombre, apellidos, empresa , fecha_aprobacion  
        from solicitudes join estudiantes on (estudiante = id)
        where empresa = p_nif;
begin
    -- apertura del cursor
    open cur_solicitudes(p_nif);

    loop
        -- fetch la fila en el registro de solicitud
        fetch cur_solicitudes into fila_solicitud;
        -- salir cuando no haya más filas a recorrer
        exit when not found;

        -- construir el mensaje
        if fila_solicitud.fecha_aprobacion is not null then
            nombres := nombres || ',' || fila_solicitud.nombre || ' ' || fila_solicitud.apellidos;
        end if;
    end loop;

    -- cerrar el cursor
    close cur_solicitudes;

    return nombres;
end;
$$;
