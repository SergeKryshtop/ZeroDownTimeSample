/***********************************************************
* Backup IsExpedited column to temp database for futher push into the PriorityId column on post.deployment

Workaround for breaking change
0. Check database version if hasn't been run and check IsExpedited exists
1. create temp table on pre-deploy
2. copy IsExpedited column values with PK to that table from complaint
3. Run script (which will drop IsExpedited and create PriorityId with NULL
4. On post deploy update Complaints.PriorityId from temp table JOIN by PK
5. Drop temporary table


* BEGIN
************************************************************/
DECLARE @BreakingChangesVersion nvarchar(10);
SET  @BreakingChangesVersion = '02.07.0004'

---- run script only if version has not been applied
--IF OBJECT_ID(N'DatabaseVersion') IS NOT NULL
--BEGIN
--	IF NOT EXISTS(SELECT NULL FROM dbo.DatabaseVersion WHERE VersionNumber = @BreakingChangesVersion)
--	BEGIN
--		-- for NI compatibility
--		IF EXISTS(SELECT NULL FROM sys.columns WHERE name = 'IsExpedited' AND object_id = OBJECT_ID('dbo.Order'))
--		BEGIN
--			IF NOT EXISTS(SELECT NULL FROM sys.objects WHERE name = 'tmp_Complaint_PriorityIdBackup')
--			BEGIN
--				-- add column to copy data
--				CREATE TABLE [dbo].[tmp_Order_PriorityIdBackup] (
--					[Id] BIGINT NOT NULL,
--					[TenantId] BIGINT NOT NULL,
--					IsExpedited bit NULL,
--					CONSTRAINT PK__tmp_Order__PriorityIdBackup PRIMARY KEY (Id, TenantId)
--				);
--			END 

--			exec sp_executesql N'
--			MERGE [dbo].[tmp_Order_PriorityIdBackup] AS target
--			USING (
--				SELECT Id, TenantId, IsExpedited
--				FROM dbo.Order
--				) AS source ([Id], [TenantId], [IsExpedited])
--				ON (target.TenantID = source.TenantID AND target.[Id] = source.[Id])
--			WHEN MATCHED THEN 
--				UPDATE SET [IsExpedited] = source.[IsExpedited]
--			WHEN NOT MATCHED THEN 
--				INSERT ([Id], [TenantId], [IsExpedited])
--				VALUES (source.[Id], source.[TenantId], source.[IsExpedited]);'
--		END 
--	END
--END

/***********************************************************
* END
************************************************************/

