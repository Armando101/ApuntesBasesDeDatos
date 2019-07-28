DROP DATABASE IF EXISTS libreria_cf;
CREATE DATABASE IF NOT EXISTS libreria_cf;

USE libreria_cf;
/* 
¿Qué tipo de entidades?  autores
Nombre: autores
*/

/*
Nombre
Genero
Fecha de nacimiento
País de origen
*/

/* columna y el tipo de dato */


CREATE TABLE IF NOT EXISTS autores (
	autor_id INT UNSIGNED NOT NULL,
	nombre VARCHAR(25) NOT NULL,
	apellido VARCHAR(25),
	pseudonimo VARCHAR(50) UNIQUE,
	genero ENUM('M','F'),
	fecha_nacimiento DATE NOT NULL,
	pais_origen VARCHAR(40) NOT NULL,
	fecha_creacion DATETIME DEFAULT current_timestamp
);

/*
INSERT INTO autores(autor_id, nombre, apellido, genero, fecha_nacimiento, pais_origen)
VALUES (1, 'Test autor', 'Test autor', 'M', '2019-07-28', 'México');

INSERT INTO autores(autor_id, nombre) VALUES (2, 'Test autor');

INSERT INTO autores(autor_id, nombre, genero, pais_origen)
VALUES (3, 'Test autor', 'M', 'Colombia');

INSERT INTO autores(autor_id, nombre, fecha_nacimiento, pais_origen)
VALUES (4, 'Test autor', '1997-08-29', 'Brasil');

INSERT INTO autores(autor_id, nombre, apellido, genero, fecha_nacimiento, pais_origen)
VALUES (5, 'Test autor', 'Test autor', 'F', '2000-07-28', 'Argentina');
*/

/* Insertando múltiples registros */

INSERT INTO autores(autor_id, nombre, genero, fecha_nacimiento, pais_origen) 
VALUES (1, 'Armando', 'M', '2019-07-28', 'México'),
		(2, 'Mario', 'M', '2019-07-28', 'Perú'),
		(3, 'Rubén', 'M', '2019-07-28', 'México'),
		(4, 'Juan',  'M', '2019-07-28', 'México'),
		(5, 'Elena', 'F', '2019-07-28', 'México');

INSERT INTO autores(autor_id, nombre, apellido, pseudonimo, genero, fecha_nacimiento, pais_origen) 
		VALUES (6, 'Stephen Edwin', 'King', 'Richard Bachman','M', '1947-09-27', 'USA');


SELECT * FROM autores;