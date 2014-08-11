CREATE TABLE [dbo].[ProductSubcategory]
(
	[TenantId] BIGINT NOT NULL,
	[Id] INT NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
	[Name] nvarchar(255) NOT NULL,
	[ModifiedDateTime] [datetime] NOT NULL CONSTRAINT [DF__ProductSubCategory__ModifiedDateTime]  DEFAULT (getutcdate()),
	CONSTRAINT [PK__ProductSubcategory] PRIMARY KEY CLUSTERED ([Id] ASC, TenantId ASC),
	
);


