
use LANA;

create table CITATELJ(
ID_CITATELJA int NOT NULL PRIMARY KEY,
IME varchar(50),
PREZIME varchar(50),
ADRESA varchar(100)
);

create table KNJIGA (
ID_KNJIGE int NOT NULL PRIMARY KEY,
NAZIV varchar(100),
PISAC VARCHAR(50),
CIJENA INT
);


create table VLASNIK(
ID_VLASNIKA int NOT NULL IDENTITY(1,1) PRIMARY KEY,
IME varchar(50),
PREZIME varchar(50),
ADRESA varchar(50),
ID_KNJIGE int FOREIGN KEY REFERENCES KNJIGA(ID_KNJIGE),
ID_CITATELJA int FOREIGN KEY REFERENCES CITATELJ(ID_CITATELJA)
);

create table KLUB_CITATELJA(
ID_KLUBA_CITATELJA int NOT NULL PRIMARY KEY,
NAZIV varchar(50),
ADRESA varchar(100),
DATUM_POSUDBE datetime,
ID_CITATELJA int FOREIGN KEY REFERENCES CITATELJ(ID_CITATELJA),
ID_KNJIGE int FOREIGN KEY REFERENCES KNJIGA(ID_KNJIGE),
ID_VLASNIKA int FOREIGN KEY REFERENCES VLASNIK(ID_VLASNIKA)
);
