DECLARE @CurrentReleaseNumber INT
DECLARE @CurrentSprintNumber INT
DECLARE @CurrentDatabaseVersionNumber INT
DECLARE @CurrentDatabaseVersion NVARCHAR(10)

--Please change information about release, sprint, version if you did some database schema changes
SET @CurrentReleaseNumber = 1
SET @CurrentSprintNumber = 3
SET @CurrentDatabaseVersionNumber = 1

--Retrieving database version
SET @CurrentDatabaseVersion = RIGHT(N'00'+CAST(@CurrentReleaseNumber AS NVARCHAR(2)),2) + N'.' + RIGHT(N'00'+CAST(@CurrentSprintNumber AS NVARCHAR(2)),2)  + N'.' + RIGHT(N'0000'+CAST(@CurrentDatabaseVersionNumber AS NVARCHAR(4)),4)
