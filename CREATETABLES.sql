/* This is the document for creating the tables and insert the sample data */
-- Create tables
-- DROP TABLE [Consoles];
-- DROP TABLE [ConsoleRef];
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
    [ConsoleRefID] INT NOT NULL FOREIGN KEY REFERENCES [ConsoleRef]([ConsoleRefID]),
    [ConsolePurchaseID] INT NOT NULL FOREIGN KEY REFERENCES [ConsoleRef]([ConsoleRefID])    
);

CREATE TABLE [Games]
(
	[GameID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[GameRefID] INT NOT NULL,
	[ConsoleRefID] INT NOT NULL,
	[PlayerNumber] VARCHAR(8) NULL,
	[Genre] VARCHAR(64) NULL,
	[IsOnline] BIT NOT NULL
);

ALTER TABLE Games
ADD FOREIGN KEY ([GameRefID]) REFERENCES [Games_Ref]([GameRefID]),
	FOREIGN KEY ([ConsoleRefID]) REFERENCES [Console_Ref]([ConsoleRefID])

CREATE TABLE [Games_Ref]
(
	[GameRefID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[GameTitle] VARCHAR(64) NOT NULL,
	[Rating] VARCHAR(4) NOT NULL,
	[Genre] VARCHAR(64) NOT NULL
);

ALTER TABLE Games_Ref
ADD FOREIGN KEY ([Rating]) REFERENCES [ESRB]([Rating])

CREATE TABLE [ESRB]
(
	[Rating] VARCHAR(4) NOT NULL,
	[Description] VARCHAR(255) NOT NULL
);

CREATE TABLE [GamePurchases]
(
	[GameID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[ConsoleID] INT NOT NULL,
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
--INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Nintendo', 'Switch', NULL)
--INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Microsoft', 'Xbox', '360')
--INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Sony', 'Playstation', '4')
--INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Nintendo', 'Nintendo 64', NULL)
--INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Nintendo', 'NES', NULL)
--INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Sony', 'Playstation', '2')
--INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Nintendo', 'Gamecube', NULL)

-- ConsolePurchases
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('2018-02-12', 400.00, 'Smiths Marketplace');
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('2018-02-12', 400.00, 'Smiths Marketplace');
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('2018-02-12', 400.00, 'Smiths Marketplace');
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('2018-02-12', 400.00, 'Smiths Marketplace');
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('2018-02-12', 400.00, 'Smiths Marketplace');
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('2018-02-12', 400.00, 'Smiths Marketplace');
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('2018-02-12', 400.00, 'Smiths Marketplace');
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('2018-02-12', 400.00, 'Smiths Marketplace');
INSERT [ConsolePurchases] (PurchaseDate, PurchasePrice, PurchaseStore) VALUES ('2018-02-12', 400.00, 'Smiths Marketplace');


--DROP TABLE [GamePurchases];
--DROP TABLE [Games];
--DROP TABLE [GameRef];
--DROP TABLE [ConsolePurchases];
--DROP TABLE [Consoles];
--DROP TABLE [ConsoleRef];
--DROP TABLE [ConsoleGames];
