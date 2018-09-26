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