--- create database and bronze, silver, gold and etl schemas
USE master;
GO

IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'olist_dwh')
BEGIN
    CREATE DATABASE olist_dwh;
END
GO

USE olist_dwh;
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'bronze')
    EXEC('CREATE SCHEMA bronze');
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'silver')
    EXEC('CREATE SCHEMA silver');

GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'gold')
    EXEC('CREATE SCHEMA gold');
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'etl')
    EXEC('CREATE SCHEMA etl');
GO

--- checking if all schemas are there
SELECT name FROM sys.schemas
WHERE name IN ('bronze', 'silver', 'gold', 'etl');



