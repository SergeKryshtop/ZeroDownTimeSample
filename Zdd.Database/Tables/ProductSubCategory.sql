CREATE TABLE [dbo].[ProductSubCategory]
(
	[Id] INT NOT NULL IdENTITY(1,1),
	[ProductCategoryId] [int] NOT NULL,
	[Name] nvarchar(255) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIdCOL  NOT NULL CONSTRAINT [DF__ProductSubCategory__rowguid]  DEFAULT (newid()) ,
	[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF__ProductSubCategory__ModifiedDate]  DEFAULT (getutcdate()),
	CONSTRAINT [PK__ProductSubcategory] PRIMARY KEY CLUSTERED ([Id] ASC),
	
);


