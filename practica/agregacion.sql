SELECT CONCAT(nombre, " ", apellido) AS nombre_completo FROM autores
UNION
SELECT CONCAT(nombre, " ", apellidos) AS nombre_completo FROM usuarios;

SELECT CONCAT(nombre, " ", apellido) AS nombre_completo, "" AS email, pais_origen AS Pais FROM autores
UNION
SELECT CONCAT(nombre, " ", apellidos) AS nombre_completo, email, "" FROM usuarios;


/* Subconsultas */

/*En la primera subconsulta obtiene el promedio, en la segunda obtiene los id's de los autores
en una lista, después concatena el nombre de los autores comparando los id's de la lista.*/

SELECT CONCAT(nombre, " ", apellido) AS Nombre_Autor
FROM autores
WHERE autor_id IN (

SELECT autor_id FROM libros 
GROUP BY autor_id 
HAVING SUM(ventas) > (SELECT AVG(ventas) FROM libros));