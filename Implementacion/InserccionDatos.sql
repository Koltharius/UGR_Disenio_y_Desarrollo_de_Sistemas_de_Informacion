INSERT INTO VUELO(CodVuelo, Destino, FechaSalida, NPasajeros)
VALUES (1, 'GRANADA', '28/8/2016',50);

INSERT INTO VUELO(CodVuelo, Destino, FechaSalida, NPasajeros)
VALUES (12, 'LONDRES', '3/9/2016',150);

INSERT INTO VUELO(CodVuelo, Destino, FechaSalida, NPasajeros)
VALUES (15, 'PARIS', '4/5/2016',123);

INSERT INTO VUELO(CodVuelo, Destino, FechaSalida, NPasajeros)
VALUES (126, 'NEW YORK', '16/10/2016',200);

INSERT INTO AVION(CodAvion, modelo, Altura, Anchura, Longitud,pesobodega,pesomax)
VALUES (256, 'BOEING 747', 20,65,70,0,4000);

INSERT INTO AVION(CodAvion, modelo, Altura, Anchura, Longitud,pesobodega,pesomax)
VALUES (278, 'AIRBUS 330',16,60,63,0,2500);

INSERT INTO AVION(CodAvion, modelo, Altura, Anchura, Longitud,pesobodega,pesomax)
VALUES (243, 'BOEING 737', 11,28,29,0,1500);

INSERT INTO AVION(CodAvion, modelo, Altura, Anchura, Longitud,pesobodega,pesomax)
VALUES (295, 'CITATION X', 6,19,22,0,300);

INSERT INTO PISTA(CODPISTA, LONGITUD,ANCHURA)
VALUES (32,2000,45);

INSERT INTO PISTA(CODPISTA, LONGITUD,ANCHURA)
VALUES (365,3000,50);

INSERT INTO PISTA(CODPISTA, LONGITUD,ANCHURA)
VALUES (387,4000,55);

INSERT INTO TIENE(CODAVION,CODVUELO)
VALUES(295,15);

INSERT INTO TIENE(CODAVION,CODVUELO)
VALUES (243,1);

INSERT INTO TIENE(CODAVION,CODVUELO)
VALUES (256,600);



