/*
START TRANSACTION;
	
	SET @libro_id = 20, @usuario_id = 3;
	
	UPDATE libros SET stock = stock - 1 WHERE libro_id = @libro_id;
	SELECT stock FROM libros WHERE libro_id = @libros_usuarios;

	INSERT INTO libros_usuarios(libro_id, usuario_id) VALUES(@libro_id, @usuario_id);

	SELECT * FROM libros_usuarios;

COMMIT;
*/

/* Transacciones y store procedures */

DELIMITER //
CREATE PROCEDURE prestamo_tr(usuario_id INT, libro_id INT)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION -- Ocurre un error
	BEGIN
		-- Código a ejecutar si hay un error
		ROLLBACK;
	END;

	START TRANSACTION;
		
		INSERT INTO libros_usuarios(libro_id, usuario_id) VALUES(libro_id, usuario_id);
		UPDATE libros SET stock = stock - 1 WHERE libros.libro_id = libro_id;

	COMMIT;

END //

DELIMITER ;