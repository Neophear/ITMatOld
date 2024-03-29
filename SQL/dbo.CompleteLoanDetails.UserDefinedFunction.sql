USE [ITMat]
GO
/****** Object:  UserDefinedFunction [dbo].[CompleteLoanDetails]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 31-10-2013
-- Description:	Returns table with all items in a Loan
-- =============================================
CREATE FUNCTION [dbo].[CompleteLoanDetails] 
(	
	-- Add the parameters for the function here
	@LoanID int
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT [ItemRefID], [IMEI] AS [Serialnumber], [SIMcardnr] AS [Name], 1 AS [Type] FROM [LoanDetailsModem] WHERE [LoanID] = @LoanID
	UNION
	SELECT [ItemRefID], [Serialnumber], '', 2 FROM [LoanDetailsToken] WHERE [LoanID] = @LoanID
	UNION
	SELECT [ItemRefID], [Serialnumber], [Name], 3 FROM [LoanDetailsLaptop] WHERE [LoanID] = @LoanID
	UNION
	SELECT [ItemRefID], [Serialnumber], [Name], 4 FROM [LoanDetailsPrinter] WHERE [LoanID] = @LoanID
	UNION
	SELECT [ItemRefID], [Serialnumber], '', 5 FROM [LoanDetailsProjector] WHERE [LoanID] = @LoanID
	UNION
	SELECT [ItemRefID], [Serialnumber], '', 6 FROM [LoanDetailsUSBKey] WHERE [LoanID] = @LoanID
	UNION
	SELECT [ItemRefID], [IMEI], '', 7 FROM [LoanDetailsPhones] WHERE [LoanID] = @LoanID
	UNION
	SELECT [ItemRefID], '', [SIMCardnr], 8 FROM [LoanDetailsSIMcard] WHERE [LoanID] = @LoanID
)

GO
