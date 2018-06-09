/******************************************************************************
**  Nombre: TG_Audit(Audit)_InsertUpdate
**  Descripcion:
**
**  Autor: Lizeth Salazar
**
**  Fecha: 05/29/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Fecha:       Autor:           Descripcion:
** --------     -----------      -----------------------------------------------
** 05/29/2018   Lizeth Salazar   Initial version
** 06/08/2018   Lizeth Salazar    Completing fields to be completely mapped
*******************************************************************************/


USE ssiA;

/*
** Reviewing the trigger does not exist, if it does, the script will remove it.
*/
IF EXISTS (SELECT * FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[TG_Audit(Audit)_InsertUpdate]')
    AND type = 'TR')
BEGIN
  DROP TRIGGER [dbo].[TG_Audit(Audit)_InsertUpdate];
  PRINT '[TG_Audit(Audit)_InsertUpdate] trigger was removed!';
END
GO

CREATE TRIGGER [dbo].[TG_Audit(Audit)_InsertUpdate]
ON [dbo].[Audit]
FOR INSERT, UPDATE, DELETE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  /**********************
  ** TABLE: Audit
  ** FIELD: AuditCode
  ***********************/
  IF UPDATE(AuditCode)
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
    SELECT TableName    = 'Audit',
           ColumnName   = 'AuditCode',
           ID1          = i.id,
           OldValue     = d.auditCode,
           NewValue     = i.auditCode,
           CreatedDate  = i.createdOn,
           CreatedBy    = i.createdBy,
           ModifiedDate = i.updatedOn,
           ModifiedBy   = i.updatedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.auditCode, '') != ISNULL(i.auditCode, '');
  END


  /**********************
  ** TABLE: Audit
  ** FIELD: AuditCriteria
  ***********************/
  IF UPDATE(AuditCriteria)
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
    SELECT TableName    = 'Audit',
           ColumnName   = 'AuditCriteria',
           ID1          = i.id,
           OldValue     = d.auditCriteria,
           NewValue     = i.auditCriteria,
           CreatedDate  = i.createdOn,
           CreatedBy    = i.createdBy,
           ModifiedDate = i.updatedOn,
           ModifiedBy   = i.updatedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.auditCriteria, '') != ISNULL(i.auditCriteria, '');
  END


  /**********************
  ** TABLE: Audit
  ** FIELD: AuditName
  ***********************/
  IF UPDATE(AuditName)
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
    SELECT TableName    = 'Audit',
           ColumnName   = 'AuditName',
           ID1          = i.id,
           OldValue     = d.auditName,
           NewValue     = i.auditName,
           CreatedDate  = i.createdOn,
           CreatedBy    = i.createdBy,
           ModifiedDate = i.updatedOn,
           ModifiedBy   = i.updatedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.auditName, '') != ISNULL(i.auditName, '');
  END


  /**********************
  ** TABLE: Audit
  ** FIELD: AuditObjective
  ***********************/
  IF UPDATE(AuditObjective)
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
    SELECT TableName    = 'Audit',
           ColumnName   = 'AuditObjective',
           ID1          = i.id,
           OldValue     = d.auditObjective,
           NewValue     = i.auditObjective,
           CreatedDate  = i.createdOn,
           CreatedBy    = i.createdBy,
           ModifiedDate = i.updatedOn,
           ModifiedBy   = i.updatedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.auditObjective, '') != ISNULL(i.auditObjective, '');
  END


  /**********************
  ** TABLE: Audit
  ** FIELD: AuditScope
  ***********************/
  IF UPDATE(AuditScope)
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
    SELECT TableName    = 'Audit',
           ColumnName   = 'AuditScope',
           ID1          = i.id,
           OldValue     = d.auditScope,
           NewValue     = i.auditScope,
           CreatedDate  = i.createdOn,
           CreatedBy    = i.createdBy,
           ModifiedDate = i.updatedOn,
           ModifiedBy   = i.updatedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.auditScope, '') != ISNULL(i.auditScope, '');
  END


  /**********************
  ** TABLE: Audit
  ** FIELD: AuditType
  ***********************/
  IF UPDATE(AuditType)
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
    SELECT TableName    = 'Audit',
           ColumnName   = 'AuditType',
           ID1          = i.id,
           OldValue     = d.auditType,
           NewValue     = i.auditType,
           CreatedDate  = i.createdOn,
           CreatedBy    = i.createdBy,
           ModifiedDate = i.updatedOn,
           ModifiedBy   = i.updatedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.auditType, '') != ISNULL(i.auditType, '');
  END


  /**********************
  ** TABLE: Audit
  ** FIELD: Periodicity
  ***********************/
  IF UPDATE(Periodicity)
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
    SELECT TableName    = 'Audit',
           ColumnName   = 'Periodicity',
           ID1          = i.id,
           OldValue     = d.periodicity,
           NewValue     = i.periodicity,
           CreatedDate  = i.createdOn,
           CreatedBy    = i.createdBy,
           ModifiedDate = i.updatedOn,
           ModifiedBy   = i.updatedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.periodicity, '') != ISNULL(i.periodicity, '');
  END
END;
GO
PRINT '[TG_Audit(Audit)_InsertUpdate] trigger was created!';
