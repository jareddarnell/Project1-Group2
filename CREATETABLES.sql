/* This is the document for creating the tables and insert the sample data */
-- Create tables
-- DROP TABLE [Consoles];
-- DROP TABLE [Console_Ref];
CREATE TABLE [Console_Ref]
(
    [ConsoleRefID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [ConsoleBrand] VARCHAR(20) NOT NULL,
    [ConsoleModel] VARCHAR(20) NOT NULL
);

CREATE TABLE [ConsolePurchases]
(
    [ConsolePurchaseID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [PurchaseDate] DATE NOT NULL,
    [PurchasePrice] DECIMAL NOT NULL,
    [PurchaseStore] VARCHAR(50) NOT NULL
    
);


CREATE TABLE [Consoles]
(
    [ConsoleID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [ConsoleRefID] INT NOT NULL,
    [ConsolePurchaseID] INT NOT NULL  
);

ALTER TABLE [Consoles]
ADD FOREIGN KEY ([ConsoleRefID]) REFERENCES [Console_Ref]([ConsoleRefID]),
	FOREIGN KEY ([ConsolePurchaseID]) REFERENCES [ConsolePurchases]([ConsolePurchaseID])

CREATE TABLE [Games]
(
	[GameID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[GameRefID] INT NOT NULL,
	[ConsoleRefID] INT NOT NULL,
	[PlayerNumber] VARCHAR(8) NULL,
	[IsOnline] BIT NOT NULL
);

CREATE TABLE [Games_Ref]
(
	[GameRefID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[GameTitle] VARCHAR(64) NOT NULL,
	[Rating] VARCHAR(8) NOT NULL,
	[Genre] VARCHAR(64) NOT NULL
);

CREATE TABLE [ESRB]
(
	[Rating] VARCHAR(8) NOT NULL PRIMARY KEY,
	[Description] VARCHAR(255) NOT NULL
);

ALTER TABLE Games
ADD FOREIGN KEY ([GameRefID]) REFERENCES [Games_Ref]([GameRefID]),
	FOREIGN KEY ([ConsoleRefID]) REFERENCES [Console_Ref]([ConsoleRefID])

ALTER TABLE Games_Ref
ADD FOREIGN KEY ([Rating]) REFERENCES [ESRB]([Rating])



CREATE TABLE [GamePurchases]
(
	[GameID] INT NOT NULL,
	[PurchaseDate] DATE NOT NULL,
	[PurchasePrice] MONEY NOT NULL,
	[PurchaseStore] VARCHAR(64) NOT NULL
);

ALTER TABLE GamePurchases
ADD CONSTRAINT pk_GameID PRIMARY KEY (GameID, PurchaseDate)


--ALTER TABLE GamePurchases
--ADD FOREIGN KEY ([ConsoleID]) REFERENCES [Consoles]([ConsoleID])

-- Seed data

-- ConsoleRefs
INSERT [Console_Ref] (ConsoleBrand, ConsoleModel) VALUES ('Nintendo', 'Switch');
INSERT [Console_Ref] (ConsoleBrand, ConsoleModel) VALUES ('Microsoft', 'Xbox 360');
INSERT [Console_Ref] (ConsoleBrand, ConsoleModel) VALUES ('Sony', 'Playstation 4');
INSERT [Console_Ref] (ConsoleBrand, ConsoleModel) VALUES ('Nintendo', 'Nintendo 64');
INSERT [Console_Ref] (ConsoleBrand, ConsoleModel) VALUES ('Nintendo', 'NES');
INSERT [Console_Ref] (ConsoleBrand, ConsoleModel) VALUES ('Sony', 'Playstation 2');
INSERT [Console_Ref] (ConsoleBrand, ConsoleModel) VALUES ('Nintendo', 'Gamecube');
INSERT [Console_Ref] (ConsoleBrand, ConsoleModel) VALUES ('Microsoft', 'Xbox One');
INSERT [Console_Ref] (ConsoleBrand, ConsoleModel) VALUES ('Sega', 'Genisis');
INSERT [Console_Ref] (ConsoleBrand, ConsoleModel) VALUES ('Sega', 'Game Gear');
INSERT [Console_Ref] (ConsoleBrand, ConsoleModel) VALUES ('Magnavox', 'Odyssey');
INSERT [Console_Ref] (ConsoleBrand, ConsoleModel) VALUES ('Atari', '2600');

--INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Nintendo', 'Switch', NULL)
--INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Microsoft', 'Xbox', '360')
--INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Sony', 'Playstation', '4')
--INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Nintendo', 'Nintendo 64', NULL)
--INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Nintendo', 'NES', NULL)
--INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Sony', 'Playstation', '2')
--INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Nintendo', 'Gamecube', NULL)

-- ConsolePurchases
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('2018-02-12', 400.00, 'Smiths Marketplace');
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('2015-02-12', 349.99, 'Gamestop');
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('2017-02-12', 400.00, 'Walmart');
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('2014-02-12', 100.00, 'Amazon');
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('1999-02-12', 200.00, 'Fred Meyers');
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('2002-02-12', 200.00, 'Gamestop');
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('2002-02-12', 250.00, 'Walmart');
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('2016-02-12', 400.00, 'Smiths Marketplace');
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('2018-04-20', 400.00, 'Smiths Marketplace');
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('1997-02-10', 225.00, 'Kmart');
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('2001-09-17', 150.00, 'Shopko');
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('1972-10-18', 85.00, 'Magnavox');
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('1978-07-25', 100.00, 'RadioShack');

-- Consoles
INSERT [Consoles] (ConsoleRefID, ConsolePurchaseID) VALUES (1, 1);
INSERT [Consoles] (ConsoleRefID, ConsolePurchaseID) VALUES (2, 2);
INSERT [Consoles] (ConsoleRefID, ConsolePurchaseID) VALUES (3, 3);
INSERT [Consoles] (ConsoleRefID, ConsolePurchaseID) VALUES (4, 4);
INSERT [Consoles] (ConsoleRefID, ConsolePurchaseID) VALUES (5, 5);
INSERT [Consoles] (ConsoleRefID, ConsolePurchaseID) VALUES (6, 6);
INSERT [Consoles] (ConsoleRefID, ConsolePurchaseID) VALUES (7, 7);
INSERT [Consoles] (ConsoleRefID, ConsolePurchaseID) VALUES (1, 8);
INSERT [Consoles] (ConsoleRefID, ConsolePurchaseID) VALUES (8, 9);
INSERT [Consoles] (ConsoleRefID, ConsolePurchaseID) VALUES (9, 10);
INSERT [Consoles] (ConsoleRefID, ConsolePurchaseID) VALUES (10, 11);
INSERT [Consoles] (ConsoleRefID, ConsolePurchaseID) VALUES (11, 12);
INSERT [Consoles] (ConsoleRefID, ConsolePurchaseID) VALUES (12, 13);

--ESRB
INSERT [ESRB] (Rating, Description) Values ('EC', 'Early Childhood');
INSERT [ESRB] (Rating, Description) Values ('E', 'Everyone');
INSERT [ESRB] (Rating, Description) Values ('E 10+', 'Everyone 10 and up');
INSERT [ESRB] (Rating, Description) Values ('T', 'Teen');
INSERT [ESRB] (Rating, Description) Values ('M', 'Mature');
INSERT [ESRB] (Rating, Description) Values ('AO', 'Adults Only');

-- Games_Ref
INSERT [Games_Ref] (GameTitle, Rating, Genre) VALUES ('Call of Duty 4: Modern Warfare', 'M', 'First-Person Shooter');
INSERT [Games_Ref] (GameTitle, Rating, Genre) VALUES ('Ratchet and Clank', 'E 10+', 'Third-Person Shooter');
INSERT [Games_Ref] (GameTitle, Rating, Genre) VALUES ('Mario Party', 'E', 'Party');
INSERT [Games_Ref] (GameTitle, Rating, Genre) VALUES ('Legend of Zelda: Breath of the Wild', 'E 10+', 'Action-Adventure');
INSERT [Games_Ref] (GameTitle, Rating, Genre) VALUES ('Legend of Zelda: Ocarina of Time', 'E', 'Action-Adventure');
INSERT [Games_Ref] (GameTitle, Rating, Genre) VALUES ('Super Mario Bros', 'E', 'Platformer');
INSERT [Games_Ref] (GameTitle, Rating, Genre) VALUES ('Elder Scrolls V: Skyrim', 'M', 'Action Role-playing');
INSERT [Games_Ref] (GameTitle, Rating, Genre) VALUES ('Mario Kart 64', 'E', 'Kart Racing');
INSERT [Games_Ref] (GameTitle, Rating, Genre) VALUES ('Kingdom Hearts', 'E', 'Action Role-playing');
INSERT [Games_Ref] (GameTitle, Rating, Genre) VALUES ('Duck Hunt', 'E', 'Sports');
INSERT [Games_Ref] (GameTitle, Rating, Genre) VALUES ('Luigi''s Mansion', 'E', 'Action-Adventure');
INSERT [Games_Ref] (GameTitle, Rating, Genre) VALUES ('Asteroids', 'E', 'Action');
INSERT [Games_Ref] (GameTitle, Rating, Genre) VALUES ('Dig Dug', 'E', 'Action');
INSERT [Games_Ref] (GameTitle, Rating, Genre) VALUES ('Shoutout!', 'E', 'Action');
INSERT [Games_Ref] (GameTitle, Rating, Genre) VALUES ('Analogic', 'E', 'Strategy');

-- Games
INSERT [Games] (GameRefID, ConsoleRefID, PlayerNumber, IsOnline) VALUES (1, 2, '1-4', 1);
INSERT [Games] (GameRefID, ConsoleRefID, PlayerNumber, IsOnline) VALUES (2, 5, '1', 0);
INSERT [Games] (GameRefID, ConsoleRefID, PlayerNumber, IsOnline) VALUES (3, 4, '1-4', 1);
INSERT [Games] (GameRefID, ConsoleRefID, PlayerNumber, IsOnline) VALUES (4, 1, '1', 0);
INSERT [Games] (GameRefID, ConsoleRefID, PlayerNumber, IsOnline) VALUES (5, 4, '1', 0);
INSERT [Games] (GameRefID, ConsoleRefID, PlayerNumber, IsOnline) VALUES (6, 5, '1-2', 0);
INSERT [Games] (GameRefID, ConsoleRefID, PlayerNumber, IsOnline) VALUES (7, 2, '1', 0);
INSERT [Games] (GameRefID, ConsoleRefID, PlayerNumber, IsOnline) VALUES (8, 4, '1-4', 0);
INSERT [Games] (GameRefID, ConsoleRefID, PlayerNumber, IsOnline) VALUES (9, 6, '1', 0);
INSERT [Games] (GameRefID, ConsoleRefID, PlayerNumber, IsOnline) VALUES (10, 4, '1-2', 0);
INSERT [Games] (GameRefID, ConsoleRefID, PlayerNumber, IsOnline) VALUES (7, 3, '1', 0);
INSERT [Games] (GameRefID, ConsoleRefID, PlayerNumber, IsOnline) VALUES (11, 7, '1', 0);
INSERT [Games] (GameRefID, ConsoleRefID, PlayerNumber, IsOnline) VALUES (12, 9, '1', 0);
INSERT [Games] (GameRefID, ConsoleRefID, PlayerNumber, IsOnline) VALUES (13, 10, '1', 0);
INSERT [Games] (GameRefID, ConsoleRefID, PlayerNumber, IsOnline) VALUES (14, 11, '1', 0);
INSERT [Games] (GameRefID, ConsoleRefID, PlayerNumber, IsOnline) VALUES (15, 12, '2', 0);

-- GamePurchases
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (1, '2007-11-05', 50.00, 'GameStop');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (2, '2002-11-04', 50.00, 'GameStop');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (3, '1998-12-18', 40.00, 'Target');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (4, '2017-03-03', 60.00, 'Amazon');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (5, '1998-11-21', 50.00, 'Shopko');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (6, '1985-09-13', 20.00, 'Kmart');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (7, '2011-11-11', 60.00, 'Amazon');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (8, '1997-02-10', 40.00, 'Kmart');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (9, '2002-09-17', 60.00, 'Shopko');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (10, '1985-10-18', 20.00, 'Kmart');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (11, '2017-11-17', 60.00, 'Nintendo');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (11, '2001-11-18', 50.00, 'Amazon');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (12, '1981-10-08', 20.00, 'RadioShack');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (13, '1983-08-26', 20.00, 'Radio Shack');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (14, '1973-12-20', 15.00, 'Magnavox');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (15, '1974-04-16', 15.00, 'Magnavox');


--DROP TABLE [GamePurchases];
--DROP TABLE [Games];
--DROP TABLE [Games_Ref];
--DROP TABLE [Consoles];
--DROP TABLE [Console_Ref];
--DROP TABLE [ConsolePurchases];
--DROP TABLE [ESRB];

--select * from dbo.Console_Ref
--select * from dbo.consolepurchases
--select * from dbo.consoles
--select * from dbo.esrb
--select * from dbo.gamepurchases
--select * from dbo.games
--select * from dbo.games_ref

select * 
from dbo.Console_Ref CR
inner join dbo.Consoles C on CR.ConsoleRefID = C.ConsoleRefID
inner join dbo.ConsolePurchases CP on C.ConsolePurchaseID = CP.ConsolePurchaseID

