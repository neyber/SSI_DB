/******************************************************************************
*  Nombre: schema for system the "martillazo.SRL"
*  Descripcion: add sentences to create tables for all Entities of our system
*
*  Autor: Henry Bustamante
*
*  Fecha: 05/24/2018
******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               ---------------------------------------------------
 05/24/2018    Henry Bustamante C.       - Initial version
 05/24/2018    Marcelo Loayza            - Added: Department, Role, Employee, Function Manual, Audit, SafetyRule, FileDocument, ExistingWorkItemAssigned
 05/28/2018    Miguel Abdon Rojas C.     - fix of schema to load "SSI(Industrial Security System) application" from data base already created
                                         - fixed properties: field names, field definitions, invalid constraints, field NULL values
 05/28/2018    Henry Bustamante C.       - I have updated schema in order to add audit columns as createdBy and mofidiedBy and only createdBy will have a default value as 0
 05/30/2018    Henry Bustamante C.       - I have updated schema in order to increase columns size for descriptions columns
******************************************************************************/
IF EXISTS(SELECT * FROM DBO.SYSDATABASES WHERE NAME = N'ssiA')
    BEGIN
             USE MASTER;
             DROP DATABASE ssiA;
    END
   CREATE DATABASE ssiA;


USE ssiA;
GO

-- Create Department

IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.Department')
)
BEGIN
	CREATE TABLE Department(id INT IDENTITY(1,1) NOT NULL
	        ,name VARCHAR(200) NOT NULL
					,createdOn DATETIME NOT NULL
					,updatedOn DATETIME NOT NULL
					,isDeleted BIT
					,version BIGINT DEFAULT 1
					, createdBy INT DEFAULT 0 NOT NULL
					, updatedBy INT
					,description VARCHAR(1000) NOT NULL

					CONSTRAINT PK_DepartmentId PRIMARY KEY (id)
	);
	ALTER TABLE [dbo].[Department] ADD CONSTRAINT [DF_Department_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [CreatedOn];
	ALTER TABLE [dbo].[Department] ADD CONSTRAINT [DF_Department_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [UpdatedOn];
  ALTER TABLE [dbo].[Department] ADD CONSTRAINT [DF_Department_IsDeleted]  DEFAULT (0) FOR [IsDeleted]

	PRINT 'Table Department created!';
END
ELSE
 BEGIN
  PRINT 'Table Department already exists into the database';
 END
GO

-- Create Role

IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.Role')
)
BEGIN
	CREATE TABLE Role(id INT IDENTITY(1,1) NOT NULL
				,createdOn DATETIME NOT NULL
				,updatedOn DATETIME NOT NULL
                ,isDeleted BIT
                ,version BIGINT DEFAULT 1
                , createdBy INT DEFAULT 0 NOT NULL
					      , updatedBy INT
				,description VARCHAR(1000) NOT NULL
				,name VARCHAR(50) NOT NULL

	CONSTRAINT PK_RoleId PRIMARY KEY (id)
	);
	ALTER TABLE [dbo].[Role] ADD CONSTRAINT [DF_Role_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [CreatedOn];
	ALTER TABLE [dbo].[Role] ADD CONSTRAINT [DF_Role_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [UpdatedOn];
  ALTER TABLE [dbo].[Role] ADD CONSTRAINT [DF_Role_IsDeleted]  DEFAULT (0) FOR [IsDeleted]

	PRINT 'Table Role created!';
END
ELSE
 BEGIN
  PRINT 'Table Role already exists into the database';
 END
GO


-- Create Employee

IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.Employee')
)
BEGIN
	CREATE TABLE Employee(id INT IDENTITY(1,1) NOT NULL
					,createdOn DATETIME NOT NULL
					,updatedOn DATETIME NOT NULL
					,isDeleted BIT
					,version BIGINT DEFAULT 1
					, createdBy INT DEFAULT 0 NOT NULL
					, updatedBy INT
					,dateOfBirth DATE NOT NULL
					,firstName VARCHAR(50) NOT NULL
					,gender CHAR(1) NOT NULL
					,healthConditionStartingAtCompany VARCHAR(100) NOT NULL
					,identificationNumber BIGINT NOT NULL
					,lastName VARCHAR(50) NOT NULL
					,startDateInCompany DATE NOT NULL
					,departmentEmployeeId INT NOT NULL
					,photoFileDocumentId INT
					,RoleEmployeeId INT NOT NULL
					,SupervisorId INT

					CONSTRAINT PK_EmployeeId PRIMARY KEY (id)
	);
	 ALTER TABLE [dbo].[Employee] ADD CONSTRAINT [DF_Employee_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [CreatedOn];
   ALTER TABLE [dbo].[Employee] ADD CONSTRAINT [DF_Employee_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [UpdatedOn];
   ALTER TABLE [dbo].[Employee] ADD CONSTRAINT [DF_Employee_IsDeleted]  DEFAULT (0) FOR [IsDeleted]

	PRINT 'Table Employee created!';
END
ELSE
 BEGIN
  PRINT 'Table Employee already exists into the database';
 END
GO


-- Create Audit

IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.Audit')
)
BEGIN
	CREATE TABLE Audit(id INT IDENTITY(1,1) NOT NULL
				,createdOn DATETIME NOT NULL
				,updatedOn DATETIME NOT NULL
                ,isDeleted BIT
                ,version BIGINT DEFAULT 1
                , createdBy INT DEFAULT 0 NOT NULL
					      , updatedBy INT
				,auditCode VARCHAR(100) NOT NULL
				,auditCriteria VARCHAR(100) NOT NULL
				,auditName VARCHAR(50) NOT NULL
				,auditObjective VARCHAR(100) NOT NULL
				,auditScope VARCHAR(100) NOT NULL
				,auditType VARCHAR(50) NOT NULL
				,employeeId INT NOT NULL
				,periodicity VARCHAR(50) NOT NULL
				,DepartmentId INT NOT NULL

				CONSTRAINT PK_AuditId PRIMARY KEY (id)
	);
	ALTER TABLE [dbo].[Audit] ADD CONSTRAINT [DF_Audit_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [CreatedOn];
	ALTER TABLE [dbo].[Audit] ADD CONSTRAINT [DF_Audit_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [UpdatedOn];
  ALTER TABLE [dbo].[Audit] ADD CONSTRAINT [DF_Audit_IsDeleted]  DEFAULT (0) FOR [IsDeleted]

	PRINT 'Table Audit created!';
END
ELSE
 BEGIN
  PRINT 'Table Audit already exists into the database';
 END
GO


-- Create SafetyRule
IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.SafetyRule')
)
BEGIN
	CREATE TABLE SafetyRule(id INT IDENTITY(1,1) NOT NULL
						,createdOn DATETIME NOT NULL
						,updatedOn DATETIME NOT NULL
						,isDeleted BIT
						,version BIGINT DEFAULT 1
						, createdBy INT DEFAULT 0 NOT NULL
					  , updatedBy INT
						,accomplishment BIT NOT NULL
						,auditId INT NOT NULL
						,complianceMetric INT NOT NULL
						,complianceParameter INT NOT NULL
						,policyCode VARCHAR(100) NOT NULL
						,policyName VARCHAR(100) NOT NULL

						CONSTRAINT PK_SafetyRuleId PRIMARY KEY (id)
	);
	ALTER TABLE [dbo].[SafetyRule] ADD CONSTRAINT [DF_SafetyRule_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [CreatedOn];
	ALTER TABLE [dbo].[SafetyRule] ADD CONSTRAINT [DF_SafetyRule_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [UpdatedOn];
  ALTER TABLE [dbo].[SafetyRule] ADD CONSTRAINT [DF_SafetyRule_IsDeleted]  DEFAULT (0) FOR [IsDeleted]

	PRINT 'Table SafetyRule created!';
END
ELSE
 BEGIN
  PRINT 'Table SafetyRule already exists into the database';
 END
GO


-- Create Function Manual
IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.FunctionManual')
)
BEGIN
	CREATE TABLE FunctionManual(id INT IDENTITY(1,1) NOT NULL
							,createdOn DATETIME NOT NULL
							,updatedOn DATETIME NOT NULL
							,isDeleted BIT
							,version BIGINT DEFAULT 1
							, createdBy INT DEFAULT 0 NOT NULL
					    , updatedBy INT
							,dependentPersonal VARCHAR(200) NOT NULL
							,externalRelation VARCHAR(200) NOT NULL
							,generalActivity VARCHAR(100) NOT NULL
							,hierarchicalLever VARCHAR(50) NOT NULL
							,internalRelation VARCHAR(200) NOT NULL
							,name VARCHAR(50) NOT NULL
							,position VARCHAR(50) NOT NULL
							,principalFunction VARCHAR(100) NOT NULL
							,superiorBoss VARCHAR(50) NOT NULL
							,roleFunctionId INT NOT NULL

							CONSTRAINT PK_FunctionManualId PRIMARY KEY (id)
	);
	ALTER TABLE [dbo].[FunctionManual] ADD CONSTRAINT [DF_FunctionManual_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [CreatedOn];
	ALTER TABLE [dbo].[FunctionManual] ADD CONSTRAINT [DF_FunctionManual_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [UpdatedOn];
    ALTER TABLE [dbo].[FunctionManual] ADD CONSTRAINT [DF_FunctionManual_IsDeleted]  DEFAULT (0) FOR [IsDeleted]

	PRINT 'Table FunctionManual created!';
END
ELSE
 BEGIN
  PRINT 'Table FunctionManual already exists into the database';
 END
GO

-- Create File Document
IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.FileDocument')
)
BEGIN
	CREATE TABLE FileDocument(id INT IDENTITY(1,1) NOT NULL
						,createdOn DATETIME NOT NULL
						,updatedOn DATETIME NOT NULL
						,isDeleted BIT
						,version BIGINT DEFAULT 1
						, createdBy INT DEFAULT 0 NOT NULL
					  , updatedBy INT
						,contentType VARCHAR(50) NOT NULL
						,data VARBINARY(MAX) NOT NULL
						,fileName VARCHAR(50) NOT NULL
						,size BIGINT NOT NULL

						CONSTRAINT PK_FileDocumentId PRIMARY KEY (id)
	);
	ALTER TABLE [dbo].[FileDocument] ADD CONSTRAINT [DF_FileDocument_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [CreatedOn];
	ALTER TABLE [dbo].[FileDocument] ADD CONSTRAINT [DF_FileDocument_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [UpdatedOn];
  ALTER TABLE [dbo].[FileDocument] ADD CONSTRAINT [DF_FileDocument_IsDeleted]  DEFAULT (0) FOR [IsDeleted]

	PRINT 'Table FileDocument created!';
END
ELSE
 BEGIN
  PRINT 'Table FileDocument already exists into the database';
 END
GO


--Create table SaCategory

IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.SaCategory')
)
BEGIN
CREATE TABLE SaCategory (id INT IDENTITY(1,1) NOT NULL
                    , category VARCHAR(50) CONSTRAINT NN_Category NOT NULL
					          , description VARCHAR(1000) CONSTRAINT NN_Description NOT NULL
                    , reference VARCHAR(1000)
                    , createdOn DATETIME NOT NULL
					          , updatedOn DATETIME NOT NULL
                    , isDeleted BIT
                    , version BIGINT DEFAULT 1
                    , createdBy INT DEFAULT 0 NOT NULL
					          , updatedBy INT
                    CONSTRAINT PK_SaCategory PRIMARY KEY(
                        [id]
                    ));

                    ALTER TABLE [dbo].[SaCategory] ADD CONSTRAINT [DF_SaCategory_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [createdOn];
		                ALTER TABLE [dbo].[SaCategory] ADD CONSTRAINT [DF_SaCategory_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [updatedOn];
                    ALTER TABLE [dbo].[SaCategory] ADD CONSTRAINT [DF_SaCategory_IsDeleted]  DEFAULT (0) FOR [isDeleted]
					PRINT 'Table SaCategory created!';
END
ELSE
	BEGIN
		PRINT 'Table SaCategory already exists into the database';
	END
GO

--Create table SaType

IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.SaType')
)
BEGIN
CREATE TABLE SaType (id INT IDENTITY(1,1) NOT NULL
                    , type VARCHAR(200) CONSTRAINT NN_Type NOT NULL
					          , description VARCHAR(1000) CONSTRAINT NN_Description NOT NULL
                    , createdOn DATETIME NOT NULL
					          , updatedOn DATETIME NOT NULL
                    , isDeleted BIT
                    , version BIGINT DEFAULT 1
                    , createdBy INT DEFAULT 0 NOT NULL
					          , updatedBy INT
                    CONSTRAINT PK_SaType PRIMARY KEY(
                        [id]
                    ));

                    ALTER TABLE [dbo].[SaType] ADD CONSTRAINT [DF_SaType_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [createdOn];
		                ALTER TABLE [dbo].[SaType] ADD CONSTRAINT [DF_SaType_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [updatedOn];
                    ALTER TABLE [dbo].[SaType] ADD CONSTRAINT [DF_SaType_IsDeleted]  DEFAULT (0) FOR [isDeleted]
					PRINT 'Table SaType created!';
END
ELSE
	BEGIN
		PRINT 'Table SaType already exists into the database';
	END
GO

--Create table Accident

IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.Accident')
)
BEGIN
CREATE TABLE Accident (id INT IDENTITY(1,1) NOT NULL
					          , description VARCHAR(1000) CONSTRAINT NN_Description NOT NULL
					          , dateAccident DATETIME CONSTRAINT NN_DateAccident NOT NULL
                    , statusRecord BIT CONSTRAINT NN_StatusRecrod DEFAULT 0 NOT NULL
					          , whereOccurr VARCHAR(1000) CONSTRAINT NN_WhereOccurr NOT NULL
					          , totalDaysOutOfWork INT CONSTRAINT NN_TotalDaysOutOfWork NOT NULL
					          , totalDaysRestrictedTransferredWork INT CONSTRAINT NN_TotalDaysRestrictedTrasnferredWork NOT NULL
                    , employeeId INT
                    , saCategoryId INT
                    , saTypeId INT
					          , createdOn DATETIME NOT NULL
					          , updatedOn DATETIME NOT NULL
                    , isDeleted BIT
                    , version BIGINT DEFAULT 1
                    , createdBy INT DEFAULT 0 NOT NULL
					          , updatedBy INT
                    CONSTRAINT PK_Accident PRIMARY KEY(
                        [id]
                    ));

                    ALTER TABLE [dbo].[Accident] ADD CONSTRAINT [DF_Accident_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [createdOn];
		                ALTER TABLE [dbo].[Accident] ADD CONSTRAINT [DF_Accident_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [updatedOn];
                    ALTER TABLE [dbo].[Accident] ADD CONSTRAINT [DF_Accident_IsDeleted]  DEFAULT (0) FOR [isDeleted]
					PRINT 'Table Accident created!';
END
ELSE
	BEGIN
		PRINT 'Table Accident already exists into the database';
	END
GO


--Create table Sickness

IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.Sickness')
)
BEGIN
CREATE TABLE Sickness (id INT IDENTITY(1,1) NOT NULL
					          , description VARCHAR(1000) CONSTRAINT NN_Description NOT NULL
					          , dateSickness DATETIME CONSTRAINT NN_DateSickness NOT NULL
                    , statusRecord BIT CONSTRAINT NN_SicknessStatusRecrod DEFAULT 0 NOT NULL
					          , whereOccurr VARCHAR(1000) CONSTRAINT NN_WhereOcurr NOT NULL
					          , totalDaysOutOfWork INT CONSTRAINT NN_TotalDaysOutOfWork NOT NULL
					          , totalDaysRestrictedTransferredWork INT CONSTRAINT NN_TotalDaysRestrictedTransferredWork NOT NULL
                    , employeeId INT
                    , saCategoryId INT
                    , saTypeId INT
                    , createdOn DATETIME NOT NULL
					          , updatedOn DATETIME NOT NULL
                    , isDeleted BIT
                    , version BIGINT DEFAULT 1
                    , createdBy INT DEFAULT 0 NOT NULL
					          , updatedBy INT
                    CONSTRAINT PK_Sickness PRIMARY KEY(
                        [id]
                    ));

                    ALTER TABLE [dbo].[Sickness] ADD CONSTRAINT [DF_Sickness_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [createdOn];
		                ALTER TABLE [dbo].[Sickness] ADD CONSTRAINT [DF_Sickness_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [updatedOn];
                    ALTER TABLE [dbo].[Sickness] ADD CONSTRAINT [DF_Sickness_IsDeleted]  DEFAULT (0) FOR [isDeleted]
					PRINT 'Table Sickness created!';
END
ELSE
	BEGIN
		PRINT 'Table Sickness already exists into the database';
	END
GO

/*** equipment assignment relations tables ****/
--Create table PpeClassification

IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.PpeClassification')
)
BEGIN
CREATE TABLE PpeClassification (id INT IDENTITY(1,1) NOT NULL
					          , name VARCHAR(100) CONSTRAINT NN_Name NOT NULL
					          , description VARCHAR(1000) CONSTRAINT NN_Description NOT NULL
                    , createdOn DATETIME NOT NULL
					          , updatedOn DATETIME NOT NULL
                    , isDeleted BIT
                    , version BIGINT DEFAULT 1
                    , createdBy INT DEFAULT 0 NOT NULL
					          , updatedBy INT
                    CONSTRAINT PK_PpeClassification PRIMARY KEY(
                        [id]
                    ));

                    ALTER TABLE [dbo].[PpeClassification] ADD CONSTRAINT [DF_PpeClassification_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [createdOn];
		                ALTER TABLE [dbo].[PpeClassification] ADD CONSTRAINT [DF_PpeClassification_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [updatedOn];
                    ALTER TABLE [dbo].[PpeClassification] ADD CONSTRAINT [DF_PpeClassification_IsDeleted]  DEFAULT (0) FOR [isDeleted]
					PRINT 'Table PpeClassification created!';
END
ELSE
	BEGIN
		PRINT 'Table PpeClassification already exists into the database';
	END
GO

--Create table Ppe

IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.Ppe')
)
BEGIN
CREATE TABLE Ppe (id INT IDENTITY(1,1) NOT NULL
					          , name VARCHAR(100) CONSTRAINT NN_Name NOT NULL
					          , description VARCHAR(1000) CONSTRAINT NN_Description NOT NULL
                    , ppeClassificationId INT
                    , createdOn DATETIME NOT NULL
					          , updatedOn DATETIME NOT NULL
                    , isDeleted BIT
                    , version BIGINT DEFAULT 1
                    , createdBy INT DEFAULT 0 NOT NULL
					          , updatedBy INT
                    CONSTRAINT PK_Ppe PRIMARY KEY(
                        [id]
                    ));

                    ALTER TABLE [dbo].[Ppe] ADD CONSTRAINT [DF_Ppe_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [createdOn];
		                ALTER TABLE [dbo].[Ppe] ADD CONSTRAINT [DF_Ppe_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [updatedOn];
                    ALTER TABLE [dbo].[Ppe] ADD CONSTRAINT [DF_Ppe_IsDeleted]  DEFAULT (0) FOR [isDeleted]
					PRINT 'Table Ppe created!';
END
ELSE
	BEGIN
		PRINT 'Table Ppe already exists into the database';
	END
GO

--Create table ExistingPpe

IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.ExistingPpe')
)
BEGIN
CREATE TABLE ExistingPpe (id INT IDENTITY(1,1) NOT NULL
					          , detail VARCHAR(1000) CONSTRAINT NN_Detail NOT NULL
					          , purchaseDate DATETIME CONSTRAINT NN_PurchaseDate NOT NULL
                    , lifeTimeDays INT CONSTRAINT NN_LifeTimeDays NOT NULL
                    , currentLifeTimeDays INT CONSTRAINT NN_CurrentLifeTimeDays NOT NULL
                    , ppeId INT
                    , createdOn DATETIME NOT NULL
					          , updatedOn DATETIME NOT NULL
                    , isDeleted BIT
                    , version BIGINT DEFAULT 1
                    , createdBy INT DEFAULT 0 NOT NULL
					          , updatedBy INT
                    CONSTRAINT PK_ExistingPpe PRIMARY KEY(
                        [id]
                    ));

                    ALTER TABLE [dbo].[ExistingPpe] ADD CONSTRAINT [DF_ExistingPpe_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [createdOn];
		                ALTER TABLE [dbo].[ExistingPpe] ADD CONSTRAINT [DF_ExistingPpe_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [updatedOn];
                    ALTER TABLE [dbo].[ExistingPpe] ADD CONSTRAINT [DF_ExistingPpe_IsDeleted]  DEFAULT (0) FOR [isDeleted]
					PRINT 'Table ExistingPpe created!';
END
ELSE
	BEGIN
		PRINT 'Table ExistingPpe already exists into the database';
	END
GO

--Create table ExistingPpeAssigned

IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.ExistingPpeAssigned')
)
BEGIN
CREATE TABLE ExistingPpeAssigned (id INT IDENTITY(1,1) NOT NULL
					          , assignedNotes VARCHAR(200) CONSTRAINT NN_AssignedNotes NOT NULL
					          , assignedDate DATETIME CONSTRAINT NN_AssignedDate NOT NULL
					          , returnNotes VARCHAR(1000) CONSTRAINT NN_ReturnNotes NOT NULL
                    , returnDate DATETIME
                    , existingPpeId INT
                    , employeeId INT
                    , createdOn DATETIME NOT NULL
					          , updatedOn DATETIME NOT NULL
                    , isDeleted BIT
                    , version BIGINT DEFAULT 1
                    , createdBy INT DEFAULT 0 NOT NULL
					          , updatedBy INT
                    CONSTRAINT PK_ExistingPpeAssigned PRIMARY KEY(
                        [id]
                    ));

                    ALTER TABLE [dbo].[ExistingPpeAssigned] ADD CONSTRAINT [DF_ExistingPpeAssigned_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [createdOn];
		                ALTER TABLE [dbo].[ExistingPpeAssigned] ADD CONSTRAINT [DF_ExistingPpeAssigned_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [updatedOn];
                    ALTER TABLE [dbo].[ExistingPpeAssigned] ADD CONSTRAINT [DF_ExistingPpeAssigned_IsDeleted]  DEFAULT (0) FOR [isDeleted]
					PRINT 'Table ExistingPpeAssigned created!';
END
ELSE
	BEGIN
		PRINT 'Table ExistingPpeAssigned already exists into the database';
	END
GO


/******** existing work item *****/
--Create table WorkItemClassification

IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.WorkItemClassification')
)
BEGIN
CREATE TABLE WorkItemClassification (id INT IDENTITY(1,1) NOT NULL
					          , name VARCHAR(100) CONSTRAINT NN_Name NOT NULL
                    , description VARCHAR(1000) CONSTRAINT NN_Description NOT NULL
                    , createdOn DATETIME NOT NULL
					          , updatedOn DATETIME NOT NULL
                    , isDeleted BIT
                    , version BIGINT DEFAULT 1
                    , createdBy INT DEFAULT 0 NOT NULL
					          , updatedBy INT
                    CONSTRAINT PK_WorkItemClassification PRIMARY KEY(
                        [id]
                    ));

                    ALTER TABLE [dbo].[WorkItemClassification] ADD CONSTRAINT [DF_WorkItemClassification_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [createdOn];
		                ALTER TABLE [dbo].[WorkItemClassification] ADD CONSTRAINT [DF_WorkItemClassification_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [updatedOn];
                    ALTER TABLE [dbo].[WorkItemClassification] ADD CONSTRAINT [DF_WorkItemClassification_IsDeleted]  DEFAULT (0) FOR [isDeleted]
					PRINT 'Table WorkItemClassification created!';
END
ELSE
	BEGIN
		PRINT 'Table WorkItemClassification already exists into the database';
	END
GO

--Create table WorkItem

IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.WorkItem')
)
BEGIN
CREATE TABLE WorkItem (id INT IDENTITY(1,1) NOT NULL
					          , name VARCHAR(100) CONSTRAINT NN_Name NOT NULL
                    , description VARCHAR(1000) CONSTRAINT NN_Description NOT NULL
                    , workItemClassificationId INT
                    , createdOn DATETIME NOT NULL
					          , updatedOn DATETIME NOT NULL
                    , isDeleted BIT
                    , version BIGINT DEFAULT 1
                    , createdBy INT DEFAULT 0 NOT NULL
					          , updatedBy INT
                    CONSTRAINT PK_WorkItem PRIMARY KEY(
                        [id]
                    ));

                    ALTER TABLE [dbo].[WorkItem] ADD CONSTRAINT [DF_WorkItem_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [createdOn];
		                ALTER TABLE [dbo].[WorkItem] ADD CONSTRAINT [DF_WorkItem_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [updatedOn];
                    ALTER TABLE [dbo].[WorkItem] ADD CONSTRAINT [DF_WorkItem_IsDeleted]  DEFAULT (0) FOR [isDeleted]
					PRINT 'Table WorkItem created!';
END
ELSE
	BEGIN
		PRINT 'Table WorkItem already exists into the database';
	END
GO

--Create table ExistingWorkItem

IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.ExistingWorkItem')
)
BEGIN
CREATE TABLE ExistingWorkItem (id INT IDENTITY(1,1) NOT NULL
                    , detail VARCHAR(100) CONSTRAINT NN_Detail NOT NULL
                    , purchaseDate DATETIME CONSTRAINT NN_PurchaseDate NOT NULL
                    , serieNo VARCHAR(50) CONSTRAINT NN_SerieNo NOT NULL
                    , workItemId INT
                    , createdOn DATETIME NOT NULL
					          , updatedOn DATETIME NOT NULL
                    , isDeleted BIT
                    , version BIGINT DEFAULT 1
                    , createdBy INT DEFAULT 0 NOT NULL
					          , updatedBy INT
                    CONSTRAINT PK_ExistingWorkItem PRIMARY KEY(
                        [id]
                    ));

                    ALTER TABLE [dbo].[ExistingWorkItem] ADD CONSTRAINT [DF_ExistingWorkItem_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [createdOn];
		                ALTER TABLE [dbo].[ExistingWorkItem] ADD CONSTRAINT [DF_ExistingWorkItem_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [updatedOn];
                    ALTER TABLE [dbo].[ExistingWorkItem] ADD CONSTRAINT [DF_ExistingWorkItem_IsDeleted]  DEFAULT (0) FOR [isDeleted]
					PRINT 'Table ExistingWorkItem created!';
END
ELSE
	BEGIN
		PRINT 'Table ExistingWorkItem already exists into the database';
	END
GO

--Create table ExistingWorkItemAssigned

IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.ExistingWorkItemAssigned')
)
BEGIN
CREATE TABLE ExistingWorkItemAssigned (id INT IDENTITY(1,1) NOT NULL
					          , assignedNotes VARCHAR(1000) NOT NULL
					          , assignedDate DATETIME NOT NULL
					          , returnNotes VARCHAR(1000) NOT NULL
							, returnDate DATETIME
							, createdOn DATETIME NOT NULL
							, updatedOn DATETIME NOT NULL
							, isDeleted BIT
							, version BIGINT DEFAULT 1
							, createdBy INT DEFAULT 0 NOT NULL
					    , updatedBy INT
							, employeeId INT NOT NULL
							, existingWorkItemId INT NOT NULL
							CONSTRAINT PK_ExistingWorkItemAssignedId PRIMARY KEY(
								[id]
                    ));

                    ALTER TABLE [dbo].[ExistingWorkItemAssigned] ADD CONSTRAINT [DF_ExistingWorkItemAssigned_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [createdOn];
		            ALTER TABLE [dbo].[ExistingWorkItemAssigned] ADD CONSTRAINT [DF_ExistingWorkItemAssigned_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [updatedOn];
                    ALTER TABLE [dbo].[ExistingWorkItemAssigned] ADD CONSTRAINT [DF_ExistingWorkItemAssigned_IsDeleted]  DEFAULT (0) FOR [isDeleted]

					PRINT 'Table ExistingWorkItemAssigned created!';
END
ELSE
	BEGIN
		PRINT 'Table ExistingWorkItemAssigned already exists into the database';
	END
GO



/******* Department ****/
-- Define the relationship between Employee and Department.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_Department]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
	ALTER TABLE [dbo].[Employee]  WITH CHECK ADD CONSTRAINT [FK_Employee_Department] FOREIGN KEY(departmentEmployeeId)
	REFERENCES [dbo].[Department] (id)
GO
	ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO

-- Define the relationship between Audit and Department.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Audit_Department]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Audit]'))
	ALTER TABLE [dbo].[Audit]  WITH CHECK ADD CONSTRAINT [FK_Audit_Department] FOREIGN KEY(departmentId)
	REFERENCES [dbo].[Department] (id)
GO
	ALTER TABLE [dbo].[Audit] CHECK CONSTRAINT [FK_Audit_Department]
GO

/******* Role ****/
-- Define the relationship between Employee and Role.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_Role]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
	ALTER TABLE [dbo].[Employee]  WITH CHECK ADD CONSTRAINT [FK_Employee_Role] FOREIGN KEY(roleEmployeeId)
	REFERENCES [dbo].[Role] (id)
GO
	ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role]
GO

-- Define the relationship between FunctionManual and Role.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_FunctionManual_Role]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[FunctionManual]'))
	ALTER TABLE [dbo].[FunctionManual]  WITH CHECK ADD CONSTRAINT [FK_FunctionManual_Role] FOREIGN KEY(roleFunctionId)
	REFERENCES [dbo].[Role] (id)
GO
	ALTER TABLE [dbo].[FunctionManual] CHECK CONSTRAINT [FK_FunctionManual_Role]
GO

/******* Audit ****/
-- Define the relationship between SafetyRule and Audit.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_SafetyRule_Audit]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[SafetyRule]'))
	ALTER TABLE [dbo].[SafetyRule]  WITH CHECK ADD CONSTRAINT [FK_SafetyRule_Audit] FOREIGN KEY(auditId)
	REFERENCES [dbo].[Audit] (id)
GO
	ALTER TABLE [dbo].[SafetyRule] CHECK CONSTRAINT [FK_SafetyRule_Audit]
GO

/******* Employee ****/
-- Define the relationship between Audit and Employee.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Audit_Employee]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Audit]'))
	ALTER TABLE [dbo].[Audit]  WITH CHECK ADD CONSTRAINT [FK_Audit_Employee] FOREIGN KEY(employeeId)
	REFERENCES [dbo].[Employee] (id)
GO
	ALTER TABLE [dbo].[Audit] CHECK CONSTRAINT [FK_Audit_Employee]
GO

/******* FileDocument ****/
-- Define the relationship between Employee and FileDocument.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_FileDocument]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
	ALTER TABLE [dbo].[Employee]  WITH CHECK ADD CONSTRAINT [FK_Employee_FileDocument] FOREIGN KEY(photoFileDocumentId)
	REFERENCES [dbo].[FileDocument] (id)
GO
	ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_FileDocument]
GO

/******* Employee Supervisor *******/
-- Define the relationship between Employee and Supervisor.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_Supervisor]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Employee]'))
  ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Supervisor] FOREIGN KEY(supervisorId)
  REFERENCES [dbo].[Employee] (id)
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Supervisor]
GO


/******* ACCIDENT FOREIGN KEYS ********/
-- Define the relationship between Accident and SaCategory.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_SaCategory_Accident]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Accident]'))
ALTER TABLE [dbo].[Accident]  WITH CHECK ADD
       CONSTRAINT [FK_SaCategory_Accident] FOREIGN KEY([saCategoryId])
REFERENCES [dbo].[SaCategory] ([id])
GO
ALTER TABLE [dbo].[Accident] CHECK
       CONSTRAINT [FK_SaCategory_Accident]

-- Define the relationship between Accident and SaType.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_SaType_Accident]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Accident]'))
ALTER TABLE [dbo].[Accident]  WITH CHECK ADD
       CONSTRAINT [FK_SaType_Accident] FOREIGN KEY([saTypeId])
REFERENCES [dbo].[SaType] ([id])
GO
ALTER TABLE [dbo].[Accident] CHECK
       CONSTRAINT [FK_SaType_Accident]

 -- Define the relationship between Accident and Employee.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employe_Accident]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Accident]'))
ALTER TABLE [dbo].[Accident]  WITH CHECK ADD
       CONSTRAINT [FK_Employe_Accident] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Accident] CHECK
       CONSTRAINT [FK_Employe_Accident]

/******* SICKNESS FOREIGN KEYS ********/
-- Define the relationship between Sickness and SaCategory.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_SaCategory_Sickness]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Sickness]'))
ALTER TABLE [dbo].[Sickness]  WITH CHECK ADD
       CONSTRAINT [FK_SaCategory_Sickness] FOREIGN KEY([saCategoryId])
REFERENCES [dbo].[SaCategory] ([id])
GO
ALTER TABLE [dbo].[Sickness] CHECK
       CONSTRAINT [FK_SaCategory_Sickness]

-- Define the relationship between Sickness and SaType.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_SaType_Sickness]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Sickness]'))
ALTER TABLE [dbo].[Sickness]  WITH CHECK ADD
       CONSTRAINT [FK_SaType_Sickness] FOREIGN KEY([saTypeId])
REFERENCES [dbo].[SaType] ([id])
GO
ALTER TABLE [dbo].[Sickness] CHECK
       CONSTRAINT [FK_SaType_Sickness]

 -- Define the relationship between Sickness and Employee.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employe_Sickness]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Sickness]'))
ALTER TABLE [dbo].[Sickness]  WITH CHECK ADD
       CONSTRAINT [FK_Employe_Sickness] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Sickness] CHECK
       CONSTRAINT [FK_Employe_Sickness]

/******* PPE ****/
-- Define the relationship between Ppe and PpeClassification.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_PpeClassification_Ppe]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Ppe]'))
ALTER TABLE [dbo].Ppe  WITH CHECK ADD
       CONSTRAINT [FK_PpeClassification_Ppe] FOREIGN KEY([ppeClassificationId])
REFERENCES [dbo].[PpeClassification] ([id])
GO
ALTER TABLE [dbo].[Ppe] CHECK
       CONSTRAINT [FK_PpeClassification_Ppe]

/******* ExistingPpe ****/
-- Define the relationship between ExistingPpe and Ppe.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ppe_ExistingPpe]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[ExistingPpe]'))
ALTER TABLE [dbo].[ExistingPpe]  WITH CHECK ADD
       CONSTRAINT [FK_Ppe_ExistingPpe] FOREIGN KEY([ppeId])
REFERENCES [dbo].[Ppe] ([id])
GO
ALTER TABLE [dbo].[ExistingPpe] CHECK
       CONSTRAINT [FK_Ppe_ExistingPpe]

/******* ExistingPpeAssigned ****/
-- Define the relationship between ExistingPpeAssigned and ExistingPpe.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExistingPpe_ExistingPpeAssigned]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[ExistingPpeAssigned]'))
ALTER TABLE [dbo].[ExistingPpeAssigned]  WITH CHECK ADD
       CONSTRAINT [FK_ExistingPpe_ExistingPpeAssigned] FOREIGN KEY([existingPpeId])
REFERENCES [dbo].[ExistingPpe] ([id])
GO
ALTER TABLE [dbo].[ExistingPpeAssigned] CHECK
       CONSTRAINT [FK_ExistingPpe_ExistingPpeAssigned]


-- Define the relationship between ExistingPpeAssigned and Employee.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employee_ExistingPpeAssigned]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[ExistingPpeAssigned]'))
ALTER TABLE [dbo].[ExistingPpeAssigned]  WITH CHECK ADD
       CONSTRAINT [FK_Employee_ExistingPpeAssigned] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[ExistingPpeAssigned] CHECK
       CONSTRAINT [FK_Employee_ExistingPpeAssigned]


/******* WorkItem ****/
-- Define the relationship between WorkItem and WorkItemClassification.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkItemClassification_WorkItem]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[WorkItem]'))
ALTER TABLE [dbo].[WorkItem]  WITH CHECK ADD
       CONSTRAINT [FK_WorkItemClassification_WorkItem] FOREIGN KEY([workItemClassificationId])
REFERENCES [dbo].[WorkItemClassification] ([id])
GO
ALTER TABLE [dbo].[WorkItem] CHECK
       CONSTRAINT [FK_WorkItemClassification_WorkItem]

/******* ExistingWorkItem ****/
-- Define the relationship between ExistingWorkItem and  WorkItem.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkItem_ExistingWorkItem]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[ExistingWorkItem]'))
ALTER TABLE [dbo].[ExistingWorkItem]  WITH CHECK ADD
       CONSTRAINT [FK_WorkItem_ExistingWorkItem] FOREIGN KEY([workItemId])
REFERENCES [dbo].[WorkItem] ([id])
GO
ALTER TABLE [dbo].[ExistingWorkItem] CHECK
       CONSTRAINT [FK_WorkItem_ExistingWorkItem]

/******* ExistingWorkItemAssigned ****/
-- Define the relationship between ExistingWorkItemAssigned and Employee.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExistingWorkItemAssigned_Employee]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[ExistingWorkItemAssigned]'))
	ALTER TABLE [dbo].[ExistingWorkItemAssigned]  WITH CHECK ADD CONSTRAINT [FK_ExistingWorkItemAssigned_Employee] FOREIGN KEY(employeeId)
	REFERENCES [dbo].[Employee] (id)
GO
	ALTER TABLE [dbo].[ExistingWorkItemAssigned] CHECK CONSTRAINT [FK_ExistingWorkItemAssigned_Employee]
GO

-- Define the relationship between ExistingWorkItemAssigned and ExistingWorkItem.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExistingWorkItemAssigned_ExistingWorkItem]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[ExistingWorkItemAssigned]'))
	ALTER TABLE [dbo].[ExistingWorkItemAssigned]  WITH CHECK ADD CONSTRAINT [FK_ExistingWorkItemAssigned_ExistingWorkItem] FOREIGN KEY(existingWorkItemId)
	REFERENCES [dbo].[ExistingWorkItem] (id)
GO
	ALTER TABLE [dbo].[ExistingWorkItemAssigned] CHECK CONSTRAINT [FK_ExistingWorkItemAssigned_ExistingWorkItem]
GO

