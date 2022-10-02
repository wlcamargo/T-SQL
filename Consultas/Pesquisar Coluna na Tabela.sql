--PESQUISAR COLUNAS NA TABELA
USE Nome_do_Banco

Select 
T.name as Tabela,
C.name as Coluna
From
Sys.sysobjects as T (nolock)
Inner join sys.all_columns as c (nolock) on t.id = c.object_id and t.xtype = 'u'

Where 
C.name like '%Nome_da_Coluna%'

Order by
T.name asc