/******************************************************************************
**  Nombre: TG_Sickness(Audit)_InsertUpdate
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
** 05/28/2018   Lizeth Salazar   Initial version
** 06/08/2018   Lizeth Salazar    Completing fields to be completely mapped
*******************************************************************************/


USE ssiA;

/*
** Reviewing the trigger does not exist, if it does, the script will remove it.
*/
IF EXISTS (SELECT * FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[TG_Sickness(Audit)_InsertUpdate]')
    AND type = 'TR')
BEGIN
  DROP TRIGGER [dbo].[TG_Sickness(Audit)_InsertUpdate];
  PRINT '[TG_Sickness(Audit)_InsertUpdate] trigger was removed!';
END
GO

CREATE TRIGGER [dbo].[TG_Sickness(Audit)_InsertUpdate]
ON [dbo].[Sickness]
FOR INSERT, UPDATE, DELETE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  /**********************
  ** TABLE: Sickness
  ** FIELD: Employee Id
  ***********************/
  IF UPDATE(EmployeeId)
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
    SELECT TableName    = 'Sickness',
           ColumnName   = 'EmployeeId',
           ID1          = i.id,
           OldValue     = d.employeeId,
           NewValue     = i.employeeId,
           CreatedDate  = i.createdOn,
           CreatedBy    = i.createdBy,
           ModifiedDate = i.updatedOn,
           ModifiedBy   = i.updatedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.employeeId, '') != ISNULL(i.employeeId, '');
  END


  /**********************
  ** TABLE: Sickness
  ** FIELD: Description
  ***********************/
  IF UPDATE(Description)
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
    SELECT TableName    = 'Sickness',
           ColumnName   = 'Description',
           ID1          = i.id,
           OldValue     = d.description,
           NewValue     = i.description,
           CreatedDate  = i.createdOn,
           CreatedBy    = i.createdBy,
           ModifiedDate = i.updatedOn,
           ModifiedBy   = i.updatedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.description, '') != ISNULL(i.description, '');
  END


  /**********************
  ** TABLE: Sickness
  ** FIELD: Date Of Sickness
  ***********************/
  IF UPDATE(DateSickness)
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
    SELECT TableName    = 'Sickness',
           ColumnName   = 'DateSickness',
           ID1          = i.id,
           OldValue     = d.dateSickness,
           NewValue     = i.dateSickness,
           CreatedDate  = i.createdOn,
           CreatedBy    = i.createdBy,
           ModifiedDate = i.updatedOn,
           ModifiedBy   = i.updatedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.dateSickness, '') != ISNULL(i.dateSickness, '');
  END


  /**********************
  ** TABLE: Sickness
  ** FIELD: Where did it occur
  ***********************/
  IF UPDATE(WhereOccurr)
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
    SELECT TableName    = 'Sickness',
           ColumnName   = 'WhereOccurr',
           ID1          = i.id,
           OldValue     = d.whereOccurr,
           NewValue     = i.whereOccurr,
           CreatedDate  = i.createdOn,
           CreatedBy    = i.createdBy,
           ModifiedDate = i.updatedOn,
           ModifiedBy   = i.updatedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.whereOccurr, '') != ISNULL(i.whereOccurr, '');
  END


  /**********************
  ** TABLE: Sickness
  ** FIELD: Total Days Out Of Work
  ***********************/
  IF UPDATE(TotalDaysOutOfWork)
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
    SELECT TableName    = 'Sickness',
           ColumnName   = 'TotalDaysOutOfWork',
           ID1          = i.id,
           OldValue     = d.totalDaysOutOfWork,
           NewValue     = i.totalDaysOutOfWork,
           CreatedDate  = i.createdOn,
           CreatedBy    = i.createdBy,
           ModifiedDate = i.updatedOn,
           ModifiedBy   = i.updatedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.totalDaysOutOfWork, '') != ISNULL(i.totalDaysOutOfWork, '');
  END


  /**********************
  ** TABLE: Sickness
  ** FIELD: Total Days Restricted Transferred Work
  ***********************/
  IF UPDATE(TotalDaysRestrictedTransferredWork)
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
    SELECT TableName    = 'Sickness',
           ColumnName   = 'TotalDaysRestrictedTransferredWork',
           ID1          = i.id,
           OldValue     = d.totalDaysRestrictedTransferredWork,
           NewValue     = i.totalDaysRestrictedTransferredWork,
           CreatedDate  = i.createdOn,
           CreatedBy    = i.createdBy,
           ModifiedDate = i.updatedOn,
           ModifiedBy   = i.updatedBy
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.totalDaysRestrictedTransferredWork, '') != ISNULL(i.totalDaysRestrictedTransferredWork, '');
  END
END;
GO
PRINT '[TG_Sickness(Audit)_InsertUpdate] trigger was created!';
