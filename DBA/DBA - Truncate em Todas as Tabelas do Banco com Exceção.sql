


Declare @Tabelas Table (Idx Int Identity(1,1), TblName Varchar(100))             

Insert into @Tabelas (TblName)    

-- Clausula da Exceção na tabela que não deseja fazer truncate --> TABLE_NAME
Select 
	Table_Name 
From 
	Information_Schema.Tables  
Where 
	Table_Type = 'Base Table' 
	and Table_NAME <> 'FATO_MOVIMENTACAO_ITEM'           
     
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
