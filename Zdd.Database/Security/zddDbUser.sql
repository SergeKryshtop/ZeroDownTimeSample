﻿CREATE USER [zddDbUser]
	FOR LOGIN [zddDbUser]
	WITH DEFAULT_SCHEMA = dbo

GO

GRANT CONNECT TO [zddDbUser];
GO
ALTER ROLE [db_owner] ADD MEMBER [zddDbUser]
