CREATE DATABASE KovserHediyyeler

use KovserHediyyeler

--Yarn Clothes table
CREATE TABLE YarnClothes 
(
ID int Primary Key, 
[Name] nvarchar(60), 
Color nvarchar(20), 
Size nvarchar(15), 
Price decimal(8,2), 
Model int foreign key references Model(ID), 
CategoryID int foreign key references Categories(ID))

INSERT INTO YarnClothes(ID, [NAME], Color, Size, Price, Model, CategoryID)
VALUES
(1, 'U0234 Pon-pon Klyoş Ətəkli Don', 'Sumax', '12-24 ay', 20.00, 4, 3),
(2, 'Q2431 Makaronka Papaq ve Sherf Desti', 'Bej', 'L', 14.00, 5, 1),
(3, 'K12T2 V yaxa Sviter', 'Qarisiq goy tonlari', 'XL', 35.00, 1, 2),
(4, 'U2521 Kombinezon', 'Yashil', '24-36 ay', 30.00, 5, 3),
(5, 'Q2376 Horuklu Jilet', 'Qara', 'XL', 28.00, 3, 1)

SELECT * FROM YarnClothes
DROP TABLE YarnClothes


--Categories table
CREATE TABLE Categories
(
ID int Primary Key,
[NAME] nvarchar(10), 
[Description] nvarchar(Max)
)

INSERT INTO Categories (ID, [NAME], [Description])
VALUES
(1, 'Qadın', '36 bədəndən etibarən'),
(2, 'Kishi', 'S Bədəndən başlayır'),
(3, 'Ushaq', '0-S bədənə qədər')

drop TABLE Categories
SELECT * FROM Categories

--Model table
CREATE TABLE Model
(
ID int Primary key, 
[Name] nvarchar(10), 
[Description] nvarchar(Max)
)

INSERT INTO Model(ID, [NAME], [Description])
VALUES
(1, 'Yuxari', 'Sviter, Vodalaska'),
(2, 'Asagi', 'Salvar, Corab'),
(3, 'Ust', 'Jaket, Jilet, Papaq, Sherf, Elcek'),
(4, 'Don', 'Don'),
(5, 'Dest', 'Kombin')

SELECT * FROM Categories
SELECT * FROM Model
DROP TABLE Model

--Queries
SELECT 
	Y.ID,
	Y.[Name],
	Y.Color,
	Y.Size,
	Y.Price,
	M.[Name] [Model],
	C.[NAME] [Category]
FROM YarnClothes [Y]
JOIN Model [M]
	ON M.ID = Y.Model
JOIN Categories [C]
	ON C.ID = Y.CategoryID

