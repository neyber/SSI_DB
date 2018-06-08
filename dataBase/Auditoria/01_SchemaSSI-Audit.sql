
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
** 06/07/2018   Lizeth Salazar   Updated variables for AuditHistory_SSI table
*******************************************************************************/
Use ssiA

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuditHistory_SSI]') AND type in (N'U'))
BEGIN
	 ALTER TABLE [dbo].[AuditHistory_SSI] DROP CONSTRAINT [DF_AuditHistory_ModifiedDate]
  ALTER TABLE [dbo].[AuditHistory_SSI] DROP CONSTRAINT [DF_AuditHistory_CreatedDate]
  DROP TABLE [dbo].[AuditHistory_SSI]
  PRINT '[AuditHistory_SSI] table was removed!';
END	
GO


  
  CREATE TABLE [dbo].[AuditHistory_SSI]
(
	[idAuditHistory] INT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_AuditHistory] PRIMARY KEY,
	[tableName]		   VARCHAR(50) NULL,
	[columnName]	   VARCHAR(50) NULL,
	[idFeature]      INT NULL,
	[oldvalue]       VARCHAR(MAX) NULL,
	[newValue]       VARCHAR(MAX) NULL,
	[createdDate]    DATETIME  NULL,
	[createdBy]		   INT DEFAULT 0 NOT NULL,
	[modifiedDate]   DATETIME NOT NULL,
	[modifiedBy]     INT NULL
);


ALTER TABLE [dbo].[AuditHistory_SSI] ADD CONSTRAINT [DF_AuditHistory_ModifiedDate]  DEFAULT (GETUTCDATE()) FOR [ModifiedDate]
ALTER TABLE [dbo].[AuditHistory_SSI] ADD CONSTRAINT [DF_AuditHistory_CreatedDate]  DEFAULT (GETUTCDATE()) FOR [CreatedDate]



/******************************************************************************
**  Nombre: WorkItem Table
**  Descripcion: Alter for table
**
**  Autor: Linet Torrico
**
**  Fecha: 06/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Fecha:       Autor:            Descripcion:
** --------     -----------       ---------------------------------------------
** 05/29/2018   Linet Torrico    Initial version
*******************************************************************************/

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'createdBy' AND Object_ID = Object_ID(N'dbo.WorkItem'))    
BEGIN
ALTER TABLE dbo.WorkItem ADD [createdBy]   int default 0
END

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'updatedBy' AND Object_ID = Object_ID(N'dbo.WorkItem'))    
BEGIN
ALTER TABLE dbo.WorkItem ADD [updatedBy] int
END



/******************************************************************************
**  Nombre: WorkItemClassification Table  
**  Descripcion: Alter for table WorkItemClassification in order to include the 
**  audit fields createdBy and updatedBy
**  
**  Autor: Linet Torrico
**
**  Fecha: 06/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Fecha:       Autor:            Descripcion:
** --------     -----------       ---------------------------------------------
** 05/29/2018   Linet Torrico    Initial version
*******************************************************************************/

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'createdBy' AND Object_ID = Object_ID(N'dbo.WorkItemClassification'))    
BEGIN
ALTER TABLE dbo.WorkItemClassification ADD [createdBy]   int default 0
END

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'updatedBy' AND Object_ID = Object_ID(N'dbo.WorkItemClassification'))    
BEGIN
ALTER TABLE dbo.WorkItemClassification ADD [updatedBy] int
END


/******************************************************************************
**  Nombre: ExistingPpe Table  
**  Descripcion: Alter for table ExistingPpe in order to include the 
**  audit fields createdBy and updatedBy
**  
**  Autor: Linet Torrico
**
**  Fecha: 06/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Fecha:       Autor:            Descripcion:
** --------     -----------       ---------------------------------------------
** 05/29/2018   Linet Torrico    Initial version
*******************************************************************************/

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'createdBy' AND Object_ID = Object_ID(N'dbo.ExistingPpe'))    
BEGIN
ALTER TABLE dbo.ExistingPpe ADD [createdBy]   int default 0
END

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'updatedBy' AND Object_ID = Object_ID(N'dbo.ExistingPpe'))    
BEGIN
ALTER TABLE dbo.ExistingPpe ADD [updatedBy] int
END


/******************************************************************************
**  Nombre: ExistingPpeAssigned Table  
**  Descripcion: Alter for table ExistingPpeAssigned in order to include the 
**  audit fields createdBy and updatedBy
**  
**  Autor: Linet Torrico
**
**  Fecha: 06/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Fecha:       Autor:            Descripcion:
** --------     -----------       ---------------------------------------------
** 05/29/2018   Linet Torrico    Initial version
*******************************************************************************/

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'createdBy' AND Object_ID = Object_ID(N'dbo.ExistingPpeAssigned'))    
BEGIN
ALTER TABLE dbo.ExistingPpeAssigned ADD [createdBy]   int default 0
END

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'updatedBy' AND Object_ID = Object_ID(N'dbo.ExistingPpeAssigned'))    
BEGIN
ALTER TABLE dbo.ExistingPpeAssigned ADD [updatedBy] int
END

/******************************************************************************
**  Nombre: FunctionManual Table  
**  Descripcion: Alter for table FunctionManual in order to include the 
**  audit fields createdBy and updatedBy
**  
**  Autor: Linet Torrico
**
**  Fecha: 06/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Fecha:       Autor:            Descripcion:
** --------     -----------       ---------------------------------------------
** 05/29/2018   Linet Torrico    Initial version
*******************************************************************************/

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'createdBy' AND Object_ID = Object_ID(N'dbo.FunctionManual'))    
BEGIN
ALTER TABLE dbo.FunctionManual ADD [createdBy]   int default 0
END

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'updatedBy' AND Object_ID = Object_ID(N'dbo.FunctionManual'))    
BEGIN
ALTER TABLE dbo.FunctionManual ADD [updatedBy] int
END

