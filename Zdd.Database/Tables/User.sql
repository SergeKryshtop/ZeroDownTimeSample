CREATE TABLE [dbo].[User]
(
    [Id] uniqueidentifier NOT NULL PRIMARY KEY,
    [LastName] nvarchar(255) NOT NULL,
    [FirstName] nvarchar(255) NOT NULL,
    [MiddleName] nvarchar(255),
    [AddressLine1] nvarchar(255) NOT NULL,
    [AddressLine2] nvarchar(255) NULL,
    [City] nvarchar(255) NOT NULL,
    [State] nvarchar(255) NOT NULL,
    [Country] nvarchar(128) NOT NULL,
    [ZipCode] nvarchar(15) NOT NULL
)
