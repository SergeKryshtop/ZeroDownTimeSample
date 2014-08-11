CREATE TABLE [dbo].[OrderItem]
(
	[TenantId] BIGINT NOT NULL,
	[Id] BIGINT NOT NULL,
    [OrderId] BIGINT NOT NULL,
    [ProductId]  BIGINT NOT NULL,
    [OrderQty] decimal(18,2) NOT NULL,
	[UnitPrice] money NOT NULL,
	[LineTotal] AS (isnull([OrderQty]*[UnitPrice],(0.00))),
    [Sent] bit NULL,
	[Received] bit NULL,
	[Rejected] bit NULL,
	CONSTRAINT PK__OrderItem PRIMARY KEY CLUSTERED(TenantId, Id),
	CONSTRAINT UQ__OrderItem UNIQUE (TenantId, OrderId, ProductId),
    CONSTRAINT FK__OrderItem__Order FOREIGN KEY(TenantId, OrderId) REFERENCES dbo.[Order](TenantId, Id) 
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK__OrderItem__Product FOREIGN KEY(TenantId, ProductId) REFERENCES dbo.[Product](TenantId, Id) 
        ON DELETE NO ACTION ON UPDATE NO ACTION


)
