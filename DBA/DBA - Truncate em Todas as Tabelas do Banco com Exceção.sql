--TRUNCATE EM TODAS AS TABELAS DO BANCO DE DADOS COM EXCEÇÃO

USE BANCO_DADOS
GO
	 
Declare @Tabelas Table (Idx Int Identity(1,1), TblName Varchar(100))             

Insert into @Tabelas (TblName)    

=============================================================================
-- BLOCO ONDE USO A EXCEÇÃO DE TABELAS QUE NÃO QUERO APAGAR
Select 
	Table_Name 
From 
	Information_Schema.Tables  
Where 
	Table_Type = 'Base Table' 
	and Table_NAME <> 'TABELAS QUE NAO QUERO APAGAR'   
=============================================================================
     
Declare @Start Int             
Declare @End Int             
Declare @Command Varchar(1000)             
             
Select @Start = 1, @end = Max(Idx) From @Tabelas             

While @Start <= @End             
Begin             
  Select @Command = 'Truncate Table ' + TblName + '' From @Tabelas Where Idx = @Start              
  Exec(@Command)             
 

 Set @Start = @Start + 1             
End