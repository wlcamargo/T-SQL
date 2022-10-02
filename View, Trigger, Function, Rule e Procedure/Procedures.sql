--AULA DE PROCEDURE

CREATE PROCEDURE SP_TRANSFERE_TABELA 
AS
BEGIN
	DROP TABLE IF EXISTS TABELA_TRANSFERIDA
		SELECT 
			[BusinessEntityID],
			[TerritoryID],
			[SalesQuota],
			[Bonus],
			[CommissionPct],
			[SalesYTD],
			[SalesLastYear],
			[rowguid],
			[ModifiedDate]
		INTO
			TABELA_TRANSFERIDA
		FROM 
			[AdventureWorks2019].[Sales].[SalesPerson]
END