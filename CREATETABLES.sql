/* This is the document for creating the tables and insert the sample data */
-- Create tables

--DROP TABLE [Consoles];
--DROP TABLE [ConsolePurchases];
--DROP TABLE [ConsoleRef];
--DROP TABLE [Games];
--DROP TABLE [GamePurchases];
--DROP TABLE [GameRef];
--DROP TABLE [ESRB];

CREATE TABLE [ConsoleRef]
(
    [ConsoleRefID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [ConsoleBrand] VARCHAR(20) NOT NULL,
    [ConsoleModel] VARCHAR(20) NOT NULL
)

CREATE TABLE [ConsolePurchases]
(
    [ConsolePurchaseID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [PurchaseDate] DATETIME NOT NULL,
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
ADD FOREIGN KEY ([ConsoleRefID]) REFERENCES [ConsoleRef]([ConsoleRefID]),
	FOREIGN KEY ([ConsolePurchaseID]) REFERENCES [ConsolePurchases]([ConsolePurchaseID])

CREATE TABLE [Games]
(
	[GameID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[GameRefID] INT NOT NULL,
	[ConsoleRefID] INT NOT NULL,
	[PlayerNumber] VARCHAR(8) NULL,
	[IsOnline] BIT NOT NULL
);

ALTER TABLE Games
ADD FOREIGN KEY ([GameRefID]) REFERENCES [Games_Ref]([GameRefID]),
	FOREIGN KEY ([ConsoleRefID]) REFERENCES [Console_Ref]([ConsoleRefID])

CREATE TABLE [GamesRef]
(
	[GameRefID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[GameTitle] VARCHAR(64) NOT NULL,
	[Rating] VARCHAR(4) NOT NULL,
	[Genre] VARCHAR(64) NOT NULL
);

ALTER TABLE GamesRef
ADD FOREIGN KEY ([Rating]) REFERENCES [ESRB]([Rating])

CREATE TABLE [ESRB]
(
	[Rating] VARCHAR(4) NOT NULL,
	[Description] VARCHAR(255) NOT NULL
);

CREATE TABLE [GamePurchases]
(
	[GameID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[PurchaseDate] DATE NOT NULL,
	[PurchasePrice] MONEY NOT NULL,
	[PurchaseStore] VARCHAR(64) NOT NULL
);

ALTER TABLE GamePurchases
ADD FOREIGN KEY ([ConsoleID]) REFERENCES [Consoles]([ConsoleID])

-- Seed data

-- ConsoleRefs
INSERT [ConsoleRef] (ConsoleBrand, ConsoleModel) VALUES ('Nintendo', 'Switch');
INSERT [ConsoleRef] (ConsoleBrand, ConsoleModel) VALUES ('Microsoft', 'Xbox 360');
INSERT [ConsoleRef] (ConsoleBrand, ConsoleModel) VALUES ('Sony', 'Playstation 4');
INSERT [ConsoleRef] (ConsoleBrand, ConsoleModel) VALUES ('Nintendo', 'Nintendo 64');
INSERT [ConsoleRef] (ConsoleBrand, ConsoleModel) VALUES ('Nintendo', 'NES');
INSERT [ConsoleRef] (ConsoleBrand, ConsoleModel) VALUES ('Sony', 'Playstation 2');
INSERT [ConsoleRef] (ConsoleBrand, ConsoleModel) VALUES ('Nintendo', 'Gamecube');
INSERT [ConsoleRef] (ConsoleBrand, ConsoleModel) VALUES ('Microsoft', 'Xbox One');

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

--ESRB Ratings
INSERT [ESRB] (Rating, Description) VALUES ('EC', 'Early Childhood');
INSERT [ESRB] (Rating, Description) VALUES ('E', 'Everyone');
INSERT [ESRB] (Rating, Description) VALUES ('E10+', 'Everyone 10 and up');
INSERT [ESRB] (Rating, Description) VALUES ('T', 'Teen');
INSERT [ESRB] (Rating, Description) VALUES ('M', 'Mature');
INSERT [ESRB] (Rating, Description) VALUES ('AO', 'Adults Only');

-- Games_Ref
INSERT [GamesRef] (GameTitle, Rating, Genre) VALUES ('Call of Duty 4: Modern Warfare', 'M', 'First-Person Shooter');
INSERT [GamesRef] (GameTitle, Rating, Genre) VALUES ('Ratchet and Clank', 'E 10+', 'Third-Person Shooter');
INSERT [GamesRef] (GameTitle, Rating, Genre) VALUES ('Mario Party', 'E', 'Party');
INSERT [GamesRef] (GameTitle, Rating, Genre) VALUES ('Legend of Zelda: Breath of the Wild', 'E 10+', 'Action-Adventure');
INSERT [GamesRef] (GameTitle, Rating, Genre) VALUES ('Legend of Zelda: Ocarina of Time', 'E', 'Action-Adventure');
INSERT [GamesRef] (GameTitle, Rating, Genre) VALUES ('Super Mario Bros', 'E', 'Platformer');
INSERT [GamesRef] (GameTitle, Rating, Genre) VALUES ('Elder Scrolls V: Skyrim', 'M', 'Action Role-playing');
INSERT [GamesRef] (GameTitle, Rating, Genre) VALUES ('Mario Kart 64', 'E', 'Kart Racing');
INSERT [GamesRef] (GameTitle, Rating, Genre) VALUES ('Kingdom Hearts', 'E', 'Action Role-playing');
INSERT [GamesRef] (GameTitle, Rating, Genre) VALUES ('Duck Hunt', 'E', 'Sports');
INSERT [GamesRef] (GameTitle, Rating, Genre) VALUES ('Luigi''s Mansion', 'E', 'Action-Adventure');

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

-- GamePurchases
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (1, '2018-02-12', 60.00, 'Amazon');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (2, '2018-02-12', 60.00, 'Amazon');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (3, '2018-02-12', 60.00, 'Amazon');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (4, '2018-02-12', 60.00, 'Amazon');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (5, '2018-02-12', 60.00, 'Amazon');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (6, '2018-02-12', 60.00, 'Amazon');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (7, '2018-02-12', 60.00, 'Amazon');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (8, '2018-02-12', 60.00, 'Amazon');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (9, '2018-02-12', 60.00, 'Amazon');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (10, '2018-02-12', 60.00, 'Amazon');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (11, '2018-02-12', 60.00, 'Amazon');
INSERT [GamePurchases] (GameID, PurchaseDate, PurchasePrice, PurchaseStore) VALUES (12, '2018-02-12', 60.00, 'Amazon');

