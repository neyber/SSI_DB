/******************************************************************************
*  Nombre: schema for accidents datamart of system the "martillazo.SRL"
*  Descripcion: add sentences to create tables for all Entities of datamart
*
*  Autor: Neyber Rojas
*
*  Fecha: 05/29/2018
******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               -------------------------------------
 05/29/2018    Neyber Rojas              - Initial version
******************************************************************************/

USE ssiA_DW;

IF NOT EXISTS (SELECT name 
							 FROM sys.schemas 
							 WHERE name = N'ACC')
BEGIN
    EXEC ('CREATE SCHEMA [ACC] AUTHORIZATION [dbo]')
END
GO

-- Create Dim_Time
IF NOT EXISTS (SELECT *
							 FROM sys.objects
							 WHERE Type = 'U'
							 AND object_id = OBJECT_ID('ACC.Dim_Time')
)
BEGIN
	CREATE TABLE ACC.Dim_Time(
					 idDimTime INT IDENTITY(1,1) CONSTRAINT PK_DepartmentId PRIMARY KEY (idDimTime)
	        ,hour VARCHAR(10) CONSTRAINT NN_hour NOT NULL
					,day VARCHAR(20) CONSTRAINT NN_day NOT NULL
					,week_number INT CONSTRAINT NN_week_number NOT NULL
					,week_month INT CONSTRAINT NN_week_month NOT NULL
					,week_year INT CONSTRAINT NN_week_year NOT NULL
					,month VARCHAR(20) CONSTRAINT NN_month NOT NULL
					,month_year_number INT CONSTRAINT NN_month_year_number NOT NULL
					,trimester INT CONSTRAINT NN_trimester NOT NULL
					,semester INT CONSTRAINT NN_semester NOT NULL
					,year INT  CONSTRAINT NN_year NOT NULL
	);
	
	PRINT 'Table ACC.Dim_Time created!';
END
ELSE
 BEGIN
  PRINT 'Table ACC.Dim_Time already exists into the database';
 END
GO

-- Create Dim_Employees
IF NOT EXISTS (SELECT *
							 FROM sys.objects
							 WHERE Type = 'U'
							 AND object_id = OBJECT_ID('ACC.Dim_Employees')
)
BEGIN
	CREATE TABLE ACC.Dim_Employees(
					 idDimEmployee INT IDENTITY(1,1) CONSTRAINT PK_idDimEmployee PRIMARY KEY (idDimEmployee)
				  ,idEmployee INT CONSTRAINT NN_idEmployee NOT NULL
	        ,firstName VARCHAR(50) CONSTRAINT NN_firstName NOT NULL
					,lastName VARCHAR(50) CONSTRAINT NN_lastName NOT NULL
					,dateOfBirth DATE CONSTRAINT NN_dateOfBirth NOT NULL
					,gender CHAR(1) CONSTRAINT NN_gender NOT NULL
					,department VARCHAR(100) CONSTRAINT NN_department NOT NULL
					,role VARCHAR(100) CONSTRAINT NN_role NOT NULL
					,saType VARCHAR(100) CONSTRAINT NN_saType NOT NULL
					,totalDaysOutOfWork INT CONSTRAINT NN_totalDaysOutOfWork NOT NULL
	);
	
	PRINT 'Table ACC.Dim_Employees created!';
END
ELSE
 BEGIN
  PRINT 'Table ACC.Dim_Employees already exists into the database';
 END
GO

-- Create Dim_Employees
IF NOT EXISTS (SELECT *
							 FROM sys.objects
							 WHERE Type = 'U'
							 AND object_id = OBJECT_ID('ACC.Dim_Employees')
)
BEGIN
	CREATE TABLE ACC.Dim_Employees(
					 idDimEmployee INT IDENTITY(1,1) CONSTRAINT PK_idDimEmployee PRIMARY KEY (idDimEmployee)
				  ,idEmployee INT CONSTRAINT NN_idEmployee NOT NULL
	        ,firstName VARCHAR(50) CONSTRAINT NN_firstName NOT NULL
					,lastName VARCHAR(50) CONSTRAINT NN_lastName NOT NULL
					,dateOfBirth DATE CONSTRAINT NN_dateOfBirth NOT NULL
					,gender CHAR(1) CONSTRAINT NN_gender NOT NULL
					,department VARCHAR(100) CONSTRAINT NN_department NOT NULL
					,role VARCHAR(100) CONSTRAINT NN_role NOT NULL
					,saType VARCHAR(100) CONSTRAINT NN_saType NOT NULL
					,totalDaysOutOfWork INT CONSTRAINT NN_totalDaysOutOfWork NOT NULL
	);
	
	PRINT 'Table ACC.Dim_Employees created!';
END
ELSE
 BEGIN
  PRINT 'Table ACC.Dim_Employees already exists into the database';
 END
GO

-- Create Dim_Departments
IF NOT EXISTS (SELECT *
							 FROM sys.objects
							 WHERE Type = 'U'
							 AND object_id = OBJECT_ID('ACC.Dim_Departments')
)
BEGIN
	CREATE TABLE ACC.Dim_Departments(
					 idDimDepartment INT IDENTITY(1,1) CONSTRAINT PK_idDimDepartment PRIMARY KEY (idDimDepartment)
				  ,idDepartment INT CONSTRAINT NN_idDepartment NOT NULL
	        ,departmentName VARCHAR(100) CONSTRAINT NN_departmentName NOT NULL
	);
	
	PRINT 'Table ACC.Dim_Departments created!';
END
ELSE
 BEGIN
  PRINT 'Table ACC.Dim_Departments already exists into the database';
 END
GO

-- Create Fact_Accident
IF NOT EXISTS (SELECT *
							 FROM sys.objects
							 WHERE Type = 'U'
							 AND object_id = OBJECT_ID('ACC.Fact_Accident')
)
BEGIN
	CREATE TABLE ACC.Fact_Accident(
						idFactAccident INT IDENTITY(1,1) CONSTRAINT PK_idFactAccident PRIMARY KEY (idFactAccident)
					 ,idDimEmployee INT CONSTRAINT FK_Fact_Dim_Employees FOREIGN KEY (idDimEmployee) REFERENCES ACC.Dim_Employees(idDimEmployee)
					 ,idDimDepartment INT CONSTRAINT FK_Fact_Dim_Departments FOREIGN KEY (idDimDepartment) REFERENCES ACC.Dim_Departments(idDimDepartment)
					 ,idDimTime INT CONSTRAINT FK_Fact_Dim_Time FOREIGN KEY (idDimTime) REFERENCES ACC.Dim_Time(idDimTime)
					 ,quantity INT CONSTRAINT NN_quantity NOT NULL
	);
	
	PRINT 'Table ACC.Fact_Accident created!';
END
ELSE
 BEGIN
  PRINT 'Table ACC.Fact_Accident already exists into the database';
 END
GO