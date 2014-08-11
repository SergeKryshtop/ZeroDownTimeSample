--SQL variables
DECLARE @CurrentTime DATETIMEOFFSET
DECLARE @TenantDatabaseVersion NVARCHAR(10)

SET @CurrentTime = SYSDATETIMEOFFSET()

--Checking table existance
IF OBJECT_ID(N'DatabaseVersion') IS NOT NULL
BEGIN
--Get DB version from server
SELECT @TenantDatabaseVersion = ISNULL(VersionNumber,0) FROM dbo.DatabaseVersion WHERE UpdateDateTime = (SELECT MAX(UpdateDateTime) FROM dbo.DatabaseVersion)
END