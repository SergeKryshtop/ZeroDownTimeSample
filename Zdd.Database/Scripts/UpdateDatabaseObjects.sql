
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

