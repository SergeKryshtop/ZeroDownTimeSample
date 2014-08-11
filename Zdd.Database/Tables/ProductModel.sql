CREATE TABLE [dbo].[ProductModel]
(
	[TenantId] BIGINT NOT NULL,
	[Id] INT NOT NULL,
	[Name] nvarchar(255) NOT NULL,
	[CatalogDescription] [xml] NULL,
	[Instructions] [xml] NULL,
	[ModifiedDateTime] [datetime] NOT NULL CONSTRAINT [DF__ProductModel__ModifiedDateTime]  DEFAULT (getutcdate()),
	CONSTRAINT [PK__ProductModel] PRIMARY KEY CLUSTERED (Id ASC, TenantId ASC)
) 

GO

