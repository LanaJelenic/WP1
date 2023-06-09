create database stablo;

use stablo

create table punac(
ID_punca int not null primary key identity(1,
1),
ogrlica int,
gustoca decimal(14,
9),
hlace varchar(41)
);

create table cura(
ID_cure int not null primary key identity(1,
1),
novcica decimal(16,
5),
gustoca decimal(10,
6),
lipa decimal(13,
10),
ogrlica int,
boja_kose varchar(38),
suknja varchar(36),
ID_punca int foreign key references punac(ID_punca)
);

create table muskarac(
ID_muskarca int not null primary key identity(1,
1),
boja_ociju varchar(50),
hlace varchar(30),
model_naocala varchar(43),
maraka decimal(14,
5),
);

alter table muskarac add ID_zene int foreign key references zena(ID_zene);

create table mladic(
ID_mladica int not null primary key identity(1,1),
suknja varchar(50),
kuna decimal(16,8),
drugiputa datetime,
asocijalno bit,
ekstroventno bit,
dukseriva varchar(48),
ID_muskarca int foreign key references muskarac(ID_muskarca)

);

create table zena(
ID_zene int not null primary key identity(1,1),
treciputa datetime,
hlace varchar(46),
kratkamajca varchar(31),
jmbag char(11),
bojaociju varchar(39),
haljina varchar(44)
);

alter table zena add ID_sestre int foreign key references sestra(ID_sestre);

create table sestra(
ID_sestre int not null primary key identity(1,1),
introvertno bit,
haljina varchar(31),
maraka decimal(16,
6),
hlace varchar(46),
narukvica int
);

create table svekar(
ID_svekra int not null primary key identity(1,1),
bojaociju varchar(40),
prstena int,
dukserica varchar(41),
lipa decimal(13,
8),
eura decimal(12,
7),
majica varchar(35)
);

create table sestra_svekar(
ID_ss int not null primary key identity(1,1),
ID_sestre int foreign key references sestra(ID_sestre),
ID_svekra int foreign key references svekar(ID_svekra)
);

insert
into
	muskarac(boja_ociju,hlace,model_naocala,maraka,)
values
('zelena','kratke','guess',156.23),
('plava','duge','okrugle',200.00),
('smeda','kaki','retro',250.65);

select *
from
	muskarac;

update
	muskarac
set
	ID_zene = 3
where
	ID_muskarca = 1;

update
	muskarac
set
	ID_zene = 2
where
	ID_muskarca = 2;

update
	muskarac
set
	ID_zene = 1
where
	ID_muskarca = 3;

insert
	into
	zena(treciputa,	hlace,	kratkamajca,jmbag,bojaociju,haljina)
values
('2023-03-03','plave','ljubičasta',12345678910,'siva','crvena dugačka'),
('2023-05-05','traper','na britele',78945612322,'smeda','kratka'),
('2023-06-06','kratke','roza',55566644433,'zelena','crna');

insert
	into
	zena(ID_sestre)
values
(1),
(2),
(3);

delete
from
	zena
where
	ID_sestre = 1;

delete
from
	zena
where
	ID_sestre = 2;

delete
from
	zena
where
	ID_sestre = 3;

update
	zena
set
	ID_sestre = 1
where
	ID_zene = 1;

update
	zena
set
	ID_sestre = 2
where
	ID_zene = 2;

update
	zena
set
	ID_sestre = 3
where
	ID_zene = 3;

select
	*
	from zena;

insert
	into
	sestra(introvertno,	haljina,maraka,	hlace,	narukvica)
values
(1,'roza',200.00,'crne',2),
(0,'crvena',150.50,'široke',1),
(1,'crna',160-87,'uske',3);

select
	*
	from sestra;

insert
	into
	svekar(bojaociju,prstena,dukserica,	lipa,eura,majica)
values
('smeda',2,'crvena',0.75,20.53,'kratka'),
('zelena,',1,'kratka',0.50,19.40,'duga'),
('plava',3,'dugačka',0.20,1.99,'plava');

select
	*
	from svekar;

insert
	into
	sestra_svekar(ID_sestre,ID_svekra)
values
(3,1),
(2,2),
(1,3);

select
	*
from
	sestra_svekar;

insert
	into
	cura(novcica,gustoca,lipa,ogrlica,boja_kose,suknja)
values
(16.55,132.22,0.50,2,'smeđa','kratka'),
(17.55,13.22,0.45,2,'plava','dugačka'),
(16.40,132.30,0.30,1,'smeđa','teksas');

select
	*
from
	cura;

update
	cura
set
	gustoca = 15.77;

insert
	into
	mladic(suknja,kuna,	drugiputa,	asocijalno,	ekstroventno,dukseriva,	ID_muskarca)
values
('kratka',100.00,'2023-06-05',0,1,'crvena',1),
('duga',50.00,'2023-06-01',1,0,'plava',2),
('teksas',13.00,'2023-05-24',1,0,'zelena',3),
('kratka',20.00,'2023-06-05',0,1,'crvena',1),
('kratka',10.00,'2023-06-05',0,1,'crvena',1);

select * from mladic;

delete from mladic
where kuna>15.78;

select
	sv.dukserica,
	ml.asocijalno,
	mu.hlace,
	se.haljina 
from
	mladic ml
inner join muskarac mu on
	ml.ID_muskarca = mu.ID_muskarca
inner join zena ze on
	mu.ID_zene = ze.ID_zene
inner join sestra se on
	ze.ID_sestre = se.ID_sestre
inner join sestra_svekar ss on
	se.ID_sestre = ss.ID_sestre
inner join svekar sv on
	ss.ID_svekra = sv.ID_svekra
where
 se.haljina like '%ba%'
OR
ze.hlace like 'a%' 
order by 
mu.hlace 
desc;



select
	se.haljina ,se.maraka
from
	sestra se
left join sestra_svekar ss ON
	ss.ID_sestre = se.ID_sestre ;









