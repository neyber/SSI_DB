-- start Henry
USE ssiA;
/******************************************************************************
**  Name: SP proGetSaCategory
**  Desc: this script is to read one record by id from SaCategory Table
**
**  Author: Henry Bustamante
**
**  Date: 05/28/2018
*******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               ---------------------------------------------------
 05/29/2018    Henry Bustamante C.       - Initial version
******************************************************************************/
-- Create proGetSaCategory stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetSaCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetSaCategory]
GO

CREATE PROCEDURE [dbo].[proGetSaCategory]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT
	          id
	          , category
            , description
            , reference
            , createdBy
            , createdOn
            , updatedBy
            , updatedOn
            , isDeleted
            , version
        FROM dbo.SaCategory
        where id = @id;

        PRINT 'Executed proGetSaCategory..';
END
GO

PRINT 'Procedure dbo.proGetSaCategory created';
GO

/******************************************************************************
**  Name: SP proGetAllSaCategories
**  Desc: this script is to get all records of SaCategory Table
**
**  Author: Henry Bustamante
**
**  Date: 05/28/2018
*******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               ---------------------------------------------------
 05/29/2018    Henry Bustamante C.       - Initial version
******************************************************************************/
-- Create proGetAllSaCategories stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetAllSaCategories]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetAllSaCategories]
GO

CREATE PROCEDURE [dbo].[proGetAllSaCategories]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT
	          id
	          , category
            , description
            , reference
            , createdBy
            , createdOn
            , updatedBy
            , updatedOn
            , isDeleted
            , version
        FROM dbo.SaCategory

        PRINT 'Executed proGetAllSaCategories..';

END
GO

PRINT 'Procedure dbo.proGetAllSaCategories created';
GO
/******************************************************************************
**  Name: SP proInsertSaCategory
**  Desc: this script is to insert new record into SaCategory Table
**
**  Author: Henry Bustamante
**
**  Date: 05/28/2018
*******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               ---------------------------------------------------
 05/29/2018    Henry Bustamante C.       - Initial version
******************************************************************************/
-- Create proInsertSaCategory stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proInsertSaCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proInsertSaCategory]
GO

CREATE PROCEDURE [dbo].[proInsertSaCategory]
(
  @newId INT OUTPUT
  , @category VARCHAR(200)
	, @description VARCHAR(1000)
	, @reference VARCHAR(1000)
  , @createdBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO dbo.SaCategory(category
                            , description
                            , reference
                            , createdBy)
	VALUES (@category
			, @description
			, @reference
      , @createdBy
			);

  SET @newId = SCOPE_IDENTITY();
	PRINT 'Executed proInsertSaCategory..';
END
GO

PRINT 'Procedure dbo.proInsertSaCategory created';
GO
/******************************************************************************
**  Name: SP proUpdateSaCategory
**  Desc: this script is to update new record into SaCategory Table
**
**  Author: Henry Bustamante
**
**  Date: 05/28/2018
*******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               ---------------------------------------------------
 05/29/2018    Henry Bustamante C.       - Initial version
******************************************************************************/
-- Create proUpdateSaCategory stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proUpdateSaCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proUpdateSaCategory]
GO

CREATE PROCEDURE [dbo].[proUpdateSaCategory]
(
    @id INT
   , @category VARCHAR(100)
	 , @description VARCHAR(1000)
	 , @reference VARCHAR(1000)
   , @updatedBy INT
	 , @updatedOn DATETIME
	 , @version BIGINT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE dbo.SaCategory
    SET category = @category
        , description = @description
        , reference = @reference
        , updatedBy = @updatedBy
		    , updatedOn = @updatedOn
		    , version = @version
    WHERE id = @id;

    PRINT 'Executed proInsertSaCategory..';
END
GO

PRINT 'Procedure dbo.proInsertSaCategory created';
GO

/******************************************************************************
**  Name: SP proDeleteSaCategory
**  Desc: this script is to delete a record from SaCategory Table
**
**  Author: Henry Bustamante
**
**  Date: 05/28/2018
*******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               ---------------------------------------------------
 05/29/2018    Henry Bustamante C.       - Initial version
******************************************************************************/
-- Create proDeleteSaCategory stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proDeleteSaCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proDeleteSaCategory]
GO

CREATE PROCEDURE [dbo].[proDeleteSaCategory]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.SaCategory
	WHERE id = @id;

	PRINT 'Executed proDeleteSaCategory..';
END
GO

PRINT 'Procedure dbo.proDeleteSaCategory created';
GO


/******************************************************************************
**  Name: SP proGetSaType
**  Desc: this script is to read one record by id from SaType Table
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
-- Create proGetSaType stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetSaType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetSaType]
GO

CREATE PROCEDURE [dbo].[proGetSaType]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT
            id
            , type
            , description
            , createdBy
            , createdOn
            , updatedBy
            , updatedOn
            , isDeleted
            , version
        FROM dbo.SaType
        where id = @id;

        PRINT 'Executed proGetSaType..';
END
GO

PRINT 'Procedure dbo.proGetSaType created';
GO

/******************************************************************************
**  Name: SP proGetAllSaType
**  Desc: this script is to get all records of SaType Table
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
-- Create proGetAllSaType stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetAllSaType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetAllSaType]
GO

CREATE PROCEDURE [dbo].[proGetAllSaType]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT
            id
            , type
            , description
            , createdBy
            , createdOn
            , updatedBy
            , updatedOn
            , isDeleted
            , version
        FROM dbo.SaType

        PRINT 'Executed proGetAllSaType..';
END
GO

PRINT 'Procedure dbo.proGetAllSaType created';
GO
/******************************************************************************
**  Name: SP proInsertSaType
**  Desc: this script is to insert new record into SaType Table
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
-- Create proInsertSaType stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proInsertSaType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proInsertSaType]
GO

CREATE PROCEDURE [dbo].[proInsertSaType]
(
    @newId INT OUTPUT
    , @type VARCHAR(200)
	  , @description VARCHAR(1000)
    , @createdBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO dbo.SaType(type
                            , description
                            , createdBy)
	VALUES (@type
			, @description
            , @createdBy
			);

   SET @newId = SCOPE_IDENTITY();
   PRINT 'Executed proInsertSaType..';
END
GO

PRINT 'Procedure dbo.proInsertSaType created';
GO

/******************************************************************************
**  Name: SP proUpdateSaType
**  Desc: this script is to update new record into SaType Table
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
-- Create proInsertSaType stored procedure.


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proUpdateSaType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proUpdateSaType]
GO

CREATE PROCEDURE [dbo].[proUpdateSaType]
(
    @id INT
    , @type VARCHAR(100)
	  , @description VARCHAR(1000)
    , @updatedBy INT
	  , @updatedOn DATETIME
	  , @version BIGINT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE dbo.SaType
    SET type = @type
        , description = @description
        , updatedBy = @updatedBy
		    , updatedOn = @updatedOn
		    , version = @version
    WHERE id = @id;

    PRINT 'Executed proInsertSaType..';
END
GO

PRINT 'Procedure dbo.proInsertSaType created';
GO
/******************************************************************************
**  Name: SP proDeleteSaType
**  Desc: this script is to delete a record from SaType Table
**
**  Author: Henry Bustamante
**
**  Date: 05/28/2018
*******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               ---------------------------------------------------
 05/29/2018    Henry Bustamante C.       - Initial version
******************************************************************************/
-- Create proDeleteSaType stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proDeleteSaType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proDeleteSaType]
GO

CREATE PROCEDURE [dbo].[proDeleteSaType]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.SaType
	WHERE id = @id;
  PRINT 'Executed proDeleteSaType..';
END
GO

PRINT 'Procedure dbo.proDeleteSaType created';
GO

/******************************************************************************
**  Name: SP proGetAccident
**  Desc: this script is to read one record by id from Accident Table
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
-- Create proGetAccident stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetAccident]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetAccident]
GO

CREATE PROCEDURE [dbo].[proGetAccident]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT
	          id
	          , description
            , dateAccident
            , whereOccurr
            , statusRecord
            , totalDaysOutOfWork
            , totalDaysRestrictedTransferredWork
            , saCategoryId
            , saTypeId
            , employeeId
            , createdBy
            , createdOn
            , updatedBy
            , updatedOn
            , isDeleted
            , version
        FROM dbo.Accident
        where id = @id;

        PRINT 'Executed proGetAccident..';
END
GO

PRINT 'Procedure dbo.proGetAccident created';
GO

/******************************************************************************
**  Name: SP proGetAllAccidents
**  Desc: this script is to get all records of Accident Table
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
-- Create proGetAllAccidents stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetAllAccidents]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetAllAccidents]
GO

CREATE PROCEDURE [dbo].[proGetAllAccidents]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT
	            id
	          , description
            , dateAccident
            , whereOccurr
            , statusRecord
            , totalDaysOutOfWork
            , totalDaysRestrictedTransferredWork
            , saCategoryId
            , saTypeId
            , employeeId
            , createdBy
            , createdOn
            , updatedBy
            , updatedOn
            , isDeleted
            , version
        FROM dbo.Accident

   PRINT 'Executed proGetAllAccidents..';
END
GO

PRINT 'Procedure dbo.proGetAllAccidents created';
GO

/******************************************************************************
**  Name: SP proInsertAccident
**  Desc: this script is to insert new record into Accident Table
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
-- Create proInsertAccident stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proInsertAccident]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proInsertAccident]
GO

CREATE PROCEDURE [dbo].[proInsertAccident]
(
    @newId INT OUTPUT
    , @description VARCHAR(1000)
	  , @dateAccident DATETIME
    , @whereOccurr VARCHAR(1000)
    , @statusRecord BIT
	  , @totalDaysOutOfWork INT
    , @totalDaysRestrictedTransferredWork INT
    , @saCategoryId INT
    , @saTypeId INT
    , @employeeId INT
    , @createdBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO dbo.Accident(description
                            , dateAccident
                            , whereOccurr
                            , statusRecord
                            , totalDaysOutOfWork
                            , totalDaysRestrictedTransferredWork
                            , saCategoryId
                            , saTypeId
                            , employeeId
                            , createdBy)
	VALUES (@description
			   , @dateAccident
         , @whereOccurr
         , @statusRecord
			   , @totalDaysOutOfWork
         , @totalDaysRestrictedTransferredWork
         , @saCategoryId
         , @saTypeId
         , @employeeId
        , @createdBy);

  SET @newId = SCOPE_IDENTITY();
	PRINT 'Executed proInsertAccident..';
END
GO

PRINT 'Procedure dbo.proInsertAccident created';
GO

/******************************************************************************
**  Name: SP proUpdateAccident
**  Desc: this script is to update new record into Accident Table
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
-- Create proUpdateAccident stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proUpdateAccident]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proUpdateAccident]
GO

CREATE PROCEDURE [dbo].[proUpdateAccident]
(
    @id INT
    , @description VARCHAR(200)
	  , @dateAccident DATETIME
    , @whereOccurr VARCHAR(100)
    , @statusRecord BIT
	  , @totalDaysOutOfWork INT
    , @totalDaysRestrictedTransferredWork INT
    , @saCategoryId INT
    , @saTypeId INT
    , @employeeId INT
    , @updatedBy INT
	  , @updatedOn DATETIME
	  , @version BIGINT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE dbo.Accident
    SET description = @description
        , dateAccident = @dateAccident
        , statusRecord = @statusRecord
        , whereOccurr = @whereOccurr
        , totalDaysOutOfWork = @totalDaysOutOfWork
        , totalDaysRestrictedTransferredWork = @totalDaysRestrictedTransferredWork
        , saCategoryId = @saCategoryId
        , saTypeId = @saTypeId
        , employeeId = @employeeId
        , updatedBy = @updatedBy
		    , updatedOn = @updatedOn
		    , version = @version
    WHERE id = @id;

	 PRINT 'Executed proUpdateAccident..';
END
GO

PRINT 'Procedure dbo.proUpdateAccident created';
GO

/******************************************************************************
**  Name: SP proDeleteAccident
**  Desc: this script is to delete a record from Accident Table
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
-- Create proDeleteAccident stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proDeleteAccident]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proDeleteAccident]
GO

CREATE PROCEDURE [dbo].[proDeleteAccident]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.Accident
	WHERE id = @id;
	 PRINT 'Executed proDeleteAccident..';
END
GO

PRINT 'Procedure dbo.proDeleteAccident created';
GO

/******************************************************************************
**  Name: SP proGetSickness
**  Desc: this script is to read one record by id from Sickness Table
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
-- Create proGetSickness stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetSickness]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetSickness]
GO

CREATE PROCEDURE [dbo].[proGetSickness]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT
            id
            , description
            , dateSickness
            , whereOccurr
            , statusRecord
            , totalDaysOutOfWork
            , totalDaysRestrictedTransferredWork
            , saCategoryId
            , saTypeId
            , employeeId
            , createdBy
            , createdOn
            , updatedBy
            , updatedOn
            , isDeleted
            , version
        FROM dbo.Sickness
        where id = @id;
	 PRINT 'Executed proGetSickness..';
END
GO

PRINT 'Procedure dbo.proGetSickness created';
GO
/******************************************************************************
**  Name: SP proGetAllSickness
**  Desc: this script is to get all records of Sickness Table
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
-- Create proGetAllSickness stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetAllSickness]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetAllSickness]
GO

CREATE PROCEDURE [dbo].[proGetAllSickness]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT
            id
            , description
            , dateSickness
            , whereOccurr
            , statusRecord
            , totalDaysOutOfWork
            , totalDaysRestrictedTransferredWork
            , saCategoryId
            , saTypeId
            , employeeId
            , createdBy
            , createdOn
            , updatedBy
            , updatedOn
            , isDeleted
            , version
        FROM dbo.Sickness

        PRINT 'Executed proGetAllSickness..';
END
GO

PRINT 'Procedure dbo.proGetAllSickness created';
GO

/******************************************************************************
**  Name: SP proInsertSickness
**  Desc: this script is to insert new record into Sickness Table
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
-- Create proInsertSickness stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proInsertSickness]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proInsertSickness]
GO

CREATE PROCEDURE [dbo].[proInsertSickness]
(
    @newId INT OUTPUT
    , @description VARCHAR(200)
	  , @dateSickness DATETIME
    , @whereOccurr VARCHAR(100)
    , @statusRecord BIT
	  , @totalDaysOutOfWork INT
    , @totalDaysRestrictedTransferredWork INT
    , @saCategoryId INT
    , @saTypeId INT
    , @employeeId INT
    , @createdBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO dbo.Sickness(description
                            , dateSickness
                            , whereOccurr
                            , statusRecord
                            , totalDaysOutOfWork
                            , totalDaysRestrictedTransferredWork
                            , saCategoryId
                            , saTypeId
                            , employeeId
                            , createdBy)
	VALUES (@description
			      , @dateSickness
            , @whereOccurr
            , @statusRecord
			      , @totalDaysOutOfWork
            , @totalDaysRestrictedTransferredWork
            , @saCategoryId
            , @saTypeId
            , @employeeId
            , @createdBy);

  SET @newId = SCOPE_IDENTITY();

  PRINT 'Executed proInsertSickness..';
END
GO

PRINT 'Procedure dbo.proInsertSickness created';
GO

/******************************************************************************
**  Name: SP proUpdateSickness
**  Desc: this script is to update new record into Sickness Table
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
-- Create proUpdateSickness stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proUpdateSickness]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proUpdateSickness]
GO

CREATE PROCEDURE [dbo].[proUpdateSickness]
(
    @id INT
    , @description VARCHAR(200)
	  , @dateSickness DATETIME
    , @whereOccurr VARCHAR(100)
    , @statusRecord BIT
	  , @totalDaysOutOfWork INT
    , @totalDaysRestrictedTransferredWork INT
    , @saCategoryId INT
    , @saTypeId INT
    , @employeeId INT
    , @updatedBy INT
	  , @updatedOn DATETIME
	  , @version BIGINT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE dbo.Sickness

    SET description = @description
        , dateSickness = @dateSickness
        , whereOccurr = @whereOccurr
        , statusRecord = @statusRecord
        , totalDaysOutOfWork = @totalDaysOutOfWork
        , totalDaysRestrictedTransferredWork = @totalDaysRestrictedTransferredWork
        , saCategoryId = @saCategoryId
        , saTypeId = @saTypeId
        , employeeId = @employeeId
        , updatedBy = @updatedBy
		    , updatedOn = @updatedOn
		    , version = @version
    WHERE id = @id;


  PRINT 'Executed proUpdateSickness..';
END
GO

PRINT 'Procedure dbo.proUpdateSickness created';
GO

/******************************************************************************
**  Name: SP proDeleteSickness
**  Desc: this script is to delete a record from Sickness Table
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
-- Create proDeleteSickness stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proDeleteSickness]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proDeleteSickness]
GO

CREATE PROCEDURE [dbo].[proDeleteSickness]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.Sickness
	WHERE id = @id;

  PRINT 'Executed proDeleteSickness..';
END
GO

PRINT 'Procedure dbo.proDeleteSickness created';
GO
-- end Henry