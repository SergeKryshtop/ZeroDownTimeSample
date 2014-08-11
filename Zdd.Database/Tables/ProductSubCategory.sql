CREATE TABLE [dbo].[ProductSubCategory]
(
	[TenantId] BIGINT NOT NULL,
	[Id] BIGINT NOT NULL,
	[ProductCategoryId] [bigint] NOT NULL,
	[Name] nvarchar(255) NOT NULL,
	[ModifiedDateTime] [datetime] NOT NULL CONSTRAINT [DF__ProductSubCategory__ModifiedDateTime]  DEFAULT (getutcdate()),
	CONSTRAINT [PK__ProductSubcategory] PRIMARY KEY CLUSTERED ([Id] ASC, TenantId ASC),
	
);


