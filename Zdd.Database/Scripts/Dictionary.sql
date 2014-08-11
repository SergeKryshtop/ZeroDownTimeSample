--Dictionary:
USE [$(DatabaseName)];

-- BEGIN [UnitMeasure]
MERGE [dbo].[UnitMeasure] AS target
USING (
    SELECT  N'UnitMeasureCode', N'Name' UNION
	SELECT  N'BOX', N'Boxes' UNION
	SELECT  N'BTL', N'Bottle' UNION
	SELECT  N'C  ', N'Celsius' UNION
	SELECT  N'CAN', N'Canister' UNION
	SELECT  N'CAR', N'Carton' UNION
	SELECT  N'CBM', N'Cubic meters' UNION
	SELECT  N'CCM', N'Cubic centimeter' UNION
	SELECT  N'CDM', N'Cubic decimeter' UNION
	SELECT  N'CM ', N'Centimeter' UNION
	SELECT  N'CM2', N'Square centimeter' UNION
	SELECT  N'CR ', N'Crate' UNION
	SELECT  N'CS ', N'Case' UNION
	SELECT  N'CTN', N'Container' UNION
	SELECT  N'DM ', N'Decimeter' UNION
	SELECT  N'DZ ', N'Dozen' UNION
	SELECT  N'EA ', N'Each' UNION
	SELECT  N'FT3', N'Cubic foot' UNION
	SELECT  N'G  ', N'Gram' UNION
	SELECT  N'GAL', N'Gallon' UNION
	SELECT  N'IN ', N'Inch' UNION
	SELECT  N'KG ', N'Kilogram' UNION
	SELECT  N'KGV', N'Kilogram/cubic meter' UNION
	SELECT  N'KM ', N'Kilometer' UNION
	SELECT  N'KT ', N'Kiloton' UNION
	SELECT  N'L  ', N'Liter' UNION
	SELECT  N'LB ', N'US pound' UNION
	SELECT  N'M  ', N'Meter' UNION
	SELECT  N'M2 ', N'Square meter' UNION
	SELECT  N'M3 ', N'Cubic meter' UNION
	SELECT  N'MG ', N'Milligram' UNION
	SELECT  N'ML ', N'Milliliter' UNION
	SELECT  N'MM ', N'Millimeter' UNION
	SELECT  N'OZ ', N'Ounces' UNION
	SELECT  N'PAK', N'Pack' UNION
	SELECT  N'PAL', N'Pallet' UNION
	SELECT  N'PC ', N'Piece' UNION
	SELECT  N'PCT', N'Percentage' UNION
	SELECT  N'PT ', N'Pint, US liquid'
    ) AS source ([TenantId], [UnitMeasureCode], [Name])
    ON (target.TenantID = source.TenantID AND target.[UnitMeasureCode] = source.[UnitMeasureCode])
WHEN MATCHED THEN 
    UPDATE SET [Name] = source.[Name], ModifiedDateTime = getutcdate()
WHEN NOT MATCHED THEN 
    INSERT ([TenantId], [UnitMeasureCode], [Name])
    VALUES (source.TenantID, source.[ComplaintTypeId], source.[ComplaintTypeName]);

--END [UnitMeasure]

-- BEGIN ProductCategory
MERGE [dbo].[ProductCategory] AS target
USING (
	SELECT $(TenantId), 1, N'Name', 100 UNION
	SELECT $(TenantId), 1, N'Bikes', 100 UNION
	SELECT $(TenantId), 1, N'Components', 100 UNION
	SELECT $(TenantId), 1, N'Clothing', 100 UNION
	SELECT $(TenantId), 1, N'Accessories', 100 UNION
    ) AS source ([TenantId], [Id], [Name], OrderIndex)
    ON (target.TenantID = source.TenantID AND target.[Id] = source.[Id])
WHEN MATCHED THEN 
    UPDATE SET [Name] = source.[Name], ModifiedDateTime = getutcdate()
WHEN NOT MATCHED THEN 
    INSERT ([TenantId], [Id], [Name])
    VALUES (source.TenantID, source.[Id], source.[Name]);
-- END RequesterType

-- BEGIN ProductSubcategory
MERGE [dbo].[ProductSubcategory] AS target
USING (
	SELECT $(TenantId), 1, 2, N'Name' UNION
	SELECT $(TenantId), 1, 2, N'Mountain Bikes' UNION
	SELECT $(TenantId), 1, 2, N'Road Bikes' UNION
	SELECT $(TenantId), 1, 2, N'Touring Bikes' UNION
	SELECT $(TenantId), 1, 2, N'Handlebars' UNION
	SELECT $(TenantId), 1, 2, N'Bottom Brackets' UNION
	SELECT $(TenantId), 1, 2, N'Brakes' UNION
	SELECT $(TenantId), 1, 2, N'Chains' UNION
	SELECT $(TenantId), 1, 2, N'Cranksets' UNION
	SELECT $(TenantId), 1, 2, N'Derailleurs' UNION
	SELECT $(TenantId), 1, 2, N'Forks' UNION
	SELECT $(TenantId), 1, 2, N'Headsets' UNION
	SELECT $(TenantId), 1, 2, N'Mountain Frames' UNION
	SELECT $(TenantId), 1, 2, N'Pedals' UNION
	SELECT $(TenantId), 1, 2, N'Road Frames' UNION
	SELECT $(TenantId), 1, 2, N'Saddles' UNION
	SELECT $(TenantId), 1, 2, N'Touring Frames' UNION
	SELECT $(TenantId), 1, 2, N'Wheels' UNION
	SELECT $(TenantId), 1, 2, N'Bib-Shorts' UNION
	SELECT $(TenantId), 1, 2, N'Caps' UNION
	SELECT $(TenantId), 1, 2, N'Gloves' UNION
	SELECT $(TenantId), 1, 2, N'Jerseys' UNION
	SELECT $(TenantId), 1, 2, N'Shorts' UNION
	SELECT $(TenantId), 1, 2, N'Socks' UNION
	SELECT $(TenantId), 1, 2, N'Tights' UNION
	SELECT $(TenantId), 1, 2, N'Vests' UNION
	SELECT $(TenantId), 1, 2, N'Bike Racks' UNION
	SELECT $(TenantId), 1, 2, N'Bike Stands' UNION
	SELECT $(TenantId), 1, 2, N'Bottles and Cages' UNION
	SELECT $(TenantId), 1, 2, N'Cleaners' UNION
	SELECT $(TenantId), 1, 2, N'Fenders' UNION
	SELECT $(TenantId), 1, 2, N'Helmets' UNION
	SELECT $(TenantId), 1, 2, N'Hydration Packs' UNION
	SELECT $(TenantId), 1, 2, N'Lights' UNION
	SELECT $(TenantId), 1, 2, N'Locks' UNION
	SELECT $(TenantId), 1, 2, N'Panniers' UNION
	SELECT $(TenantId), 1, 2, N'Pumps' UNION
	SELECT $(TenantId), 1, 2, N'Tires and Tubes'
    ) AS source ([TenantId], [Id], [ProductCategoryId], [Name])
    ON (target.TenantID = source.TenantID AND target.[Id] = source.[Id])
WHEN MATCHED THEN 
    UPDATE SET [Name] = source.[Name], ModifiedDateTime = getutcdate()
WHEN NOT MATCHED THEN 
    INSERT ([TenantId], [Id], [ProductCategoryId], [Name])
    VALUES (source.TenantID, source.[Id], source.ProductCategoryId, source.Name);
-- END ProductSubCategory



--Dictionary:
