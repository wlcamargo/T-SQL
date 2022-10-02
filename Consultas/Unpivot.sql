--AULA DE UNPIVOT

--TRANFORMAR LINHAS EM COLUNAS
SELECT
	ANO,
	VALOR,
	PERIODO
FROM
	[dbo].['Vendas Mensais$']
UNPIVOT
(
	VALOR
	FOR PERIODO IN ([jan],[fev],[mar],[abr],[mai],[jun],[jul],[ago],[set],[out],[nov],[dez])
) AS RESULT


