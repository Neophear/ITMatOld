USE [ITMat]
GO
/****** Object:  UserDefinedFunction [dbo].[GetMailInfo]    Script Date: 25-01-2018 10:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 14-08-2014
-- Description:	Creates a tooltip for a loan
-- =============================================
CREATE FUNCTION [dbo].[GetMailInfo] 
(
	-- Add the parameters for the function here
	@LoanID int
)
RETURNS VARCHAR(MAX)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Tooltip VARCHAR(MAX) = ''

	-- Add the T-SQL statements to compute the return value here
	DECLARE @ModemCount INT = (SELECT COUNT(*) FROM [LoanDetails] WHERE [LoanDetails].[LoanID] = @LoanID AND [LoanDetails].[Type] = 1 AND [LoanDetails].[Deleted] = 0)
	DECLARE @TokenCount INT = (SELECT COUNT(*) FROM [LoanDetails] WHERE [LoanDetails].[LoanID] = @LoanID AND [LoanDetails].[Type] = 2 AND [LoanDetails].[Deleted] = 0)
	DECLARE @LaptopCount INT = (SELECT COUNT(*) FROM [LoanDetails] WHERE [LoanDetails].[LoanID] = @LoanID AND [LoanDetails].[Type] = 3 AND [LoanDetails].[Deleted] = 0)
	DECLARE @PrinterCount INT = (SELECT COUNT(*) FROM [LoanDetails] WHERE [LoanDetails].[LoanID] = @LoanID AND [LoanDetails].[Type] = 4 AND [LoanDetails].[Deleted] = 0)
	DECLARE @ProjectorCount INT = (SELECT COUNT(*) FROM [LoanDetails] WHERE [LoanDetails].[LoanID] = @LoanID AND [LoanDetails].[Type] = 5 AND [LoanDetails].[Deleted] = 0)
	DECLARE @USBkeyCount INT = (SELECT COUNT(*) FROM [LoanDetails] WHERE [LoanDetails].[LoanID] = @LoanID AND [LoanDetails].[Type] = 6 AND [LoanDetails].[Deleted] = 0)
	DECLARE @PhoneCount INT = (SELECT COUNT(*) FROM [LoanDetails] WHERE [LoanDetails].[LoanID] = @LoanID AND [LoanDetails].[Type] = 7 AND [LoanDetails].[Deleted] = 0)
	DECLARE @SIMcardCount INT = (SELECT COUNT(*) FROM [LoanDetails] WHERE [LoanDetails].[LoanID] = @LoanID AND [LoanDetails].[Type] = 8 AND [LoanDetails].[Deleted] = 0)
	

	IF @ModemCount > 0
	BEGIN
		SET @Tooltip += CAST(@ModemCount AS VARCHAR(3)) + 'x modem\n'
	END
	
	IF @TokenCount > 0
	BEGIN
		SET @Tooltip += CAST(@TokenCount AS VARCHAR(3)) + 'x token\n'
	END
	
	IF @LaptopCount > 0
	BEGIN
		SET @Tooltip += CAST(@LaptopCount AS VARCHAR(3)) + 'x bærbar\n'
	END
	
	IF @PrinterCount > 0
	BEGIN
		SET @Tooltip += CAST(@PrinterCount AS VARCHAR(3)) + 'x printer\n'
	END
	
	IF @ProjectorCount > 0
	BEGIN
		SET @Tooltip += CAST(@ProjectorCount AS VARCHAR(3)) + 'x projektor\n'
	END
	
	IF @USBkeyCount > 0
	BEGIN
		SET @Tooltip += CAST(@USBkeyCount AS VARCHAR(3)) + 'x USB-nøgle\n'
	END
	
	IF @PhoneCount > 0
	BEGIN
		SET @Tooltip += CAST(@PhoneCount AS VARCHAR(3)) + 'x mobiltelefon\n'
	END
	
	IF @SIMcardCount > 0
	BEGIN
		SET @Tooltip += CAST(@SIMcardCount AS VARCHAR(3)) + 'x SIM-kort\n'
	END
	
	-- Return the result of the function
	RETURN @Tooltip

END

GO
