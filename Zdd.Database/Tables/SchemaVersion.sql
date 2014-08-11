CREATE TABLE [dbo].[SchemaVersion]
(
 	[VersionNumber] NVARCHAR(10) NOT NULL, 
    [UpdateDateTime] DATETIMEOFFSET NULL,
	CONSTRAINT [pk__SchemaVersion] PRIMARY KEY CLUSTERED ([VersionNumber] ASC)
)
