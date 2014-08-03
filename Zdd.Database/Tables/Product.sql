CREATE TABLE [dbo].[Product]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(128) NOT NULL,
    [Description] nvarchar(max),
    [CategoryId] INT NOT NULL,
    [Weight] DECIMAL(18,2)  NULL,
)
