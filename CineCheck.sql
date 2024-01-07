create database cineCheck;

use cineCheck;

create table films(
filmId int AUTO_INCREMENT PRIMARY KEY,
filmName varchar(50) unique,
duration Time
);

INSERT INTO films (filmName, duration) 
VALUES 
('Wonka', '01:57:00'),
('Les trois mousquetaires', '01:55:00'),
('Migration', '01:22:00'),
('Wish', '01:42:00'),
('Aquaman', '02:04:00'),
('La tresse', '01:59:00');

create table prices(
priceId int AUTO_INCREMENT PRIMARY KEY,
catPrice varchar(50) unique,
price decimal(4,2)
);

INSERT INTO prices (catPrice, price) 
VALUES 
('Plein Tarif : ', 9.20),
('Etudiant : ', 7.60),
('Moins de 14ans : ', 5.90);

create table cinemas(
cineId int AUTO_INCREMENT PRIMARY KEY,
cineName varchar(50) unique,
cineLocation varchar(50)
);

INSERT INTO cinemas (cineName, cineLocation) 
VALUES 
('Cinema Star', 'Paris11'),
('Cinema L\'étoile', 'Paris12'),
('Cinema des lumières', 'Paris13'),
('Cinema Bellevue ', 'Paris14'),
('Cinema Vision', 'Paris15');

create table salles(
salleId int AUTO_INCREMENT PRIMARY KEY,
salleName varchar(50),
salleCapacity int,
cineKey int,
FOREIGN KEY (cineKey) REFERENCES cinemas(cineId)
);

INSERT INTO salles (salleName, salleCapacity, cineKey) 
VALUES 
('Salle1', 100, 1),
('Salle2', 60, 1),
('Salle3', 40, 1),
('Salle4', 30, 1),
('Salle5', 30, 1),
('SalleA', 120, 2),
('SalleB', 80, 2),
('SalleC', 75, 2),
('SalleD', 55, 2),
('Salle Bleue', 150, 3),
('Salle Jaune', 90, 3),
('Salle Verte', 80, 3),
('Salle Rouge', 70, 3),
('Salle Orange', 60, 3),
('Salle Rose', 50, 3),
('Salle1', 150, 4),
('Salle2', 90, 4),
('Salle3', 80, 4),
('Grande Salle', 200, 5),
('Salle prestige', 120, 5),
('Salle RDC1  ', 90, 5),
('Salle RDC2 ', 80, 5),
('Salle RDC3 ', 80, 5),
('Salle sous-sol', 50, 5);

create table admins(
adminId int AUTO_INCREMENT PRIMARY KEY,
pseudo varchar(50) unique,
role varchar(50),
email varchar(255) not null unique,
password varchar(255) not null,
adminFirstName varchar(50),
adminName varchar(50),
cineKey int,
FOREIGN KEY (cineKey) REFERENCES cinemas(cineId)
);

INSERT INTO admins (pseudo, role, email, password, adminFirstName, adminName) 
VALUES 
('kingAdmin', 'GroupAdmin', 'admin1@example.com', 'password123', 'Lucien', 'Dupont'),
('queenAdmin', 'CineAdmin', 'admin2@example.com', 'password234', 'Henri', 'Simon'),
('riderAdmin', 'CineAdmin', 'admin3@example.com', 'password345', 'Jacques', 'Bernard'),
('jackAdmin', 'CineAdmin', 'admin4@example.com', 'password456', 'Gatien', 'Durand'),
('crazyAdmin', 'CineAdmin', 'admin5@example.com', 'password456', 'Bruno', 'Coutin');

create table programmations(
progId int AUTO_INCREMENT PRIMARY KEY,
progDate DateTime,
adminKey int,
filmKey int,
salleKey int,
salleCurrentCapacity int,
FOREIGN KEY (adminKey) REFERENCES admins(adminId),
FOREIGN KEY (filmKey) REFERENCES films(filmId),
FOREIGN KEY (salleKey) REFERENCES salles(salleId)
);

INSERT INTO programmations (progDate, adminKey, filmKey, salleKey, salleCurrentCapacity) 
VALUES 
('2024-01-01 18:00', 2, 1, 3, 32),
('2024-01-01 18:15', 4, 5, 15, 45),
('2024-01-01 18:30', 5, 2, 17, 78),
('2024-01-01 18:30', 3, 3, 9, 52),
('2024-01-01 18:45', 5, 6, 16, 114),
('2024-01-01 19:00', 4, 4, 11, 67),
('2024-01-01 19:00', 2, 2, 2, 46),
('2024-01-01 19:15', 3, 4, 8, 71),
('2024-01-01 19:30', 4, 6, 10, 137),
('2024-01-01 20:00', 5, 5, 18, 71),
('2024-01-02 10:00', 1, 3, 19, 187),
('2024-01-02 10:00', 1, 1, 20, 104),
('2024-01-02 14:05', 2, 2, 5, 22),
('2024-01-02 16:30', 3, 3, 6, 99),
('2024-01-03 14:00', 5, 6, 16, 116);

create table clients(
clientId char(36) PRIMARY KEY,
pseudo varchar(50),
email varchar(255) unique,
password varchar(255),
clientFirstName varchar(50),
clientName varchar(50)
);

INSERT INTO clients (clientId, pseudo, email, password, clientFirstName, clientName) 
VALUES 
('abcdefgh-ijkl-mnop-qrst-uvwxyz012345', 'killer', 'client1@example.com', 'passwordABC1', 'Julie', 'Albert'),
('bcdefghi-jklm-nopq-rstu-vwxyz0123456', 'butterfly', 'client2@example.com', 'passwordBCD2', 'Lucie', 'Sebas'),
('cdefghij-klmn-opqr-stuv-wxyz01234567', 'velvet', 'client3@example.com', 'passwordCDE3', 'Jeanne', 'Dark'),
('defghijk-lmno-pqrs-tuvw-xyz012345678', 'barbie', 'client4@example.com', 'passwordDEF4', 'Anne', 'Lack'),
('efghijkl-mnop-qrst-uvwx-yz0123456789', 'einstein', 'client5@example.com', 'passwordEFG5', 'Nicolas', 'White'),
('fghijklm-nopq-rstu-vwxy-z0123456789a', 'queenE', 'client6@example.com', 'passwordFGH6', 'Antoine', 'Dagobert'),
('ghijklmn-opqr-stuv-wxyz-0123456789ab', 'kingC', 'client7@example.com', 'passwordGHI7', 'Jackie', 'Michel'),
('hijklmno-pqrs-tuvw-xyz0-123456789abc', 'strawberry', 'client8@example.com', 'passwordHIJ8', 'Alain', 'François'),
('ijklmnop-qrst-uvwx-yz01-23456789abcd', 'loveAngel', 'client9@example.com', 'passwordIJK9', 'William', 'Bern');

create table ticketCard(
ticketId int AUTO_INCREMENT PRIMARY KEY,
clientKey char(36),
progKey int,
priceKey int,
quantity int,
FOREIGN KEY (clientKey) REFERENCES clients(clientId),
FOREIGN KEY (progKey) REFERENCES programmations(progId),
FOREIGN KEY (priceKey) REFERENCES prices(priceId)
);

INSERT INTO ticketCard (clientKey, progKey, priceKey, quantity) 
VALUES 
('cdefghij-klmno-pqrs-tuvw-xyz01234567', 2, 1, 2),
('fghijklm-nopqr-stuv-wxyz-0123456789a', 5, 1, 2),
('fghijklm-nopqr-stuv-wxyz-0123456789a', 5, 3, 1),
('ghijklmn-opqrs-tuvw-xyz0-123456789ab', 1, 1, 4),
('bcdefghi-jklmn-opqr-stuv-wxyz0123456', 2, 1, 1),
('abcdefgh-ijklm-nopq-rstu-vwxyz012345', 3, 2, 2),
('efghijkl-mnopq-rstu-vwxy-z0123456789', 3, 1, 3),
('defghijk-lmnop-qrst-uvwx-yz012345678', 4, 1, 1),
('defghijk-lmnop-qrst-uvwx-yz012345678', 4, 3, 3),
('ijklmnop-qrstu-vwxy-z012-3456789abcd', 6, 2, 1),
('hijklmno-pqrst-uvwx-yz01-23456789abc', 5, 1, 2),
('hijklmno-pqrst-uvwx-yz01-23456789abc', 5, 2, 2),
('bcdefghi-jklmn-opqr-stuv-wxyz0123456', 1, 1, 3);

create table ticketCheck(
checkId int PRIMARY KEY,
checkDate DateTime,
FOREIGN KEY (checkId) REFERENCES ticketCard(ticketId)
);

INSERT INTO ticketCheck (checkDate, checkId) 
VALUES 
('2024-01-01 14:01:05', 1),
('2024-01-01 14:02:10', 2),
('2024-01-01 14:04:22', 4),
('2024-01-01 14:07:36', 5),
('2024-01-01 14:09:47', 6),
('2024-01-01 14:14:13', 8),
('2024-01-01 14:18:32', 9),
('2024-01-01 14:19:01', 10),
('2024-01-01 14:24:14', 12);
