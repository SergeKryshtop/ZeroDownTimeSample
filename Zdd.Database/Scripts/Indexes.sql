IF (SELECT OBJECT_ID FROM sys.indexes WHERE name = 'ix__Product_Name') IS NULL
BEGIN
    CREATE NONCLUSTERED INDEX [ix__Product_Name]
    ON [dbo].[Product]([Name] ASC)
   
END





