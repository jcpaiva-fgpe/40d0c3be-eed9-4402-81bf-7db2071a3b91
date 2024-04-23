INSERT INTO EMPLE VALUES (9000, 'MARTINEZ', 'EMPLEADO', 7566, '1991-12-03', 3000, NULL, 20);
INSERT INTO EMPLE VALUES (9001, 'GOMEZ', 'EMPLEADO', 7782, '1992-01-23', 1690, NULL, 10);

delete from EMPLE where emp_no = 9000;
delete from emple where emp_no = 9001;

select * from auditaremple ORDER BY operacion;