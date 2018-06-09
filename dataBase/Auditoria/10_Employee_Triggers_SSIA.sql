/******************************************************************************
**  Nombre: TG_Employee(Audit)_InsertUpdate
**  Descripcion:
**
**  Autor: Lizeth Salazar
**
**  Fecha: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Fecha:       Autor:           Descripcion:
** --------     -----------      -----------------------------------------------
** 05/28/2018   Lizeth Salazar    Initial version
** 06/08/2018   Lizeth Salazar    Completing fields to be completely mapped
*******************************************************************************/


USE ssiA;

/*
** Reviewing the trigger does not exist, if it does, the script will remove it.
*/
IF EXISTS (SELECT * FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[TG_Employee(Audit)_InsertUpdate]')
    AND type = 'TR')
BEGIN
  DROP TRIGGER [dbo].[TG_Employee(Audit)_InsertUpdate];
  PRINT '[TG_Employee(Audit)_InsertUpdate] was removed!';
END
GO

CREATE TRIGGER [dbo].[TG_Employee(Audit)_InsertUpdate]
ON [dbo].[Employee]
FOR INSERT, UPDATE, DELETE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  /**********************
  ** TABLE: Employee
  ** FIELD: First Name
  ***********************/
  IF UPDATE(FirstName)
  BEGIN
    INSERT INTO [dbo].[AuditHistory_SSI](tableName,
										columnName,
										idFeature,
										oldValue,
										newValue,
										createdDate,
										createdBy,
										modifiedDate,
										modifiedBy)
    SELECT TableName    = 'Employee',
           ColumnName   = 'First Name',
           ID1          = i.id,
           OldValue     = d.firstName,
           NewValue     = i.firstName,
           CreatedDate  = i.createdOn,
           CreatedBy    = i.createdBy,
           ModifiedDate = i.updatedOn,
           ModifiedBy   = i.updatedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.FirstName, '') != ISNULL(i.FirstName, '');
  END


  /**********************
  ** TABLE: Employee
  ** FIELD: Last Name
  ***********************/
  IF UPDATE(LastName)
  BEGIN
    INSERT INTO [dbo].[AuditHistory_SSI](tableName,
										columnName,
										idFeature,
										oldValue,
										newValue,
										createdDate,
										createdBy,
										modifiedDate,
										modifiedBy)
    SELECT TableName    = 'Employee',
           ColumnName   = 'Last Name',
           ID1          = i.id,
           OldValue     = d.lastName,
           NewValue     = i.lastName,
           CreatedDate  = i.createdOn,
           CreatedBy    = i.createdBy,
           ModifiedDate = i.updatedOn,
           ModifiedBy   = i.updatedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.LastName, '') != ISNULL(i.LastName, '');
  END


  /**********************
  ** TABLE: Employee
  ** FIELD: Date Of Birth
  ***********************/
  IF UPDATE(DateOfBirth)
  BEGIN
    INSERT INTO [dbo].[AuditHistory_SSI](tableName,
										columnName,
										idFeature,
										oldValue,
										newValue,
										createdDate,
										createdBy,
										modifiedDate,
										modifiedBy)
    SELECT TableName    = 'Employee',
           ColumnName   = 'DateOfBirth',
           ID1          = i.id,
           OldValue     = d.dateOfBirth,
           NewValue     = i.dateOfBirth,
           CreatedDate  = i.createdOn,
           CreatedBy    = i.createdBy,
           ModifiedDate = i.updatedOn,
           ModifiedBy   = i.updatedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.DateOfBirth, '') != ISNULL(i.DateOfBirth, '');
  END


  /**********************
  ** TABLE: Employee
  ** FIELD: Identification Number
  ***********************/
  IF UPDATE(IdentificationNumber)
  BEGIN
    INSERT INTO [dbo].[AuditHistory_SSI](tableName,
										columnName,
										idFeature,
										oldValue,
										newValue,
										createdDate,
										createdBy,
										modifiedDate,
										modifiedBy)
    SELECT TableName    = 'Employee',
           ColumnName   = 'IdentificationNumber',
           ID1          = i.id,
           OldValue     = d.identificationNumber,
           NewValue     = i.identificationNumber,
           CreatedDate  = i.createdOn,
           CreatedBy    = i.createdBy,
           ModifiedDate = i.updatedOn,
           ModifiedBy   = i.updatedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.IdentificationNumber, '') != ISNULL(i.IdentificationNumber, '');
  END


  /**********************
  ** TABLE: Employee
  ** FIELD: StartDateInCompany
  ***********************/
  IF UPDATE(StartDateInCompany)
  BEGIN
    INSERT INTO [dbo].[AuditHistory_SSI](tableName,
										columnName,
										idFeature,
										oldValue,
										newValue,
										createdDate,
										createdBy,
										modifiedDate,
										modifiedBy)
    SELECT TableName    = 'Employee',
           ColumnName   = 'StartDateInCompany',
           ID1          = i.id,
           OldValue     = d.startDateInCompany,
           NewValue     = i.startDateInCompany,
           CreatedDate  = i.createdOn,
           CreatedBy    = i.createdBy,
           ModifiedDate = i.updatedOn,
           ModifiedBy   = i.updatedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.StartDateInCompany, '') != ISNULL(i.StartDateInCompany, '');
  END


  /**********************
  ** TABLE: Employee
  ** FIELD: Health Condition Starting At Company
  ***********************/
  IF UPDATE(StartDateInCompany)
  BEGIN
    INSERT INTO [dbo].[AuditHistory_SSI](tableName,
										columnName,
										idFeature,
										oldValue,
										newValue,
										createdDate,
										createdBy,
										modifiedDate,
										modifiedBy)
    SELECT TableName    = 'Employee',
           ColumnName   = 'StartDateInCompany',
           ID1          = i.id,
           OldValue     = d.healthConditionStartingAtCompany,
           NewValue     = i.healthConditionStartingAtCompany,
           CreatedDate  = i.createdOn,
           CreatedBy    = i.createdBy,
           ModifiedDate = i.updatedOn,
           ModifiedBy   = i.updatedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.HealthConditionStartingAtCompany, '') != ISNULL(i.HealthConditionStartingAtCompany, '');
  END
END;
GO
PRINT '[TG_Employee(Audit)_InsertUpdate] trigger was created!';
