--ESPAÇO EM DISCO

DECLARE @drive nvarchar(10)
DECLARE @MBFree int
DECLARE @bodyy VARCHAR(1024) 

DROP TABLE IF EXISTS #DriveSpace 
CREATE TABLE #DriveSpace 
( 
drive nvarchar(10), 
MBFree int 
) 

INSERT INTO #DriveSpace 
exec xp_fixeddrives

DECLARE db_cursor CURSOR FOR

select drive,MBFree from #DriveSpace

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @drive,@MBFree

WHILE @@FETCH_STATUS = 0  
BEGIN 

	set @bodyy=
	('LOW FREE DISK SPACE ON SQL Server Name : ' + cast(@@ServerName as nvarchar)
	+' - Drive : '+cast(@drive as nvarchar) +' '
	+' - MB Free : '+cast(@MBFree as nvarchar) +' MB')


	FETCH NEXT FROM db_cursor INTO @drive,@MBFree

END  

CLOSE db_cursor  
DEALLOCATE db_cursor
GO

SELECT * FROM #DriveSpace
GO



