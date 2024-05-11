select 1 as id_plataforma, obtener_venta_plataforma(1)
union
select 2, obtener_venta_plataforma(2)
union
select 3, obtener_venta_plataforma(3)
union
select 4, obtener_venta_plataforma(4)
union
select 5, obtener_venta_plataforma(5)
union
select 6, obtener_venta_plataforma(6)
union
select 7, obtener_venta_plataforma(7)
order by 1;