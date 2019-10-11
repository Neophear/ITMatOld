USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[DeleteLoanDetail]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 29-08-2014
-- Description:	Sets LoanDetail to deleted
-- =============================================
CREATE PROCEDURE [dbo].[DeleteLoanDetail] 
	-- Add the parameters for the stored procedure here
	@LoanDetailsID INT, 
	@UserID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [LoanDetails] SET [Deleted] = 1 WHERE [ID] = @LoanDetailsID
	EXEC dbo.WriteLog 2, 11, @LoanDetailsID, @UserID
END

GO
