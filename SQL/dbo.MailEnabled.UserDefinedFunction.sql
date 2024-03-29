USE [ITMat]
GO
/****** Object:  UserDefinedFunction [dbo].[MailEnabled]    Script Date: 25-01-2018 10:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig
-- Create date: 22-08-2014
-- Description:	Checks if loan is mail enabled
-- =============================================
CREATE FUNCTION [dbo].[MailEnabled] 
(
	-- Add the parameters for the function here
	@LoanID INT
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result BIT
	DECLARE @Count INT
	DECLARE @PickedUp BIT
	DECLARE @FailedPickup BIT
	
	-- Add the T-SQL statements to compute the return value here
	SET @Count = (SELECT COUNT(*) FROM [Log] WHERE [ItemTypeRefID] = 10 AND [ItemRefID] = @LoanID AND [ActionRefID] = 4 AND CONVERT(DATE, [TimeStamp]) = CONVERT(DATE, GETDATE()))
	
	IF ((SELECT [DatePickedUp] FROM [Loans] WHERE [ID] = @LoanID) IS NULL)
		SET @PickedUp = 0
	ELSE
		SET @PickedUp = 1
	
	SET @FailedPickup = (SELECT [FailedPickup] FROM [Loans] WHERE [ID] = @LoanID)
	
	IF ((@Count = 0) AND (@PickedUp = 0) AND (@FailedPickup = 0))
		SET @Result = 1
	ELSE
		SET @Result = 0

	-- Return the result of the function
	RETURN @Result

END

GO
