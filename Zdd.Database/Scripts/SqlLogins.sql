USE master
GO
--Create AnGAdmin login 
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = '$(DefaultAnGAdminLogin)')
BEGIN
    BEGIN TRY
    CREATE LOGIN [$(DefaultAnGAdminLogin)] FROM WINDOWS
    END TRY
    BEGIN CATCH
    END CATCH
END
GO
--Create AnGTenant login
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = '$(DefaultAnGTenantLogin)')
BEGIN
    BEGIN TRY
    CREATE LOGIN [$(DefaultAnGTenantLogin)] FROM WINDOWS
    END TRY
    BEGIN CATCH
    END CATCH
END
GO
--Add sysadmin role to AnGAdmin login 
IF EXISTS (SELECT 1 FROM sys.server_principals WHERE name = '$(DefaultAnGAdminLogin)')
ALTER SERVER ROLE [sysadmin] ADD MEMBER [$(DefaultAnGAdminLogin)]
GO
USE $(DatabaseName)
GO
--Create database user for AnGTenant login
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'$(DefaultAnGTenantLogin)' AND TYPE = 'U')
BEGIN
    BEGIN TRY
    CREATE USER [$(DefaultAnGTenantLogin)] FOR LOGIN [$(DefaultAnGTenantLogin)] WITH DEFAULT_SCHEMA=dbo
    END TRY
    BEGIN CATCH
    END CATCH   
END
GO
--Add AnGTenantRole role to AnGTenant database user 
IF EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'AnGTenantRole' AND TYPE = 'R')
BEGIN
    BEGIN TRY
    ALTER ROLE AnGTenantRole ADD MEMBER [$(DefaultAnGTenantLogin)]
    END TRY
    BEGIN CATCH
    END CATCH   
END