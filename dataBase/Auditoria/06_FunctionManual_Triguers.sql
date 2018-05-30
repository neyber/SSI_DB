
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
    INSERT INTO dbo.AuditHistory_SSI(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'FunctionManual', 
           ColumnName   = 'name',
           ID1          = i.Id, 
           Date         = @CurrDate, 
           OldValue     = d.[name], 
           NewValue     = i.[name],
           ModifiedBy   = i.updatedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.Id = i.Id)
    WHERE ISNULL(d.name, '') != ISNULL(i.name, '');
  END

    IF UPDATE(position)
  BEGIN
    INSERT INTO dbo.AuditHistory_SSI(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'FunctionManual', 
           ColumnName   = 'position',
           ID1          = i.Id, 
           Date         = @CurrDate, 
           OldValue     = d.[position], 
           NewValue     = i.[position],
           ModifiedBy   = i.updatedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.Id = i.Id)
    WHERE ISNULL(d.position, '') != ISNULL(i.position, '');
  END

      IF UPDATE(principalFunction)
  BEGIN
    INSERT INTO dbo.AuditHistory_SSI(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'FunctionManual', 
           ColumnName   = 'principalFunction',
           ID1          = i.Id, 
           Date         = @CurrDate, 
           OldValue     = d.[principalFunction], 
           NewValue     = i.[principalFunction],
           ModifiedBy   = i.updatedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.Id = i.Id)
    WHERE ISNULL(d.principalFunction, '') != ISNULL(i.principalFunction, '');
  END

END;
