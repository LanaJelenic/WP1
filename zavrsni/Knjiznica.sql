create database knjiznica1;
use knjiznica1

create table clan(
ID_clana int not null primary key identity(1,1),
ime varchar(50),
prezime varchar(50),
br_iskaznice int,
lozinka varchar(10),
status bit
);

create table evidencija_posudbe(
ID_posudbe int not null primary key identity(1,1),
ID_clana int foreign key references clan(ID_clana),
datum_posudbe datetime,
datum_vracanja datetime
);

create table knjiga(
ID_knjige int not null primary key identity(1,1),
naslov varchar(50),
ime_autora varchar(50),
prezime_autora varchar(50),
sazetak varchar(250),
br_stranica int
);

create table knjiga_posudba(
ID_knjige int foreign key references knjiga(ID_knjige),
ID_posudbe int foreign key references evidencija_posudbe(ID_posudbe)
);

INSERT INTO clan(ime,prezime,br_iskaznice,lozinka,status)
VALUES
('Luka','Horvat',123,'lhorvat',1),
('Maja','Prigl',124,'pmaja',1),
('Ante','Bogović',125,'abogovic',1),
('Iva','Dvojak',126,'dvojakI',1);

SELECT*FROM clan;

INSERT INTO evidencija_posudbe(ID_clana,datum_posudbe,datum_vracanja)
VALUES
(2,'2023-04-16','2023-04-30'),
(3,'2023-05-05','2023-05-19'),
(4,'2023-05-10','2023-05-24'),
(5,'2023-05-20','2023-06-03'),
(4,'2023-06-05','2023-06-19'),
(3,'2023-02-14','2023-02-28');

SELECT*FROM evidencija_posudbe;

INSERT INTO knjiga(naslov,ime_autora,prezime_autora,sazetak,br_stranica)
VALUES
('Wayward pines','Blake','Crouch','Gradić Wayward Pines okružen je elektrificiranom ogradom s bodljikavom žicom na vrhu, koja je i pod danonoćnom prismotrom snajperista.
 U gradu živi 461 stanovnik koji se tamo probudio nakon teške prometne nesreće.',335),
 
 ('Mrtva priroda','Joy','Fielding','Od teških ozljeda Casey pada u komu. Cijelo je vrijeme svjesna svoje okolina, ali nije u stanju pomaknuti nijedan dio tijela i komunicirati. 
Leži u bolničkom krevetu i sluša što govore njezini posjetitelji koji ne znaju da ih ona čuje.',328),

('Institut','Stephen','King','Usred noći, u obiteljskoj kući u predgrađu Minneapolisa nepoznati provalnici ubijaju roditelje Lukea Ellisa, a njega omamljuju i odvode u nepoznatom smjeru.',656),

('Svijet poslije','Susan','EE','Kad Penryninu sestru Paige zarobe misleći da je čudovište, situacija završi masakrom. Paige nestane. Ljudi su prestravljeni.
Potraga je vodi u središte anđeoskih tajnih planova',368),

('Djevojke koje sjaje','Lauren','Beukes','Godine 1931. Harper Curtis nakon počinjenog ubojstva bježi od podjednako nasilnih utjerivača pravde. 
Spletom okolnosti uspijeva im uteći i sklonište pronalazi u napuštenoj kući',302),

('Trkač','Patrick','Lee','Sam, koji je pet godina bio pripadnik elitnog tima za supertajne operacije, instinktivno pokušava spasiti djevojcicu koja se ne sjeca svoje prošlosti ni razloga zašto je ti ljudi pokušavaju ubiti.',330);

SELECT*FROM knjiga;

INSERT INTO knjiga_posudba(ID_knjige,ID_posudbe)
VALUES
(22,1),
(23,2),
(24,3),
(25,4),
(26,5),
(27,6);

SELECT*FROM knjiga_posudba;