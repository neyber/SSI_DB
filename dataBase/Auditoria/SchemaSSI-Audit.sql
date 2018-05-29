
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


IF EXISTS (SELECT * FROM sys.objects 
    WHERE object_id = OBJECT_ID(N'[dbo].[AuditHistory_SSI]') 
    )
BEGIN
  ALTER TABLE [dbo].[AuditHistory_SSI] DROP CONSTRAINT [DF_AuditHistory_ModifiedDate]
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
	[ModifiedDate]   DATETIME NOT NULL,
	[ModifiedBy]     INT NULL,
	[CreatedBy]		 INT NULL,
);


ALTER TABLE [dbo].[AuditHistory_SSI] ADD CONSTRAINT [DF_AuditHistory_ModifiedDate]  DEFAULT (GETUTCDATE()) FOR [ModifiedDate]


	PRINT 'Table AuditHistory_SSI created!';
END

 
/******************************************************************************
**  Nombre: WorkItemClassification Table
**  Descripcion: Alter to WorkItemClassification table adding CreatedBy and
**  ModifiedBy
**  Autor: Linet Torrico
**
**  Fecha: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Fecha:       Autor:            Descripcion:
** --------     -----------       ---------------------------------------------
** 05/28/2018   Linet Torrico    Initial version
*******************************************************************************/



IF EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.WorkItemClassification')
)

				IF not exists
				(
				 SELECT *
				 FROM INFORMATION_SCHEMA.COLUMNS
				 WHERE COLUMN_NAME = 'CreatedBy' AND TABLE_NAME = 'WorkItemClassification'
				)
				BEGIN
				 ALTER TABLE dbo.WorkItemClassification ADD [CreatedBy] [int]  NULL;
				END
				GO


				IF not exists
				(
				 SELECT *
				 FROM INFORMATION_SCHEMA.COLUMNS
				 WHERE COLUMN_NAME = 'ModifiedBy' AND TABLE_NAME = 'WorkItemClassification'
				)
				BEGIN
				 ALTER TABLE dbo.WorkItemClassification ADD [ModifiedBy] [int]  NULL;
				END
				GO


	BEGIN
		PRINT 'Table WorkItemClassification already updated into the database';
	END
GO



/******************************************************************************
**  Nombre: WorkItem Table
**  Descripcion: Alter Table WorkItem adding CreatedBy and ModifiedBy
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

IF EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.WorkItem')
)

				IF not exists
				(
				 SELECT *
				 FROM INFORMATION_SCHEMA.COLUMNS
				 WHERE COLUMN_NAME = 'CreatedBy' AND TABLE_NAME = 'WorkItem'
				)
				BEGIN
				 ALTER TABLE dbo.WorkItem ADD [CreatedBy] [int]  NULL;
				END
				GO


				IF not exists
				(
				 SELECT *
				 FROM INFORMATION_SCHEMA.COLUMNS
				 WHERE COLUMN_NAME = 'ModifiedBy' AND TABLE_NAME = 'WorkItem'
				)
				BEGIN
				 ALTER TABLE dbo.WorkItem ADD [ModifiedBy] [int]  NULL;
				END
				GO


	BEGIN
		PRINT 'Table WorkItem already updated into the database';
	END
GO	