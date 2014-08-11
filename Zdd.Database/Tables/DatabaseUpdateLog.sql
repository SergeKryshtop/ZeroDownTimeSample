CREATE TABLE [dbo].[DatabaseUpdateLog]
(
	[TenantId] BIGINT NOT NULL,
	[DatabaseUpdateLogId] BIGINT IDENTITY(1,1) NOT NULL,
 	[FromVersion] NVARCHAR(10) NULL,
	[ToVersion] NVARCHAR(10) NULL, 
    [UpdateStartTime] DATETIMEOFFSET NULL,
	[UpdateEndTime] DATETIMEOFFSET NULL,
	CONSTRAINT [pk_DatabaseUpdateLog] PRIMARY KEY CLUSTERED ([DatabaseUpdateLogId] ASC,[TenantId] ASC)
)
