--AULA DE UPPER E LOWER
SELECT 
	[ID_VENDA],
    [DATA_VENDA],
    [ID_CLIENTE],
    LOWER([NOME_CLIENTE]) as NOME_MINUSCULO,
    [VAL_VENDA]
FROM 
	[TB_VENDAS_CLIENTES]


PRINT(upper('wallace'))




