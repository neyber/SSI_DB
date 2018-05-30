
/******************************************************************************
**  Nombre: AuditHistory_SSI Table
**  Descripcion: Table for Audit History
**
**  Autor: Linet Torrico
**
**  Fecha: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Fecha:       Autor:            Descripcion:
** --------     -----------       ---------------------------------------------
** 05/29/2018   Linet Torrico    Initial version
*******************************************************************************/
Use ssiA

GO
IF EXISTS (SELECT * FROM sys.objects 
    WHERE object_id = OBJECT_ID(N'[dbo].[AuditHistory_SSI]') 
    )
BEGIN
  ALTER TABLE [dbo].[AuditHistory_SSI] DROP CONSTRAINT [DF_AuditHistory_ModifiedDate]
  ALTER TABLE [dbo].[AuditHistory_SSI] DROP CONSTRAINT [DF_AuditHistory_CreatedDate]
  DROP TABLE [dbo].[AuditHistory_SSI]
  PRINT '[AuditHistory_SSI] table was removed!';
  
  CREATE TABLE [dbo].[AuditHistory_SSI]
(
	[AuditHistoryId] INT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_AuditHistory] PRIMARY KEY,
	[TableName]		 VARCHAR(50) NULL,
	[ColumnName]	 VARCHAR(50) NULL,
	[ID]             INT NULL,
	[Date]           DATETIME NULL,
	[Oldvalue]       VARCHAR(MAX) NULL,
	[NewValue]       VARCHAR(MAX) NULL,
	[CreatedDate]    DATETIME NOT NULL,
	[ModifiedDate]   DATETIME NOT NULL,
	[ModifiedBy]     INT NULL,
	[CreatedBy]		 INT DEFAULT 0 NOT NULL,
);


ALTER TABLE [dbo].[AuditHistory_SSI] ADD CONSTRAINT [DF_AuditHistory_ModifiedDate]  DEFAULT (GETUTCDATE()) FOR [ModifiedDate]
ALTER TABLE [dbo].[AuditHistory_SSI] ADD CONSTRAINT [DF_AuditHistory_CreatedDate]  DEFAULT (GETUTCDATE()) FOR [CreatedDate]

	PRINT 'Table AuditHistory_SSI created!';
END
GO
