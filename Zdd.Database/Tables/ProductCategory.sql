CREATE TABLE [dbo].[ProductCategory]
(
    [TenantId] BIGINT NOT NULL,
    [Id] BIGINT NOT NULL,
    [Name] nvarchar(128) NOT NULL,
    [OrderIndex] int NOT NULL DEFAULT(100),
	CONSTRAINT PK__ProductCategory PRIMARY KEY CLUSTERED(TenantId ASC, Id ASC)
)
