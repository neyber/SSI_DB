/******************************************************************************
**  Name: script to initialize table with values - team A
**  Desc: add initialization of next tables Accident, Sickness, SaCategory, SaType
          , ExistingPpeAssigned, ExistingPpe, Ppe, PpeClassification, ExistingWorkItem
          , WorkItem and  WorkItemClassification
**
**  Author: Henry Bustamante
**  Description: is pending scripts added by marcelo, (employee, and other tables), to work completely this script
**  Date: 05/26/2018
*******************************************************************************/
/******************************************************************************
**  Name: script to initialize table with values - team A
**  Desc: add initialization of next tables Accident, Sickness, SaCategory, SaType
          , ExistingPpeAssigned, ExistingPpe, Ppe, PpeClassification, ExistingWorkItem
          , WorkItem and  WorkItemClassification
**
 Modified: Marcelo Loayza
**  Added: Department, Role, Employee, Function Manual
**  Date: 05/26/2018
*******************************************************************************/

IF db_id('ssiA') IS NULL
BEGIN
    print('creating new DB');
    CREATE DATABASE ssiA;
END
GO
use ssiA
GO

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN TRANSACTION;


IF EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.Department')
)
BEGIN
    IF (SELECT COUNT(*) FROM dbo.Department) <= 0
    BEGIN
        PRINT 'Insert data into the Department table...';
        --SET IDENTITY_INSERT dbo.Department ON
        INSERT INTO [dbo].[Department]([name],[createdOn],[updatedOn],[isDeleted],[version],[description])
        VALUES ('HHRR','2005-09-01', '2005-09-02', 0, 1, 'departament of HHRR');
        INSERT INTO [dbo].[Department]([name],[createdOn],[updatedOn],[isDeleted],[version],[description])
        VALUES ('SALES', '2005-09-01', '2005-09-02', 0, 1, 'department of Sales');
        INSERT INTO [dbo].[Department]([name],[createdOn],[updatedOn],[isDeleted],[version],[description])
        VALUES ('ACCOUNTING', '2005-09-01', '2005-09-02', 0, 1, 'departament of Accounting');
        INSERT INTO [dbo].[Department]([name],[createdOn],[updatedOn],[isDeleted],[version],[description])
        VALUES ('PLANIFICATION','2005-09-01', '2005-09-02', 0, 1, 'departament of Planification');
        INSERT INTO [dbo].[Department]([name],[createdOn],[updatedOn],[isDeleted],[version],[description])
        VALUES ('CONSTRUCTION','2005-09-01', '2005-09-02', 0, 1, 'departament of construction');
        INSERT INTO [dbo].[Department]([name],[createdOn],[updatedOn],[isDeleted],[version],[description])
        VALUES ('AUDIT','2005-09-01', '2005-09-02', 0, 1, 'departament of Audit');
        INSERT INTO [dbo].[Department]([name],[createdOn],[updatedOn],[isDeleted],[version],[description])
        VALUES ('INGENIERY','2005-09-01', '2005-09-02', 0, 1, 'departament of Ingeniery');
        INSERT INTO [dbo].[Department]([name],[createdOn],[updatedOn],[isDeleted],[version],[description])
        VALUES ('TRANSACTIONS', '2005-09-01', '2005-09-02', 0, 1, 'departament of Transactions');
        INSERT INTO [dbo].[Department]([name],[createdOn],[updatedOn],[isDeleted],[version],[description])
        VALUES ('TRANSPORT','2005-09-01', '2005-09-02', 0, 1, 'departament of transport');
        INSERT INTO [dbo].[Department]([name],[createdOn],[updatedOn],[isDeleted],[version],[description])
        VALUES ('IMPORTATIONS','2005-09-01', '2005-09-02', 0, 1, 'departament of Import');
        --SET IDENTITY_INSERT dbo.Department OFF;
        PRINT 'Department table done...';
    END
    ELSE
    BEGIN
        PRINT 'Table Department alrready has data';
    END
END
ELSE
BEGIN
    PRINT 'Table Department does not exists';
END

IF EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.Role')
)
BEGIN
    IF (SELECT COUNT(*) FROM dbo.Role) <= 0
    BEGIN
        PRINT 'Insert data into the Role table...';
        --SET IDENTITY_INSERT dbo.Role ON
        INSERT INTO [dbo].[Role]([createdOn],[updatedOn],[isDeleted],[version],[description],[name])
        VALUES ('2005-08-10', '2005-09-03', 0, 1, 'Administrator','Admin' );
        INSERT INTO [dbo].[Role]([createdOn],[updatedOn],[isDeleted],[version],[description],[name])
        VALUES ('2005-08-11', '2005-09-04', 0, 1, 'Accounting','Account' );
        INSERT INTO [dbo].[Role]([createdOn],[updatedOn],[isDeleted],[version],[description],[name])
        VALUES ('2005-08-11', '2005-09-04', 0, 1, 'Worker level 1','Worker 1' );
        INSERT INTO [dbo].[Role]([createdOn],[updatedOn],[isDeleted],[version],[description],[name])
        VALUES ('2005-08-11', '2005-09-04', 0, 1, 'Worker level 2','Worker 2' );
        INSERT INTO [dbo].[Role]([createdOn],[updatedOn],[isDeleted],[version],[description],[name])
        VALUES ('2005-08-11', '2005-09-04', 0, 1, 'transportation Manager','ManargerT' );
        INSERT INTO [dbo].[Role]([createdOn],[updatedOn],[isDeleted],[version],[description],[name])
        VALUES ('2005-08-11', '2005-09-04', 0, 1, 'Support Worker','Support' );
        INSERT INTO [dbo].[Role]([createdOn],[updatedOn],[isDeleted],[version],[description],[name])
        VALUES ('2005-08-11', '2005-09-04', 0, 1, 'Sales man','Sales' );
        INSERT INTO [dbo].[Role]([createdOn],[updatedOn],[isDeleted],[version],[description],[name])
        VALUES ('2005-08-11', '2005-09-04', 0, 1, 'Supervises the construction','Work supervisor' );
        --SET IDENTITY_INSERT dbo.Role OFF;
        PRINT 'Role table done...';
    END
    ELSE
    BEGIN
        PRINT 'Table Role already has data';
    END

END
ELSE
BEGIN
    PRINT 'Table Role does not exists';
END

IF EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.FunctionManual')
)
BEGIN
    IF (SELECT COUNT(*) FROM dbo.FunctionManual) <= 0
    BEGIN
        PRINT 'Insert data into the FunctionManual table...';
        --SET IDENTITY_INSERT dbo.FunctionManual ON
        INSERT INTO [dbo].[FunctionManual] ([createdOn],[updatedOn],[isDeleted],[version],[dependentPersonal],[externalRelation],[generalActivity],[hierarchicalLever],[internalRelation],[name],[position],[principalFunction],[superiorBoss],[roleFunctionId])
        VALUES ('2006-06-11','2006-07-10', 0, 1,'all HHRR personal', 'Customers and providers', 'admistrate the company', 'admin 1', 'realtions with accounting and management', 'Admin', 'Administrator', 'Administrate the company', 'CEO of SSI', 1);
        INSERT INTO [dbo].[FunctionManual] ([createdOn],[updatedOn],[isDeleted],[version],[dependentPersonal],[externalRelation],[generalActivity],[hierarchicalLever],[internalRelation],[name],[position],[principalFunction],[superiorBoss],[roleFunctionId])
        VALUES ('2006-06-11','2006-07-10', 0, 1,'sales department', 'Customers', 'work with the accounting', 'admin 1', 'realtions with admin and management', 'Account', 'Accounting', 'Manage the Accounting of the Company', 'Administrator', 2);
        INSERT INTO [dbo].[FunctionManual] ([createdOn],[updatedOn],[isDeleted],[version],[dependentPersonal],[externalRelation],[generalActivity],[hierarchicalLever],[internalRelation],[name],[position],[principalFunction],[superiorBoss],[roleFunctionId])
        VALUES ('2006-06-11','2006-07-10', 0, 1,'all HHRR personal', 'Customers and providers', 'admistrate the company', 'worker 1', 'realtions with HHRR and management', 'worker 1', 'Worker level 1', 'work on the contructions', 'Manager', 3);
        INSERT INTO [dbo].[FunctionManual] ([createdOn],[updatedOn],[isDeleted],[version],[dependentPersonal],[externalRelation],[generalActivity],[hierarchicalLever],[internalRelation],[name],[position],[principalFunction],[superiorBoss],[roleFunctionId])
        VALUES ('2006-06-11','2006-07-10', 0, 1,'all HHRR personal', 'providers', 'work on the construction', 'worker 2', 'realtions with HHRR and management', 'worker 2', 'Worker level 2', 'work on the contructions', 'Manager', 4);
        INSERT INTO [dbo].[FunctionManual] ([createdOn],[updatedOn],[isDeleted],[version],[dependentPersonal],[externalRelation],[generalActivity],[hierarchicalLever],[internalRelation],[name],[position],[principalFunction],[superiorBoss],[roleFunctionId])
        VALUES ('2006-06-11','2006-07-10', 0, 1,'all Transporrtation personal', 'providers', 'Is on charge of the the transportations', 'ManargerT', 'realtions with HHRR and workers', 'Transportation Manager', 'transportation1 level 2', 'work on the transportation', 'Manager', 4);
        --SET IDENTITY_INSERT dbo.FunctionManual OFF;
        PRINT 'FunctionManual table done...';
    END
    ELSE
    BEGIN
        PRINT 'Table FunctionManual already has data';
    END

END
ELSE
BEGIN
    PRINT 'Table FunctionManual does not exists';
END

IF EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.Employee')
)
BEGIN
    IF (SELECT COUNT(*) FROM dbo.Employee) <= 0
    BEGIN
        PRINT 'Insert data into the Employee table...';
        --SET IDENTITY_INSERT dbo.Employee ON
        INSERT INTO [dbo].[Employee] ([createdOn],[updatedOn],[isDeleted],[version],[dateOfBirth] ,[firstName],[gender],[healthConditionStartingAtCompany],[identificationNumber],[lastName],[startDateInCompany],[departmentEmployeeId],[photoFileDocumentId],[RoleEmployeeId],[SupervisorId])
        VALUES ('2005-08-11', '2005-09-04', 0, 1,'1999-09-04','Jose', 'm', 'good condition', 1001, 'Lopez', '2005-08-11', 1, null, 1, null);
        INSERT INTO [dbo].[Employee] ([createdOn],[updatedOn],[isDeleted],[version],[dateOfBirth] ,[firstName],[gender],[healthConditionStartingAtCompany],[identificationNumber],[lastName],[startDateInCompany],[departmentEmployeeId],[photoFileDocumentId],[RoleEmployeeId],[SupervisorId])
        VALUES ('2005-08-11', '2005-09-04', 0, 1,'1998-09-04','Juan', 'm', 'good condition', 1001, 'Peres', '2005-08-11', 5, null, 3, null);
        INSERT INTO [dbo].[Employee] ([createdOn],[updatedOn],[isDeleted],[version],[dateOfBirth] ,[firstName],[gender],[healthConditionStartingAtCompany],[identificationNumber],[lastName],[startDateInCompany],[departmentEmployeeId],[photoFileDocumentId],[RoleEmployeeId],[SupervisorId])
        VALUES ('2005-08-11', '2005-09-04', 0, 1,'1997-01-04','Pedro', 'm', 'good condition', 1001, 'Aranda', '2005-08-11', 5, null, 3, null);
        INSERT INTO [dbo].[Employee] ([createdOn],[updatedOn],[isDeleted],[version],[dateOfBirth] ,[firstName],[gender],[healthConditionStartingAtCompany],[identificationNumber],[lastName],[startDateInCompany],[departmentEmployeeId],[photoFileDocumentId],[RoleEmployeeId],[SupervisorId])
        VALUES ('2005-08-11', '2005-09-04', 0, 1,'1995-05-04','Luis', 'm', 'good condition', 1001, 'Rojas', '2005-08-11', 5, null, 3, null);
        INSERT INTO [dbo].[Employee] ([createdOn],[updatedOn],[isDeleted],[version],[dateOfBirth] ,[firstName],[gender],[healthConditionStartingAtCompany],[identificationNumber],[lastName],[startDateInCompany],[departmentEmployeeId],[photoFileDocumentId],[RoleEmployeeId],[SupervisorId])
        VALUES ('2005-08-11', '2005-09-04', 0, 1,'1993-02-04','Jason', 'm', 'good condition', 1001, 'Magne', '2005-08-11', 5, null, 3, null);
        INSERT INTO [dbo].[Employee] ([createdOn],[updatedOn],[isDeleted],[version],[dateOfBirth] ,[firstName],[gender],[healthConditionStartingAtCompany],[identificationNumber],[lastName],[startDateInCompany],[departmentEmployeeId],[photoFileDocumentId],[RoleEmployeeId],[SupervisorId])
        VALUES ('2005-08-11', '2005-09-04', 0, 1,'1992-05-04','Fred', 'm', 'good condition', 1001, 'Mour', '2005-08-11', 5, null, 4, null);
        INSERT INTO [dbo].[Employee] ([createdOn],[updatedOn],[isDeleted],[version],[dateOfBirth] ,[firstName],[gender],[healthConditionStartingAtCompany],[identificationNumber],[lastName],[startDateInCompany],[departmentEmployeeId],[photoFileDocumentId],[RoleEmployeeId],[SupervisorId])
        VALUES ('2005-08-11', '2005-09-04', 0, 1,'1992-02-04','Daniel', 'm', 'good condition', 1001, 'Ardruino', '2005-08-11', 5, null, 4, null);
        INSERT INTO [dbo].[Employee] ([createdOn],[updatedOn],[isDeleted],[version],[dateOfBirth] ,[firstName],[gender],[healthConditionStartingAtCompany],[identificationNumber],[lastName],[startDateInCompany],[departmentEmployeeId],[photoFileDocumentId],[RoleEmployeeId],[SupervisorId])
        VALUES ('2005-08-11', '2005-09-04', 0, 1,'1991-01-04','Kevin', 'm', 'good condition', 1001, 'Mamani', '2005-08-11', 5, null, 4, null);
        INSERT INTO [dbo].[Employee] ([createdOn],[updatedOn],[isDeleted],[version],[dateOfBirth] ,[firstName],[gender],[healthConditionStartingAtCompany],[identificationNumber],[lastName],[startDateInCompany],[departmentEmployeeId],[photoFileDocumentId],[RoleEmployeeId],[SupervisorId])
        VALUES ('2005-08-11', '2005-09-04', 0, 1,'1990-10-04','Denis', 'm', 'good condition', 1001, 'Cruz', '2005-08-11', 5, null, 4, null);
        INSERT INTO [dbo].[Employee] ([createdOn],[updatedOn],[isDeleted],[version],[dateOfBirth] ,[firstName],[gender],[healthConditionStartingAtCompany],[identificationNumber],[lastName],[startDateInCompany],[departmentEmployeeId],[photoFileDocumentId],[RoleEmployeeId],[SupervisorId])
        VALUES ('2005-08-11', '2005-09-04', 0, 1,'1996-08-04','Alex', 'm', 'good condition', 1001, 'Roble', '2005-08-11', 5, null, 4, null);
        --SET IDENTITY_INSERT dbo.Employee OFF;
        PRINT 'Employee table done...';
    END
    ELSE
    BEGIN
        PRINT 'Table Employee already has data';
    END

END
ELSE
	BEGIN
		PRINT 'Table Employee does not exists';
	END


IF EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.SaCategory')
)
BEGIN

    IF (SELECT COUNT(*) FROM dbo.SaCategory) <= 0
    BEGIN
        PRINT 'Insert data into the SaCategory table...';

        --SET IDENTITY_INSERT dbo.SaCategory ON
        INSERT INTO [dbo].[SaCategory] ([category],[description],[reference])
        VALUES ('Days out of work', 'this category is follow the OSHA documentation', 'Formulario OSHA - 300');
        INSERT INTO [dbo].[SaCategory] ([category],[description],[reference])
        VALUES ('Testricted / Transferred work', 'this category is follow the OSHA documentation', 'Formulario OSHA - 300');
        INSERT INTO [dbo].[SaCategory] ([category],[description],[reference])
        VALUES ('Remained at work', 'this category is follow the OSHA documentation', 'Formulario OSHA - 300');
        INSERT INTO [dbo].[SaCategory] ([category],[description],[reference])
        VALUES ('Other recordable cases', 'this category is follow the OSHA documentation', 'Formulario OSHA - 300');
        INSERT INTO [dbo].[SaCategory] ([category],[description],[reference])
        VALUES ('Death', 'this category is follow the OSHA documentation', 'Formulario OSHA - 300');
        --SET IDENTITY_INSERT dbo.SaCategory OFF;
        PRINT 'SaCategory table done...';
    END
    ELSE
    BEGIN
        PRINT 'Table SaCategory already has data';
    END


END
ELSE
	BEGIN
		PRINT 'Table SaCategory does not exists';
	END


IF EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.SaType')
)
BEGIN
    IF (SELECT COUNT(*) FROM dbo.SaType) <= 0
    BEGIN
        PRINT 'Insert data into the SaType table...';
        --SET IDENTITY_INSERT dbo.SaType ON
        INSERT INTO [dbo].[SaType] ([type],[description])
        VALUES ('Injury', 'this type was includes by osha rules normative');
        INSERT INTO [dbo].[SaType] ([type],[description])
        VALUES ('Skin disorder', 'this type was includes by osha rules normative');
        INSERT INTO [dbo].[SaType] ([type],[description])
        VALUES ('Respiratory condition', 'this type was includes by osha rules normative');
        INSERT INTO [dbo].[SaType] ([type],[description])
        VALUES ('Poisoning', 'this type was includes by osha rules normative');
        INSERT INTO [dbo].[SaType] ([type],[description])
        VALUES ('Hearing loss', 'this type was includes by osha rules normative');
        INSERT INTO [dbo].[SaType] ([type],[description])
        VALUES ('Other diseases', 'this type was includes by osha rules normative');
        --SET IDENTITY_INSERT dbo.SaType OFF;
        PRINT 'SaType table done...';
    END
    ELSE
    BEGIN
        PRINT 'Table SaType already has data';
    END

END
ELSE
BEGIN
    PRINT 'Table SaType does not exists';
END


IF EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.Sickness')
)
BEGIN
    IF (SELECT COUNT(*) FROM dbo.Sickness) <= 0
    BEGIN
        PRINT 'Insert data into the Sickness table....';

        INSERT INTO [dbo].[Sickness] ([description],[dateSickness],[whereOccurr],[totalDaysOutOfWork],[totalDaysRestrictedTransferredWork],[saCategoryId],[saTypeId], [employeeId])
        VALUES ('during the night duty shift and with inadequate clothing is that the employee has a cold, and due to negligence', '2018-05-05 14:05:03', 'this happened on guard night shift', 3, 4, 1, 1, 2);
        INSERT INTO [dbo].[Sickness] ([description],[dateSickness],[whereOccurr],[totalDaysOutOfWork],[totalDaysRestrictedTransferredWork],[saCategoryId],[saTypeId], [employeeId])
        VALUES ('More than 5 years working with Zika discharge affects the employee lungs', '2018-01-03 14:05:03', 'this happened on guard night shift', 3, 4, 1, 1, 1);
        INSERT INTO [dbo].[Sickness] ([description],[dateSickness],[whereOccurr],[totalDaysOutOfWork],[totalDaysRestrictedTransferredWork],[saCategoryId],[saTypeId], [employeeId])
        VALUES ('More than 4 years working with the material download caused damage to the shoulders and now needs physiotherapy', '2018-01-02 14:05:03','During jornal work, in the new building', 3, 4, 2, 1, 2);
        INSERT INTO [dbo].[Sickness] ([description],[dateSickness],[whereOccurr],[totalDaysOutOfWork],[totalDaysRestrictedTransferredWork],[saCategoryId],[saTypeId], [employeeId])
        VALUES ('before he had an accident with the mechanical shovel and now his hand is infected', '2018-03-09 14:05:03','During jornal work, in the new building', 3, 4, 1, 1, 1);
        INSERT INTO [dbo].[Sickness] ([description],[dateSickness],[whereOccurr],[totalDaysOutOfWork],[totalDaysRestrictedTransferredWork],[saCategoryId],[saTypeId], [employeeId])
        VALUES ('More than 4 years working with the material download caused damage to the shoulders and now needs physiotherapy', '2017-06-07 14:05:03','During jornal work, in the new building', 3, 4, 3, 2, 1);
        INSERT INTO [dbo].[Sickness] ([description],[dateSickness],[whereOccurr],[totalDaysOutOfWork],[totalDaysRestrictedTransferredWork],[saCategoryId],[saTypeId], [employeeId])
        VALUES ('got sick and now has vision problems', '2017-08-10 14:05:03','During jornal work, in the new building', 3, 4, 1, 1, 1);

        PRINT 'Sickness table done...';
    END
    ELSE
    BEGIN
        PRINT 'Table Sickness already has data';
    END

END
ELSE
BEGIN
    PRINT 'Table Sickness does not exists';
END


IF EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.Accident')
)
BEGIN
    IF (SELECT COUNT(*) FROM dbo.Accident) <= 0
    BEGIN
        PRINT 'Insert data into the Accident table....';
        INSERT INTO [dbo].[Accident] ([description],[dateAccident],[whereOccurr],[totalDaysOutOfWork],[totalDaysRestrictedTransferredWork],[saCategoryId],[saTypeId], [employeeId])
        VALUES ('It happened when employee was not using his protection', '2018-05-05 14:05:03', 'It happened when employee was not using his protection,this occurred on the building, during last night.', 0, 2, 2, 1, 2);
        INSERT INTO [dbo].[Accident] ([description],[dateAccident],[whereOccurr],[totalDaysOutOfWork],[totalDaysRestrictedTransferredWork],[saCategoryId],[saTypeId], [employeeId])
        VALUES ('when they unloaded cargo of sika burst a bag', '2017-05-05 14:05:03','where the new building of west america Avenue No. 123', 3, 4, 3, 1, 3);
        INSERT INTO [dbo].[Accident] ([description],[dateAccident],[whereOccurr],[totalDaysOutOfWork],[totalDaysRestrictedTransferredWork],[saCategoryId],[saTypeId], [employeeId])
        VALUES ('when the tractor turned suddenly it hit the mixer truck', '2017-06-05 14:05:03', 'in the building under construction', 3, 4, 3, 3, 3);
        INSERT INTO [dbo].[Accident] ([description],[dateAccident],[whereOccurr],[totalDaysOutOfWork],[totalDaysRestrictedTransferredWork],[saCategoryId],[saTypeId], [employeeId])
        VALUES ('It happened when employee was not using his protection', '2017-08-09 14:05:03', 'It happened when employee was not using his protection,this occurred on the building, during last night.', 0, 2, 2, 3, 1);
        PRINT 'Accident table done...';
    END
    ELSE
    BEGIN
        PRINT 'Table Accident already has data';
    END

END
ELSE
BEGIN
    PRINT 'Table Accident does not exists';
END


IF EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.PpeClassification')
)
BEGIN
    IF (SELECT COUNT(*) FROM dbo.PpeClassification) <= 0
    BEGIN
        PRINT 'Insert data into the PpeClassification table....';
        INSERT INTO [dbo].[PpeClassification] ([name], [description])
        VALUES ('Protección de cráneo', 'Son elementos que cubren totalmente el cráneo, protegiéndolo contra los efectos de golpes, sustancias químicas, riesgos eléctricos y térmicos.');
        INSERT INTO [dbo].[PpeClassification] ([name], [description])
        VALUES ('Protección de manos', 'Son elementos que cubren totalmente las manos, protegiéndolo contra agentes que puedan presentarse en los insumos de materia prima como sustancias químicas, riesgos eléctricos y térmicos.');
        INSERT INTO [dbo].[PpeClassification] ([name], [description])
        VALUES ('Protección de pies', 'Son elementos que cubren totalmente los pies, protegiéndolo contra los efectos de, sustancias químicas, riesgos eléctricos y térmicos.');
        PRINT 'PpeClassification table done...';
    END
    ELSE
    BEGIN
        PRINT 'Table PpeClassification already has data';
    END

END
ELSE
BEGIN
    PRINT 'Table PpeClassification does not exists';
END


IF EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.Ppe')
)
BEGIN
    IF (SELECT COUNT(*) FROM dbo.Ppe) <= 0
    BEGIN
        PRINT 'Insert data into the Ppe table....';
        INSERT INTO [dbo].[Ppe] ([name], [description], [ppeClassificationId])
        VALUES ('Casco', 'Protege contra golpes en la cabeza.', 1);
        INSERT INTO [dbo].[Ppe] ([name], [description], [ppeClassificationId])
        VALUES ('Guantes', 'Protege contra sustancias químicas, riesgos eléctricos y térmicos.', 2);
        INSERT INTO [dbo].[Ppe] ([name], [description], [ppeClassificationId])
        VALUES ('Botas', 'Protege contra colges, ailamiento de corriente.', 3);
        PRINT 'Ppe table done...';
    END
    ELSE
    BEGIN
        PRINT 'Table Ppe already has data';
    END

END
ELSE
BEGIN
    PRINT 'Table Ppe does not exists';
END

IF EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.ExistingPpe')
)
BEGIN
    IF (SELECT COUNT(*) FROM dbo.ExistingPpe) <= 0
    BEGIN
        PRINT 'Insert data into the ExistingPpe table....';
        INSERT INTO [dbo].[ExistingPpe] ([detail], [lifeTimeDays],[currentLifeTimeDays], [purchaseDate], [ppeId])
        VALUES ('10101-CA', 100, 100, '2017-12-09 14:05:03', 1);
        INSERT INTO [dbo].[ExistingPpe] ([detail], [lifeTimeDays],[currentLifeTimeDays], [purchaseDate], [ppeId])
        VALUES ('10102-GU', 100, 100, '2017-12-12 14:05:03', 2);
        INSERT INTO [dbo].[ExistingPpe] ([detail], [lifeTimeDays],[currentLifeTimeDays], [purchaseDate], [ppeId])
        VALUES ('10103-BO', 100, 100, '2017-12-12 14:05:03', 3);
        PRINT 'ExistingPpe table done...';
    END
    ELSE
    BEGIN
        PRINT 'Table ExistingPpe already has data';
    END

END
ELSE
BEGIN
    PRINT 'Table ExistingPpe does not exists';
END


IF EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.ExistingPpeAssigned')
)
BEGIN
    IF (SELECT COUNT(*) FROM dbo.ExistingPpeAssigned) <= 0
    BEGIN
        PRINT 'Insert data into the ExistingPpeAssigned table....';
        INSERT INTO [dbo].[ExistingPpeAssigned] ([assignedNotes], [assignedDate],[returnNotes], returnDate, [existingPpeId], [employeeId])
        VALUES ('Asignado un casco en buen estado', '2017-12-09 14:05:03', 'nothing to tell', '', 1, 1);
        INSERT INTO [dbo].[ExistingPpeAssigned] ([assignedNotes], [assignedDate],[returnNotes], returnDate, [existingPpeId], [employeeId])
        VALUES ('Asignado un par de guantes en buen estado', '2018-02-03 14:05:03', 'nothing to tell', '', 1, 2);
        INSERT INTO [dbo].[ExistingPpeAssigned] ([assignedNotes], [assignedDate],[returnNotes], returnDate, [existingPpeId], [employeeId])
        VALUES ('Asignado un par de botas en buen estado', '2017-12-11 14:05:03', 'nothing to tell', '2018-02-03 14:05:03', 2, 3);
        PRINT 'ExistingPpeAssigned table done...';
    END
    ELSE
    BEGIN
        PRINT 'Table ExistingPpeAssigned already has data';
    END

END
ELSE
BEGIN
    PRINT 'Table ExistingPpeAssigned does not exists';
END

IF EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.WorkItemClassification')
)
BEGIN
    IF (SELECT COUNT(*) FROM dbo.WorkItemClassification) <= 0
    BEGIN
        PRINT 'Insert data into the WorkItemClassification table....';
        INSERT INTO [dbo].[WorkItemClassification] ([name], [description])
        VALUES ('Herramienta manual', 'Son impulsados manualmente.');
        INSERT INTO [dbo].[WorkItemClassification] ([name], [description])
        VALUES ('Herramienta electronica', 'Son manipulados con comandos.');
        INSERT INTO [dbo].[WorkItemClassification] ([name], [description])
        VALUES ('Herramienta digital', 'son operados por personas expertas en ello.');
        PRINT 'WorkItemClassification table done...';
    END
    ELSE
    BEGIN
        PRINT 'Table WorkItemClassification already has data';
    END

END
ELSE
BEGIN
    PRINT 'Table WorkItemClassification does not exists';
END


IF EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.WorkItem')
)
BEGIN
    IF (SELECT COUNT(*) FROM dbo.WorkItem) <= 0
    BEGIN
        PRINT 'Insert data into the WorkItem table....';
        INSERT INTO [dbo].[WorkItem] ([name], [description],[workItemClassificationId])
        VALUES ('Casco', 'Casco de seguridad', 1);
        INSERT INTO [dbo].[WorkItem] ([name], [description],[workItemClassificationId])
        VALUES ('Guante', 'Guantes de seguridad', 2);
        INSERT INTO [dbo].[WorkItem] ([name], [description],[workItemClassificationId])
        VALUES ('Botas', 'Botas de seguridad', 3);
        PRINT 'WorkItem table done...';
    END
    ELSE
    BEGIN
        PRINT 'Table WorkItem already has data';
    END

END
ELSE
BEGIN
    PRINT 'Table WorkItem does not exists';
END

IF EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.ExistingWorkItem')
)
BEGIN
    IF (SELECT COUNT(*) FROM dbo.ExistingWorkItem) <= 0
    BEGIN
        PRINT 'Insert data into the ExistingWorkItem table....';
        INSERT INTO [dbo].[ExistingWorkItem] ([detail], [purchaseDate],[serieNo], [workItemId])
        VALUES ('Adicionando stock de moledora', '2017-12-12 14:05:03', '111-CA', 1);
        INSERT INTO [dbo].[ExistingWorkItem] ([detail], [purchaseDate],[serieNo], [workItemId])
        VALUES ('Adicionando stock de Volqueta', '2018-01-12 14:05:03', '145-VO', 1);
        INSERT INTO [dbo].[ExistingWorkItem] ([detail], [purchaseDate],[serieNo], [workItemId])
        VALUES ('Adicionando stock de Mezcladora', '2018-05-04 14:05:03', '567-ME', 1);
        PRINT 'ExistingWorkItem table done...';
    END
    ELSE
    BEGIN
        PRINT 'Table ExistingWorkItem already has data';
    END

END
ELSE
BEGIN
    PRINT 'Table ExistingWorkItem does not exists';
END

COMMIT TRANSACTION;



