USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[CustomerExists]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 02-09-2014
-- Description:	Checks whether Customer exists
-- =============================================
CREATE PROCEDURE [dbo].[CustomerExists] 
	-- Add the parameters for the stored procedure here
	@MANR VARCHAR(8),
	@Stabsnummer VARCHAR(20),
	@ID INT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @errors VARCHAR(2) = ''

	-- Add the T-SQL statements to compute the return value here
	IF EXISTS (SELECT TOP 1 * FROM [Customers] WHERE [MANR] = @MANR AND [ID] != @ID AND [Deleted] = 0)
		SET @errors = '8'
	IF EXISTS (SELECT TOP 1 * FROM [Customers] WHERE [Stabsnummer] = @Stabsnummer AND [ID] != @ID AND [Deleted] = 0)
		SET @errors = (@errors + '9')
	
	-- Return the result of the function
	RETURN @errors
END

GO
