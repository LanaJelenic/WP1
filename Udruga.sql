create database UDRUGA;
use UDRUGA
create table OSOBA(
ID_OSOBA int NOT NULL PRIMARY KEY,
IME varchar(50),
PREZIME varchar(50),
ID_ZIVOTINJE int FOREIGN KEY REFERENCES ZIVOTINJA(ID_ZIVOTINJE)
);

create table ZIVOTINJA(
ID_ZIVOTINJE int NOT NULL PRIMARY KEY,
VRSTA varchar(100),
TE�INA decimal,
NJEGA varchar(200)
);

create table PROSTOR(
ID_PROSTORA int NOT NULL PRIMARY KEY,
SIRINA int,
DULJINA decimal,
ID_ZIVOTINJE int FOREIGN KEY REFERENCES ZIVOTINJA(ID_ZIVOTINJE)
);

create table UDRUGA(
ID_UDRUGA int NOT NULL PRIMARY KEY,
NAZIV varchar(50),
ID_OSOBA int FOREIGN KEY REFERENCES OSOBA(ID_OSOBA),
ID_ZIVOTINJE int FOREIGN KEY REFERENCES ZIVOTINJA(ID_ZIVOTINJE),
ID_PROSTORA int FOREIGN KEY REFERENCES PROSTOR(ID_PROSTORA),
ADRESA varchar(100)
);