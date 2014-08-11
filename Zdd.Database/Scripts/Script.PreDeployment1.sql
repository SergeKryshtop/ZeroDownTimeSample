/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


--Reading SqlCmd variables
:r .\SqlCmdVariables.sql

--Reading variables
:r .\ScriptVariables.sql

--Reading current database version
:r .\Version.sql


--Checking table existance
IF OBJECT_ID(N'DatabaseUpdateLog') IS NOT NULL AND @TenantDatabaseVersion<>'1'
BEGIN
INSERT INTO dbo.DatabaseUpdateLog (TenantId, FromVersion, ToVersion, UpdateStartTime)
VALUES ($(TenantId),@TenantDatabaseVersion,@CurrentDatabaseVersion,@CurrentTime)
END


--Do pre deployment updates for backward compatibility
:r .\BackwardCompatibility.PreDeployment.sql