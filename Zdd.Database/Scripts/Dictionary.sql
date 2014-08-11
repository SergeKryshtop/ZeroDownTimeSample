--Dictionary:
USE [$(DatabaseName)];

-- BEGIN [UnitMeasure]
MERGE [dbo].[UnitMeasure] AS target
USING (
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
    ) AS source ([UnitMeasureCode], [Name])
    ON (target.[UnitMeasureCode] = source.[UnitMeasureCode])
WHEN MATCHED THEN 
    UPDATE SET [Name] = source.[Name]
WHEN NOT MATCHED THEN 
    INSERT ([UnitMeasureCode], [Name])
    VALUES (source.[UnitMeasureCode], source.[Name]);

--END [UnitMeasure]

-- BEGIN ProductCategory
MERGE [dbo].[ProductCategory] AS target
USING (
	SELECT $(TenantId), 1, N'Bikes', 100 UNION
	SELECT $(TenantId), 2, N'Components', 100 UNION
	SELECT $(TenantId), 3, N'Clothing', 100 UNION
	SELECT $(TenantId), 4, N'Accessories', 100
    ) AS source ([TenantId], [Id], [Name], OrderIndex)
    ON (target.TenantID = source.TenantID AND target.[Id] = source.[Id])
WHEN MATCHED THEN 
    UPDATE SET [Name] = source.[Name]
WHEN NOT MATCHED THEN 
    INSERT ([TenantId], [Id], [Name])
    VALUES (source.TenantID, source.[Id], source.[Name]);
-- END RequesterType

-- BEGIN ProductSubcategory
MERGE [dbo].[ProductSubcategory] AS target
USING (
	SELECT $(TenantId),1, 1, N'Mountain Bikes' UNION
	SELECT $(TenantId),2, 1, N'Road Bikes' UNION
	SELECT $(TenantId),3, 1, N'Touring Bikes' UNION
	SELECT $(TenantId),4, 2, N'Handlebars' UNION
	SELECT $(TenantId),5, 2, N'Bottom Brackets' UNION
	SELECT $(TenantId),6, 2, N'Brakes' UNION
	SELECT $(TenantId),7, 2, N'Chains' UNION
	SELECT $(TenantId),8, 2, N'Cranksets' UNION
	SELECT $(TenantId),9, 2, N'Derailleurs' UNION
	SELECT $(TenantId),10, 2, N'Forks' UNION
	SELECT $(TenantId),11, 2, N'Headsets' UNION
	SELECT $(TenantId),12, 2, N'Mountain Frames' UNION
	SELECT $(TenantId),13, 2, N'Pedals' UNION
	SELECT $(TenantId),14, 2, N'Road Frames' UNION
	SELECT $(TenantId),15, 2, N'Saddles' UNION
	SELECT $(TenantId),16, 2, N'Touring Frames' UNION
	SELECT $(TenantId),17, 2, N'Wheels' UNION
	SELECT $(TenantId),18, 3, N'Bib-Shorts' UNION
	SELECT $(TenantId),19, 3, N'Caps' UNION
	SELECT $(TenantId),20, 3, N'Gloves' UNION
	SELECT $(TenantId),21, 3, N'Jerseys' UNION
	SELECT $(TenantId),22, 3, N'Shorts' UNION
	SELECT $(TenantId),23, 3, N'Socks' UNION
	SELECT $(TenantId),24, 3, N'Tights' UNION
	SELECT $(TenantId),25, 3, N'Vests' UNION
	SELECT $(TenantId),26, 4, N'Bike Racks' UNION
	SELECT $(TenantId),27, 4, N'Bike Stands' UNION
	SELECT $(TenantId),28, 4, N'Bottles and Cages' UNION
	SELECT $(TenantId),29, 4, N'Cleaners' UNION
	SELECT $(TenantId),30, 4, N'Fenders' UNION
	SELECT $(TenantId),31, 4, N'Helmets' UNION
	SELECT $(TenantId),32, 4, N'Hydration Packs' UNION
	SELECT $(TenantId),33, 4, N'Lights' UNION
	SELECT $(TenantId),34, 4, N'Locks' UNION
	SELECT $(TenantId),35, 4, N'Panniers' UNION
	SELECT $(TenantId),36, 4, N'Pumps' UNION
	SELECT $(TenantId),37, 4, N'Tires and Tubes'
    ) AS source ([TenantId], [Id], [ProductCategoryId], [Name])
    ON (target.TenantID = source.TenantID AND target.[Id] = source.[Id])
WHEN MATCHED THEN 
    UPDATE SET [Name] = source.[Name], ModifiedDateTime = getutcdate()
WHEN NOT MATCHED THEN 
    INSERT ([TenantId], [Id], [ProductCategoryId], [Name])
    VALUES (source.TenantID, source.[Id], source.ProductCategoryId, source.Name);
-- END ProductSubCategory



-- BEGIN ProductModel
MERGE [dbo].[ProductModel] AS target
USING (
	SELECT $(TenantId), 1, N'Classic Vest' UNION
SELECT $(TenantId), 1, N'Classic Vest' UNION
SELECT $(TenantId), 2, N'Cycling Cap' UNION
SELECT $(TenantId), 3, N'Full-Finger Gloves' UNION
SELECT $(TenantId), 4, N'Half-Finger Gloves' UNION
SELECT $(TenantId), 5, N'HL Mountain Frame' UNION
SELECT $(TenantId), 6, N'HL Road Frame' UNION
SELECT $(TenantId), 7, N'HL Touring Frame' UNION
SELECT $(TenantId), 8, N'LL Mountain Frame' UNION
SELECT $(TenantId), 9, N'LL Road Frame' UNION
SELECT $(TenantId), 10, N'LL Touring Frame' UNION
SELECT $(TenantId), 11, N'Long-Sleeve Logo Jersey' UNION
SELECT $(TenantId), 12, N'Men''s Bib-Shorts' UNION
SELECT $(TenantId), 13, N'Men''s Sports Shorts' UNION
SELECT $(TenantId), 14, N'ML Mountain Frame' UNION
SELECT $(TenantId), 15, N'ML Mountain Frame-W' UNION
SELECT $(TenantId), 16, N'ML Road Frame' UNION
SELECT $(TenantId), 17, N'ML Road Frame-W' UNION
SELECT $(TenantId), 18, N'Mountain Bike Socks' UNION
SELECT $(TenantId), 19, N'Mountain-100' UNION
SELECT $(TenantId), 20, N'Mountain-200' UNION
SELECT $(TenantId), 21, N'Mountain-300' UNION
SELECT $(TenantId), 22, N'Mountain-400-W' UNION
SELECT $(TenantId), 23, N'Mountain-500' UNION
SELECT $(TenantId), 24, N'Racing Socks' UNION
SELECT $(TenantId), 25, N'Road-150' UNION
SELECT $(TenantId), 26, N'Road-250' UNION
SELECT $(TenantId), 27, N'Road-350-W' UNION
SELECT $(TenantId), 28, N'Road-450' UNION
SELECT $(TenantId), 29, N'Road-550-W' UNION
SELECT $(TenantId), 30, N'Road-650' UNION
SELECT $(TenantId), 31, N'Road-750' UNION
SELECT $(TenantId), 32, N'Short-Sleeve Classic Jersey' UNION
SELECT $(TenantId), 33, N'Sport-100' UNION
SELECT $(TenantId), 34, N'Touring-1000' UNION
SELECT $(TenantId), 35, N'Touring-2000' UNION
SELECT $(TenantId), 36, N'Touring-3000' UNION
SELECT $(TenantId), 37, N'Women''s Mountain Shorts' UNION
SELECT $(TenantId), 38, N'Women''s Tights' UNION
SELECT $(TenantId), 39, N'Mountain-400' UNION
SELECT $(TenantId), 40, N'Road-550' UNION
SELECT $(TenantId), 41, N'Road-350' UNION
SELECT $(TenantId), 42, N'LL Mountain Front Wheel' UNION
SELECT $(TenantId), 43, N'Touring Rear Wheel' UNION
SELECT $(TenantId), 44, N'Touring Front Wheel' UNION
SELECT $(TenantId), 45, N'ML Mountain Front Wheel' UNION
SELECT $(TenantId), 46, N'HL Mountain Front Wheel' UNION
SELECT $(TenantId), 47, N'LL Touring Handlebars' UNION
SELECT $(TenantId), 48, N'HL Touring Handlebars' UNION
SELECT $(TenantId), 49, N'LL Road Front Wheel' UNION
SELECT $(TenantId), 50, N'ML Road Front Wheel' UNION
SELECT $(TenantId), 51, N'HL Road Front Wheel' UNION
SELECT $(TenantId), 52, N'LL Mountain Handlebars' UNION
SELECT $(TenantId), 53, N'Touring Pedal' UNION
SELECT $(TenantId), 54, N'ML Mountain Handlebars' UNION
SELECT $(TenantId), 55, N'HL Mountain Handlebars' UNION
SELECT $(TenantId), 56, N'LL Road Handlebars' UNION
SELECT $(TenantId), 57, N'ML Road Handlebars' UNION
SELECT $(TenantId), 58, N'HL Road Handlebars' UNION
SELECT $(TenantId), 59, N'LL Headset' UNION
SELECT $(TenantId), 60, N'ML Headset' UNION
SELECT $(TenantId), 61, N'HL Headset' UNION
SELECT $(TenantId), 62, N'LL Mountain Pedal' UNION
SELECT $(TenantId), 63, N'ML Mountain Pedal' UNION
SELECT $(TenantId), 64, N'HL Mountain Pedal' UNION
SELECT $(TenantId), 65, N'ML Touring Seat/Saddle' UNION
SELECT $(TenantId), 66, N'LL Touring Seat/Saddle' UNION
SELECT $(TenantId), 67, N'HL Touring Seat/Saddle' UNION
SELECT $(TenantId), 68, N'LL Road Pedal' UNION
SELECT $(TenantId), 69, N'ML Road Pedal' UNION
SELECT $(TenantId), 70, N'HL Road Pedal' UNION
SELECT $(TenantId), 71, N'LL Mountain Seat/Saddle 1' UNION
SELECT $(TenantId), 72, N'ML Mountain Seat/Saddle 1' UNION
SELECT $(TenantId), 73, N'HL Mountain Seat/Saddle 1' UNION
SELECT $(TenantId), 74, N'LL Road Seat/Saddle 2' UNION
SELECT $(TenantId), 75, N'ML Road Seat/Saddle 1' UNION
SELECT $(TenantId), 76, N'HL Road Seat/Saddle 1' UNION
SELECT $(TenantId), 77, N'ML Road Rear Wheel' UNION
SELECT $(TenantId), 78, N'HL Road Rear Wheel' UNION
SELECT $(TenantId), 79, N'LL Mountain Seat/Saddle 2' UNION
SELECT $(TenantId), 80, N'ML Mountain Seat/Saddle 2' UNION
SELECT $(TenantId), 81, N'HL Mountain Seat/Saddle 2' UNION
SELECT $(TenantId), 82, N'LL Road Seat/Saddle 1' UNION
SELECT $(TenantId), 83, N'ML Road Seat/Saddle 2' UNION
SELECT $(TenantId), 84, N'HL Road Seat/Saddle 2' UNION
SELECT $(TenantId), 85, N'LL Mountain Tire' UNION
SELECT $(TenantId), 86, N'ML Mountain Tire' UNION
SELECT $(TenantId), 87, N'HL Mountain Tire' UNION
SELECT $(TenantId), 88, N'LL Road Tire' UNION
SELECT $(TenantId), 89, N'ML Road Tire' UNION
SELECT $(TenantId), 90, N'HL Road Tire' UNION
SELECT $(TenantId), 91, N'Touring Tire' UNION
SELECT $(TenantId), 92, N'Mountain Tire Tube' UNION
SELECT $(TenantId), 93, N'Road Tire Tube' UNION
SELECT $(TenantId), 94, N'Touring Tire Tube' UNION
SELECT $(TenantId), 95, N'LL Bottom Bracket' UNION
SELECT $(TenantId), 96, N'ML Bottom Bracket' UNION
SELECT $(TenantId), 97, N'HL Bottom Bracket' UNION
SELECT $(TenantId), 98, N'Chain' UNION
SELECT $(TenantId), 99, N'LL Crankset' UNION
SELECT $(TenantId), 100, N'ML Crankset' UNION
SELECT $(TenantId), 101, N'HL Crankset' UNION
SELECT $(TenantId), 102, N'Front Brakes' UNION
SELECT $(TenantId), 103, N'Front Derailleur' UNION
SELECT $(TenantId), 104, N'LL Fork' UNION
SELECT $(TenantId), 105, N'ML Fork' UNION
SELECT $(TenantId), 106, N'HL Fork' UNION
SELECT $(TenantId), 107, N'Hydration Pack' UNION
SELECT $(TenantId), 108, N'Taillight' UNION
SELECT $(TenantId), 109, N'Headlights - Dual-Beam' UNION
SELECT $(TenantId), 110, N'Headlights - Weatherproof' UNION
SELECT $(TenantId), 111, N'Water Bottle' UNION
SELECT $(TenantId), 112, N'Mountain Bottle Cage' UNION
SELECT $(TenantId), 113, N'Road Bottle Cage' UNION
SELECT $(TenantId), 114, N'Patch kit' UNION
SELECT $(TenantId), 115, N'Cable Lock' UNION
SELECT $(TenantId), 116, N'Minipump' UNION
SELECT $(TenantId), 117, N'Mountain Pump' UNION
SELECT $(TenantId), 118, N'Hitch Rack - 4-Bike' UNION
SELECT $(TenantId), 119, N'Bike Wash' UNION
SELECT $(TenantId), 120, N'Touring-Panniers' UNION
SELECT $(TenantId), 121, N'Fender Set - Mountain' UNION
SELECT $(TenantId), 122, N'All-Purpose Bike Stand' UNION
SELECT $(TenantId), 123, N'LL Mountain Rear Wheel' UNION
SELECT $(TenantId), 124, N'ML Mountain Rear Wheel' UNION
SELECT $(TenantId), 125, N'HL Mountain Rear Wheel' UNION
SELECT $(TenantId), 126, N'LL Road Rear Wheel' UNION
SELECT $(TenantId), 127, N'Rear Derailleur' UNION
SELECT $(TenantId), 128, N'Rear Brakes'
    ) AS source ([TenantId], [Id], [Name])
    ON (target.TenantID = source.TenantID AND target.[Id] = source.[Id])
WHEN MATCHED THEN 
    UPDATE SET [Name] = source.[Name]
WHEN NOT MATCHED THEN 
    INSERT ([TenantId], [Id], [Name])
    VALUES (source.TenantID, source.[Id], source.Name);



--Dictionary:
