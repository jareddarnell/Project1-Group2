/* This is the document for creating the tables and insert the sample data */

CREATE TABLE [Consoles]
(
	[ConsoleID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[ConsoleBrand] VARCHAR(64) NOT NULL,
	[ConsoleModel] VARCHAR(64) NOT NULL,
	[SubModel] VARCHAR(64) NULL
);

INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Nintendo', 'Switch', NULL)
INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Microsoft', 'Xbox', '360')
INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Sony', 'Playstation', '4')
INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Nintendo', 'Nintendo 64', NULL)
INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Nintendo', 'NES', NULL)
INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Sony', 'Playstation', '2')
INSERT [Consoles] (ConsoleBrand, ConsoleModel, SubModel) VALUES ('Nintendo', 'Gamecube', NULL)

--SELECT
--	*
--FROM
--	[Consoles]

CREATE TABLE [Games]
(
	[GameID] INT NOT NULL IDENTITY(1,1),
	[GameTitle] VARCHAR(64) NOT NULL,
	[ConsoleID] INT NOT NULL FOREIGN KEY REFERENCES [Consoles]([ConsoleID]),
	[Rating] VARCHAR(8) NULL,
	[PlayerNumber] VARCHAR(8) NULL,
	[Category] VARCHAR(64) NULL,
	CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED
	(
		[GameID] ASC
	)
);

INSERT [Games] (GameTitle, ConsoleID, Rating, PlayerNumber, Category) VALUES ('Call of Duty 4: Modern Warfare', 2, 'M', '1-4', 'First-person shooter')

CREATE TABLE [Purchases]
(
	[GameID] INT NOT NULL IDENTITY(1,1),
	--[ConsoleModel] VARCHAR(64) NOT NULL FOREIGN KEY REFERENCES [Consoles]([ConsoleModel]),		--This can't reference Consoles as it is not possible to have two primary keys in one table, Also redundant
	[ConsoleID] INT NOT NULL FOREIGN KEY REFERENCES [Consoles]([ConsoleID]),					--Can possibly use this instead
	[PurchaseDate] DATE NOT NULL,
	[PurchasePrice] MONEY NULL,
	[PurchaseStore] VARCHAR(64) NULL,															--Could possibly do geography data type for latitude-longitude
	CONSTRAINT [PK_Purchases] PRIMARY KEY CLUSTERED
	(
		[GameID] ASC
	)
);

INSERT [Purchases] (GameID, ConsoleID, PurchaseDate, PurchaseStore) VALUES (1, 2, '5-Nov-07', 50, 'GameStop')

CREATE TABLE [ConsoleGames]
(
	[GameID] INT NOT NULL,
	[ConsoleID] INT NOT NULL
	CONSTRAINT [PK_ConsoleGames] PRIMARY KEY
	(
		[GameID],
		[ConsoleID]
	)
	FOREIGN KEY ([GameID]) REFERENCES [Games]([GameID]),
	FOREIGN KEY ([ConsoleID]) REFERENCES [Consoles]([ConsoleID])
)

--DROP TABLE [Consoles];
--DROP TABLE [Games];
--DROP TABLE [Purchases];
--DROP TABLE [ConsoleGames];