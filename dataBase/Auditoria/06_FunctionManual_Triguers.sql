
/******************************************************************************
**  Nombre: TG_FunctionManual(Audit)_InsertUpdate
**  Descripcion: Triguer to know when 
**  the funtions related with personal has been changed
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

Use ssiA


IF EXISTS (SELECT * FROM sys.objects 
    WHERE object_id = OBJECT_ID(N'[dbo].[TG_FunctionManual(Audit)InsertUpdate]') 
    AND type = 'TR')
BEGIN
  DROP TRIGGER [dbo].[TG_FunctionManual(Audit)InsertUpdate];
  PRINT '[TG_FunctionManual(Audit)_InsertUpdate] trigger was removed!';
END
GO


CREATE TRIGGER [dbo].[TG_FunctionManual(Audit)_InsertUpdate]

ON [dbo].[FunctionManual]

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
    SELECT  
		   tableName    = 'FunctionManual', 
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

    IF UPDATE(position)
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
    SELECT  tableName    = 'FunctionManual', 
           columnName   = 'position',
           idFeature    = i.Id, 
           oldvalue     = d.[position], 
           newValue     = i.[position], 
           createdDate  = i.createdOn,
           createdBy    = i.createdBy,
		   modifiedDate = i.updatedOn,
		   modifiedBy   = i.updatedBy           
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.Id = i.Id)
    WHERE ISNULL(d.position, '') != ISNULL(i.position, '');
  END

      IF UPDATE(principalFunction)
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
    SELECT  
		   tableName    = 'FunctionManual', 
           columnName   = 'principalFunction',
           idFeature    = i.Id, 
           oldvalue     = d.[principalFunction], 
           newValue     = i.[principalFunction], 
           createdDate  = i.createdOn,
           createdBy    = i.createdBy,
		   modifiedDate = i.updatedOn,
		   modifiedBy   = i.updatedBy        
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.Id = i.Id)
    WHERE ISNULL(d.principalFunction, '') != ISNULL(i.principalFunction, '');
  END

END;
