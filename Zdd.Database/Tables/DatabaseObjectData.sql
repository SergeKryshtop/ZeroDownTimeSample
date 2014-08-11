CREATE TABLE [dbo].[DatabaseObjectData]
(
    [ObjectType] NVARCHAR(50) NOT NULL, 
    [ObjectName] NVARCHAR(200) NOT NULL, 
    [CreatedRelease] SMALLINT NULL, 
    [CreatedDateTime] DATETIMEOFFSET NULL, 
    [LastUsedRelease] SMALLINT NULL, 
    [RemovedRelease] SMALLINT NULL, 
    [RemovedDateTime] DATETIMEOFFSET NULL,
	CONSTRAINT [pk_DatabaseObjectData] PRIMARY KEY CLUSTERED (ObjectType ASC, ObjectName ASC)
)
