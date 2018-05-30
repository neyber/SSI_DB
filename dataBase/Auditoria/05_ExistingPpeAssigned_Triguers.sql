
/******************************************************************************
**  Nombre: TG_ExistingPpeAssigned(Audit)_InsertUpdate
**  Descripcion: Triguer to know when 
**  the equipament related with personal protection has been changed
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
    WHERE object_id = OBJECT_ID(N'[dbo].[TG_ExistingPpeAssigned(Audit)_InsertUpdate]') 
    AND type = 'TR')
BEGIN
  DROP TRIGGER [dbo].[TG_ExistingPpeAssigned(Audit)_InsertUpdate]
  PRINT '[TG_ExistingPpeAssigned(Audit)_InsertUpdate] trigger was removed!';
END
GO


CREATE TRIGGER [dbo].[TG_ExistingPpeAssigned(Audit)_InsertUpdate]

ON [dbo].[ExistingPpeAssigned]

FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(assignedNotes)
  BEGIN
    INSERT INTO dbo.AuditHistory_SSI(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'ExistingPpeAssigned', 
           ColumnName   = 'assignedNotes',
           ID1          = i.Id, 
           Date         = @CurrDate, 
           OldValue     = d.[assignedNotes], 
           NewValue     = i.[assignedNotes],
           ModifiedBy   = i.updatedBy
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.Id = i.Id)
    WHERE ISNULL(d.assignedNotes, '') != ISNULL(i.assignedNotes, '');
  END

    IF UPDATE(returnNotes)
  BEGIN
    INSERT INTO dbo.AuditHistory_SSI(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'ExistingPpeAssigned', 
           ColumnName   = 'returnNotes',
           ID1          = i.Id, 
           Date         = @CurrDate, 
           OldValue     = d.[returnNotes], 
           NewValue     = i.[returnNotes],
           ModifiedBy   = i.updatedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.Id = i.Id)
    WHERE ISNULL(d.returnNotes, '') != ISNULL(i.returnNotes, '');
  END
END;
 