USE [ITMat]
GO
/****** Object:  UserDefinedFunction [dbo].[GetOutlookName]    Script Date: 25-01-2018 10:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 26-03-2014
-- Description:	Gets outlookname from customer
-- =============================================
CREATE FUNCTION [dbo].[GetOutlookName] 
(
	-- Add the parameters for the function here
	@ID int
)
RETURNS varchar(50)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result varchar(50)

	-- Add the T-SQL statements to compute the return value here
	SET @Result = Replace((SELECT ([Stabsnummer] + ' ' + [Lastname] + ', ' + [Firstname] + ' ' + ISNULL([Middlename], '')) FROM [Customers] WHERE [ID] = @ID),'  ', ' ')
	
	-- Return the result of the function
	RETURN @Result

END

GO
