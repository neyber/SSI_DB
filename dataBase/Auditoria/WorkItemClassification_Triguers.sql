
/******************************************************************************
**  Nombre: TG_WorkItemClassification(Audit)_InsertUpdate
**  Descripcion: 
**
**  Autor: Linet Torrico
**
**  Fecha: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Fecha:       Autor:           Descripcion:
** --------     -----------      -----------------------------------------------
** 05/28/2018   Linet Torrico   Initial version
*******************************************************************************/



/*
** Reviewing the trigger does not exist, if it does, the script will remove it.
*/
IF EXISTS (SELECT * FROM sys.objects 
    WHERE object_id = OBJECT_ID(N'[dbo].[TG_WorkItemClassification(Audit)_InsertUpdate]') 
    AND type = 'TR')
BEGIN
  DROP TRIGGER [dbo].[TG_WorkItemClassification(Audit)_InsertUpdate];
  PRINT '[TG_WorkItemClassification(Audit)_InsertUpdate] trigger was removed!';
END
GO


CREATE TRIGGER [dbo].[TG_WorkItemClassification(Audit)_InsertUpdate]

ON [dbo].[WorkItemClassification]

FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(updatedOn)
  BEGIN
    INSERT INTO dbo.AuditHistory_SSI(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'WorkItemClassification', 
           ColumnName   = 'updatedOn',
           ID1          = i.Id, 
           Date         = @CurrDate, 
           OldValue     = d.[updatedOn], 
           NewValue     = i.[updatedOn],
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.Id = i.Id)
    WHERE ISNULL(d.updatedOn, '') != ISNULL(i.updatedOn, '');
  END

    IF UPDATE(createdOn)
  BEGIN
    INSERT INTO dbo.AuditHistory_SSI(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 CreatedBy) 
    SELECT TableName    = 'WorkItemClassification', 
           ColumnName   = 'createdOn',
           ID1          = i.Id, 
           Date         = @CurrDate, 
           OldValue     = d.[createdOn], 
           NewValue     = i.[createdOn],
           ModifiedBy   = i.CreatedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.Id = i.Id)
    WHERE ISNULL(d.createdOn, '') != ISNULL(i.createdOn, '');
  END
  PRINT '[TG_WorkItemClassification(Audit)_InsertUpdate] trigger was Created!';
END;
