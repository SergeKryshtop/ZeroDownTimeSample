﻿CREATE TABLE [dbo].[Order]
(
	[TenantId] BIGINT NOT NULL,
    [Id] BIGINT NOT NULL,
	CONSTRAINT PK__Order PRIMARY KEY CLUSTERED(TenantId ASC, Id ASC)

)
