
--Criando Schema
CREATE SCHEMA Chains;
GO
--Criando tabela no Schema
CREATE TABLE Chains.Sizes (ChainID int, width dec(10,2));

--Adicionar tabela existente ao novo schema
CREATE SCHEMA Products;

--Aterando dbo para Schema criado
alter schema products transfer dbo.students 
go