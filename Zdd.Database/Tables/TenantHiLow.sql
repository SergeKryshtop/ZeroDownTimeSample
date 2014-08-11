CREATE TABLE [dbo].[TenantHiLow]
(
    [Order] BIGINT,
    [Product] BIGINT,
    [ProductModel] BIGINT,
);
GO
ALTER TABLE [dbo].[TenantHiLow] ADD 
    CONSTRAINT [DF__TenantHiLow_Product] DEFAULT 1 FOR [Product]
GO
ALTER TABLE [dbo].[TenantHiLow] ADD 
    CONSTRAINT [DF__TenantHiLow_ProductModel] DEFAULT 1 FOR [ProductModel]
GO

ALTER TABLE [dbo].[TenantHiLow] ADD 
    CONSTRAINT [Df__Product_Order] DEFAULT 1 FOR [Order]
GO