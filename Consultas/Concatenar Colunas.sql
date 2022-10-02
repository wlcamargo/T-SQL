--CONCATENAR COLUNAS

--O SINAL DE MAIS "+" SERVE PARA CONCATENAR CAMPOS
--SE TENTAR CONCATENAR COLUNAS NUMÉRICAS IRÁ SOMAR
SELECT
NOME +' '+ SOBRENOME AS NOME_COMPLETO

FROM TB_CLIENTE


--CONCATENAR AINDA QUE NUMÉRICAS
SELECT
Concat(Coluna_num_1, Coluna_num_2) as Coluna1_e_Coluna2
FROM TB_CLIENTE


--CONCATENAR MES_ANO
[MES_ANO] AS CONCAT(DATEPART(MONTH,[DATA_VENDA]),' - ',DATEPART(YEAR,[DATA_VENDA]))
