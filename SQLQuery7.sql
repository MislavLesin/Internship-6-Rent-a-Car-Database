CREATE DATABASE RentACar

go

USE RentACar

CREATE TABLE VehicleTypes(
Id int IDENTITY(1,1) PRIMARY KEY,
Type nvarchar(50) NOT NULL,
SummerPricePerHalfDay float NOT NULL,
WinterPricePerHalfDay float NOT NULL
)

CREATE TABLE Registrations(
Id int IDENTITY(1,1) PRIMARY KEY,
DateOfRegistration DateTime2 NOT NULL,
RegistrationEndDate DateTime2
)

CREATE TABLE Vehicles(
	Id int IDENTITY(1,1) PRIMARY KEY,
	Make nvarchar(40) NOT NULL,
	Model nvarchar(50) NOT NULL,
	Colour nvarchar(40) NOT NULL,
	Milage nvarchar(12) NOT NULL,
	VehicleTypeId int FOREIGN KEY REFERENCES VehicleTypes(Id) NOT NULL,
	RegistrationId int FOREIGN KEY REFERENCES Registrations(Id)
)

CREATE TABLE Staff (
Id int IDENTITY(1,1) PRIMARY KEY,
FirstName nvarchar(50) NOT NULL,
LastName nvarchar(50) NOT NULL,
Email nvarchar(50)
)


CREATE TABLE Rentals (
Id int IDENTITY(1,1) PRIMARY KEY,
CustomerFirstName nvarchar(50) NOT NULL,
CustomerLastName nvarchar(50) NOT NULL,
CustomerOib nvarchar(8) NOT NULL,
CustomerDateOfBirth DateTime2,
CustomerDriversLicnceNumber nvarchar(12) NOT NULL,
CustomerCreditCardNumber nvarchar(12) NOT NULL,
VehicleId int FOREIGN KEY REFERENCES Vehicles(Id) NOT NULL,
StaffId int FOREIGN KEY REFERENCES Staff(Id) NOT NULL,
RentMadeOnDate DateTime2 NOT NULL,
Duration decimal not null
)

USE RentACar3;
EXEC sp_configure 'clr enabled' ,1
GO

RECONFIGURE
GO
EXEC sp_configure 'clr enabled'  
GO

USE RentACar3
GO

EXEC sp_changedbowner 'sa'
USE RentACar3
GO


-------------------------------------------------
ALTER TABLE Staff
ADD DateOfBirth DateTime2 NOT NULL
go

insert into Staff(FirstName ,LastName,Email, DateOfBirth) VALUES
('Marko','Markic', 'MarkoM@Gmail.com', '1992-6-12'),
('Ivan','Ivkovic', 'IvanI@Gmail.com', '1990-2-23'),
('Ante','Antic', 'AnteAA@Gmail.com', '1986-9-1'),
('Bosko','Buha', 'BoskoB@Gmail.com', '1975-6-18'),
('Marija','Marinic', 'MarijaM@Gmail.com', '1998-5-16'),
('Ana','Anic', 'AnaA@Gmail.com', '1996-2-12'),
('Lucija','Lukovic', 'LucijaL@Gmail.com', '1994-2-1'),
('Antea','Basic', 'AnteaA@Gmail.com', '1994-11-12')



insert into VehicleTypes (Type,SummerPricePerHalfDay,WinterPricePerHalfDay) values
('50cc Moped',125,110),
('125cc Bike',140,125),
('250cc Bike',220,200),
('Small city car',190,165),
('Compact Car',210,180),
('Caravan Car',300,270),
('Estate Car',320,290),
('SUV Car',400,370),
('Cargo Car',450,420)






insert into Registrations(DateOfRegistration,RegistrationEndDate) Values
('2020-6-1','2021-6-1'),
('2020-6-10','2021-6-10'),
('2020-6-11','2021-6-11'),
('2020-2-1','2021-2-1'),
('2020-2-23','2021-2-23'),
('2020-3-3','2021-3-3'),
('2020-2-1','2021-2-1'),
('2020-2-1','2021-2-1'),
('2020-7-7','2021-7-7'),
('2020-9-1','2021-9-1'),
('2020-7-9','2021-7-9'),
('2020-2-2','2021-2-2'),
('2020-5-1','2021-5-1'),
('2020-5-1','2021-5-1'),
('2020-5-8','2021-5-8'),
('2020-7-7','2021-7-7'),
('2020-7-12','2021-7-12'),
('2020-6-23','2021-6-23'),
('2020-1-24','2021-1-24'),
('2020-11-11','2021-11-11'),
('2020-6-11','2021-6-11')



insert into Vehicles (Make, Model,Colour,Milage,VehicleTypeId,RegistrationId) values
('Piaggio','Typhoon 50', 'Black', '7250',1,1),
('Piaggio','Typhoon 50', 'Yelow', '5000',1,2),
('Piaggio','Typhoon 50', 'Grey', '1200',1,3),
('Piaggio','Typhoon 50', 'Black', '4006',1,4),
('Piaggio','Typhoon 50', 'White', '3248',1,5),
('Piaggio','Vespa Primavera 125', 'White', '258',2,6),
('Piaggio','Vespa Primavera 125', 'Black', '1120',2,7),
('Piaggio','Vespa 250 GTS', 'Grey', '700',3,8),
('Piaggio','Vespa 250 GTS', 'Black', '1135',2,9),
('Volkswagen','UP', 'White', '20650',4,10),
('Volkswagen','UP', 'Blue', '30000',4,11),
('Renault','Clio', 'White', '15000',4,12),
('Volkswagen','Golf', 'Blue', '28000',5,13),
('Volkswagen','Golf', 'Red', '12540',5,14),
('Renault','Clio Grand Tour', 'Red', '13000',6,15),
('Volkswagen','Golf Plus', 'White', '10500',6,16),
('Skoda','Octavia', 'Black', '24000',7,17),
('BMW','3 - Series', 'Grey', '45000',7,18),
('Peugeot','3008', 'Red', '42051',8,19),
('Peugeot','3008', 'Black', '51000',8,20),
('Volkswagen','Caddy Furgon', 'White', '70500',9,21)


insert into Rentals (CustomerFirstName,CustomerLastName,CustomerOib,
CustomerDateOfBirth,CustomerDriversLicnceNumber,CustomerCreditCardNumber,
VehicleId,StaffId,RentMadeOnDate, Duration) values

('Marko','Markic', '123-456', '1992-6-12','78945781','7485769400',1,1,'2020-7-12', 3),		
('Mike','Mikes', '453-126', '1990-2-23','92548167','7484958105',2,2,'2020-7-15', 1.5),			
('Ante','Antic', '656-456', '1986-9-1','32655597','9680347195',3,3,'2020-5-15',30),				
('Bosko','Buha', '147-852', '1975-6-18','44715926','9586714983',4,4,'2020-5-5',15),
('Marija','Marinic', '145-445', '1998-5-16','95601410','4031958746',5,5,'2020-8-15',11),
('Ana','Anic', '969-006', '1996-2-12','96963671','9567841967',6,6,'2020-9-5',6.5),
('Lucija','Lukovic', '177-231', '1994-2-1','10506784','9630570148',7,7,'2020-7-1',13),
('Antea','Basic', '195-952', '1994-11-12','30295847','9584716659',8,8,'2020-2-25',4),
('Andrea','Andric','648-9125','1995-3-3','965165742','9487520641',9,1,'2020-8-8',6),			
('Marko','Markicevic', '747-456', '1992-6-18','78967818','1248769400',10,2,'2020-5-12',11),
('Alan','Alles', '963-126', '1991-2-2','92502574','7484741005',11,2,'2020-9-15',2.5),
('Antea','Antic', '968-456', '1986-8-1','32666597','9858947195',12,3,'2020-4-15',3.5),
('Bosko','Boskovic', '458-852', '1975-9-18','40265592','8585714983',13,4,'2020-5-7',8),
('Marija','Luketin', '558-996', '1997-6-9','99220010','4034545246',14,5,'2020-8-22',1),
('Ana','Anicevska', '969-007', '1985-2-12','96021571','9566363567',15,6,'2020-8-15',2),
('Ante','Lukovic', '996-231', '1996-2-1','10636784','9630787848',16,7,'2019-7-1',1.5),
('Ivo','Ivan', '965-952', '1994-8-12','30699887','9587755859',17,8,'2020-12-23',3),																								
('Marko','Skoro', '747-985', '1993-5-19','78033418','1248745100',18,2,'2020-2-1',8.5),
('Miho','Alkar', '985-555', '1992-12-2','92599994','1248740009',19,2,'2020-6-6',6.5),
('Lucija','Banovac', '968-002', '1976-8-1','44446597','9854520195',20,3,'2020-1-12',5),
('Bosko','Gabela', '458-959', '1979-9-11','44959592','8585799983',21,4,'2020-5-18',4),
('Anamarija','Vidovic', '558-784', '1997-6-19','99950010','4078785246',14,5,'2020-8-21',3),
('Ana','Bosnjak', '969-050', '1988-5-12','96002199','9566361120',15,6,'2020-7-14',7),
('Ante','Jerkov', '996-958', '1996-11-12','10634452','9630786565',16,7,'2019-9-1',9),
('Ivo','Sivo', '965-965', '1994-1-1','30699596','9587722039',17,8,'2020-12-2',1.5)				





--1 Dohvatiti sva vozila kojima je istekla registracija

select * from Vehicles v
join Registrations r ON v.RegistrationId = r.Id
where RegistrationEndDate < GETDATE()


--2 Dohvatiti sva vozila kojima registracija ističe unutar idućih mjesec dana

Select * from Vehicles v
JOIN Registrations r ON v.RegistrationId = r.Id
Where DATEDIFF(month, GETDATE(), RegistrationEndDate) < 1


--3 Dohvatiti koliko vozila postoji po vrsti

select COUNT(VehicleTypeId), Max(VehicleTypes.Type) as tipVozila from Vehicles
join VehicleTypes on VehicleTypeId = VehicleTypes.Id
where VehicleTypeId = 1 
UNION
select COUNT(VehicleTypeId), Max(VehicleTypes.Type) as tipVozila from Vehicles
join VehicleTypes on VehicleTypeId = VehicleTypes.Id
where VehicleTypeId =2
UNION
select COUNT(VehicleTypeId), Max(VehicleTypes.Type) as tipVozila from Vehicles
join VehicleTypes on VehicleTypeId = VehicleTypes.Id
where VehicleTypeId = 3
UNION
select COUNT(VehicleTypeId), Max(VehicleTypes.Type) as tipVozila from Vehicles
join VehicleTypes on VehicleTypeId = VehicleTypes.Id
where VehicleTypeId = 4
UNION
select COUNT(VehicleTypeId), Max(VehicleTypes.Type) as tipVozila from Vehicles
join VehicleTypes on VehicleTypeId = VehicleTypes.Id
where VehicleTypeId = 5
UNION
select COUNT(VehicleTypeId), Max(VehicleTypes.Type) as tipVozila from Vehicles
join VehicleTypes on VehicleTypeId = VehicleTypes.Id
where VehicleTypeId = 6
UNION
select COUNT(VehicleTypeId), Max(VehicleTypes.Type) as tipVozila from Vehicles
join VehicleTypes on VehicleTypeId = VehicleTypes.Id
where VehicleTypeId = 7
UNION
select COUNT(VehicleTypeId), Max(VehicleTypes.Type) as tipVozila from Vehicles
join VehicleTypes on VehicleTypeId = VehicleTypes.Id
where VehicleTypeId = 8
UNION
select COUNT(VehicleTypeId), Max(VehicleTypes.Type) as tipVozila from Vehicles
join VehicleTypes on VehicleTypeId = VehicleTypes.Id
where VehicleTypeId = 9



select COUNT(Id), 'Motorcycle' as TypeOfVehicle from vehicles where VehicleTypeId =1 or VehicleTypeId =2
or VehicleTypeId =3
union
select COUNT(Id), 'Car' as TipVozila from vehicles where VehicleTypeId > 3 AND VehicleTypeId < 9
union
select COUNT(Id),'Van' as TipVozila from vehicles where VehicleTypeId = 9


--nisan bia siguran na koji nacin trazis ispis pa sam napisa oba :D


--4 Dohvatiti zadnjih 5 najmova koje je ostvario neki zaposlenik

select top(5) * from Rentals r
where r.StaffId = 2
order by r.RentMadeOnDate desc


--5 Izračunati ukupnu cijenu najma za određeni najam 
--(hint: pripaziti na najmove koji imaju miješanu zimsku i ljetnu tarifu tijekom trajanja)


select customerfirstname, customerlastname, make, model,
CASE When datepart(month,RentMadeOnDate) > '10' OR datepart(month,RentMadeOnDate) < '3' 
then cast( duration * WinterPricePerHalfDay * 2 as nvarchar )+ ' kn'
When datepart(month,RentMadeOnDate) < '11' AND datepart(month,RentMadeOnDate) > '2' 
then cast(duration * SummerPricePerHalfDay * 2 as nvarchar) + ' kn'
END AS RentPrice
from VehicleTypes vt join Vehicles v on vt.Id = v.VehicleTypeId
join Rentals r on r.VehicleId = v.Id where r.id = 7


-- 6 Dohvatiti sve kupce najmova ikad, s tim da se ne ponavljaju u rezultatima

select distinct r.CustomerFirstName,r.CustomerLastName from Rentals r


-- 7 Dohvatiti za svakog zaposlenika timestamp zadnjeg najma kojeg je ostvario

select  max(r.RentMadeOnDate) as TimeStamp, 
max(s.Firstname) as StaffFirstName,max(s.lastname) as StaffLastName
from Rentals r
join Staff s on s.Id = r.StaffId
where s.Id in (select distinct StaffId from Rentals)
group by s.id


-- 8 Dohvatiti broj vozila svake marke koji rent-a-car ima

select count (vehicletypeid) as NumOfVehicles ,make as Make
from Vehicles
where make in (select distinct make from Vehicles)
 group by make


 -- 9 Arhivirati sve najmove koji su završili u novu tablicu. Osim već postojećih podataka u najmu
 -- , arhivirana tablica će sadržavati i podatak koliko je taj najam koštao.


select Customerfirstname, Customerlastname, Rentmadeondate, Make, Model, Colour,
CASE When datepart(month,RentMadeOnDate) > '10' OR datepart(month,RentMadeOnDate) < '3' 
then cast( duration * WinterPricePerHalfDay * 2 as nvarchar )+ ' kn'
When datepart(month,RentMadeOnDate) < '11' AND datepart(month,RentMadeOnDate) > '2' 
then cast(duration * SummerPricePerHalfDay * 2 as nvarchar) + ' kn'
END AS RentPrice
into AechiveRentsAndPrice
from VehicleTypes vt join Vehicles v on vt.Id = v.VehicleTypeId
join Rentals r on r.VehicleId = v.Id 
where dateadd(day, duration, r.RentMadeOnDate) < GETDATE() 

select * from AechiveRentsAndPrice


-- 10 Pobrojati koliko je najmova bilo po mjesecu, u svakom mjesecu 2020. godine.

select count(Id) as NumOfRents, 'January' as month from Rentals r
where datepart(month, r.RentMadeOnDate) = 1
UNION
select count(Id), 'February' as month from Rentals r
where datepart(month, r.RentMadeOnDate) = 2
UNION
select count(Id), 'March' as month from Rentals r
where datepart(month, r.RentMadeOnDate) = 3
UNION
select count(Id), 'April' as month from Rentals r
where datepart(month, r.RentMadeOnDate) = 4
UNION
select count(Id), 'May' as month from Rentals r
where datepart(month, r.RentMadeOnDate) = 5
UNION
select count(Id), 'June' as month from Rentals r
where datepart(month, r.RentMadeOnDate) = 6
UNION
select count(Id), 'July' as month from Rentals r
where datepart(month, r.RentMadeOnDate) = 7
UNION
select count(Id), 'August' as month from Rentals r
where datepart(month, r.RentMadeOnDate) = 8
UNION
select count(Id), 'September' as month from Rentals r
where datepart(month, r.RentMadeOnDate) = 9
UNION
select count(Id), 'October' as month from Rentals r
where datepart(month, r.RentMadeOnDate) = 10
UNION
select count(Id), 'November' as month from Rentals r
where datepart(month, r.RentMadeOnDate) = 11
UNION
select count(Id), 'December' as month from Rentals r
where datepart(month, r.RentMadeOnDate) = 12
order by numofrents


-- 11 Za sva vozila određene vrste, osim informaciju o vozilu, 
-- ispisati tekstualnu informaciju treba li registrirati vozilo unutar idućih mjesec dana 
-- (‘Treba registraciju’, ‘Ne treba registraciju’)


select v.*, 
CASE When Datediff (day, GETDATE(), RegistrationEndDate) < 31
then 'Needs Registration'
else
  'Does not need Registrtion '
END as Registrtion from Vehicles v
join Registrations r on v.RegistrationId = r.Id 
where VehicleTypeId < 4

-- 12 Dohvatiti broj najmova po vrsti vozila čija duljina najma 
-- (razdoblje) prelazi prosječnu duljinu najma

select count (r.Id) as NumOfVehicles , Make, Duration
from Vehicles v
join Rentals r on r.VehicleId = v.Id
group by VehicleTypeId, make, Duration,r.id
having r.id in (select id from Rentals
where Duration > (select avg(duration) 
from Rentals))