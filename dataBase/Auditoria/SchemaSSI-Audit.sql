
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





/******** existing work item *****/
--Create table WorkItemClassification

IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.WorkItemClassification')
)
BEGIN
CREATE TABLE WorkItemClassification (Id INT IDENTITY(1,1) NOT NULL
					          , name VARCHAR(100) CONSTRAINT NN_Name NOT NULL
							  , description VARCHAR(200) CONSTRAINT NN_Description NOT NULL
							  , createdOn DATETIME NOT NULL
					          , updatedOn DATETIME NOT NULL
							  , isDeleted BIT
							  ,	[CreatedBy] [int]  NOT NULL
							  , [CreatedDate] [datetime]  NOT NULL
							  , [ModifiedBy] [int]        NOT NULL
							  , [ModifiedDate] [datetime] NOT NULL
                    , version BIGINT DEFAULT 1
                    CONSTRAINT PK_WorkItemClassification PRIMARY KEY(
                        [Id]
                    ));

                    ALTER TABLE [dbo].[WorkItemClassification] ADD CONSTRAINT [DF_WorkItemClassification_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [createdOn];
		            ALTER TABLE [dbo].[WorkItemClassification] ADD CONSTRAINT [DF_WorkItemClassification_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [updatedOn];
                    ALTER TABLE [dbo].[WorkItemClassification] ADD CONSTRAINT [DF_WorkItemClassification_IsDeleted]  DEFAULT (0) FOR [isDeleted]
					ALTER TABLE [dbo].[Department] ADD CONSTRAINT [DF_Department_CreatedDate]  DEFAULT (GETUTCDATE()) FOR [CreatedDate];
					ALTER TABLE [dbo].[Department] ADD CONSTRAINT [DF_Department_ModifiedDate]  DEFAULT (GETUTCDATE()) FOR [ModifiedDate]
					
					PRINT 'Table WorkItemClassification created!';
END
ELSE
	BEGIN
		PRINT 'Table WorkItemClassification already exists into the database';
	END
GO



--Create table WorkItem

IF NOT EXISTS (SELECT *
   FROM sys.[objects]
   WHERE Type = 'U'
   AND object_id = OBJECT_ID('dbo.WorkItem')
)
BEGIN
CREATE TABLE WorkItem (Id INT IDENTITY(1,1) NOT NULL
					          , name VARCHAR(100) CONSTRAINT NN_Name NOT NULL
                    , description VARCHAR(200) CONSTRAINT NN_Description NOT NULL
                    , workItemClassificationId INT
                    , createdOn DATETIME NOT NULL
					          , updatedOn DATETIME NOT NULL
                    , isDeleted BIT
                    , version BIGINT DEFAULT 1
                    CONSTRAINT PK_WorkItem PRIMARY KEY(
                        [Id]
                    ));

                    ALTER TABLE [dbo].[WorkItem] ADD CONSTRAINT [DF_WorkItem_CreatedOn]  DEFAULT (GETUTCDATE()) FOR [createdOn];
		                ALTER TABLE [dbo].[WorkItem] ADD CONSTRAINT [DF_WorkItem_UpdatedOn]  DEFAULT (GETUTCDATE()) FOR [updatedOn];
                    ALTER TABLE [dbo].[WorkItem] ADD CONSTRAINT [DF_WorkItem_IsDeleted]  DEFAULT (0) FOR [isDeleted]
					PRINT 'Table WorkItem created!';
END
ELSE
	BEGIN
		PRINT 'Table WorkItem already exists into the database';
	END
GO
