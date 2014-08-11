/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

--Login and user creating
:r .\SqlLogins.sql

--Reading variables
:r .\ScriptVariables.sql

--Reading current database version
:r .\Version.sql


--Adding dictionary data
:r .\Dictionary.sql

--Do post deployment updates for backward compatibility
:r .\BackwardCompatibility.PostDeployment.sql

--Add indexes
:r .\Indexes.sql

--Delete deprecated objects
:r .\DeprecatedObjects.sql

--Update database objects table
:r .\UpdateDatabaseObjects.sql

--Updating database version
:r .\UpdateDatabaseVersion.sql

