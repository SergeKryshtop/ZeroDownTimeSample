CREATE TABLE [dbo].[ProductModel]
(
	[Id] INT NOT NULL IdENTITY(1,1),
	[Name] nvarchar(255) NOT NULL,
	[CatalogDescription] [xml] NULL,
	[Instructions] [xml] NULL,
	[rowguid] [uniqueidentifier] ROWGUIdCOL  NOT NULL CONSTRAINT [DF__ProductModel__rowguid]  DEFAULT (newid()),
	[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF__ProductModel__ModifiedDate]  DEFAULT (getutcdate()),
	CONSTRAINT [PK_ProductModel_ProductModelId] PRIMARY KEY CLUSTERED ( Id ASC)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

