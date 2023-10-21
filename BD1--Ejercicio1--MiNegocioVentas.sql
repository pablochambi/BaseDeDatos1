CREATE DATABASE IF NOT EXISTS MiNegocio;
USE MiNegocio;
CREATE TABLE Almacen(
			nro int PRIMARY KEY,
			nombre varchar(20),
			responsable varchar(20));

CREATE TABLE Articulo(
			cod_art int PRIMARY KEY,
			descripcion varchar(30),
			precio decimal(7,2));

CREATE TABLE Material(
			cod_mat int PRIMARY KEY,
			descripcion varchar(30));

CREATE TABLE Ciudad(
			cod_ciu int PRIMARY KEY,
			nombre varchar(30));

CREATE TABLE Proveedor(
			cod_prov int,
			nombre varchar(30),
			domicilio varchar(40),
			cod_ciu int,
			fecha_alta date,
			PRIMARY KEY(cod_prov),
			FOREIGN KEY(cod_ciu) REFERENCES Ciudad(cod_ciu));
  
CREATE TABLE Contiene(
			nro_alm int,
			cod_art int,
            CONSTRAINT contiene_pk PRIMARY KEY (nro_alm,cod_art),
			FOREIGN KEY(nro_alm) REFERENCES Almacen(nro),
			FOREIGN KEY(cod_art) REFERENCES Articulo(cod_art));


CREATE TABLE Compuesto_por(
			cod_art int,
			cod_mat int,
			CONSTRAINT compuestoPor_pk PRIMARY KEY (cod_art,cod_mat),
			FOREIGN KEY(cod_art) REFERENCES Articulo(cod_art),
			FOREIGN KEY(cod_mat) REFERENCES Material(cod_mat));


CREATE TABLE Provisto_por(
			cod_mat int,
            cod_prov int,
			CONSTRAINT provistoPor_pk PRIMARY KEY (cod_mat,cod_prov),
			FOREIGN KEY(cod_mat) REFERENCES Material(cod_mat),
			FOREIGN KEY(cod_prov) REFERENCES Proveedor(cod_prov));
  

SELECT * FROM Almacen;
SELECT * FROM Articulo;
SELECT * FROM ciudad;
SELECT * FROM compuesto_por;
SELECT * FROM contiene;
SELECT * FROM material;
SELECT * FROM proveedor;

insert into Material(cod_mat, descripcion)
			values(4,'cuatro'),(5,'cinco'),(6,'seis'),(7,'siete'),(8,'ocho'),(9,'nueve'),(10,'diez'),(11,'once'),(12,'doce'),(13,'trece'),
            (14,'catorce'),(15,'quince'),(16,'dieciseis'),(17,'diecisiete'),(18,'dieciocho');
            
-- 1. Listar los números de artículos cuyo precio se encuentre entre $100 y $1000 y su
-- descripción comience con la letra A.
SELECT A.cod_art
FROM Articulo A 
WHERE A.precio BETWEEN 100 AND 1000;

-- 2. Listar todos los datos de todos los proveedores.
SELECT * FROM Proveedor;

-- 3. Listar la descripción de los materiales de código 1, 3, 6, 9 y 18.
SELECT M.descripcion 
FROM Material M 
WHERE M.cod_mat IN (1,3,6,9,18);

-- 4. Listar código y nombre de proveedores de la calle Suipacha, que hayan sido dados
-- de alta en el año 2001.
select P.cod_prov, P.nombre
from proveedor P
where P.domicilio like '%Suipacha%'
and P.fecha_alta between '2001-01-02' and '2001-12-31';

-- 5. Listar nombre de todos los proveedores y de su ciudad.
select P.nombre as Proveedor, C.nombre as Ciudad 
from Proveedor P JOIN Ciudad C ON P.cod_ciu = C.cod_ciu;

-- 6. Listar los nombres de los proveedores de la ciudad de La Plata.
select P.nombre
from Proveedor P join Ciudad C ON P.cod_ciu = C.cod_ciu
where C.nombre = 'La Plata';

-- 7. Listar los números de almacenes que almacenan el artículo de descripción A.

select C.nro_alm
from Contiene C join Articulo A on C.nro_alm = A.nro
where A.descripcion = 'A';


-- 8. Listar los materiales (código y descripción) provistos por proveedores de la ciudad
-- de Rosario.
-- 9. Listar los nombres de los proveedores que proveen materiales para artículos
-- ubicados en almacenes que Martín Gómez tiene a su cargo.
-- 10. Mover los artículos almacenados en el almacén de número 10 al de número 20.
-- 11. Eliminar a los proveedores que contengan la palabra ABC en su nombre
-- 12. Indicar la cantidad de proveedores que comienzan con la letra F.
-- 13. Listar el promedio de precios de los artículos por cada almacén (nombre)
-- 14. Listar la descripción de artículos compuestos por al menos 2 materiales.
-- 15. Listar cantidad de materiales que provee cada proveedor (código, nombre y
-- domicilio)
-- 16. Cuál es el precio máximo de los artículos que proveen los proveedores de la ciudad
-- de Zárate.
-- 17. Listar los nombres de aquellos proveedores que no proveen ningún material.
-- 18. Listar los códigos de los materiales que provea el proveedor 10 y no los provea el
-- proveedor 15.
-- 19. Listar número y nombre de almacenes que contienen los artículos de descripción A
-- y los de descripción B (ambos).
-- 20. Listar la descripción de artículos compuestos por todos los materiales.
-- 21. Hallar los códigos y nombres de los proveedores que proveen al menos un material
-- que se usa en algún artículo cuyo precio es mayor a $100.
-- 22. Listar la descripción de los artículos de mayor precio.
-- 23. Listar los nombres de proveedores de Capital Federal que sean únicos
-- proveedores de algún material.
-- 24. Listar los nombres de almacenes que almacenan la mayor cantidad de artículos.
-- 25. Listar la ciudades donde existan proveedores que proveen todos los materiales.
-- 26. Listar los números de almacenes que tienen todos los artículos que incluyen el
-- material con código 123.







