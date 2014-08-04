CREATE TABLE [dbo].[UnitMeasure]
(
	[UnitMeasureCode] [nchar](3) NOT NULL,
	[Name] nvarchar(255) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_UnitMeasure_ModifiedDate]  DEFAULT (getutcdate()),
	CONSTRAINT [PK__UnitMeasure] PRIMARY KEY CLUSTERED ([UnitMeasureCode] ASC )
) 
GO

