USE [ITMat]
GO
/****** Object:  UserDefinedFunction [dbo].[GetUnAvailableItems]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 12-12-2013
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[GetUnAvailableItems] 
(	
	-- Add the parameters for the function here
	@StartDate date, 
	@EndDate date,
	@Type int
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT [ItemRefID] FROM [LoanDetails]
		LEFT OUTER JOIN
			[Loans] ON [LoanDetails].[LoanID] = [Loans].[ID]
	WHERE dbo.DateOverlaps([Loans].[DateFrom], [Loans].[DateTo], [Loans].[DateReturned], @StartDate, @EndDate) = 1 AND
		[LoanDetails].[Type] = @Type AND [Loans].[Deleted] = 0 AND [Loans].[FailedPickup] = 0 AND [LoanDetails].[ReturnedDate] IS NULL AND [LoanDetails].[Deleted] = 0
)
GO
