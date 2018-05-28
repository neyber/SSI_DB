
/******************************************************************************
**  Name: Create Schema Audit
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