USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[MailSent]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 27-08-2014
-- Description:	Inserts mail log
-- =============================================
CREATE PROCEDURE [dbo].[MailSent] 
	-- Add the parameters for the stored procedure here
	@LoanID INT,
	@UserID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	EXEC dbo.WriteLog 4, 10, @LoanID, @UserID
END

GO
