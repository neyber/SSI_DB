/******************************************************************************
**  Name: SP proGetAccidentsReport
**  Desc: this script is to get a record from Fact_Accident Table
**
**  Author: Walker Colina
**
**  Date: 06/08/2018
*******************************************************************************
*                            Change History
******************************************************************************
*  Fecha:         Autor:                                 Descripcion:
 --------      -----------               ---------------------------------------------------
 06/08/2018    Walker Colina	         - Initial version
 06/08/2018    Walker Colina	         - Added FullDate column
******************************************************************************/
-- Create proGetAccidentsReport stored procedure.


USE [ssiA_DW]
GO

-- Create proGetWorkItemClassification stored procedure.
IF EXISTS (SELECT * FROM sys.objects
           WHERE object_id = OBJECT_ID(N'[proGetAccidentsReport]')
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE proGetAccidentsReport;
END
GO

CREATE PROCEDURE proGetAccidentsReport
(
	@startDate datetime,
	@endDate datetime
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	  SELECT 
		  CONCAT(E.[firstName], ' ', E.[lastName]) AS fullName
		  ,"Gender" = 
			CASE
				WHEN E.[gender] = 'F' THEN 'Female'
				WHEN E.[gender] = 'M' THEN 'Male'
				ELSE E.[gender]
			END
		  ,E.[role]
		  ,T.[FiscalYear] AS [year]
		  ,T.[MonthName] AS [month]
		  ,T.[DayOfMonth] AS [day]
		  ,T.[FullDate] AS [fullDate]
		  ,A.[quantity]
	  FROM [ssiA_DW].[ACC].[Fact_Accident] A
		  LEFT JOIN [ssiA_DW].[ACC].[Dim_Employees] E ON A.[idDimEmployee] = E.[idDimEmployee]
		  LEFT JOIN [ssiA_DW].[ACC].[Dim_Departments] D ON D.[idDimDepartment] = A.[idDimDepartment]
		  LEFT JOIN [ssiA_DW].[ACC].[Dim_Time] T ON T.[idDimTime] = A.[idDimTime]
	  WHERE T.[FullDate] >= @startDate AND T.[FullDate] <= @endDate

	  PRINT 'Executed proGetAccidentsReport..';
END
GO

PRINT 'Procedure proGetAccidentsReport created';
GO