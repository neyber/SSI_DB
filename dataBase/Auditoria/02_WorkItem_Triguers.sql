
/******************************************************************************
**  Nombre: TG_WorkItem(Audit)_InsertUpdate
**  Descripcion: This Trigger generate audit information when a name or 
**  new register is created or updated from WorkITem Table
**  Autor: Linet Torrico
**
**  Fecha: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Fecha:       Autor:           Descripcion:
** --------     -----------      -----------------------------------------------
** 05/28/2018   Linet Torrico   Initial version
** 05/29/2018   Linet Torrico   Modification for Name, CreatedBy and UpdatedBy
*******************************************************************************/

Use ssiA


IF EXISTS (SELECT * FROM sys.objects 
    WHERE object_id = OBJECT_ID(N'[dbo].[TG_WorkItem(Audit)_InsertUpdate]') 
    AND type = 'TR')
BEGIN
  DROP TRIGGER [dbo].[TG_WorkItem(Audit)_InsertUpdate];
  PRINT '[TG_WorkItem(Audit)_InsertUpdate] trigger was removed!';
END
GO


CREATE TRIGGER [dbo].[TG_WorkItem(Audit)_InsertUpdate]

ON [dbo].[WorkItem]

FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(name)
  BEGIN
    INSERT INTO dbo.AuditHistory_SSI(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'WorkItem', 
           ColumnName   = 'updatedOn',
           ID1          = i.Id, 
           Date         = @CurrDate, 
           OldValue     = d.[name], 
           NewValue     = i.[name],
           ModifiedBy   = i.updatedBy          
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
    SELECT TableName    = 'WorkItem', 
           ColumnName   = 'createdOn',
           ID1          = i.Id, 
           Date         = @CurrDate, 
           OldValue     = d.[createdOn], 
           NewValue     = i.[createdOn],
           CreatedBy   = i.createdBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.Id = i.Id)
    WHERE ISNULL(d.createdOn, '') != ISNULL(i.createdOn, '');
  END

END;
