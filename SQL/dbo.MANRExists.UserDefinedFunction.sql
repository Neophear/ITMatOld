USE [ITMat]
GO
/****** Object:  UserDefinedFunction [dbo].[MANRExists]    Script Date: 25-01-2018 10:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 24-10-2013
-- Description:	Checks if MANR exists. If not returns 0
-- =============================================
CREATE FUNCTION [dbo].[MANRExists] 
(
	-- Add the parameters for the function here
	@MANR VARCHAR(10)
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result VARCHAR(10)

	-- Add the T-SQL statements to compute the return value here
	SET @Result = (SELECT [ID] FROM [Customers] WHERE [MANR] = @MANR)
	
	IF @Result IS NULL
		SET @Result = '0'

	-- Return the result of the function
	RETURN @Result

END

GO
