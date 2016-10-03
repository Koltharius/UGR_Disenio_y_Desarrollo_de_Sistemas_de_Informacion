create or replace PROCEDURE altaCarga(idVuelo IN CARGAS.CODVUELO%TYPE,
    idCarga IN CARGAS.CODCARGA%TYPE, 
    Peso IN CARGAS.PESO%TYPE, 
    Contenido IN CARGAS.CONTENIDO%TYPE)
  IS
    pesobodegaLocal number;
    pesomaxLocal number;
    idavionLocal number;
    parent_not_found exception;
    peso_max exception;
    pragma exception_init(parent_not_found, -2291);
  BEGIN
    INSERT INTO cargas VALUES(idCarga,idVuelo,Peso,Contenido);
    
    SELECT av.codavion INTO idavionLocal FROM avion av,vuelo vu,tiene ti
    WHERE av.codavion = ti.codavion AND vu.codvuelo = ti.codvuelo and vu.codvuelo=idvuelo;

    SELECT pesobodega INTO pesobodegaLocal FROM avion
    WHERE codavion = idavionLocal;
    
    SELECT pesomax INTO pesomaxLocal FROM avion
    WHERE codavion = idavionLocal;
    
    IF(pesobodegaLocal + Peso > pesomaxLocal) THEN
    RAISE peso_max;
    END IF;
    
    UPDATE avion
    SET pesobodega = pesobodegaLocal + Peso
    WHERE codavion = idavionLocal;
    
  EXCEPTION
    WHEN dup_val_on_index THEN
      RAISE_APPLICATION_ERROR (-20001, 'La carga ya esta registrado.');
    WHEN parent_not_found THEN
      RAISE_APPLICATION_ERROR (-20002, 'El vuelo en el que quiere insertar la carga no existe.');
    WHEN peso_max THEN
      RAISE_APPLICATION_ERROR (-20003, 'Se ha superado el peso límite del avión.');
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR (-20004, 'El vuelo no tiene avion asignado.');
    WHEN OTHERS THEN
      RAISE;
end altaCarga;