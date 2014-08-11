/* Adding only new version */
IF OBJECT_ID(N'SchemaVersion') IS NOT NULL
BEGIN
MERGE [dbo].[DatabaseVersion] AS target
USING (
    SELECT $(TenantId),@CurrentDatabaseVersion, @CurrentTime
	) AS DatabaseVersion ([TenantId], [VersionNumber], [UpdateDateTime])
    ON (target.TenantId = DatabaseVersion.TenantId AND target.[VersionNumber] = DatabaseVersion.[VersionNumber])
WHEN NOT MATCHED THEN 
    INSERT ([TenantId], [VersionNumber], [UpdateDateTime])
    VALUES (DatabaseVersion.TenantID, DatabaseVersion.[VersionNumber], DatabaseVersion.[UpdateDateTime]);
END

--Add log information for database update
IF OBJECT_ID(N'DatabaseUpdateLog') IS NOT NULL
BEGIN
UPDATE dbo.DatabaseUpdateLog 
SET UpdateEndTime = @CurrentTime
WHERE DatabaseUpdateLogId = (SELECT MAX(DatabaseUpdateLogId) FROM dbo.DatabaseUpdateLog)
END