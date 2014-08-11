USE [ZddDatabase]
GO

DECLARE @ProductIdStart bigint



WHILE (SELECT ISNULL(MAX(Id),0) FROM dbo.Product) < 20000000
BEGIN
SET @ProductIdStart = (SELECT ISNULL(MAX(Id),0) FROM dbo.Product);
PRINT 'Max Id = ' + STR(@ProductIdStart);

INSERT INTO [dbo].[Product]
           ([TenantId]
           ,[Id]
           ,[Name]
           ,[ProductNumber]
           ,[Description]
           ,[CategoryId]
           ,[MakeFlag]
           ,[FinishedGoodsFlag]
           ,[Color]
           ,[SafetyStockLevel]
           ,[ReorderPoint]
           ,[StandardCost]
           ,[ListPrice]
           ,[Size]
           ,[SizeUnitMeasureCode]
           ,[WeightUnitMeasureCode]
           ,[Weight]
           ,[DaysToManufacture]
           ,[ProductLine]
           ,[Class]
           ,[Style]
           ,[ProductSubCategoryId]
           ,[ProductModelId]
           ,[SellStartDate]
           ,[SellEndDate]
           ,[DiscontinuedDate]
           ,[ModifiedDate])
     SELECT 1
      ,[ProductID] + @ProductIdStart
      ,p.[Name] + '-' + Str(@ProductIdStart)
      ,[ProductNumber] + '-' + Str(@ProductIdStart)
      ,NULL
      ,sc.[ProductCategoryID]
      ,[MakeFlag]
      ,[FinishedGoodsFlag]
      ,[Color]
      ,[SafetyStockLevel]
      ,[ReorderPoint]
      ,[StandardCost]
      ,[ListPrice]
      ,[Size]
      ,[SizeUnitMeasureCode]
      ,[WeightUnitMeasureCode]
      ,[Weight]
      ,[DaysToManufacture]
      ,[ProductLine]
      ,[Class]
      ,[Style]
      ,p.[ProductSubcategoryID]
      ,[ProductModelId]
      ,[SellStartDate]
      ,[SellEndDate]
      ,[DiscontinuedDate]
      ,p.[ModifiedDate]
  FROM [AdventureWorks2012].[Production].[Product] p INNER JOIN [AdventureWorks2012].[Production].[ProductSubcategory] sc ON p.ProductSubcategoryID = sc.ProductSubcategoryID

  END

