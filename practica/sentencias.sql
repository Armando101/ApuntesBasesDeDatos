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
	autor_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(25) NOT NULL,
	apellido VARCHAR(25),
	pseudonimo VARCHAR(50) UNIQUE,
	genero ENUM('M','F'),
	fecha_nacimiento DATE NOT NULL,
	pais_origen VARCHAR(40) NOT NULL,
	fecha_creacion DATETIME DEFAULT current_timestamp
);

CREATE TABLE IF NOT EXISTS libros (
	libro_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	autor_id INT UNSIGNED NOT NULL,

	titulo VARCHAR(50) NOT NULL,
	descripcion VARCHAR(250),
	paginas INT UNSIGNED,
	fecha_publicacion DATE NOT NULL,
	fecha_creacion DATETIME DEFAULT current_timestamp,
	FOREIGN KEY(autor_id) REFERENCES autores(autor_id) ON DELETE CASCADE
);

/* Insercción de autores*/

INSERT INTO autores(nombre, apellido, pseudonimo, genero, fecha_nacimiento, pais_origen) 
		VALUES ('Stephen Edwin', 'King', 'Richard Bachman','M', '1947-09-27', 'USA'),
		('Joanne', 'Rowling', 'J.K. Rowling','F', '1947-09-27', 'Reino Unido');


/* Insercción de libros*/
	
INSERT INTO libros(autor_id, titulo, fecha_publicacion)
	VALUES (1, 'Carrie', '1974-01-01'),
			(1, 'El misterio de Salems Lot', '1975-01-01'),
			(1, 'Ojos de fuego', '1980-01-01'),
			(1, 'Cujo', '1981-01-01'),

			(2, 'Harry Potter y la piedra filosofal', '1997-06-30'),
			(2, 'Harry Potter y la camara secreta', '1998-07-2'),
			(2, 'Harry Potter y el prisionero de Azkaban', '1999-07-8'),
			(2, 'Harry Potter y el cáliz de fuego', '2000-03-20'),
			(2, 'Harry Potter y la orden del fénix', '2003-06-21'),
			(2, 'Harry Potter y el misterio del príncipe', '2005-06-16'),
			(2, 'Harry Potter y las reliquias de la muerte', '2007-07-21');

ALTER TABLE libros ADD ventas INT UNSIGNED NOT NULL;
SELECT * FROM autores;
SELECT * FROM libros;
