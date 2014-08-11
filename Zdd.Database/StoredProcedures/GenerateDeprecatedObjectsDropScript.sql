CREATE PROCEDURE [dbo].[GenerateDeprecatedObjectsDropScript]
AS
SELECT ObjectName AS 'Object name',
'IF OBJECT_ID(N' + '''dbo.' +  ObjectName + ''') IS NOT NULL' + '
BEGIN
    DROP ' + ObjectType + ' dbo.' + ObjectName + '
END' AS 'Drop script'
FROM DatabaseObjectData
WHERE ObjectType <> 'Trigger'
AND LastUsedRelease IS NOT NULL
AND RemovedRelease IS NULL