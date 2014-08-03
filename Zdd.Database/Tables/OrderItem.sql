CREATE TABLE [dbo].[OrderItem]
(
    [OrderId] BIGINT NOT NULL,
    [ProductId]  INT NOT NULL,
    [Quatity] int NOT NULL,
    
    CONSTRAINT PK__OrderItem PRIMARY KEY CLUSTERED (OrderId, ProductId),
    CONSTRAINT FK__OrderItem__Order FOREIGN KEY(OrderId) REFERENCES dbo.[Order](Id) 
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK__OrderItem__Product FOREIGN KEY(ProductId) REFERENCES dbo.[Product](Id) 
        ON DELETE NO ACTION ON UPDATE NO ACTION


)
