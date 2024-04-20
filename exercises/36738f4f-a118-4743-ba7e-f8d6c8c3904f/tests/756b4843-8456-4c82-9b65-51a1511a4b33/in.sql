insert into alum0405(dni, nombre, apellidos, fecha_nac, 
	direccion, poblacion, provincia, clase, faltas1, faltas2, faltas3)
values('34448997J', 'FRANCISCO', 'MARTINEZ', '1982-04-01',
	'C/MEDICO FELIX, 14', 'BERROCALEJO', 'CACERES', 'A', 0, 0, 0);

insert into alum0405(dni, nombre, apellidos, fecha_nac, 
	direccion, poblacion, provincia, clase, faltas1, faltas2, faltas3)
values('34448957Z', 'ANDRÉS', 'SORIANO', '2006-03-01',
	'C/MAYOR, 35', 'MADRID', 'MADRID', 'B', 0, 0, 0);

insert into alum0405(dni, nombre, apellidos, fecha_nac, 
	direccion, poblacion, provincia, clase, faltas1, faltas2, faltas3)
values('34448557X', 'DAVID', 'GONZALEZ', '1993-08-04',
	'C/STA FLORENTINA, 23', 'CARTAGENA', 'CARTAGENA', 'B', 0, 0, 0);

update alum0405 set fecha_nac = '2005-01-03' where dni = '34448974N';
update alum0405 set fecha_nac = '1979-01-06' where dni = '34448999N';

select * from alum0405;