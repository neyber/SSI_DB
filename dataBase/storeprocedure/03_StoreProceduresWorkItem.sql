

--start miguel
USE ssiA;


-- Create proGetWorkItemClassification stored procedure.
IF EXISTS (SELECT * FROM sys.objects
           WHERE object_id = OBJECT_ID(N'[dbo].[proGetWorkItemClassification]')
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.proGetWorkItemClassification;
END
GO
/******************************************************************************
**  Name: proGetWorkItemClassification
**  Desc: Get an WorkItem Classification
**
**  Called by: SSI
**
**  Author: Miguel Rojas
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:       Author:                        Description:
** --------     --------       ------------------------------------------------
** 29/05/2018  Miguel Rojas   Initial version
*******************************************************************************/
CREATE PROCEDURE dbo.proGetWorkItemClassification
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT id
            , name
            , description
            , createdBy
            , createdOn
            , updatedBy
            , updatedOn
            , isDeleted
            , version
    FROM dbo.WorkItemClassification
	WHERE id = @id;

	PRINT 'Executed proGetWorkItemClassification..';
END
GO

PRINT 'Procedure dbo.proGetWorkItemClassification created';
GO


-- Create proGetAllWorkItemClassification stored procedure.
IF EXISTS (SELECT * FROM sys.objects
           WHERE object_id = OBJECT_ID(N'[dbo].[proGetAllWorkItemClassification]')
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.proGetAllWorkItemClassification;
END
GO
/******************************************************************************
**  Name: proGetAllWorkItemClassification
**  Desc: Get all WorkItem Classifications
**
**  Called by: SSI
**
**  Author: Miguel Rojas
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:       Author:                        Description:
** --------     --------       ------------------------------------------------
** 29/05/2018  Miguel Rojas   Initial version
*******************************************************************************/
CREATE PROCEDURE dbo.proGetAllWorkItemClassification
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT id
            , name
            , description
            , createdBy
            , createdOn
            , updatedBy
            , updatedOn
            , isDeleted
            , version
    FROM dbo.WorkItemClassification;

	PRINT 'Executed proGetAllWorkItemClassification..';
END
GO

PRINT 'Procedure dbo.proGetAllWorkItemClassification created';
GO



-- Create proInsertWorkItemClassification stored procedure.
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[proInsertWorkItemClassification]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.proInsertWorkItemClassification
END
GO
/******************************************************************************
**  Name: proInsertWorkItemClassification
**  Desc: Inserts an WorkItem Classification
**
**  Called by: SSI
**
**  Author: Miguel Rojas
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:       Author:                        Description:
** --------     --------       ------------------------------------------------
** 29/05/2018  Miguel Rojas   Initial version
*******************************************************************************/
CREATE PROCEDURE dbo.proInsertWorkItemClassification
(
    @newId INT OUTPUT
	 ,@name VARCHAR(100)
	 ,@description VARCHAR(200)
	 ,@createdBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO dbo.WorkItemClassification (
										name
										,description
										,createdBy
										)
	VALUES (
			 @name
			,@description
			,@createdBy
			);

	SET @newId = SCOPE_IDENTITY();

	PRINT 'Executed proInsertWorkItemClassification..';
END
GO

PRINT 'Procedure dbo.proInsertWorkItemClassification created';
GO


--Create the proUpdateWorkItemClassification stored procedure.
IF EXISTS (SELECT * FROM sys.objects
		   WHERE object_id = OBJECT_ID(N'[dbo].[proUpdateWorkItemClassification]')
		   AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.proUpdateWorkItemClassification;
END
GO
/******************************************************************************
**  Name: proUpdateWorkItemClassification
**  Desc: Update an WorkItem Classification
**
**  Called by: SSI
**
**  Author: Miguel Rojas
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:       Author:                        Description:
** --------     --------       ------------------------------------------------
** 29/05/2018  Miguel Rojas   Initial version
*******************************************************************************/
CREATE PROCEDURE dbo.proUpdateWorkItemClassification
(
	  @id INT
	 ,@name VARCHAR(100)
	 ,@description VARCHAR(200)
	 ,@updatedBy INT
	 ,@updatedOn DATETIME
	 ,@version BIGINT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE WorkItemClassification
	SET  name		 = @name
		,description = @description
		,updatedBy	 = @updatedBy
		,updatedOn   = @updatedOn
		,version   = @version
	WHERE id = @id;

	PRINT 'Executed proUpdateWorkItemClassification..';
END
GO

PRINT 'Procedure dbo.proUpdateWorkItemClassification created';
GO



-- Create the proDeleteWorkItemClassification stored procedure.
IF EXISTS (SELECT * FROM sys.objects
	   	   WHERE object_id = OBJECT_ID(N'[dbo].[proDeleteWorkItemClassification]')
		   AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.proDeleteWorkItemClassification;
END
GO
/******************************************************************************
**  Name: proDeleteWorkItemClassification
**  Desc: Delete an WorkItem Classification
**
**  Called by: SSI
**
**  Author: Miguel Rojas
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:       Author:                        Description:
** --------     --------       ------------------------------------------------
** 29/05/2018  Miguel Rojas   Initial version
*******************************************************************************/
CREATE PROCEDURE dbo.proDeleteWorkItemClassification
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM WorkItemClassification
	WHERE id = @id;

	PRINT 'Executed proDeleteWorkItemClassification..';
END
GO

PRINT 'Procedure dbo.proDeleteWorkItemClassification created';
GO



-- Create proGetWorkItem stored procedure.
IF EXISTS (SELECT * FROM sys.objects
           WHERE object_id = OBJECT_ID(N'[dbo].[proGetWorkItem]')
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.proGetWorkItem;
END
GO
/******************************************************************************
**  Name: proGetWorkItem
**  Desc: Get an WorkItem
**
**  Called by: SSI
**
**  Author: Miguel Rojas
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:       Author:                        Description:
** --------     --------       ------------------------------------------------
** 29/05/2018  Miguel Rojas   Initial version
*******************************************************************************/
CREATE PROCEDURE dbo.proGetWorkItem
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT id
            , name
            , description
            , workItemClassificationId
            , createdBy
            , createdOn
            , updatedBy
            , updatedOn
            , isDeleted
            , version
    FROM dbo.WorkItem
	WHERE id = @id;

	PRINT 'Executed proGetWorkItem..';
END
GO

PRINT 'Procedure dbo.proGetWorkItem created';
GO


-- Create proGetAllWorkItem stored procedure.
IF EXISTS (SELECT * FROM sys.objects
           WHERE object_id = OBJECT_ID(N'[dbo].[proGetAllWorkItem]')
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.proGetAllWorkItem;
END
GO
/******************************************************************************
**  Name: proGetAllWorkItem
**  Desc: Get all WorkItems
**
**  Called by: SSI
**
**  Author: Miguel Rojas
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:       Author:                        Description:
** --------     --------       ------------------------------------------------
** 29/05/2018  Miguel Rojas   Initial version
*******************************************************************************/
CREATE PROCEDURE dbo.proGetAllWorkItem
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT id
            , name
            , description
            , workItemClassificationId
            , createdBy
            , createdOn
            , updatedBy
            , updatedOn
            , isDeleted
            , version
    FROM dbo.WorkItem;

	PRINT 'Executed proGetAllWorkItem..';
END
GO

PRINT 'Procedure dbo.proGetAllWorkItem created';
GO



-- Create proInsertWorkItem stored procedure.
IF EXISTS (SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[proInsertWorkItem]')
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.proInsertWorkItem
END
GO
/******************************************************************************
**  Name: proInsertWorkItem
**  Desc: Inserts an WorkItem
**
**  Called by: SSI
**
**  Author: Miguel Rojas
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:       Author:                        Description:
** --------     --------       ------------------------------------------------
** 29/05/2018  Miguel Rojas   Initial version
*******************************************************************************/
CREATE PROCEDURE dbo.proInsertWorkItem
(
    @newId INT OUTPUT
	 ,@name VARCHAR(100)
	 ,@description VARCHAR(200)
	 ,@workItemClassificationId INT
	 ,@createdBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	INSERT INTO dbo.WorkItem(
							 name
							,description
							,workItemClassificationId
							,createdBy
							)
	VALUES (
			 @name
			,@description
			,@workItemClassificationId
			,@createdBy
			);

	SET @newId = SCOPE_IDENTITY();

	PRINT 'Executed proInsertWorkItem..';
END
GO

PRINT 'Procedure dbo.proInsertWorkItem created';
GO


--Create the proUpdateWorkItem stored procedure.
IF EXISTS (SELECT * FROM sys.objects
		   WHERE object_id = OBJECT_ID(N'[dbo].[proUpdateWorkItem]')
		   AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.proUpdateWorkItem;
END
GO
/******************************************************************************
**  Name: proUpdateWorkItem
**  Desc: Update an WorkItem
**
**  Called by: SSI
**
**  Author: Miguel Rojas
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:       Author:                        Description:
** --------     --------       ------------------------------------------------
** 29/05/2018  Miguel Rojas   Initial version
*******************************************************************************/
CREATE PROCEDURE dbo.proUpdateWorkItem
(
	  @id INT
	 ,@name VARCHAR(100)
	 ,@description VARCHAR(200)
	 ,@workItemClassificationId INT
	 ,@updatedBy INT
 	 ,@updatedOn DATETIME
	 ,@version BIGINT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE WorkItem
	SET  name		 = @name
		,description = @description
		,workItemClassificationId = @workItemClassificationId
		,updatedBy = @updatedBy
		,updatedOn = @updatedOn
		,version = @version
	WHERE id = @id;

	PRINT 'Executed proUpdateWorkItem..';
END
GO

PRINT 'Procedure dbo.proUpdateWorkItem created';
GO



-- Create the proDeleteWorkItem stored procedure.
IF EXISTS (SELECT * FROM sys.objects
	   	   WHERE object_id = OBJECT_ID(N'[dbo].[proDeleteWorkItem]')
		   AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE dbo.proDeleteWorkItem;
END
GO
/******************************************************************************
**  Name: proDeleteWorkItem
**  Desc: Delete an WorkItem
**
**  Called by: SSI
**
**  Author: Miguel Rojas
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:       Author:                        Description:
** --------     --------       ------------------------------------------------
** 29/05/2018  Miguel Rojas   Initial version
*******************************************************************************/
CREATE PROCEDURE dbo.proDeleteWorkItem
(
	@id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM WorkItem
	WHERE id = @id;

	PRINT 'Executed proDeleteWorkItem..';
END
GO

PRINT 'Procedure dbo.proDeleteWorkItem created';
GO

--end miguel



-- start henry

/******************************************************************************
**  Name: SP proGetExistingWorkItem
**  Desc: this script is to read one record by id from ExistingWorkItem Table
**
**  Author: Henry Bustamante
**
**  Date: 05/29/2018
*******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               ---------------------------------------------------
 05/29/2018    Henry Bustamante C.       - Initial version
******************************************************************************/
-- Create proGetExistingWorkItem stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetExistingWorkItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetExistingWorkItem]
GO

CREATE PROCEDURE [dbo].[proGetExistingWorkItem]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT   id
	          , detail
            , purchaseDate
            , serieNo
            , workItemId
            , createdBy
            , createdOn
            , updatedBy
            , updatedOn
            , isDeleted
            , version
        FROM dbo.ExistingWorkItem
        where id = @id;

 PRINT 'Executed proGetExistingWorkItem..';
END
GO

PRINT 'Procedure dbo.proGetExistingWorkItem created';
GO

/******************************************************************************
**  Name: SP proGetAllExistingWorkItem
**  Desc: this script is to get all records of ExistingWorkItem Table
**
**  Author: Henry Bustamante
**
**  Date: 05/29/2018
*******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               ---------------------------------------------------
 05/29/2018    Henry Bustamante C.       - Initial version
******************************************************************************/
-- Create proGetAllExistingWorkItem stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetAllExistingWorkItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetAllExistingWorkItem]
GO

CREATE PROCEDURE [dbo].[proGetAllExistingWorkItem]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	 SELECT id
            , detail
            , purchaseDate
            , serieNo
            , workItemId
            , createdBy
            , createdOn
            , updatedBy
            , updatedOn
            , isDeleted
            , version
        FROM dbo.ExistingWorkItem

 PRINT 'Executed proGetAllExistingWorkItem..';
END
GO

PRINT 'Procedure dbo.proGetAllExistingWorkItem created';
GO

/******************************************************************************
**  Name: SP proInsertExistingWorkItem
**  Desc: this script is to insert new record into ExistingWorkItem Table
**
**  Author: Henry Bustamante
**
**  Date: 05/29/2018
*******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               ---------------------------------------------------
 05/29/2018    Henry Bustamante C.       - Initial version
******************************************************************************/
-- Create proInsertExistingWorkItem stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proInsertExistingWorkItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proInsertExistingWorkItem]
GO

CREATE PROCEDURE [dbo].[proInsertExistingWorkItem]
(
      @newId INT OUTPUT
    , @detail VARCHAR(100)
	  , @purchaseDate DATETIME
    , @serieNo VARCHAR(50)
    , @workItemId INT
    , @createdBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO dbo.ExistingWorkItem(detail
                            , purchaseDate
                            , serieNo
                            , workItemId
                            , createdBy)
	VALUES (@detail
			      , @purchaseDate
			      , @serieNo
            , @workItemId
            , @createdBy);

  SET @newId = SCOPE_IDENTITY();

 PRINT 'Executed proInsertExistingWorkItem..';
END
GO

PRINT 'Procedure dbo.proInsertExistingWorkItem created';
GO

/******************************************************************************
**  Name: SP proUpdateExistingWorkItem
**  Desc: this script is to update new record into ExistingWorkItem Table
**
**  Author: Henry Bustamante
**
**  Date: 05/29/2018
*******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               ---------------------------------------------------
 05/29/2018    Henry Bustamante C.       - Initial version
******************************************************************************/
-- Create proUpdateExistingWorkItem stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proUpdateExistingWorkItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proUpdateExistingWorkItem]
GO

CREATE PROCEDURE [dbo].[proUpdateExistingWorkItem]
(
    @id INT
    , @detail VARCHAR(100)
	  , @purchaseDate DATETIME
    , @serieNo VARCHAR(50)
    , @workItemId INT
    , @updatedBy INT
  	, @updatedOn DATETIME
	  , @version BIGINT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE dbo.ExistingWorkItem
    SET detail = @detail
        , purchaseDate = @purchaseDate
        , serieNo = @serieNo
        , workItemId = @workItemId
        , updatedBy = @updatedBy
     		, updatedOn   = @updatedOn
    		, version   = @version
    WHERE id = @id;


 PRINT 'Executed proUpdateExistingWorkItem..';
END
GO

PRINT 'Procedure dbo.proUpdateExistingWorkItem created';
GO

/******************************************************************************
**  Name: SP proDeleteExistingWorkItem
**  Desc: this script is to delete a record from ExistingWorkItem Table
**
**  Author: Henry Bustamante
**
**  Date: 05/29/2018
*******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               ---------------------------------------------------
 05/29/2018    Henry Bustamante C.       - Initial version
******************************************************************************/
-- Create proDeleteExistingWorkItem stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proDeleteExistingWorkItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proDeleteExistingWorkItem]
GO

CREATE PROCEDURE [dbo].[proDeleteExistingWorkItem]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.ExistingWorkItem
	WHERE id = @id;
 PRINT 'Executed proDeleteExistingWorkItem..';
END
GO
PRINT 'Procedure dbo.proDeleteExistingWorkItem created';
GO


-- end henry


--start marcelo

/******************************************************************************
**  Name: SP proGetExistingWorkItemAssigned
**  Desc: this script is to get a record from ExistingWorkItemAssigned Table
**
**  Author: Marcelo Loayza
**
**  Date: 05/29/2018
*******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               ---------------------------------------------------
 05/29/2018    Marcelo Loayza       - Initial version
******************************************************************************/
-- Create proGetExistingWorkItemAssigned stored procedure.


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetExistingWorkItemAssigned]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetExistingWorkItemAssigned]
GO

CREATE PROCEDURE [dbo].[proGetExistingWorkItemAssigned]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT id
	    , assignedNotes
			, assignedDate
			, returnNotes
			, returnDate
			, employeeId
			, existingWorkItemId
      , createdBy
      , createdOn
      , updatedBy
      , updatedOn
      , isDeleted
      , version
        FROM dbo.ExistingWorkItemAssigned
        where id = @id;
        PRINT 'Executed proGetExistingWorkItemAssigned..';
END
GO

PRINT 'Procedure dbo.proGetExistingWorkItemAssigned created';
GO
/******************************************************************************
**  Name: SP proGetAllExistingWorkItemAssigned
**  Desc: this script is to get all a record from ExistingWorkItemAssigned Table
**
**  Author: Marcelo Loayza
**
**  Date: 05/29/2018
*******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               ---------------------------------------------------
 05/29/2018    Marcelo Loayza       - Initial version
******************************************************************************/
-- Create proGetAllExistingWorkItemAssigned stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetAllExistingWorkItemAssigneds]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetAllExistingWorkItemAssigneds]
GO

CREATE PROCEDURE [dbo].[proGetAllExistingWorkItemAssigneds]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT id
	    , assignedNotes
			, assignedDate
			, returnNotes
			, returnDate
			, employeeId
			, existingWorkItemId
      , createdBy
      , createdOn
      , updatedBy
      , updatedOn
      , isDeleted
      , version
        FROM dbo.ExistingWorkItemAssigned

        PRINT 'Executed proGetAllExistingWorkItemAssigneds..';
END
GO

PRINT 'Procedure dbo.proGetAllExistingWorkItemAssigneds created';
GO
/******************************************************************************
**  Name: SP proInsertExistingWorkItem
**  Desc: this script is to insert a record from ExistingWorkItemAssigned Table
**
**  Author: Marcelo Loayza
**
**  Date: 05/29/2018
*******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               ---------------------------------------------------
 05/29/2018    Marcelo Loayza       - Initial version
******************************************************************************/
-- Create proInsertExistingWorkItemAssigned stored procedure.


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proInsertExistingWorkItemAssigned]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proInsertExistingWorkItemAssigned]
GO

CREATE PROCEDURE [dbo].[proInsertExistingWorkItemAssigned]
(
    @newId INT OUTPUT
		, @assignedNotes VARCHAR(1000)
		, @assignedDate DATETIME
		, @returnNotes VARCHAR(1000)
		, @returnDate DATETIME
		, @employeeId INT
		, @existingWorkItemId INT
		, @createdBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO dbo.ExistingWorkItemAssigned(assignedNotes
								, assignedDate
								, returnNotes
								, returnDate
								, employeeId
								, existingWorkItemId
								, createdBy)
	VALUES (  @assignedNotes
			, @assignedDate
			, @returnNotes
			, @returnDate
			, @employeeId
			, @existingWorkItemId
			, @createdBy);

  SET @newId = SCOPE_IDENTITY();
  PRINT 'Executed proInsertExistingWorkItemAssigned..';
END

GO

PRINT 'Procedure dbo.proInsertExistingWorkItemAssigned created';
GO

/******************************************************************************
**  Name: SP proUpdateExistingWorkItemAssigned
**  Desc: this script is to Update a record from ExistingWorkItemAssigned Table
**
**  Author: Marcelo Loayza
**
**  Date: 05/29/2018
*******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               ---------------------------------------------------
 05/29/2018    Marcelo Loayza       - Initial version
******************************************************************************/
-- Create proUpdateExistingWorkItemAssigned stored procedure.
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proUpdateExistingWorkItemAssigned]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proUpdateExistingWorkItemAssigned]
GO

CREATE PROCEDURE [dbo].[proUpdateExistingWorkItemAssigned]
(
    @id INT
  , @assignedNotes VARCHAR(1000)
	, @assignedDate DATETIME
	, @returnNotes VARCHAR(1000)
	, @returnDate DATETIME
	, @employeeId INT
	, @existingWorkItemId INT
	, @updatedBy INT
  , @updatedOn DATETIME
	, @version BIGINT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE dbo.ExistingWorkItemAssigned
    SET assignedNotes = @assignedNotes
    , assignedDate = @assignedDate
		, returnNotes = @returnNotes
		, returnDate = @returnDate
		, employeeId = @employeeId
		, existingWorkItemId = @existingWorkItemId
		, updatedBy = @updatedBy
		, updatedOn = @updatedOn
		, version   = @version
    WHERE id = @id;

    PRINT 'Executed proUpdateExistingWorkItemAssigned..';

END

GO

PRINT 'Procedure dbo.proUpdateExistingWorkItemAssigned created';
GO
/******************************************************************************
**  Name: SP proDeleteExistingWorkItemAssigned
**  Desc: this script is to Delete a record from ExistingWorkItemAssigned Table
**
**  Author: Marcelo Loayza
**
**  Date: 05/29/2018
*******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               ---------------------------------------------------
 05/29/2018    Marcelo Loayza       - Initial version
******************************************************************************/
-- Create proDeleteExistingWorkItemAssigned stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proDeleteExistingWorkItemAssigned]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proDeleteExistingWorkItemAssigned]
GO

CREATE PROCEDURE [dbo].[proDeleteExistingWorkItemAssigned]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.Role
	WHERE id = @id;

	PRINT 'Executed proDeleteExistingWorkItemAssigned..';
END

GO

PRINT 'Procedure dbo.proDeleteExistingWorkItemAssigned created';
GO
--end marcelo