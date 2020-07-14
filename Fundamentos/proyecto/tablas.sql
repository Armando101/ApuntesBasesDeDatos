DROP DATABASE IF EXISTS blog;
CREATE DATABASE IF NOT EXISTS blog;
USE blog;

/* Tablas para la base de datos ProtecoBlog */

/* Tablas independientes (No tienen llave foranea) */
CREATE TABLE  IF NOT EXISTS categorias (
	categoria_id INT NOT NULL AUTO_INCREMENT,
	nombre_categoria VARCHAR(30) NOT NULL, 
	PRIMARY KEY (categoria_id)
);

CREATE TABLE IF NOT EXISTS etiquetas (
	etiqueta_id INT NOT NULL AUTO_INCREMENT,
	nombre_etiqueta VARCHAR(30) NOT NULL,
	PRIMARY KEY (etiqueta_id)
);

CREATE TABLE IF NOT EXISTS usuarios (
	usuario_id INT NOT NULL AUTO_INCREMENT,
	login VARCHAR(30) NOT NULL,
	password VARCHAR(32) NOT NULL,
	nickname VARCHAR(40) NOT NULL,
	email VARCHAR(40) NOT NULL UNIQUE,
	PRIMARY KEY (usuario_id)
);


/* Tabla dependientes (Tienen llave foranea) */
CREATE TABLE IF NOT EXISTS posts (
	post_id INT NOT NULL AUTO_INCREMENT,
	titulo VARCHAR(150) NOT NULL,
	fecha_publicacion TIMESTAMP,
	contenido TEXT NOT NULL,
	estatus CHAR(8) DEFAULT 'Activo',

	usuario_id INT NOT NULL,
	categoria_id INT NOT NULL,
	
	PRIMARY KEY (post_id),
	FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
	FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id)
);

CREATE TABLE IF NOT EXISTS comentarios (
	comentario_id INT NOT NULL AUTO_INCREMENT,
	cuerpo_comentario TEXT NOT NULL,
	usuario_id INT NOT NULL,
	post_id INT NOT NULL,

	PRIMARY KEY (comentario_id),
	FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
	FOREIGN KEY (post_id) REFERENCES posts(post_id)
);


/* Tablas transitivas */
-- Sirven como puente par unir dos tablas cuya relación es M-M. No tienen contendido semántico 

CREATE TABLE IF NOT EXISTS posts_etiquetas (
	posts_etiquetas_id INT NOT NULL AUTO_INCREMENT,
	post_id INT NOT NULL,
	etiqueta_id INT NOT  NULL,

	PRIMARY KEY (posts_etiquetas_id),
	FOREIGN KEY (post_id) REFERENCES posts(post_id),
	FOREIGN KEY (etiqueta_id) REFERENCES etiquetas(etiqueta_id)
);
