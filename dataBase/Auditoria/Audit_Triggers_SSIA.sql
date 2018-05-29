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
FOR INSERT, UPDATE
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
    INSERT INTO [dbo].[AuditHistory_SSI](TableName, 
										ColumnName, 
										ID, 
										Date, 
										OldValue, 
										NewValue) 
    SELECT TableName    = 'Audit', 
           ColumnName   = 'AuditCode',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.auditCode, 
           NewValue     = i.auditCode         
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
    INSERT INTO [dbo].[AuditHistory_SSI](TableName, 
										ColumnName, 
										ID, 
										Date, 
										OldValue, 
										NewValue) 
    SELECT TableName    = 'Audit', 
           ColumnName   = 'AuditCriteria',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.auditCriteria, 
           NewValue     = i.auditCriteria         
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
    INSERT INTO [dbo].[AuditHistory_SSI](TableName, 
										ColumnName, 
										ID, 
										Date, 
										OldValue, 
										NewValue) 
    SELECT TableName    = 'Audit', 
           ColumnName   = 'AuditName',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.auditName, 
           NewValue     = i.auditName         
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
    INSERT INTO [dbo].[AuditHistory_SSI](TableName, 
										ColumnName, 
										ID, 
										Date, 
										OldValue, 
										NewValue) 
    SELECT TableName    = 'Audit', 
           ColumnName   = 'AuditObjective',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.auditObjective, 
           NewValue     = i.auditObjective         
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
    INSERT INTO [dbo].[AuditHistory_SSI](TableName, 
										ColumnName, 
										ID, 
										Date, 
										OldValue, 
										NewValue) 
    SELECT TableName    = 'Audit', 
           ColumnName   = 'AuditScope',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.auditScope, 
           NewValue     = i.auditScope         
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
    INSERT INTO [dbo].[AuditHistory_SSI](TableName, 
										ColumnName, 
										ID, 
										Date, 
										OldValue, 
										NewValue) 
    SELECT TableName    = 'Audit', 
           ColumnName   = 'AuditType',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.auditType, 
           NewValue     = i.auditType         
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
    INSERT INTO [dbo].[AuditHistory_SSI](TableName, 
										ColumnName, 
										ID, 
										Date, 
										OldValue, 
										NewValue) 
    SELECT TableName    = 'Audit', 
           ColumnName   = 'Periodicity',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.periodicity, 
           NewValue     = i.periodicity         
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.periodicity, '') != ISNULL(i.periodicity, '');
  END
END;
GO
PRINT '[TG_Audit(Audit)_InsertUpdate] trigger was created!';
