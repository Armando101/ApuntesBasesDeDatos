SELECT libros.titulo, CONCAT(autores.nombre, " ", autores.apellido) AS Nombre_autor,
libros.fecha_creacion
FROM libros
INNER JOIN autores ON libros.autor_id=autores.autor_id;

/* Obtener el título de todos los libros y autores, siempre y cuando el autor tenga un pseudonimo*/

SELECT libros.titulo, CONCAT(autores.nombre, " ", autores.apellido) AS Nombre_autor,
libros.fecha_creacion
FROM libros
INNER JOIN autores ON libros.autor_id=autores.autor_id AND autores.pseudonimo IS NOT NULL;

/*
usarios = a
libros_usuarios=b
*/

SELECT 
	CONCAT(nombre, " ", apellidos),
	libros_usuarios.libro_id

FROM usuarios
LEFT JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id;

/* Mostrar el nombre de los usuarios y el id de libros prestados, siempre y cuando
El usuario haya prestado al menos un libro */

SELECT 
	CONCAT(nombre, " ", apellidos),
	libros_usuarios.libro_id

FROM usuarios
LEFT JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
WHERE libros_usuarios.libro_id IS NOT NULL;

/* Mostrar el nombre de los usuarios y el id de libros prestados, siempre y cuando
El usuario no haya prestado libros */

SELECT 
	CONCAT(nombre, " ", apellidos),
	libros_usuarios.libro_id

FROM usuarios
LEFT JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
WHERE libros_usuarios.libro_id IS NULL;

/* Obtener el nombre completo de los usuarios que haya prestado un libro,
el libro debió haber sido escrito por un autore con pseaudonimo 
y el prestamo se debió haber realizado el día de hoy.

Podemos ir viendo el orden en que vamos a unir las entidades y hacerlo paso por paso
		usuarios
		libros_usuarios
		libros
		autores
*/


SELECT DISTINCT
CONCAT(usuarios.nombre, " ", usuarios.apellidos) AS nombre_usuario
FROM usuarios
INNER JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
		AND DATE(libros_usuarios.fecha_creacion) = CURDATE()
INNER JOIN libros ON libros_usuarios.libro_id = libros.libro_id
INNER JOIN autores ON libros.autor_id = autores.autor_id AND autores.pseudonimo IS NOT NULL; 