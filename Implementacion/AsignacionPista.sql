create or replace PROCEDURE asignacionPista(idVuelo IN VUELO.CODVUELO%TYPE,
    idPista IN PISTA.CODPISTA%TYPE
    )
  IS
    idavionLocal number;
    tamPista number;
    tamAvion number;
    parent_not_found exception;
    peso_max exception;
    tamano_mayor exception;
    pragma exception_init(parent_not_found, -2291);
  BEGIN
    INSERT INTO asigna VALUES(idPista,idVuelo);
    
    SELECT av.codavion INTO idavionLocal FROM avion av,vuelo vu,tiene ti,asigna asi
    WHERE av.codavion = ti.codavion AND vu.codvuelo = ti.codvuelo and vu.codvuelo=idVuelo and asi.codvuelo=vu.codvuelo and asi.codpista=idPista;
    
    select longitud into tamPista from pista
    where codpista=idpista;
    
    select longitud into tamAvion from avion
    where codavion=idavionLocal;
    
    if(tamAvion*50>tamPista) then
      raise tamano_mayor;
    end if;
  EXCEPTION
    WHEN dup_val_on_index THEN
      RAISE_APPLICATION_ERROR (-20005, 'El vuelo ya esta asignado a una pista.');
    WHEN parent_not_found THEN
      RAISE_APPLICATION_ERROR (-20006, 'El vuelo no existe.');
    WHEN tamano_mayor then
      RAISE_APPLICATION_ERROR (-20007, 'El avion no puede aterrizar en esta pista.');
    WHEN OTHERS THEN
      RAISE;
end asignacionPista;