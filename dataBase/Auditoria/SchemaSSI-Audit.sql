
/******************************************************************************
**  Name: Create Table Audit
**  Desc: add sentences to create table and field for Audit
**
**  Author: Linet Torrico 
**  Description: Table AuditHistory_SSI
**  Date: 05/27/2018
*******************************************************************************/

IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.AuditHistory_SSI')
)
BEGIN
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
	[ModifiedBy]     INT
);


ALTER TABLE [dbo].[AuditHistory_SSI] ADD CONSTRAINT [DF_AuditHistory_ModifiedDate]  DEFAULT (GETUTCDATE()) FOR [ModifiedDate]


	PRINT 'Table AuditHistory_SSI created!';
END
ELSE
 BEGIN
  PRINT 'Table AuditHistory_SSI already exists into the database';
 END
GO

/******************************************************************************
**  Name: Alter Table WorkItemClassification
**  Desc: Adding columns CreatedBy and ModifiedBy
**
**  Author: Linet Torrico 
**  Description: Table AuditHistory_SSI
**  Date: 05/27/2018
*******************************************************************************/

/******** existing work item *****/
--Alter table WorkItemClassification

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
				 ALTER TABLE dbo.WorkItemClassification ADD [CreatedBy] [int]  NOT NULL;
				END
				GO


				IF not exists
				(
				 SELECT *
				 FROM INFORMATION_SCHEMA.COLUMNS
				 WHERE COLUMN_NAME = 'ModifiedBy' AND TABLE_NAME = 'WorkItemClassification'
				)
				BEGIN
				 ALTER TABLE dbo.WorkItemClassification ADD [ModifiedBy] [int]  NOT NULL;
				END
				GO


	BEGIN
		PRINT 'Table WorkItemClassification already updated into the database';
	END
GO

/******************************************************************************
**  Name: Alter Table WorkItemClassification
**  Desc: Adding columns CreatedBy and ModifiedBy
**
**  Author: Linet Torrico 
**  Description: Table AuditHistory_SSI
**  Date: 05/27/2018
*******************************************************************************/

	