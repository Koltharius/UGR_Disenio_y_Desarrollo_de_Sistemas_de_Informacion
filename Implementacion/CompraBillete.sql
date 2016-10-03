create or replace PROCEDURE CompraBillete(codvuelo in COMPRA.CODVUELO%TYPE, 
  dni in PASAJERO.DNI%TYPE,
  nombre in PASAJERO.NOMBRE%TYPE,
  nacionalidad in PASAJERO.NACIONALIDAD%TYPE)
  IS
    parent_not_found exception;
    pragma exception_init(parent_not_found, -2291);
  BEGIN
    INSERT INTO pasajero VALUES (dni, nombre, nacionalidad);
    INSERT INTO compra VALUES (dni,codvuelo);
  EXCEPTION
    WHEN dup_val_on_index THEN
      RAISE_APPLICATION_ERROR (-20008, 'El cliente ya ha comprado este billete.');
    WHEN parent_not_found THEN
      RAISE_APPLICATION_ERROR (-20009, 'El vuelo en el que quiere comprar un billete no existe.');
    WHEN OTHERS THEN
      RAISE;
END CompraBillete;