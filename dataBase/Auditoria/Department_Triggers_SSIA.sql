/******************************************************************************
**  Nombre: TG_Department(Audit)_InsertUpdate
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
    WHERE object_id = OBJECT_ID(N'[dbo].[TG_Department(Audit)_InsertUpdate]') 
    AND type = 'TR')
BEGIN
  DROP TRIGGER [dbo].[TG_Department(Audit)_InsertUpdate];
  PRINT '[TG_Department(Audit)_InsertUpdate] was removed!';
END
GO

CREATE TRIGGER [dbo].[TG_Department(Audit)_InsertUpdate]
ON [dbo].[Department]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();

  /**********************
  ** TABLE: Department
  ** FIELD: Name
  ***********************/
  IF UPDATE(Name)
  BEGIN
    INSERT INTO [dbo].[AuditHistory_SSI](TableName, 
										ColumnName, 
										ID, 
										Date, 
										OldValue, 
										NewValue) 
    SELECT TableName    = 'Department', 
           ColumnName   = 'Name',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.name, 
           NewValue     = i.name         
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.name, '') != ISNULL(i.name, '');
  END


  /**********************
  ** TABLE: Department
  ** FIELD: Description
  ***********************/
  IF UPDATE(Description)
  BEGIN
    INSERT INTO [dbo].[AuditHistory_SSI](TableName, 
										ColumnName, 
										ID, 
										Date, 
										OldValue, 
										NewValue) 
    SELECT TableName    = 'Department', 
           ColumnName   = 'Description',
           ID1          = i.id, 
           Date         = @CurrDate, 
           OldValue     = d.description, 
           NewValue     = i.description         
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.id = i.id)
    WHERE ISNULL(d.description, '') != ISNULL(i.description, '');
  END
END;
GO
PRINT '[TG_Department(Audit)_InsertUpdate] trigger was created!';
