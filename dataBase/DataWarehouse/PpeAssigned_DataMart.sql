/******************************************************************************
*  Nombre: schema for personal protection equipment datamart of system the "martillazo.SRL"
*  Descripcion: add sentences to create tables for all Entities of datamart
*
*  Autor: Walker Colina
*
*  Fecha: 05/30/2018
******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               -------------------------------------
 05/30/2018    Walker Colina             - Initial version
 05/30/2018    Walker Colina             - Added ETL tables
******************************************************************************/

USE [ssiA_DW];
GO

IF NOT EXISTS (SELECT name 
			   FROM sys.schemas 
			   WHERE name = N'PPE')
BEGIN
  EXEC ('CREATE SCHEMA [PPE] AUTHORIZATION [dbo]')
END
GO

IF NOT EXISTS (SELECT name 
			   FROM sys.schemas 
			   WHERE name = N'ETL')
BEGIN
  EXEC ('CREATE SCHEMA [ETL] AUTHORIZATION [dbo]')
END
GO

-- Create Dim_Time on schema PPE
IF NOT EXISTS (SELECT *
			   FROM sys.objects
			   WHERE Type = 'U'
			   AND object_id = OBJECT_ID('PPE.Dim_Time')
)
BEGIN
  CREATE TABLE [PPE].[Dim_Time](
	[DimTimeID] INT IDENTITY(1,1)
	,[FullDate] DATETIME NULL
	,[DateName] CHAR(11) NULL
	,[DateNameUS] CHAR(11) NULL   --US Date FORMAT, MM/DD/YYYY
	,[DateNameEU] CHAR(11) NULL   --European Union Date Format DD/MM/YYYY
	,[DayOfWeek] TINYINT NULL
	,[DayNameOfWeek] CHAR(10) NULL
	,[DayOfMonth] TINYINT NULL
	,[DayOfYear] SMALLINT NULL
	,[WeekdayWeekend] CHAR(7) NULL
	,[WeekOfYear] TINYINT NULL
	,[MonthName] CHAR(10) NULL
	,[MonthOfYear] TINYINT NULL
	,[IsLastDayOfMonth] CHAR(1) NULL
	,[CalendarQuarter] TINYINT NULL
	,[CalendarYear] SMALLINT NULL
	,[CalendarYearMonth] CHAR(7) NULL
	,[CalendarYearQtr] CHAR(7) NULL
	,[FiscalMonthOfYear] TINYINT NULL
	,[FiscalQuarter] TINYINT NULL
	,[FiscalYear] INT NULL
	,[FiscalYearMonth] CHAR(9) NULL
	,[FiscalYearQtr] CHAR(8) NULL
	,CONSTRAINT [PK_DimTime] PRIMARY KEY CLUSTERED 
    (
	  [DimTimeID] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
  ) ON [PRIMARY]
    		
  PRINT 'Table PPE.Dim_Time created!';
END
ELSE
 BEGIN
  PRINT 'Table PPE.Dim_Time already exists into the database for schema PPE';
 END
GO

-- Create Dim_Employees on schema PPE
IF NOT EXISTS (SELECT *
			   FROM sys.objects
			   WHERE Type = 'U'
			   AND object_id = OBJECT_ID('PPE.Dim_Employees')
)
BEGIN
  CREATE TABLE [PPE].[Dim_Employees](
	[EmployeeID] INT NOT NULL
	,[FullName] VARCHAR(150) NOT NULL
	,[DateOfBirth] DATE NOT NULL
	,[Gender] CHAR(1) NOT NULL
	,[Role] VARCHAR(100) NOT NULL
	,CONSTRAINT [PK_DimEmployees] PRIMARY KEY CLUSTERED 
	(
		[EmployeeID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
  ) ON [PRIMARY]

  PRINT 'Table PPE.Dim_Employees created!';
 	  
END
ELSE
 BEGIN
  PRINT 'Table PPE.Dim_Employees already exists into the database for schema PPE';
 END
GO

-- Create Dim_Departments on schema PPE
IF NOT EXISTS (SELECT *
			   FROM sys.objects
			   WHERE Type = 'U'
			   AND object_id = OBJECT_ID('PPE.Dim_Departments')
)
BEGIN
  CREATE TABLE [PPE].[Dim_Departments](
	[DepartmentID] INT NOT NULL
	,[DepartmentName] VARCHAR(100) 
	,CONSTRAINT [PK_DimDepartments] PRIMARY KEY CLUSTERED 
	(
		[DepartmentID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
  ) ON [PRIMARY]

  PRINT 'Table PPE.Dim_Departments created!';
 		  
END
ELSE
 BEGIN
  PRINT 'Table PPE.Dim_Departments already exists into the database for schema PPE';
 END
GO

-- Create Dim_Ppes on schema PPE
IF NOT EXISTS (SELECT *
			   FROM sys.objects
			   WHERE Type = 'U'
			   AND object_id = OBJECT_ID('PPE.Dim_Ppes')
)
BEGIN
  CREATE TABLE [PPE].[Dim_Ppes](
	[ExistingPpeID] INT NOT NULL
	,[ExistingPpeDetail] VARCHAR(200) NOT NULL
	,[PpeName] VARCHAR(100) NOT NULL
	,[PpeClassification] VARCHAR(100) NOT NULL
	,CONSTRAINT [PK_DimPpes] PRIMARY KEY CLUSTERED 
    (
		[ExistingPpeID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
  ) ON [PRIMARY]

  PRINT 'Table PPE.Dim_Ppes created!';		  
	
END
ELSE
 BEGIN
  PRINT 'Table PPE.Dim_Ppes already exists into the database for schema PPE';
 END
GO

-- Create Fact_PpeAssigned
IF NOT EXISTS (SELECT *
			   FROM sys.objects
			   WHERE Type = 'U'
			   AND object_id = OBJECT_ID('PPE.Fact_PpeAssigned')
)
BEGIN
  CREATE TABLE [PPE].[Fact_PpeAssigned](
	[EmployeeID] INT NOT NULL
	,[DepartmentID] INT NOT NULL
	,[PpesID] INT NOT NULL
	,[DimTimeID] INT NOT NULL
	,quantity INT NOT NULL
	,CONSTRAINT [PK_FactPpeAssigned] PRIMARY KEY CLUSTERED 
	(
		[EmployeeID] ASC,
		[DepartmentID] ASC,
		[PpesID] ASC,
		[DimTimeID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
  ) ON [PRIMARY]
  PRINT 'Table PPE.Fact_PpeAssigned created!';
	
END
ELSE
 BEGIN
  PRINT 'Table PPE.Fact_PpeAssigned already exists into the database for schema PPE';
 END
GO

-- Create Employees on schema ETL
IF NOT EXISTS (SELECT *
			   FROM sys.objects
			   WHERE Type = 'U'
			   AND object_id = OBJECT_ID('ETL.Employees')
)
BEGIN
  CREATE TABLE [ETL].[Employees](
	[EmployeeID] INT NOT NULL
	,[FullName] VARCHAR(150) NOT NULL
	,[DateOfBirth] DATE NOT NULL
	,[Gender] CHAR(1) NOT NULL
	,[Role] VARCHAR(100) NOT NULL
  ) ON [PRIMARY]

  PRINT 'Table ETL.Employees created!';
 	  
END
ELSE
 BEGIN
  PRINT 'Table ETL.Employees already exists into the database for schema ETL';
 END
GO

-- Create Departments on schema ETL
IF NOT EXISTS (SELECT *
			   FROM sys.objects
			   WHERE Type = 'U'
			   AND object_id = OBJECT_ID('ETL.Departments')
)
BEGIN
  CREATE TABLE [ETL].[Departments](
	[DepartmentID] INT NOT NULL
	,[DepartmentName] VARCHAR(100) 
  ) ON [PRIMARY]

  PRINT 'Table ETL.Departments created!';
 		  
END
ELSE
 BEGIN
  PRINT 'Table ETL.Departments already exists into the database for schema ETL';
 END
GO

-- Create Ppes on schema ETL
IF NOT EXISTS (SELECT *
			   FROM sys.objects
			   WHERE Type = 'U'
			   AND object_id = OBJECT_ID('ETL.Ppes')
)
BEGIN
  CREATE TABLE [ETL].[Ppes](
	[ExistingPpeID] INT NOT NULL
	,[ExistingPpeDetail] VARCHAR(200) NOT NULL
	,[PpeName] VARCHAR(100) NOT NULL
	,[PpeClassification] VARCHAR(100) NOT NULL
  ) ON [PRIMARY]

  PRINT 'Table ETL.Ppes created!';		  
	
END
ELSE
 BEGIN
  PRINT 'Table ETL.Ppes already exists into the database for schema ETL';
 END
GO

-- Create PpeAssigned
IF NOT EXISTS (SELECT *
			   FROM sys.objects
			   WHERE Type = 'U'
			   AND object_id = OBJECT_ID('ETL.PpeAssigned')
)
BEGIN
  CREATE TABLE [ETL].[PpeAssigned](
	[EmployeeID] INT NOT NULL
	,[DepartmentID] INT NOT NULL
	,[PpesID] INT NOT NULL
	,[DimTimeID] INT NOT NULL
	,quantity INT NOT NULL
  ) ON [PRIMARY]
  PRINT 'Table ETL.PpeAssigned created!';
	
END
ELSE
 BEGIN
  PRINT 'Table ETL.PpeAssigned already exists into the database for schema ETL';
 END
GO


IF NOT EXISTS (SELECT * 
    FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME='FK_DimEmployee')
BEGIN
  ALTER TABLE [PPE].[Fact_PpeAssigned] WITH CHECK ADD CONSTRAINT [FK_DimEmployee] FOREIGN KEY(EmployeeID)
  REFERENCES [PPE].[Dim_Employees](EmployeeID)
END
ELSE
BEGIN
	PRINT 'REFERENTIAL CONSTRAINT FK_DimEmployee  already exists into the database';
END
GO

IF NOT EXISTS (SELECT * 
    FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME='FK_DimDepartments')
BEGIN
	ALTER TABLE [PPE].[Fact_PpeAssigned] WITH CHECK ADD CONSTRAINT [FK_DimDepartments] FOREIGN KEY (DepartmentID) 
	REFERENCES [PPE].[Dim_Departments](DepartmentID)
END
ELSE
BEGIN
	PRINT 'REFERENTIAL CONSTRAINT FK_DimDepartments  already exists into the database';
END
GO

IF NOT EXISTS (SELECT * 
    FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME='FK_DimPpes')
BEGIN
	ALTER TABLE [PPE].[Fact_PpeAssigned] WITH CHECK ADD CONSTRAINT [FK_DimPpes] FOREIGN KEY (PpesID) 
	REFERENCES [PPE].[Dim_Ppes](ExistingPpeID)
END
ELSE
BEGIN
	PRINT 'REFERENTIAL CONSTRAINT FK_DimPpes already exists into the database';
END
GO

IF NOT EXISTS (SELECT * 
    FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME='FK_DimTime')
BEGIN
	ALTER TABLE [PPE].[Fact_PpeAssigned] WITH CHECK ADD CONSTRAINT [FK_DimTime] FOREIGN KEY (DimTimeID) 
	REFERENCES [PPE].[Dim_Time](DimTimeID)	
END
ELSE
BEGIN
	PRINT 'REFERENTIAL CONSTRAINT FK_DimTime already exists into the database';
END
GO
