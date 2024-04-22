CREATE TABLE DEPART (
 DEPT_NO  numeric(2) PRIMARY KEY,
 DNOMBRE  varchar(14), 
 LOC      varchar(14) ) ;

INSERT INTO DEPART VALUES (10,'CONTABILIDAD','SEVILLA');
INSERT INTO DEPART VALUES (20,'INVESTIGACION','MADRID');
INSERT INTO DEPART VALUES (30,'VENTAS','BARCELONA');
INSERT INTO DEPART VALUES (40,'PRODUCCION','BILBAO');

CREATE TABLE EMPLE (
 EMP_NO    numeric(4) PRIMARY KEY,
 APELLIDO  varchar(10)  ,
 OFICIO    varchar(10)  ,
 DIR       numeric(4) ,
 FECHA_ALT DATE      ,
 SALARIO   numeric(7),
 COMISION  numeric(7),
 DEPT_NO   numeric(2) NOT NULL) ;

INSERT INTO EMPLE VALUES (7369, 'SANCHEZ', 'EMPLEADO', 7902, '1990-12-17', 1040, NULL, 20);
INSERT INTO EMPLE VALUES (7499, 'ARROYO', 'VENDEDOR', 7698, '1990-02-20', 1500, 390, 30);
INSERT INTO EMPLE VALUES (7521, 'SALA', 'VENDEDOR', 7698, '1991-02-22', 1625, 650, 30);
INSERT INTO EMPLE VALUES (7566, 'JIMENEZ', 'DIRECTOR', 7839, '1991-04-02', 2900, NULL, 20);
INSERT INTO EMPLE VALUES (7654, 'MARTIN', 'VENDEDOR', 7698, '1991-09-29', 1600, 1020, 30);
INSERT INTO EMPLE VALUES (7698, 'NEGRO', 'DIRECTOR', 7839, '1991-05-01', 3005, NULL, 30);
INSERT INTO EMPLE VALUES (7782, 'CEREZO', 'DIRECTOR', 7839, '1991-06-09', 2885, NULL, 10);
INSERT INTO EMPLE VALUES (7788, 'GIL', 'ANALISTA', 7566, '1991-11-09', 3000, NULL, 20);
INSERT INTO EMPLE VALUES (7839, 'REY', 'PRESIDENTE', NULL, '1991-11-17', 4100, NULL, 10);
INSERT INTO EMPLE VALUES (7844, 'TOVAR', 'VENDEDOR', 7698, '1991-09-08', 1350, 0, 30);
INSERT INTO EMPLE VALUES (7876, 'ALONSO', 'EMPLEADO', 7788, '1991-09-23', 1430, NULL, 20);
INSERT INTO EMPLE VALUES (7900, 'JIMENO', 'EMPLEADO', 7698, '1991-12-03', 1335, NULL, 30);
INSERT INTO EMPLE VALUES (7902, 'FERNANDEZ', 'ANALISTA', 7566, '1991-12-03', 3000, NULL, 20);
INSERT INTO EMPLE VALUES (7934, 'MUÑOZ', 'EMPLEADO', 7782, '1992-01-23', 1690, NULL, 10);

create table ALUM0405(
DNI	  varchar(10) PRIMARY KEY,
NOMBRE	  varchar(15) NOT NULL,
APELLIDOS varchar(20) NOT NULL,
FECHA_NAC DATE,
DIRECCION varchar(20),
POBLACION varchar(20),
PROVINCIA varchar(20),
CURSO	  numeric(2)  NOT NULL,
NIVEL	  varchar(10)  NOT NULL,
CLASE	  CHAR(1)  NOT NULL,
FALTAS1	  numeric(2),
FALTAS2	  numeric(2),
FALTAS3	  numeric(2)
);

INSERT INTO ALUM0405 VALUES ('34448974N', 'CONCHA', 'ESTRUCH VIDAL','1985-11-10','C/ MEDICO FELIX, 12','BERROCALEJO', 'CACERES',2,'DAI','A',0,0,0);
INSERT INTO ALUM0405 VALUES ('34448999N', 'DORA', 'MARTIN BRE A','1994-11-10','C/ MEDICO FELIX, 10','BERROCALEJO', 'CACERES',1,'ESO','C',0,0,0);

create table notas_alumnos
 (
   NOMBRE_ALUMNO varchar(25) PRIMARY KEY,
   nota1         numeric(2),
   nota2         numeric(2),
   nota3         numeric(2)
 ) ;
 
insert into NOTAS_ALUMNOS VALUES ('Alcalde García, M. Luisa', 5, 5, 5);
insert into NOTAS_ALUMNOS VALUES ('Benito Martín, Luis', 7, 6, 8);
insert into NOTAS_ALUMNOS VALUES ('Casas Martínez, Manuel', 7, 5, 5);
insert into NOTAS_ALUMNOS VALUES ('Corregidor Sánchez, Ana', 6, 9, 8);
insert into NOTAS_ALUMNOS VALUES ('Díaz Sánchez, Maria', NULL, NULL, 7);

create table LIBRERIA
 (TEMA       CHAR(15) NOT NULL ,
  ESTANTE    CHAR(1),
  EJEMPLARES numeric(2)
 ) ;

INSERT INTO LIBRERIA VALUES ('INFORMATICA', 'A', 5);
INSERT INTO LIBRERIA VALUES ('ECONOMIA',    'A', 10);
INSERT INTO LIBRERIA VALUES ('DEPORTES',    'B', 8);
INSERT INTO LIBRERIA VALUES ('FILOSOFIA',   'C', 7);
INSERT INTO LIBRERIA VALUES ('DIBUJO',      'C', 10);
INSERT INTO LIBRERIA VALUES ('MEDICINA',    'C', 16);
INSERT INTO LIBRERIA VALUES ('BIOLOGIA',    'A', 11);
INSERT INTO LIBRERIA VALUES ('GEOLOGIA',    'D', 7);
INSERT INTO LIBRERIA VALUES ('SOCIEDAD',    'D', 9);
INSERT INTO LIBRERIA VALUES ('LABORES',     'B', 20);
INSERT INTO LIBRERIA VALUES ('JARDINERIA',  'E', 6);

CREATE TABLE ALUMNOS
(
  DNI    varchar(10) PRIMARY KEY,
  APENOM varchar(30),
  DIREC  varchar(30),
  POBLA  varchar(15),
  TELEF  varchar(10)  
) ;

CREATE TABLE MODULOS
(
  COD    numeric(2) PRIMARY KEY,
  NOMBRE varchar(25)
) ;

CREATE TABLE NOTAS
(
  DNI varchar(10) NOT NULL,
  COD numeric(2)  NOT NULL,
  NOTA numeric(2)
);

INSERT INTO MODULOS VALUES (1,'Programación');
INSERT INTO MODULOS VALUES (2,'Sistemas Informáticos');
INSERT INTO MODULOS VALUES (3,'Entornos de desarrollo');
INSERT INTO MODULOS VALUES (4,'FOL');
INSERT INTO MODULOS VALUES (5,'Empresa');
INSERT INTO MODULOS VALUES (6,'Bases de Datos');
INSERT INTO MODULOS VALUES (7,'Lenguajes de Marcas');
INSERT INTO MODULOS VALUES (8,'Inglés');


INSERT INTO ALUMNOS VALUES
('12344345','Alcalde García, Elena', 'C/Las Matas, 24','Madrid', '917766545');

INSERT INTO ALUMNOS VALUES
('4448242','Cerrato Vela, Luis', 'C/Mina 28 - 3A', 'Madrid', '916566545');

INSERT INTO ALUMNOS VALUES
('56882942','Díaz Fernández, María', 'C/Luis Vives 25', 'Móstoles', '915577545');

INSERT INTO NOTAS VALUES('12344345', 1, 6);
INSERT INTO NOTAS VALUES('12344345', 2, 5);
INSERT INTO NOTAS VALUES('12344345', 3, 6);
INSERT INTO NOTAS VALUES('4448242', 4, 6);
INSERT INTO NOTAS VALUES('4448242', 5, 8);
INSERT INTO NOTAS VALUES('4448242', 6, 4);
INSERT INTO NOTAS VALUES('4448242', 7, 5);
INSERT INTO NOTAS VALUES('56882942', 4, 8);
INSERT INTO NOTAS VALUES('56882942', 5, 7);
INSERT INTO NOTAS VALUES('56882942', 6, 8);
INSERT INTO NOTAS VALUES('56882942', 7, 9);