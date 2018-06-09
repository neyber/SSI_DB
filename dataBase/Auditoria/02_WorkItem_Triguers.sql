
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
    INSERT INTO dbo.AuditHistory_SSI(tableName, 
                                 columnName, 
                                 idFeature, 
                                 oldvalue, 
                                 newValue, 
                                 createdDate,
								 createdBy, 
                                 modifiedDate,
								 modifiedBy) 
    SELECT tableName    = 'WorkItem', 
           columnName   = 'name',
           idFeature    = i.Id, 
           oldvalue     = d.[name], 
           newValue     = i.[name], 
           createdDate  = @CurrDate,
           createdBy    = i.createdBy,
		   modifiedDate = i.updatedOn,
		   modifiedBy   = 1         
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.Id = i.Id)
    WHERE ISNULL(d.updatedOn, '') != ISNULL(i.updatedOn, '');
  END


  IF UPDATE(description)
  BEGIN
    INSERT INTO dbo.AuditHistory_SSI(tableName, 
                                 columnName, 
                                 idFeature, 
                                 oldvalue, 
                                 newValue, 
                                 createdDate,
								 createdBy, 
                                 modifiedDate,
								 modifiedBy) 
    SELECT tableName    = 'WorkItem', 
           columnName   = 'description',
           idFeature    = i.Id, 
           oldvalue     = d.[description], 
           newValue     = i.[description], 
           createdDate  = @CurrDate,
           createdBy    = i.createdBy,
		   modifiedDate = i.updatedOn,
		   modifiedBy   = 1         
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.Id = i.Id)
    WHERE ISNULL(d.updatedOn, '') != ISNULL(i.updatedOn, '');
  END

  PRINT '[TG_WorkItem(Audit)_InsertUpdate]';
END;



