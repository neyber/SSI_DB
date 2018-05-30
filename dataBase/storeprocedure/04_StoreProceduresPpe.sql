-- start Henry
USE ssiA;

/******************************************************************************
**  Name: SP proGetPpeClassification
**  Desc: this script is to read one record by id from PpeClassification Table
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
-- Create proGetPpeClassification stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetPpeClassification]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetPpeClassification]
GO

CREATE PROCEDURE [dbo].[proGetPpeClassification]
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
        FROM dbo.PpeClassification
        where id = @id;

        PRINT 'Executed proGetPpeClassification..';
END
GO

PRINT 'Procedure dbo.proGetPpeClassification created';
GO

/******************************************************************************
**  Name: SP proGetAllPpeClassification
**  Desc: this script is to get all records of PpeClassification Table
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
-- Create proGetAllPpeClassification stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetAllPpeClassification]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetAllPpeClassification]
GO

CREATE PROCEDURE [dbo].[proGetAllPpeClassification]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT id
            , name
            , description
        FROM dbo.PpeClassification

        PRINT 'Executed proGetAllPpeClassification..';
END
GO

PRINT 'Procedure dbo.proGetAllPpeClassification created';
GO

/******************************************************************************
**  Name: SP proInsertPpeClassification
**  Desc: this script is to insert new record into PpeClassification Table
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
-- Create proInsertPpeClassification stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proInsertPpeClassification]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proInsertPpeClassification]
GO

CREATE PROCEDURE [dbo].[proInsertPpeClassification]
(
    @Name VARCHAR(200)
	, @description VARCHAR(1000)
    , @createdBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO dbo.PpeClassification(name
                            , description
                            , createdBy)
	VALUES (@Name
			, @description
            , @createdBy);


       PRINT 'Executed proInsertPpeClassification..';
END
GO

PRINT 'Procedure dbo.proInsertPpeClassification created';
GO

/******************************************************************************
**  Name: SP proUpdatePpeClassification
**  Desc: this script is to update new record into PpeClassification Table
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
-- Create proUpdatePpeClassification stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proUpdatePpeClassification]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proUpdatePpeClassification]
GO

CREATE PROCEDURE [dbo].[proUpdatePpeClassification]
(
    @id INT
    , @name VARCHAR(200)
    , @description VARCHAR(1000)
    , @updatedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE dbo.PpeClassification
    SET name = @name
        , description = @description
        , updatedBy = @updatedBy
    WHERE id = @id;

       PRINT 'Executed proUpdatePpeClassification..';
END
GO

PRINT 'Procedure dbo.proUpdatePpeClassification created';
GO

/******************************************************************************
**  Name: SP proDeletePpeClassification
**  Desc: this script is to delete a record from PpeClassification Table
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
-- Create proDeletePpeClassification stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proDeletePpeClassification]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proDeletePpeClassification]
GO

CREATE PROCEDURE [dbo].[proDeletePpeClassification]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.PpeClassification
	WHERE id = @id;
       PRINT 'Executed proDeletePpeClassification..';
END
GO

PRINT 'Procedure dbo.proDeletePpeClassification created';
GO

/******************************************************************************
**  Name: SP proGetPpe
**  Desc: this script is to read one record by id from Ppe Table
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
-- Create proGetPpe stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetPpe]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetPpe]
GO

CREATE PROCEDURE [dbo].[proGetPpe]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT
            id
            ,name
            , description
            , ppeClassificationId
        FROM dbo.Ppe
        where id = @id;
  PRINT 'Executed proDeletePpeClassification..';
END
GO

PRINT 'Procedure dbo.proDeletePpeClassification created';
GO

/******************************************************************************
**  Name: SP proGetAllPpe
**  Desc: this script is to read all records from Ppe Table
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
-- Create proGetAllPpe stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetAllPpe]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetAllPpe]
GO

CREATE PROCEDURE [dbo].[proGetAllPpe]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT
            id
            ,name
            , description
            , ppeClassificationId
        FROM dbo.Ppe

  PRINT 'Executed proGetAllPpe..';
END
GO

PRINT 'Procedure dbo.proGetAllPpe created';
GO

/******************************************************************************
**  Name: SP proInsertPpe
**  Desc: this script is to insert new record into Ppe Table
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
-- Create proInsertPpe stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proInsertPpe]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proInsertPpe]
GO

CREATE PROCEDURE [dbo].[proInsertPpe]
(
    @name VARCHAR(200)
	  , @description VARCHAR(1000)
    , @ppeClassificationId INT
    , @createdBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO dbo.Ppe(name
                            , description
                            , ppeClassificationId
                            , createdBy)
	VALUES (@name
			    , @description
			    , @ppeClassificationId
          , @createdBy);

	SELECT @@IDENTITY AS NewPpeID;

  PRINT 'Executed proInsertPpe..';
END
GO

PRINT 'Procedure dbo.proInsertPpe created';
GO

/******************************************************************************
**  Name: SP proUpdatePpe
**  Desc: this script is to update new record into Ppe Table
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
-- Create proUpdatePpe stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proUpdatePpe]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proUpdatePpe]
GO

CREATE PROCEDURE [dbo].[proUpdatePpe]
(
    @id INT
    , @name VARCHAR(200)
    , @description VARCHAR(1000)
    , @ppeClassificationId INT
    , @updatedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE dbo.Ppe
    SET name = @name
        , description = @description
        , ppeClassificationId = @ppeClassificationId
        , updatedBy = @updatedBy
    WHERE id = @id;

  PRINT 'Executed proUpdatePpe..';
END
GO

PRINT 'Procedure dbo.proUpdatePpe created';
GO

/******************************************************************************
**  Name: SP proDeletePpe
**  Desc: this script is to delete a record from Ppe Table
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
-- Create proDeletePpe stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proDeletePpe]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proDeletePpe]
GO

CREATE PROCEDURE [dbo].[proDeletePpe]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.Ppe
	WHERE id = @id;
  PRINT 'Executed proDeletePpe..';
END
GO

PRINT 'Procedure dbo.proDeletePpe created';
GO

/******************************************************************************
**  Name: SP proGetExistingPpe
**  Desc: this script is to read one record by id from ExistingPpe Table
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
-- Create proGetExistingPpe stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetExistingPpe]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetExistingPpe]
GO

CREATE PROCEDURE [dbo].[proGetExistingPpe]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT id
            , detail
            , purchaseDate
            , lifeTimeDays
            , currentLifeTimeDays
            , ppeId
        FROM dbo.ExistingPpe
        where id = @id;

  PRINT 'Executed proGetExistingPpe..';
END
GO

PRINT 'Procedure dbo.proGetExistingPpe created';
GO

/******************************************************************************
**  Name: SP proGetAllExistingPpe
**  Desc: this script is to get all records of ExistingPpe Table
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
-- Create proGetAllExistingPpe stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetAllExistingPpe]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetAllExistingPpe]
GO

CREATE PROCEDURE [dbo].[proGetAllExistingPpe]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT id
            , detail
            , purchaseDate
            , lifeTimeDays
            , currentLifeTimeDays
            , ppeId
        FROM dbo.ExistingPpe

  PRINT 'Executed proGetAllExistingPpe..';
END
GO

PRINT 'Procedure dbo.proGetAllExistingPpe created';
GO

/******************************************************************************
**  Name: SP proInsertExistingPpe
**  Desc: this script is to insert new record into ExistingPpe Table
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
-- Create proInsertExistingPpe stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proInsertExistingPpe]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proInsertExistingPpe]
GO

CREATE PROCEDURE [dbo].[proInsertExistingPpe]
(
     @detail VARCHAR(1000)
    , @purchaseDate DATETIME
    , @lifeTimeDays INT
    , @currentLifeTimeDays INT
    , @ppeId INT
    , @createdBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO dbo.ExistingPpe(
            detail
            , purchaseDate
            , lifeTimeDays
            , currentLifeTimeDays
            , ppeId
            , createdBy)
	VALUES (@detail
			      , @purchaseDate
			      , @lifeTimeDays
            , @currentLifeTimeDays
	      		, @ppeId
            , @createdBy);


  PRINT 'Executed proInsertExistingPpe..';
END
GO

PRINT 'Procedure dbo.proInsertExistingPpe created';
GO

/******************************************************************************
**  Name: SP proUpdateExistingPpe
**  Desc: this script is to update new record into ExistingPpe Table
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
-- Create proUpdateExistingPpe stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proUpdateExistingPpe]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proUpdateExistingPpe]
GO

CREATE PROCEDURE [dbo].[proUpdateExistingPpe]
(
    @id INT
    , @detail VARCHAR(1000)
    , @purchaseDate DATETIME
    , @lifeTimeDays INT
    , @currentLifeTimeDays INT
    , @ppeId INT
    , @updatedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE dbo.ExistingPpe
    SET detail = @detail
        , purchaseDate = @purchaseDate
        , lifeTimeDays = @lifeTimeDays
        , currentLifeTimeDays = @currentLifeTimeDays
        , ppeId = @ppeId
        , updatedBy = @updatedBy
    WHERE id = @id;

  PRINT 'Executed proUpdateExistingPpe..';
END
GO

PRINT 'Procedure dbo.proUpdateExistingPpe created';
GO

/******************************************************************************
**  Name: SP proDeleteExistingPpe
**  Desc: this script is to delete a record from ExistingPpe Table
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
-- Create proDeleteExistingPpe stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proDeleteExistingPpe]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proDeleteExistingPpe]
GO

CREATE PROCEDURE [dbo].[proDeleteExistingPpe]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.ExistingPpe
	WHERE id = @id;
  PRINT 'Executed proDeleteExistingPpe..';
END
GO

PRINT 'Procedure dbo.proDeleteExistingPpe created';
GO

/******************************************************************************
**  Name: SP proGetExistingPpeAssigned
**  Desc: this script is to read one record by id from ExistingPpeAssigned Table
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
-- Create proGetExistingPpeAssigned stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetExistingPpeAssigned]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetExistingPpeAssigned]
GO

CREATE PROCEDURE [dbo].[proGetExistingPpeAssigned]
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
            , existingPpeId
            , employeeId
        FROM dbo.ExistingPpeAssigned
        where id = @id;

  PRINT 'Executed proGetExistingPpeAssigned..';
END
GO

PRINT 'Procedure dbo.proGetExistingPpeAssigned created';
GO

/******************************************************************************
**  Name: SP proGetAllExistingPpeAssigned
**  Desc: this script is to get all records of ExistingPpeAssigned Table
**
**  Author: Henry Bustamante
**
**  Date: 05/28/2018
*******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               ---------------------------------------------------
 05/28/2018    Henry Bustamante C.       - Initial version
******************************************************************************/
-- Create proGetAllExistingPpeAssigned stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetAllExistingPpeAssigned]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetAllExistingPpeAssigned]
GO

CREATE PROCEDURE [dbo].[proGetAllExistingPpeAssigned]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT id
            , assignedNotes
            , assignedDate
            , returnNotes
            , returnDate
            , existingPpeId
            , employeeId
        FROM dbo.ExistingPpeAssigned
  PRINT 'Executed proGetAllExistingPpeAssigned..';
END
GO

PRINT 'Procedure dbo.proGetAllExistingPpeAssigned created';
GO

/******************************************************************************
**  Name: SP proInsertExistingPpeAssigned
**  Desc: this script is to insert new record into ExistingPpeAssigned Table
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
-- Create proInsertExistingPpeAssigned stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proInsertExistingPpeAssigned]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proInsertExistingPpeAssigned]
GO

CREATE PROCEDURE [dbo].[proInsertExistingPpeAssigned]
(
    @assignedNotes VARCHAR(200)
    , @assignedDate DATETIME
    , @returnNotes VARCHAR(200)
    , @returnDate DATETIME
    , @existingPpeId INT
    , @employeeId INT
    , @createdBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO dbo.ExistingPpeAssigned(
              assignedNotes
            , assignedDate
            , returnNotes
            , returnDate
            , existingPpeId
            , employeeId
            , createdBy)
	VALUES (
            @assignedNotes
			      , @assignedDate
			      , @returnNotes
            , @returnDate
			      , @existingPpeId
            , @employeeId
            , @createdBy);


      PRINT 'Executed proInsertExistingPpeAssigned..';
END
GO

PRINT 'Procedure dbo.proInsertExistingPpeAssigned created';
GO

/******************************************************************************
**  Name: SP proUpdateExistingPpeAssigned
**  Desc: this script is to update new record into ExistingPpeAssigned Table
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
-- Create proUpdateExistingPpeAssigned stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proUpdateExistingPpeAssigned]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proUpdateExistingPpeAssigned]
GO

CREATE PROCEDURE [dbo].[proUpdateExistingPpeAssigned]
(
    @id INT
    , @assignedNotes VARCHAR(200)
    , @assignedDate DATETIME
    , @returnNotes VARCHAR(200)
    , @returnDate DATETIME
    , @existingPpeId INT
    , @employeeId INT
    , @updatedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE dbo.ExistingPpeAssigned
    SET assignedNotes = @assignedNotes
        , assignedDate = @assignedDate
        , returnNotes = @returnNotes
        , returnDate = @returnDate
        , existingPpeId = @existingPpeId
        , employeeId = @employeeId
        , updatedBy = @updatedBy
    WHERE id = @id;

 PRINT 'Executed proUpdateExistingPpeAssigned..';
END
GO

PRINT 'Procedure dbo.proUpdateExistingPpeAssigned created';
GO

/******************************************************************************
**  Name: SP proDeleteExistingPpeAssigned
**  Desc: this script is to delete a record from ExistingPpeAssigned Table
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
-- Create proDeleteExistingPpeAssigned stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proDeleteExistingPpeAssigned]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proDeleteExistingPpeAssigned]
GO

CREATE PROCEDURE [dbo].[proDeleteExistingPpeAssigned]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.ExistingPpeAssigned
	WHERE id = @id;
 PRINT 'Executed proDeleteExistingPpeAssigned..';
END
GO

PRINT 'Procedure dbo.proDeleteExistingPpeAssigned created';
GO