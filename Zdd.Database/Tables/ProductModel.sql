CREATE TABLE [dbo].[ProductModel]
(
	[TenantId] BIGINT NOT NULL,
	[Id] BIGINT NOT NULL,
	[Name] nvarchar(255) NOT NULL,
	CONSTRAINT [PK__ProductModel] PRIMARY KEY CLUSTERED (Id ASC, TenantId ASC)
) 

GO

