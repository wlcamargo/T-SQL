-- AULA DE IIF

SELECT 
	[ID_PRODUTO],
	[PRODUTO],
	[CATEGORIA],
	[COR],
	--TESTE DA CONDI��O
	IIF(COR = 'PRETO', 'PR',
		IIF(COR = 'BRANCO', 'BR', 'RS')) AS COR_ABREV
FROM
	[dbo].[TB_PRODUTO]



