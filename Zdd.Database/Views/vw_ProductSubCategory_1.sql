CREATE VIEW [dbo].[vw_ProductSubCategory_1]
	AS 
	SELECT [TenantId]
      ,[Id]
      ,[ProductCategoryId]
      ,[Name]
      ,[ModifiedDateTime]
  FROM [dbo].[ProductSubcategory]
