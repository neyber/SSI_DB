-- Start Marcelo
USE ssiA;

/******************************************************************************
**  Name: SP proGetDepartment
**  Desc: this script is to get a record from Department Table
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
-- Create proGetDepartment stored procedure.


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetDepartment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetDepartment]
GO

CREATE PROCEDURE [dbo].[proGetDepartment]
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

        FROM dbo.Department
        where id = @id;
END
GO
/******************************************************************************
**  Name: SP proGetAllDepartment
**  Desc: this script is to get all a record from Department Table
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
-- Create proGetAllDepartment stored procedure.
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetAllDepartments]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetAllDepartments]
GO

CREATE PROCEDURE [dbo].[proGetAllDepartments]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT  id
			, name
			, description

        FROM dbo.Department
END
GO

/******************************************************************************
**  Name: SP proInsertDepertment
**  Desc: this script is to insert a record from Department Table
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
-- Create proInsertDepertment stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proInsertDepartment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proInsertDepartment]
GO

CREATE PROCEDURE [dbo].[proInsertDepartment]
(
      @name VARCHAR(100)
	, @description varchar(200)
    , @createdBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO dbo.Department(name
                            , description
							, createdBy)
	VALUES (@name
			, @description
            , @createdBy);

	SELECT @@IDENTITY AS NewDepartmentID;
END
GO


/******************************************************************************
**  Name: SP proUpdateDepartment
**  Desc: this script is to Update a record from Department Table
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
-- Create proUpdateDepartment stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proUpdateDepartment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proUpdateDepartment]
GO

CREATE PROCEDURE [dbo].[proUpdateDepartment]
(
      @id INT
    , @name VARCHAR(100)
	, @description varchar(200)
    , @updatedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE dbo.Department
    SET name = @name
        , description = @description
        , updatedBy = @updatedBy
    WHERE id = @id;
END
GO

/******************************************************************************
**  Name: SP proDeleteDepartment
**  Desc: this script is to Delete a record from Department Table
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
-- Create proDeleteDepartment stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proDeleteDepartment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proDeleteDepartment]
GO

CREATE PROCEDURE [dbo].[proDeleteDepartment]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.Department
	WHERE id = @id;
END
GO

/******************************************************************************
**  Name: SP proGetRole
**  Desc: this script is to get a record from Role Table
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
-- Create proGetRole stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetRole]
GO

CREATE PROCEDURE [dbo].[proGetRole]
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

        FROM dbo.Role
        where id = @id;
END
GO

/******************************************************************************
**  Name: SP proGetAllRoles
**  Desc: this script is to get all a record from Role Table
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
-- Create proGetAllRoles stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetAllRoles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetAllRoles]
GO

CREATE PROCEDURE [dbo].[proGetAllRoles]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT id
			, name
			, description

        FROM dbo.Role
END
GO

/******************************************************************************
**  Name: SP proInsertRole
**  Desc: this script is to insert a record from Role Table
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
-- Create proInsertRole stored procedure.
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proInsertRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proInsertRole]
GO

CREATE PROCEDURE [dbo].[proInsertRole]
(
      @name VARCHAR(100)
	, @description varchar(200)
    , @createdBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO dbo.Role(name
                            , description
							, createdBy)
	VALUES (@name
			, @description
            , @createdBy);

	SELECT @@IDENTITY AS NewRoleID;
END
GO


/******************************************************************************
**  Name: SP proUpdateRole
**  Desc: this script is to Update a record from Role Table
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
-- Create proUpdateRole stored procedure.


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proUpdateRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proUpdateRole]
GO

CREATE PROCEDURE [dbo].[proUpdateRole]
(
      @id INT
    , @name VARCHAR(100)
	, @description varchar(200)
    , @updatedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE dbo.Role
    SET name = @name
        , description = @description
        , updatedBy = @updatedBy
    WHERE id = @id;
END
GO

/******************************************************************************
**  Name: SP proDeleteRole
**  Desc: this script is to Delete a record from Role Table
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
-- Create proDeleteRole stored procedure.


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proDeleteRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proDeleteRole]
GO

CREATE PROCEDURE [dbo].[proDeleteRole]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.Role
	WHERE id = @id;
END
GO

/******************************************************************************
**  Name: SP proGetFunctionManual
**  Desc: this script is to get a record from FunctionManual Table
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
-- Create proGetFunctionManual stored procedure.


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetFunctionManual]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetFunctionManual]
GO

CREATE PROCEDURE [dbo].[proGetFunctionManual]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT id
	    , dependentPersonal
      , externalRelation
		  , generalActivity
		  , hierarchicalLever
		  , internalRelation
		  , name
		  , position
		  , principalFunction
		  , superiorBoss
		  , roleFunctionId

        FROM dbo.FunctionManual
        where id = @id;
END
GO

/******************************************************************************
**  Name: SP proGetAllFunctionManual
**  Desc: this script is to get all a record from FunctionManual Table
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
-- Create proGetAllFunctionManual stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetAllFunctionManuals]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetAllFunctionManuals]
GO

CREATE PROCEDURE [dbo].[proGetAllFunctionManuals]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT id
	    , dependentPersonal
      , externalRelation
		  , generalActivity
		  , hierarchicalLever
		  , internalRelation
		  , name
		  , position
		  , principalFunction
		  , superiorBoss
		  , roleFunctionId

        FROM dbo.FunctionManual
END
GO

/******************************************************************************
**  Name: SP proInsertFunctionManual
**  Desc: this script is to insert a record from FunctionManual Table
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
-- Create proInsertFunctionManual stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proInsertFunctionManual]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proInsertFunctionManual]
GO

CREATE PROCEDURE [dbo].[proInsertFunctionManual]
(
	  @dependentPersonal VARCHAR(200)
	, @externalRelation VARCHAR(200)
	, @generalActivity VARCHAR(200)
	, @hierarchicalLever VARCHAR(50)
	, @internalRelation VARCHAR(200)
    , @name VARCHAR(50)
	, @position VARCHAR(50)
	, @principalFunction VARCHAR(100)
	, @superiorBoss VARCHAR(50)
    , @roleFunctionId INT
	, @createdBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO dbo.FunctionManual(dependentPersonal
                            , externalRelation
							, generalActivity
							, hierarchicalLever
							, internalRelation
							, name
							, position
							, principalFunction
							, superiorBoss
							, roleFunctionId
							, createdBy)
	VALUES (@dependentPersonal
			, @externalRelation
            , @generalActivity
			, @hierarchicalLever
			, @internalRelation
			, @name
			, @position
			, @principalFunction
			, @superiorBoss
			, @roleFunctionId
			, @createdBy);

	SELECT @@IDENTITY AS NewFuntionManualID;
END
GO

/******************************************************************************
**  Name: SP proUpdateFunctionManual
**  Desc: this script is to Update a record from FunctionManual Table
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
-- Create proUpdateFunctionManual stored procedure.
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proUpdateFunctionManual]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proUpdateFunctionManual]
GO

CREATE PROCEDURE [dbo].[proUpdateFunctionManual]
(
      @id INT
    , @dependentPersonal VARCHAR(200)
	, @externalRelation VARCHAR(200)
	, @generalActivity VARCHAR(200)
	, @hierarchicalLever VARCHAR(50)
	, @internalRelation VARCHAR(200)
    , @name VARCHAR(50)
	, @position VARCHAR(50)
	, @principalFunction VARCHAR(100)
	, @superiorBoss VARCHAR(50)
    , @roleFunctionId INT
	, @updatedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE dbo.FunctionManual
    SET dependentPersonal = @dependentPersonal
        , externalRelation = @externalRelation
		, generalActivity = @generalActivity
		, hierarchicalLever = @hierarchicalLever
		, internalRelation = @internalRelation
		, name = @name
		, position = @position
		, principalFunction = @principalFunction
		, superiorBoss = @superiorBoss
		, roleFunctionId = @roleFunctionId
		, updatedBy = @updatedBy
    WHERE id = @id;
END
GO

/******************************************************************************
**  Name: SP proDeleteFunctionManual
**  Desc: this script is to Delete a record from FunctionManual Table
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
-- Create proDeleteFunctionManual stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proDeleteFunctionManual]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proDeleteFunctionManual]
GO

CREATE PROCEDURE [dbo].[proDeleteFunctionManual]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.FunctionManual
	WHERE id = @id;
END
GO
/******************************************************************************
**  Name: SP proGetEmplyoee
**  Desc: this script is to get all a record from Emplyoee Table
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
-- Create proGetEmplyoee stored procedure.
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetEmployee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetEmployee]
GO

CREATE PROCEDURE [dbo].[proGetEmployee]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT id
	    , dateOfBirth
			, firstName
			, gender
			, healthConditionStartingAtCompany
			, identificationNumber
			, lastName
			, startDateInCompany
			, departmentEmployeeId
			, roleEmployeeId
			, supervisorId

        FROM dbo.Employee
        where id = @id;
END
GO
/******************************************************************************
**  Name: SP proGetAllEmplyoee
**  Desc: this script is to get all a record from Emplyoee Table
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
-- Create proGetAllEmplyoee stored procedure.
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetAllEmployees]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetAllEmployees]
GO

CREATE PROCEDURE [dbo].[proGetAllEmployees]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT id
	    , dateOfBirth
			, firstName
			, gender
			, healthConditionStartingAtCompany
			, identificationNumber
			, lastName
			, startDateInCompany
			, departmentEmployeeId
			, roleEmployeeId
			, supervisorId

        FROM dbo.Employee
END
GO

/******************************************************************************
**  Name: SP proInsertEmplyoee
**  Desc: this script is to insert a record from Emplyoee Table
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
-- Create proInsertEmplyoee stored procedure.


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proInsertEmployee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proInsertEmployee]
GO

CREATE PROCEDURE [dbo].[proInsertEmployee]
(
	  @dateOfBirth DATE
	, @firstName VARCHAR(50)
	, @gender CHAR(1)
	, @healthConditionStartingAtCompany VARCHAR(100)
	, @identificationNumber BIGINT
    , @lastName VARCHAR(50)
	, @startDateInCompany DATE
	, @departmentEmployeeId INT
	, @roleEmployeeId INT
    , @supervisorId INT
	, @createdBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO dbo.Employee(dateOfBirth
						   , firstName
						   , gender
						   , healthConditionStartingAtCompany
						   , identificationNumber
						   , lastName
						   , startDateInCompany
						   , departmentEmployeeId
						   , RoleEmployeeId
						   , SupervisorId
						   , createdBy)
	VALUES (  @dateOfBirth
			, @firstName
			, @gender
			, @healthConditionStartingAtCompany
			, @identificationNumber
			, @lastName
			, @startDateInCompany
			, @departmentEmployeeId
			, @roleEmployeeId
			, @supervisorId
			, @createdBy);

	SELECT @@IDENTITY AS NewEmployeeID;
END
GO


/******************************************************************************
**  Name: SP proUpdateEmplyoee
**  Desc: this script is to Update a record from Emplyoee Table
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
-- Create proUpdateEmplyoee stored procedure.
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proUpdateEmployee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proUpdateEmployee]
GO

CREATE PROCEDURE [dbo].[proUpdateEmployee]
(
      @id INT
    , @dateOfBirth DATE
	, @firstName VARCHAR(50)
	, @gender CHAR(1)
	, @healthConditionStartingAtCompany VARCHAR(100)
	, @identificationNumber BIGINT
    , @lastName VARCHAR(50)
	, @startDateInCompany DATE
	, @departmentEmployeeId INT
	, @roleEmployeeId INT
    , @supervisorId INT
	, @updatedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE dbo.Employee
    SET dateOfBirth = @dateOfBirth
        , firstName = @firstName
		, gender = @gender
		, healthConditionStartingAtCompany = @healthConditionStartingAtCompany
		, identificationNumber = @identificationNumber
		, lastName = @lastName
		, startDateInCompany = @startDateInCompany
		, departmentEmployeeId = @departmentEmployeeId
		, roleEmployeeId = @roleEmployeeId
		, supervisorId = @supervisorId
		, updatedBy = @updatedBy
    WHERE id = @id;
END
GO

/******************************************************************************
**  Name: SP proDeleteEmplyoee
**  Desc: this script is to Delete a record from Emplyoee Table
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
-- Create proDeleteEmplyoee stored procedure.
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proDeleteEmployee]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proDeleteEmployee]
GO

CREATE PROCEDURE [dbo].[proDeleteEmployee]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.Employee
	WHERE id = @id;
END
GO



/******************************************************************************
**  Name: SP proGetAudit
**  Desc: this script is to get a record from Audit Table
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
-- Create proGetAudit stored procedure.
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetAudit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetAudit]
GO

CREATE PROCEDURE [dbo].[proGetAudit]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT id
	    , auditCode
			, auditCriteria
			, auditName
			, auditObjective
			, auditScope
			, auditType
			, employeeId
			, periodicity
			, DepartmentId

        FROM dbo.Audit
        where id = @id;
END
GO

/******************************************************************************
**  Name: SP proGetAllAudit
**  Desc: this script is to get all a record from Audit Table
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
-- Create proGetAllAudit stored procedure.
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetAllAudits]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetAllAudits]
GO

CREATE PROCEDURE [dbo].[proGetAllAudits]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT id
	    , auditCode
			, auditCriteria
			, auditName
			, auditObjective
			, auditScope
			, auditType
			, employeeId
			, periodicity
			, DepartmentId

        FROM dbo.Audit
END
GO

/******************************************************************************
**  Name: SP proInsertAudit
**  Desc: this script is to insert a record from Audit Table
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
-- Create proInsertAudit stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proInsertAudit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proInsertAudit]
GO

CREATE PROCEDURE [dbo].[proInsertAudit]
(
	    @auditCode VARCHAR(100)
      , @auditCriteria VARCHAR(100)
      , @auditName VARCHAR(50)
      , @auditObjective VARCHAR(100)
      , @auditScope VARCHAR(100)
      , @auditType VARCHAR(50)
      , @employeeId INT
      , @periodicity VARCHAR(50)
      , @DepartmentId INT
	  , @createdBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO dbo.Audit(auditCode
						, auditCriteria
						, auditName
						, auditObjective
						, auditScope
						, auditType
						, employeeId
						, periodicity
						, DepartmentId
						, createdBy)
	VALUES (  @auditCode
		    , @auditCriteria
		    , @auditName
		    , @auditObjective
		    , @auditScope
		    , @auditType
		    , @employeeId
		    , @periodicity
		    , @DepartmentId
		    , @createdBy);

	SELECT @@IDENTITY AS NewAuditID;
END
GO


/******************************************************************************
**  Name: SP proUpdateAudit
**  Desc: this script is to Update a record from Audit Table
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
-- Create proUpdateAudit stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proUpdateAudit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proUpdateAudit]
GO

CREATE PROCEDURE [dbo].[proUpdateAudit]
(
      @id INT
    , @auditCode VARCHAR(100)
    , @auditCriteria VARCHAR(100)
    , @auditName VARCHAR(50)
    , @auditObjective VARCHAR(100)
    , @auditScope VARCHAR(100)
    , @auditType VARCHAR(50)
    , @employeeId INT
    , @periodicity VARCHAR(50)
    , @DepartmentId INT
	, @updatedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE dbo.Audit
    SET auditCode = @auditCode
        , auditCriteria = @auditCriteria
		, auditName = @auditName
		, auditObjective = @auditObjective
		, auditScope = @auditScope
		, auditType = @auditType
		, employeeId = @employeeId
		, periodicity = @periodicity
		, DepartmentId = @DepartmentId
		, updatedBy = @updatedBy
    WHERE id = @id;
END
GO

/******************************************************************************
**  Name: SP proDeleteAudit
**  Desc: this script is to Delete a record from Audit Table
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
-- Create proDeleteAudit stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proDeleteAudit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proDeleteAudit]
GO

CREATE PROCEDURE [dbo].[proDeleteAudit]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.Audit
	WHERE id = @id;
END
GO

/******************************************************************************
**  Name: SP proGetSafetyRule
**  Desc: this script is to get a record from SafetyRule Table
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
-- Create proGetSafetyRule stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetSafetyRule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetSafetyRule]
GO

CREATE PROCEDURE [dbo].[proGetSafetyRule]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT id
	    , accomplishment
			, auditId
			, complianceMetric
			, complianceParameter
			, policyCode
			, policyName

        FROM dbo.SafetyRule
        where id = @id;
END
GO

/******************************************************************************
**  Name: SP proGetAllSafetyRule
**  Desc: this script is to get all a record from SafetyRule Table
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
-- Create proGetAllSafetyRule stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proGetAllSafetyRules]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proGetAllSafetyRules]
GO

CREATE PROCEDURE [dbo].[proGetAllSafetyRules]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	 SELECT id
	    , accomplishment
			, auditId
			, complianceMetric
			, complianceParameter
			, policyCode
			, policyName

        FROM dbo.SafetyRule
END
GO

/******************************************************************************
**  Name: SP proInsertSafetyRule
**  Desc: this script is to insert a record from SafetyRule Table
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
-- Create proInsertSafetyRule stored procedure.
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proInsertSafetyRule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proInsertSafetyRule]
GO

CREATE PROCEDURE [dbo].[proInsertSafetyRule]
(
		@accomplishment BIT
      , @auditId INT
      , @complianceMetric INT
      , @complianceParameter INT
      , @policyCode VARCHAR(100)
      , @policyName VARCHAR(100)
	  , @createdBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO dbo.SafetyRule(accomplishment
								, auditId
								, complianceMetric
								, complianceParameter
								, policyCode
								, policyName
								, createdBy)
	VALUES (  @accomplishment
			, @auditId
			, @complianceMetric
			, @complianceParameter
			, @policyCode
			, @policyName
			, @createdBy);

	SELECT @@IDENTITY AS NewSafetyRuleID;
END
GO

/******************************************************************************
**  Name: SP proUpdateSafetyRule
**  Desc: this script is to Update a record from SafetyRule Table
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
-- Create proUpdateSafetyRule stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proUpdateSafetyRule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proUpdateSafetyRule]
GO

CREATE PROCEDURE [dbo].[proUpdateSafetyRule]
(
      @id INT
    , @accomplishment BIT
    , @auditId INT
    , @complianceMetric INT
    , @complianceParameter INT
    , @policyCode VARCHAR(100)
    , @policyName VARCHAR(100)
	, @updatedBy INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE dbo.SafetyRule
    SET accomplishment = @accomplishment
        , auditId = @auditId
		, complianceMetric = @complianceMetric
		, complianceParameter = @complianceParameter
		, policyCode = @policyCode
		, policyName = @policyName
		, updatedBy = @updatedBy
    WHERE id = @id;
END
GO

/******************************************************************************
**  Name: SP proDeleteSafetyRule
**  Desc: this script is to Delete a record from SafetyRule Table
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
-- Create proDeleteSafetyRule stored procedure.

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[proDeleteSafetyRule]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[proDeleteSafetyRule]
GO

CREATE PROCEDURE [dbo].[proDeleteSafetyRule]
(
    @id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM dbo.SafetyRule
	WHERE id = @id;
END
GO

-- End Marcelo