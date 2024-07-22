
DECLARE @name NVARCHAR(256) -- database name  
DECLARE @path NVARCHAR(512) -- path for backup files  
DECLARE @fileName NVARCHAR(512) -- filename for backup  
DECLARE @fileDate NVARCHAR(40) -- used for file name
 
-- specify database backup directory
SET @path = 'D:\HS_BBU\'  
 
-- specify filename format
SELECT @fileDate =  FORMAT(GETDATE(),'yyyy-MM-dd_HH,mm,ss', 'fa')
 
DECLARE db_cursor CURSOR LOCAL FOR  
SELECT name 
FROM master.sys.databases 
WHERE name NOT IN ('master','model','msdb','tempdb')  -- exclude these databases
 
OPEN db_cursor   
FETCH NEXT FROM db_cursor INTO @name   
 
WHILE @@FETCH_STATUS = 0   
BEGIN   
   SET @fileName = @path + @name + '_' + @fileDate + '.BAK'  
   BACKUP DATABASE @name TO DISK = @fileName  WITH COMPRESSION
 
   FETCH NEXT FROM db_cursor INTO @name   
END   
 
CLOSE db_cursor   
DEALLOCATE db_cursor