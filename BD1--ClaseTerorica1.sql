CREATE DATABASE IF NOT EXISTS ClaseTeorica1;
USE ClaseTeorica1;

CREATE TABLE Empleado(
nro int PRIMARY KEY,
nombre varchar(30) NOT NULL,
cod_esp int,
nro_jefe int null,
sueldo decimal(7,2),
f_ingreso date);

-- drop table empleado;



CREATE TABLE Area(
		cod_area char(3) primary key,
		descripcion varchar(30) NOT NULL);

CREATE TABLE Especialidad(
		cod_esp int primary key,
		descripcion varchar(30) NOT NULL);
        
CREATE TABLE Trabaja(
		num_emp int references Empleado(num) ,
		cod_area varchar(30) references Area(cod_area),
        constraint  trabaja_pk primary key (num_emp,cod_area)
        );
        
        
	insert into Especialidad(cod_esp,descripcion)
    values(1,'Gerente'),(2,'Operario');

-- select * from Especialidad;

insert into Area(cod_area,descripcion)
values('A1','Area1'),('A2','Area2');

-- select * from Area;
    
insert into Empleado(nro,nombre,cod_esp,nro_jefe,sueldo,f_ingreso)
values (1000,'Juan',1,NULL, 10000,'20000101'),
(1001,'Pedro',2,1000, 5000,'20080501'),
(1002,'Daniel',2,1000, 2000,'20091001');

insert into Empleado(nro,nombre,cod_esp,nro_jefe,sueldo,f_ingreso)
values 
(1003,'Zarate',2,1000, 6000,'20070101'),
(1004,'Amalia',2,1000, 5000,'20200501'),
(1005,'Karmen',2,1000, 2000,'20091001');

insert into Trabaja(num_emp,cod_area)
values 
(1000,'A1'),
(1000,'A2'),
(1001,'A1'),
(1002,'A2');

insert into especialidad(cod_esp, descripcion)
values 
(1,'Gerente'),
(2,'Operario');

-- select *  from especialidad;
-- select * from trabaja;
-- Listar a todos los empleados y el lugar donde trabajan
select * from Empleado Em JOIN Trabaja T ON Em.nro = T.num_emp
	JOIN Area A ON A.cod_area = T.cod_area;

-- “Listar el nombre de los empleados que trabajan en el área de descripción Area 1 y
-- que cobran más de $5000”
SELECT Em.nro, Em.nombre
FROM Empleado Em JOIN Trabaja T 
	ON Em.nro = T.num_emp JOIN Area A ON A.cod_area = T.cod_area
    WHERE A.descripcion = 'Area1'
    AND Em.sueldo >5000;
	
-- Listar el nombre de todos los empleados. Indicar ademas el nombre de su jefe (si es que tiene)
SELECT Em.nombre,J.nombre
FROM Empleado Em LEFT JOIN Empleado J ON Em.nro_jefe = J.nro;

-- Listar el nombre de todos los empleados junto al nombre de su jefe
SELECT Em.nombre,J.nombre
FROM Empleado Em JOIN Empleado J ON Em.nro_jefe = J.nro;

-- Listar el nombre de aquellos EMPLEADOS que TRABAJAN en el AREA de código A1”
select EM.nombre
from Empleado EM JOIN Trabaja T ON EM.nro = T.num_emp
where T.cod_area = 'A1';

-- “Listar el nombre y descripción de especialidad de todos los empleados”
select EM.nombre , ES.descripcion
from Empleado EM , Especialidad ES
where EM.cod_esp = ES.cod_esp;

-- seleccionar el numero de aquellos empleados que sean jefes reales
select DISTINCT nro_jefe 
from Empleado 
where nro_jefe is not null;

-- seleccionar a los empleados que tienen los numeros 1001,1002, 1004
select * from Empleado where nro in (1001,1002,1004);



-- seleccionar los empleados que terminen con la letra n
select * from Empleado where nombre like '%N';

-- seleccionar los empleados que empiesen con la letra A
select * from Empleado where nombre like 'A%';



-- Listar a los empleados sin jefe
select * from Empleado where nro_jefe is null;

-- seleccionar a los empleados que ingresaron entre el 2008 y el 2009
select * from Empleado where f_ingreso between '20080101' AND '20091231';

-- seleccionar a los empleados que ingresaron despues del 2008-01-01
select * from Empleado where f_ingreso > '20080501';

-- seleccionar todos los campos de los Empleados donde el sueldo sea mayor a 5000
select * from Empleado where sueldo>5000;

-- ordeanar de mayor a menor segun sueldo
SELECT * FROM Empleado order by sueldo , f_ingreso desc;
 
-- cambia el campo nro a numero
select nro as numero, nombre from Empleado;

-- SELECCIONAR los nombres de los Empleados DONDE el sueldo sea MAYOR a 5000
select nombre from Empleado where sueldo>5000;
    

    
        
        
        
        
        