
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
** 05/29/2018   Linet Torrico   Including name and description for audit
*******************************************************************************/

Use ssiA

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
		   
    SELECT tableName    = 'WorkItemClassification', 
           columnName   = 'name',
           idFeature    = i.Id, 
           oldvalue     = d.[name], 
           newValue     = i.[name], 
           createdDate  = i.createdOn,
           createdBy    = i.createdBy,
		   modifiedDate = i.updatedOn,
		   modifiedBy   = i.updatedBy  
		            
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.Id = i.Id)
    WHERE ISNULL(d.name, '') != ISNULL(i.name, '');
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
    SELECT tableName    = 'WorkItemClassification', 
           columnName   = 'description',
           idFeature    = i.Id, 
           oldvalue     = d.[description], 
           newValue     = i.[description], 
           createdDate  = i.createdOn,
           createdBy    = i.createdBy,
		   modifiedDate = i.updatedOn,
		   modifiedBy   = i.updatedBy       
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.Id = i.Id)
    WHERE ISNULL(d.description, '') != ISNULL(i.description, '');
  END
  PRINT '[TG_WorkItemClassification(Audit)_InsertUpdate] trigger was Created!';
END;
