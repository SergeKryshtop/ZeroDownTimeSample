CREATE TABLE [dbo].[ProductCategory]
(
    [Id] INT NOT NULL PRIMARY KEY IdENTITY(1,1),
    [Name] nvarchar(128) NOT NULL,
    [OrderIndex] int NOT NULL DEFAULT(100)
)
