
--Update database objects table with new objects and object state
MERGE [dbo].[DatabaseObjectData] AS target
USING (
        SELECT CASE type WHEN 'U' THEN 'Table'
                         WHEN 'V' THEN 'View'
                         WHEN 'P' THEN 'Procedure'
                         WHEN 'FN' THEN 'Function'
                         WHEN 'TR' THEN 'Trigger' END ObjectType,
               name AS ObjectName
        FROM sys.objects
        WHERE type IN ('U','V','P','TR','FN')
        AND name <> '__RefactorLog'
        AND name NOT LIKE '%diagram%'
       
	) AS source (ObjectType, ObjectName)
    ON (target.ObjectType = source.ObjectType AND target.ObjectName = source.ObjectName)
WHEN MATCHED THEN 
    UPDATE SET RemovedRelease = NULL,
			   RemovedDateTime = NULL
WHEN NOT MATCHED BY TARGET THEN 
    INSERT (ObjectType, ObjectName,CreatedRelease,CreatedDateTime)
    VALUES (source.ObjectType, source.ObjectName,@CurrentReleaseNumber,SYSDATETIME())
WHEN NOT MATCHED BY SOURCE THEN 
    UPDATE SET RemovedRelease = @CurrentReleaseNumber,
	           RemovedDateTime = SYSDATETIME() ;

	           
-- Update last used release column based on version of view

 SELECT o1.ObjectName, o2.CreatedRelease - 1 AS LastUsedRelease
 INTO #DeprecatedView
 FROM DatabaseObjectData o1
 JOIN DatabaseObjectData o2
 --Find views that has newer versions
 ON LEFT(o1.ObjectName,LEN(o1.ObjectName)-CHARINDEX('_',REVERSE(o1.ObjectName))+1) = LEFT(o2.ObjectName,LEN(o2.ObjectName)-CHARINDEX('_',REVERSE(o2.ObjectName))+1)
 AND CAST(RIGHT(o1.ObjectName,1) AS INT) + 1 = CAST(RIGHT(o2.ObjectName,1) AS INT)
 WHERE o1.ObjectType = 'View'
 AND o2.ObjectType = 'View'
 
 
 UPDATE DatabaseObjectData
 SET LastUsedRelease = s2.LastUsedRelease
 FROM DatabaseObjectData s1
 JOIN
 (
 SELECT ObjectName, LastUsedRelease
 FROM #DeprecatedView 
 UNION
 SELECT so2.name, d.LastUsedRelease
 FROM sys.objects so1
 JOIN #DeprecatedView d
 ON so1.name= d.ObjectName
 JOIN sys.objects so2
 ON so1.object_id = so2.parent_object_id) s2
 ON s1.ObjectName = s2.ObjectName
 WHERE s1.LastUsedRelease IS NULL

-- Set initial info about objects creation release

DECLARE @Version nvarchar(10)
SET  @Version = '10.03.0002'

IF OBJECT_ID(N'DatabaseVersion') IS NOT NULL
BEGIN
	IF NOT EXISTS(SELECT 1 FROM dbo.DatabaseVersion WHERE VersionNumber >= @Version)
	BEGIN
	    MERGE [dbo].[DatabaseObjectData] AS target
        USING (
                SELECT N'Table', N'AnGMember',1,NULL
				UNION
				SELECT N'Table', N'AssociatedEntityType',1,NULL
				UNION
				SELECT N'Table', N'AuthorizedRepresentative',2,NULL
				UNION
				SELECT N'Table', N'AuthorizedRepresentativeRelationshipType',2,NULL
				UNION
				SELECT N'Table', N'BenefitPlan',10,NULL
				UNION
				SELECT N'Table', N'Claim',9,NULL
				UNION
				SELECT N'Table', N'Complaint',1,NULL
				UNION
				SELECT N'Table', N'ComplaintEventLog',1,NULL
				UNION
				SELECT N'Table', N'ComplaintEventLogDetails',9,NULL
				UNION
				SELECT N'Table', N'ComplaintSubType',1,NULL
				UNION
				SELECT N'Table', N'ComplaintType',1,NULL
				UNION
				SELECT N'Table', N'DatabaseUpdateLog',1,NULL
				UNION
				SELECT N'Table', N'DatabaseVersion',1,NULL
				UNION
				SELECT N'Table', N'Determination',2,NULL
				 UNION
				SELECT N'Table', N'Determination2DeterminationType',10,NULL
				UNION
				SELECT N'Table', N'DeterminationType',2,NULL
				UNION
				SELECT N'Table', N'DeterminationTypeOverturn',8,NULL
				UNION
				SELECT N'Table', N'DeterminationTypeOverturnPlanError',8,NULL
				UNION
				SELECT N'Table', N'Extension',2,NULL
				UNION
				SELECT N'Table', N'ExtensionReason',2,NULL
				UNION
				SELECT N'Table', N'ExternalComplaintSystem',1,NULL
				UNION
				SELECT N'Table', N'Note',2,NULL
				UNION
				SELECT N'Table', N'NoteType',9,NULL
				UNION
				SELECT N'Table', N'OwnerType',1,NULL
				UNION
				SELECT N'Table', N'PrimaryCategory',2,NULL
				UNION
				SELECT N'Table', N'Priority',2,NULL
				UNION
				SELECT N'Table', N'Provider',10,NULL
				UNION
				SELECT N'Table', N'Recommendation',2,NULL
				UNION
				SELECT N'Table', N'RecommendationList',2,NULL
				UNION
				SELECT N'Table', N'Requester',1,NULL
				UNION
				SELECT N'Table', N'RequesterType',1,NULL
				UNION
				SELECT N'Table', N'SecondaryCategory',10,NULL
				UNION
				SELECT N'Table', N'Source',1,NULL
				UNION
				SELECT N'Table', N'State',1,NULL
				UNION
				SELECT N'Table', N'Status',1,NULL
				UNION
				SELECT N'Table', N'StatusChangeReason',1,NULL
				UNION
				SELECT N'Table', N'UMCase',8,NULL
				UNION
				SELECT N'Table', N'UMCaseAdmissionExtension',8,NULL
				UNION
				SELECT N'Table', N'UMCaseDiagnosis',8,NULL
				UNION
				SELECT N'Table', N'UMCaseProcedureService',8,NULL
				UNION
				SELECT N'Table', N'ValidationStatus',2,NULL
				UNION
				SELECT N'Table', N'ValidationStatusChangeReason',2,NULL
				UNION
				SELECT N'Trigger', N'tr_vw_Complaint_1_Instead_I',2,7
				UNION
				SELECT N'Trigger', N'tr_vw_Complaint_1_Instead_U',2,7
				UNION
				SELECT N'Trigger', N'tr_vw_Complaint_2_Instead_I',8,7
				UNION
				SELECT N'Trigger', N'tr_vw_Complaint_2_Instead_U',8,7
				UNION
				SELECT N'Trigger', N'tr_vw_Extension_1_Instead_I',8,7
				UNION
				SELECT N'Trigger', N'tr_vw_Extension_1_Instead_U',8,7
				UNION
				SELECT N'View', N'vw_AnGMember_1',2,NULL
				UNION
				SELECT N'View', N'vw_AssociatedEntityType_1',2,NULL
				UNION
				SELECT N'View', N'vw_AuthorizedRepresentative_1',2,NULL
				UNION
				SELECT N'View', N'vw_AuthorizedRepresentativeRelationshipType_1',2,NULL
				UNION
				SELECT N'View', N'vw_BenefitPlan_1',10,NULL
				UNION
				SELECT N'View', N'vw_Claim_1',9,NULL
				UNION
				SELECT N'View', N'vw_Complaint_1',2,7
				UNION
				SELECT N'View', N'vw_Complaint_1_1',2,7
				UNION
				SELECT N'View', N'vw_Complaint_2',2,7
				UNION
				SELECT N'View', N'vw_Complaint_3',2,NULL
				UNION
				SELECT N'View', N'vw_Complaint_Read_1',2,7
				UNION
				SELECT N'View', N'vw_Complaint_Read_2',8,NULL
				UNION
				SELECT N'View', N'vw_ComplaintEventLog_1',2,8
				UNION
				SELECT N'View', N'vw_ComplaintEventLog_2',9,NULL
				UNION
				SELECT N'View', N'vw_ComplaintEventLogDetails_1',9,NULL
				UNION
				SELECT N'View', N'vw_ComplaintSubType_1',2,7
				UNION
				SELECT N'View', N'vw_ComplaintSubType_2',8,NULL
				UNION
				SELECT N'View', N'vw_ComplaintType_1',2,NULL
				UNION
				SELECT N'View', N'vw_Determination_1',2,NULL
				UNION
				SELECT N'View', N'vw_Determination_Read_1',2,NULL
				UNION
				SELECT N'View', N'vw_Determination2DeterminationType_1',10,NULL
				UNION
				SELECT N'View', N'vw_DeterminationType_1',2,NULL
				UNION
				SELECT N'View', N'vw_DeterminationTypeOverturn_1',8,NULL
				UNION
				SELECT N'View', N'vw_DeterminationTypeOverturnPlanError_1',8,NULL
				UNION
				SELECT N'View', N'vw_Extension_1',2,7
				UNION
				SELECT N'View', N'vw_Extension_2',8,NULL
				UNION
				SELECT N'View', N'vw_ExtensionReason_1',2,7
				UNION
				SELECT N'View', N'vw_ExtensionReason_2',8,NULL
				UNION
				SELECT N'View', N'vw_ExternalComplaintSystem_1',2,NULL
				UNION
				SELECT N'View', N'vw_Note_1',2,NULL
				UNION
				SELECT N'View', N'vw_Note_Read_1',9,NULL
				UNION
				SELECT N'View', N'vw_NoteType_1',9,NULL
				UNION
				SELECT N'View', N'vw_OwnerType_1',2,NULL
				UNION
				SELECT N'View', N'vw_PrimaryCategory_1',2,NULL
				UNION
				SELECT N'View', N'vw_Priority_1',2,NULL
				UNION
				SELECT N'View', N'vw_Provider_1',10,NULL
				UNION
				SELECT N'View', N'vw_Recommendation_1',2,NULL
				UNION
				SELECT N'View', N'vw_Recommendation_Read_1',2,NULL
				UNION
				SELECT N'View', N'vw_RecommendationList_1',2,NULL
				UNION
				SELECT N'View', N'vw_Requester_1',2,NULL
				UNION
				SELECT N'View', N'vw_Requester_Read_1',2,NULL
				UNION
				SELECT N'View', N'vw_RequesterType_1',2,NULL
				UNION
				SELECT N'View', N'vw_SecondaryCategory_1',10,NULL
				UNION
				SELECT N'View', N'vw_Source_1',2,NULL
				UNION
				SELECT N'View', N'vw_State_1',2,NULL
				UNION
				SELECT N'View', N'vw_Status_1',2,NULL
				UNION
				SELECT N'View', N'vw_StatusChangeReason_1',2,NULL
				UNION
				SELECT N'View', N'vw_UMCase_1',8,NULL
				UNION
				SELECT N'View', N'vw_UMCaseAdmissionExtension_1',8,NULL
				UNION
				SELECT N'View', N'vw_UMCaseDiagnosis_1',8,NULL
				UNION
				SELECT N'View', N'vw_UMCaseProcedureService_1',8,NULL
				UNION
				SELECT N'View', N'vw_ValidationStatus_1',2,NULL
				UNION
				SELECT N'View', N'vw_ValidationStatusChangeReason_1',2,NULL
    
	          ) AS source (ObjectType, ObjectName, CreatedRelease,LastUsedRelease)
    ON (target.ObjectType = source.ObjectType AND target.ObjectName = source.ObjectName)
    WHEN MATCHED THEN 
    UPDATE SET target.CreatedRelease = source.CreatedRelease,
			   target.LastUsedRelease = source.LastUsedRelease;
	END
END