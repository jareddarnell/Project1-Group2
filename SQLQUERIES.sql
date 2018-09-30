/* This file is for the sql queries */
--1
SELECT
	(ConsoleBrand + ConsoleModel) AS [Consoles]
FROM
	Consoles_Ref
;

--2
SELECT
	GameTitle
FROM
	Games_Ref
;

--3
SELECT
	GR.GameTitle,
	CR.ConsoleModel

FROM
	Games G
	LEFT JOIN Games_Ref GR ON G.GameRefID = GR.GameRefID
	LEFT JOIN Consoles_Ref CR ON CR.ConsoleRefID = G.ConsoleRefID

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
			Games G
			LEFT JOIN Games_Ref GR ON G.GameRefID = GR.GameRefID
			LEFT JOIN Consoles_Ref CR ON CR.ConsoleRefID = G.ConsoleRefID

		GROUP BY
			GR.GameTitle

		HAVING
			count(GR.GameTitle) > 1) GT
	LEFT JOIN Games_Ref GR ON GT.GameTitle = GR.GameTitle
	LEFT JOIN Games G ON G.GameRefID = GR.GameRefID
	LEFT JOIN Consoles_Ref CR ON CR.ConsoleRefID = G.ConsoleRefID
;

--5
SELECT 
	GR.GameTitle,
	(CR.ConsoleBrand + ' ' + CR.ConsoleModel) As [Console]
		
FROM
	Games_Ref GR 
	LEFT JOIN Games G ON G.GameRefID = GR.GameRefID
	LEFT JOIN Consoles_Ref CR ON CR.ConsoleRefID = G.ConsoleRefID

WHERE
	GR.Genre LIKE'%Role-Playing%'
;