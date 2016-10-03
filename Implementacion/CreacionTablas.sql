create table vuelo(				
  CodVuelo number primary key,
  Destino varchar2(20),
  FechaSalida date,
  NPasajeros number
  );
  
create table Pasajero(
  DNI varchar2(10) primary key,
  Nombre varchar2(30),
  Nacionalidad varchar2(20)
  );

create table Compra(
  DNI references pasajero(DNI),
  codVuelo references vuelo(codVuelo),
  primary key(DNI,codVuelo)
);
  
create table Avion(
  CodAvion number primary key,
  modelo varchar2(15),
  Altura number,
  Anchura number,
  Longitud number,
  pesoBodega number default 0,
  pesoMax number
);

create table Tiene(
  CodAvion references Avion(codAvion),
  CodVuelo references Vuelo(CodVuelo) primary key
);

create table Pista(
  CodPista number CONSTRAINT CodPista_notnull not null
  CONSTRAINT CodPista_primarykey primary key,
  Longitud number,
  Anchura number
);

create table Asigna(
  CodPista references Pista(CodPista),
  CodVuelo references Vuelo(CodVuelo) primary key
);

create table Cargas(
  CodCarga number,
  peso number,
  contenido varchar2(30),
  CodVuelo references Vuelo(CodVuelo),
  primary key(CodCarga, CodVuelo)
);
