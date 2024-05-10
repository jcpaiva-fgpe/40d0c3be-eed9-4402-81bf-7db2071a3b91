create or replace procedure generaTarjetasEmbarque(pIdVuelo vuelos.id_vuelo%type)
    language plpgsql
as $cursor$
declare
    vNumeroEmbarque int;
    vIdBillete billete_vuelos.id_billete%type;
    cur_billetes cursor(pIdVuelo vuelos.id_vuelo%type)
        for select id_billete
        from billete_vuelos
        where id_vuelo = pIdVuelo;
begin
	vNumeroEmbarque = 1;
	open cur_billetes(pIdVuelo);    -- apertura del cursor
    loop
        fetch cur_billetes into vIdBillete; -- fila en el registro de agente
        exit when not found;   -- salir cuando no haya más filas a recorrer
        -- construir el mensaje
        insert into tarjetas_embarque (id_billete,id_vuelo, no_embarque, no_asiento) values (
        	vIdBillete, pIdVuelo, vNumeroEmbarque, primerAsientoLibre(pIdVuelo)
        );
       vNumeroEmbarque = vNumeroEmbarque + 1;
       end loop;
    close cur_billetes;    -- cerrar el cursor
end;
$cursor$;