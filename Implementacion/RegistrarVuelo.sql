create or replace PROCEDURE RegistrarVuelo(idVuelo IN VUELO.CODVUELO%TYPE,
    destino IN VUELO.DESTINO%TYPE, 
    fechaSalida IN VUELO.FECHASALIDA%TYPE, 
    Npasajeros IN VUELO.NPASAJEROS%TYPE)
  IS
    parent_not_found exception;
    pragma exception_init(parent_not_found, -2291);
  BEGIN
    INSERT INTO vuelo VALUES(idVuelo,destino,fechaSalida,Npasajeros);
  EXCEPTION
    WHEN dup_val_on_index THEN
      RAISE_APPLICATION_ERROR (-20010, 'El vuelo ya esta registrado.');
    WHEN OTHERS THEN
      RAISE;      
END RegistrarVuelo;