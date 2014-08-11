CREATE TABLE [dbo].[UnitMeasure]
(
	[UnitMeasureCode] [nvarchar](3) NOT NULL,
	[Name] nvarchar(255) NOT NULL,
	CONSTRAINT [PK_UnitMeasure_UnitMeasureCode] PRIMARY KEY CLUSTERED 
	(
		[UnitMeasureCode] ASC
	)
)
