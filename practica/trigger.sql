DELIMITER //
CREATE TRIGGER after_insert_actualizacion_libros

-- Cuándo queremos que el trigger se ejecute BEFORE o ANTES.

AFTER INSERT ON libros
-- Que se va a ejecutar cada vez que el trigger sea ejecutado.
FOR EACH ROW 
BEGIN
	UPDATE autores SET cantidad_libros = cantidad_libros + 1 WHERE autor_id = NEW.autor_id;
END;
//
-- NEW hace referencia al registro actual, al que se ha insertado.

CREATE TRIGGER after_delete_actualizacion_libros
AFTER DELETE ON libros
FOR EACH ROW
BEGIN
	UPDATE autores SET cantidad_libros = cantidad_libros - 1 WHERE autor_id = OLD.autor_id;
END;
-- NEW hace referencia al registro eliminado.
//

CREATE TRIGGER after_update_actualizacion_libros
AFTER UPDATE ON libros
FOR EACH ROW
BEGIN
	-- Si hubo un cambio en la columna THEN
	IF(NEW.autor_id != OLD.autor_id) THEN
		UPDATE autores SET cantidad_libros = cantidad_libros + 1 WHERE autor_id = NEW.autor_id;
		UPDATE autores SET cantidad_libros = cantidad_libros - 1 WHERE autor_id = OLD.autor_id;
	END IF;
END;
//

DELIMITER ;