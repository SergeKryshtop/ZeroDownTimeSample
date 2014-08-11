CREATE PROCEDURE [dbo].[GetDeprecatedObjects]
AS
SELECT [ObjectType] AS 'Object type', [ObjectName] AS 'Object name',
       [LastUsedRelease] AS 'Last used in release №',
       [LastUsedRelease] + 2 AS 'Minimal release № for removing',
       CASE WHEN RemovedRelease IS NULL THEN 'No'
            ELSE 'Yes' END 'Is removed'
FROM DatabaseObjectData
WHERE LastUsedRelease IS NOT NULL
