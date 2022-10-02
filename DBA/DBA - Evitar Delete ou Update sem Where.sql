use ANALITICO
go

CREATE TRIGGER [dbo].[BLOCK_DML_SEM_WHERE2] 
ON [dbo].[dCliente_Escola]
FOR UPDATE, DELETE 
AS 
BEGIN 
  
    DECLARE 
        @Linhas_Alteradas INT = @@ROWCOUNT,
        @Linhas_Tabela INT = (SELECT SUM(row_count) FROM sys.dm_db_partition_stats WHERE [object_id] = OBJECT_ID('dCliente_Escola') AND (index_id <= 1))
 
    IF (@Linhas_Alteradas >= @Linhas_Tabela)
    BEGIN 
		PRINT('Operações de DELETE e/ou UPDATE sem cláusula WHERE não são permitidas na tabela dCliente_Escola') 
        ROLLBACK
    END 
END
GO

DELETE FROM [dbo].[dCliente_Escola] 