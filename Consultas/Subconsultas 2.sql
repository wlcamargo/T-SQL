--AULA SUBCONSULTA 2

--CRIAR TABELA DE VENDAS MESES
CREATE TABLE TB_VENDAS_MESES (
	MES VARCHAR(7),
	VAL_VENDA MONEY	
)
GO

--INSERIR REGISTROS NA TABELA DE VENDAS MESES
INSERT INTO TB_VENDAS_MESES VALUES ('01-2022',500)
INSERT INTO TB_VENDAS_MESES VALUES ('02-2022',400)
INSERT INTO TB_VENDAS_MESES VALUES ('03-2022',600)
INSERT INTO TB_VENDAS_MESES VALUES ('04-2022',350)
INSERT INTO TB_VENDAS_MESES VALUES ('05-2022',250)
INSERT INTO TB_VENDAS_MESES VALUES ('06-2022',320)
INSERT INTO TB_VENDAS_MESES VALUES ('07-2022',480)
GO

----CONSULTA NA TABELA VENDAS MESES
SELECT * FROM TB_VENDAS_MESES
--GO

SELECT 
	MES,
	SUM(VAL_VENDA) AS VAL_VENDA,
	SUM(VAL_VENDA) / (SELECT SUM(VAL_VENDA) AS VAL_VENDA FROM [dbo].[TB_VENDAS_MESES])*100 AS PERCENTUAL
FROM 
	[TB_VENDAS_MESES]
GROUP BY
	MES





