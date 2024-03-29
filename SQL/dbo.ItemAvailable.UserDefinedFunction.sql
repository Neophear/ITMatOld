USE [ITMat]
GO
/****** Object:  UserDefinedFunction [dbo].[ItemAvailable]    Script Date: 25-01-2018 10:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 24-10-2013
-- Description:	Checks whether an item is unavailable
-- =============================================
CREATE FUNCTION [dbo].[ItemAvailable] 
(
	-- Add the parameters for the function here
	@StartDate date,
	@EndDate date,
	@ItemID int,
	@ItemType int
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result bit

	-- Add the T-SQL statements to compute the return value here

	IF EXISTS (SELECT [ItemRefID] FROM [LoanDetails]
		LEFT OUTER JOIN
			[Loans] ON [LoanDetails].[LoanID] = [Loans].[ID]
		WHERE 
			dbo.DateOverlaps([Loans].[DateFrom], [Loans].[DateTo], [Loans].[DateReturned], @StartDate, @EndDate) = 1
		AND
			[LoanDetails].[Type] = @ItemType
		AND
			[ItemRefID] = @ItemID
		OR
			[LoanDetails].[ReturnedDate] IS NOT NULL)
	BEGIN
		SET @Result = 1
	END

	-- Return the result of the function
	RETURN @Result

END

GO
