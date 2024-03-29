USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[DeleteLoanDetailMisc]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 01-09-2014
-- Description:	Deletes a misc
-- =============================================
CREATE PROCEDURE [dbo].[DeleteLoanDetailMisc] 
	-- Add the parameters for the stored procedure here
	@ID INT,
	@UserID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [LoanDetailsMisc] SET [Deleted] = 1 WHERE [ID] = @ID
	EXEC dbo.WriteLog 2, 12, @ID, @UserID
END

GO
