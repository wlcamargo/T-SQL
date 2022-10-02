--CONTAR LINHAS DE TODAS AS TABELAS

select
    tabelas.name as 'TABELA',
    sum(partitions.rows) as 'LINHAS'
from 
	sys.tables as tabelas
	join sys.partitions as partitions on tabelas.object_id = partitions.object_id and partitions.index_id in (0,1)
group by 
	schema_name(schema_id), 
	tabelas.name
