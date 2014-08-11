CREATE TABLE [dbo].[DatabaseVersion]
(
 	[TenantId] BIGINT NOT NULL,
	[VersionNumber] NVARCHAR(10) NOT NULL, 
    [UpdateDateTime] DATETIMEOFFSET NULL,
	CONSTRAINT [pk__DatabaseVersion] PRIMARY KEY CLUSTERED ([VersionNumber] ASC)
)
