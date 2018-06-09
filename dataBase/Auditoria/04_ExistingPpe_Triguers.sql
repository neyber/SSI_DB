
/******************************************************************************
**  Nombre: TG_ExistingPpe(Audit)_InsertUpdate
**  Descripcion: Triguer to know when 
**  the equipament related with personal protection has been changed
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

/*
** Reviewing the trigger does not exist, if it does, the script will remove it.
*/
IF EXISTS (SELECT * FROM sys.objects 
    WHERE object_id = OBJECT_ID(N'[dbo].[TG_ExistingPpe(Audit)_InsertUpdate]') 
    AND type = 'TR')
BEGIN
  DROP TRIGGER [dbo].[TG_ExistingPpe(Audit)_InsertUpdate];
  PRINT '[TG_ExistingPpe(Audit)_InsertUpdate] trigger was removed!';
END
GO


CREATE TRIGGER [dbo].[TG_ExistingPpe(Audit)_InsertUpdate]

ON [dbo].[ExistingPpe]

FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(detail) 
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
    SELECT tableName    = 'ExistingPpe', 
           columnName   = 'detail',
           idFeature    = i.Id, 
           oldvalue     = d.[detail], 
           newValue     = i.[detail], 
           createdDate  = i.createdOn,
           createdBy    = i.createdBy,
		   modifiedDate = i.updatedOn,
		   modifiedBy   = i.updatedBy 
		    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.Id = i.Id)
    WHERE ISNULL(d.detail, '') != ISNULL(i.detail, '');
  END

    IF UPDATE(lifeTimeDays)
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
    SELECT tableName    = 'ExistingPpe', 
           columnName   = 'lifeTimeDays',
           idFeature    = i.Id, 
           oldvalue     = d.[lifeTimeDays], 
           newValue     = i.[lifeTimeDays], 
           createdDate  = i.createdOn,
           createdBy    = i.createdBy,
		   modifiedDate = i.updatedOn,
		   modifiedBy   = i.updatedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.Id = i.Id)
    WHERE ISNULL(d.lifeTimeDays, '') != ISNULL(i.lifeTimeDays, '');
  END

END;
