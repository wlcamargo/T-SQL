SELECT COUNT(*) AS ROWS FROM [PRODUCAO].[dbo].[TB_VENDA_MENSAL]

SELECT COUNT(*) AS ROWS FROM [STAGING].[dbo].[TB_VENDA_MENSAL]

SELECT COUNT(*) AS ROWS FROM [DATA_WAREHOUSE].[dbo].[fVendasMes]

SELECT MAX(DATA_VENDA) AS MAIOR_DATA FROM [PRODUCAO].[dbo].[TB_VENDA_MENSAL]

SELECT MAX(DATA_VENDA) AS MAIOR_DATA FROM [STAGING].[dbo].[TB_VENDA_MENSAL]

SELECT MAX(DATA_VENDA) AS MAIOR_DATA FROM [DATA_WAREHOUSE].[dbo].[fVendasMes]

SELECT * FROM [PRODUCAO].[dbo].[TB_VENDA_MENSAL]

SELECT * FROM [STAGING].[dbo].[TB_VENDA_MENSAL]

SELECT * FROM [DATA_WAREHOUSE].[dbo].[fVendasMes]

DROP TABLE IF EXISTS[STAGING].dbo.[TB_VENDA_MENSAL]
--CARGA FULL STG
SELECT * INTO [STAGING].dbo.[TB_VENDA_MENSAL] FROM [PRODUCAO].[dbo].[TB_VENDA_MENSAL]

--TEMPO DA CARGA FULL 25 SEGUNDOS

--CARGA FULL DW
SELECT ID_VENDA, DATA_VENDA, VAL_VENDA INTO [DATA_WAREHOUSE].DBO.[fVendasMes] FROM [STAGING].[dbo].[TB_VENDA_MENSAL]


--CARGA TESTE NA PRODU��O
INSERT INTO  [PRODUCAO].[dbo].[TB_VENDA_MENSAL] 
(DATA_VENDA, VAL_VENDA) VALUES 
('2022-04-05',10)


--CARGA INCREMENTAL
EXEC [STAGING].[dbo].[SP_UPDATE_STAGING]

--CARGA INCREMENTAL
EXEC [DATA_WAREHOUSE].dbo.SP_UPDATE_DW










