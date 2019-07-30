DELIMITER //
/* usuario_id me permite saber a qué usuario se le va prestar un libro
libro_id me permite saber qué libro voy a prestar  */

/* Inserta un registro en libros_usuarios y resta en 1 el stock */
CREATE PROCEDURE prestamo(usuario_id INT, libro_id INT, OUT cantidad INT)

BEGIN
	SET cantidad = (SELECT stock FROM libros WHERE libros.libro_id=libro_id);

	IF cantidad >0 THEN

	INSERT INTO libros_usuarios(libro_id, usuario_id) VALUES (libro_id, usuario_id);
	UPDATE libros SET stock = stock-1 WHERE libros.libro_id = libro_id;
	
	/*ELSEIF condicion*/

	SET cantidad = cantidad -1;

	ELSE
		SELECT "No es posible realizar el prestamo" AS mensaje_error;
	END IF;

END //

CREATE PROCEDURE tipo_lector(usuario_id INT)
BEGIN
	
	SET @cantidad = (SELECT COUNT(*) FROM libros_usuarios
					WHERE libros_usuarios.usuario_id = usuario_id);

	CASE
		WHEN @cantidad > 20 THEN
			SELECT "Fanático" AS mensaje;

		WHEN @cantidad > 10 AND @cantidad <20 THEN 
			SELECT "Aficionado" AS mensaje;

		WHEN @cantidad > 5 AND @cantidad <10 THEN 
			SELECT "Promedio" AS mensaje;
		ELSE
			SELECT "Nuevo" AS mensaje;
	END CASE;

END//

/* Procedure que me devuelve 5 libros al azar */
CREATE PROCEDURE libros_azar()
BEGIN

	SET @iteracion = 0;

	WHILE @iteracion < 5 DO

		SELECT libro_id, titulo FROM libros ORDER BY RAND() LIMIT 1;
		SET @iteracion = @iteracion + 1;

	END WHILE;
END//

/*
CREATE PROCEDURE libros_azar()
BEGIN

	SET @iteracion = 0;

	REPEAT

		SELECT libro_id, titulo FROM libros ORDER BY RAND() LIMIT 1;
		SET @iteracion = @iteracion + 1;

		UNTIL @iteracion >=5	# AQUI NO HAY ;
	END REPEAT;
END//
*/



DELIMITER ;