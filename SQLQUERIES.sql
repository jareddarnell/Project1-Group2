/* This file is for the sql queries */
--1
SELECT
	(ConsoleBrand + ConsoleModel) AS [Consoles]
FROM
	dbo.Consoles_Ref
;

--2
SELECT
	GameTitle
FROM
	dbo.Games_Ref
;

--3
SELECT
	GR.GameTitle,
	CR.ConsoleModel

FROM
	dbo.Games G
	LEFT JOIN dbo.Games_Ref GR ON G.GameRefID = GR.GameRefID
	LEFT JOIN dbo.Consoles_Ref CR ON CR.ConsoleRefID = G.ConsoleRefID

WHERE
	CR.ConsoleModel = 'Xbox One'
;

--4
SELECT
	GT.GameTitle,
	(CR.ConsoleBrand + ' ' + CR.ConsoleModel) AS [Console]
		
FROM
	(SELECT 
		GR.GameTitle
	
	
		FROM
			dbo.Games G
			LEFT JOIN dbo.Games_Ref GR ON G.GameRefID = GR.GameRefID
			LEFT JOIN dbo.Consoles_Ref CR ON CR.ConsoleRefID = G.ConsoleRefID

		GROUP BY
			GR.GameTitle

		HAVING
			count(GR.GameTitle) > 1) GT
	LEFT JOIN dbo.Games_Ref GR ON GT.GameTitle = GR.GameTitle
	LEFT JOIN dbo.Games G ON G.GameRefID = GR.GameRefID
	LEFT JOIN dbo.Consoles_Ref CR ON CR.ConsoleRefID = G.ConsoleRefID
;

--5
SELECT 
	GR.GameTitle,
	(CR.ConsoleBrand + ' ' + CR.ConsoleModel) As [Console]
		
FROM
	dbo.Games_Ref GR 
	LEFT JOIN dbo.Games G ON G.GameRefID = GR.GameRefID
	LEFT JOIN dbo.Consoles_Ref CR ON CR.ConsoleRefID = G.ConsoleRefID

WHERE
	GR.Genre LIKE'%Role-Playing%'
;