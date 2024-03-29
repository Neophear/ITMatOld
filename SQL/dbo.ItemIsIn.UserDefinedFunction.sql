USE [ITMat]
GO
/****** Object:  UserDefinedFunction [dbo].[ItemIsIn]    Script Date: 25-01-2018 10:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 23-10-2013
-- Description:	Checks to see if an item is in
-- =============================================
CREATE FUNCTION [dbo].[ItemIsIn] 
(
	-- Add the parameters for the function here
	@DateFrom date,
	@DateTo date,
	@DatePickedUp date,
	@DateReturned date
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result bit = 0

	-- Add the T-SQL statements to compute the return value here
	IF (@DateReturned IS NULL)
		SET @Result = 0
	ELSE IF (GETDATE() > @DateReturned)
		SET @Result = 1
    ELSE IF (GETDATE() BETWEEN @DateFrom AND @DateTo)
		SET @Result = 0
    ELSE
		SET @Result = 1
    

	-- Return the result of the function
	RETURN @Result

END

GO
