/************************************************************************
* Change Priority dictionary from 0...2 to 1...3
Flow step:
1. Apply db script change with new dictionary values.
2. New values DON'T delete existing numbers, just rename 1 and 2, and adds 3
3. 0 - Standard is still in the database
4. After deploy we increment all PriorityId in Complaint
5. Drop dic value 0.
6. Done

* BEGIN
**************************************************************************/

DECLARE @BreakingChangesVersion nvarchar(10);
SET  @BreakingChangesVersion = '02.07.0003'


-- run script only if version @VersionToFix was executed before
/* 
Check to not run fix script more then one time and ensure that script, which you are trying to fix was actually executed
*/
--IF  NOT EXISTS(SELECT NULL FROM dbo.DatabaseVersion WHERE VersionNumber = @BreakingChangesVersion) AND
--    EXISTS(SELECT NULL FROM dbo.[Priority] WHERE PriorityId = 0)
--BEGIN
--    UPDATE dbo.Complaint SET PriorityId = PriorityId + 1;

--    DELETE FROM dbo.[Priority] WHERE PriorityId = 0;
--END

/************************************************************************
* END
************************************************************************/


/************************************************************************
* Migrate data from IsExpedited column to the Priority column in Complaint
* BEGIN
**************************************************************************/
SET  @BreakingChangesVersion = '02.07.0004'

--IF EXISTS(SELECT NULL FROM sys.objects WHERE name = 'tmp_Complaint_PriorityIdBackup') AND 
--    NOT EXISTS(SELECT NULL FROM dbo.DatabaseVersion WHERE VersionNumber = @BreakingChangesVersion)
--BEGIN
--	/* Copy data to new column */
--    DECLARE @ExpeditedPriorityId SMALLINT,  @StandardPriorityId SMALLINT;
--	SET @ExpeditedPriorityId = (SELECT TOP 1 PriorityId FROM vw_Priority_1 WHERE LOWER(PriorityName) = 'expedited');
--    SET @StandardPriorityId = (SELECT TOP 1 PriorityId FROM vw_Priority_1 WHERE LOWER(PriorityName) = 'standard');

	
--    exec sp_executesql 
--	    N'
--UPDATE c 
--SET PriorityId = ( CASE WHEN tmp.IsExpedited = 1 THEN @ExpeditedPriorityId ELSE @StandardPriorityId END)
--FROM 
--	[dbo].[Complaint] c 
--		INNER JOIN [dbo].[tmp_Complaint_PriorityIdBackup] tmp ON c.AnGComplaintId = tmp.AnGComplaintId AND c.TenantId = tmp.TenantId 
--WHERE c.PriorityId IS NULL
--', 
--        @params = N'@ExpeditedPriorityId SMALLINT,  @StandardPriorityId SMALLINT', 
--	    @ExpeditedPriorityId = @ExpeditedPriorityId, 
--	    @StandardPriorityId = @StandardPriorityId;

--        -- drop table
--        DROP TABLE tmp_Complaint_PriorityIdBackup;
--END

   
/*************************************************************************
* END
**************************************************************************/



/************************************************************************
* Update old dictionary values to new in ExtensionReasonId 
* BEGIN
**************************************************************************/
--DECLARE @BreakingChangesVersion_1 nvarchar(10);
--SET  @BreakingChangesVersion_1 = '08.03.0004'

--IF NOT EXISTS(SELECT NULL FROM dbo.DatabaseVersion WHERE VersionNumber >= @BreakingChangesVersion_1)
--BEGIN
--    WHILE EXISTS (SELECT TOP (1) 1 FROM dbo.Extension WHERE ExtensionReasonId BETWEEN 1 AND 5)
--    BEGIN
--        UPDATE TOP (1000) dbo.Extension
--        SET ExtensionReasonId = 9, ExtensionReasonDescription = CASE WHEN ExtensionReasonId = 1 THEN N'Pending receipt of medical records'
--                                                                     WHEN ExtensionReasonId = 2 THEN N'Pending receipt of provider response'
--                                                                     WHEN ExtensionReasonId = 3 THEN N'Plan still investigating'
--                                                                     WHEN ExtensionReasonId = 4 THEN N'Member requested'
--                                                                     WHEN ExtensionReasonId = 5 THEN N'Pending receipt of Appointment of Representative form' END
--        WHERE ExtensionReasonId BETWEEN 1 AND 5

--		IF @@ROWCOUNT = 0
--        BREAK
--    END
--END

/*************************************************************************
* END
**************************************************************************/


/************************************************************************
* Update NoteTypeId to 1 (General) for all existing notes without NoteType
* BEGIN
**************************************************************************/
--DECLARE @BreakingChangesVersion_3 nvarchar(10);
--SET  @BreakingChangesVersion_3 = '09.01.0002'

--IF NOT EXISTS(SELECT NULL FROM dbo.DatabaseVersion WHERE VersionNumber >= @BreakingChangesVersion_3)
--BEGIN
--	WHILE EXISTS (SELECT TOP (1) 1 FROM dbo.Note WHERE NoteTypeId IS NULL)
--	BEGIN
--	  UPDATE TOP (1000) dbo.Note
--	  SET NoteTypeId = 1
--	  WHERE NoteTypeId IS NULL

--	  IF @@ROWCOUNT = 0
--	  BREAK
--	END
--END

/*************************************************************************
* END
**************************************************************************/
