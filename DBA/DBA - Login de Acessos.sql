--Criar Login
USE [master]
CREATE LOGIN [Wallace]
	WITH PASSWORD=N'mudar@123', 
	DEFAULT_DATABASE=[AdventureWorksDW2019], 
	CHECK_EXPIRATION=OFF, 
	CHECK_POLICY=OFF
GO
USE [AdventureWorksDW2019]
GO
CREATE USER [Wallace] FOR LOGIN [Wallace]
GO

--=========================================================================
--Verificar Login Criado
select 
	name,
	modify_date,
	LOGINPROPERTY(name, 'DaysUntilExpiration') as DaysUntilExpiration, 
	LOGINPROPERTY(name, 'PasswordLastSetTime') as PasswordLastSetTime,
	LOGINPROPERTY(name, 'IsExpired') as IsExpired,
	LOGINPROPERTY(name, 'IsMustChange') as IsMustChange,
	*
from
	sys.sql_logins

--==========================================================================

select * from sys.sysprocesses
where loginame = 'wallace'                                                                                              

--=========================================================================

--Permitir acesso a nivel de objeto
GRANT SELECT ON FactInternetSales TO Wallace

--Usuários Conexao no database
SELECT 
	P.name,
	P.type_desc,
	PP.name,
	PP.type_desc,
	PP.is_fixed_role
FROM
	SYS.database_role_members ROLES
	JOIN SYS.database_principals P ON ROLES.member_principal_id = P.principal_id
	JOIN SYS.database_principals PP ON ROLES.member_principal_id = PP.principal_id


--==========================================================================
--Comandos de Segurança
use [AdventureWorks2019]
DENY SELECT ON [Sales].[Store] TO wallace_camargo

use [AdventureWorks2019]
REVOKE SELECT ON [Sales].[Store] TO wallace_camargo

use [AdventureWorks2019]
GRANT SELECT ON [Sales].[Store] TO wallace_camargo

--Verificar Privilégios
EXEC [AdventureWorks2019].dbo.sp_helprotect 
    @username = 'wallace_camargo'    

