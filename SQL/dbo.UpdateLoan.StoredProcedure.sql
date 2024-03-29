USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[UpdateLoan]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 31-08-2014
-- Description:	Updates loan
-- =============================================
CREATE PROCEDURE [dbo].[UpdateLoan] 
	-- Add the parameters for the stored procedure here
	@ID INT,
	@DateFrom DATETIME,
	@DateTo DATETIME,
	@DatePickedUp DATETIME,
	@DateReturned DATETIME,
	@TypeRefID INT,
	@Comment VARCHAR(MAX),
	@UserID UNIQUEIDENTIFIER,
	@Note VARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [Loans] SET [DateFrom] = @DateFrom, [DateTo] = @DateTo, [DatePickedUp] = @DatePickedUp, [DateReturned] = @DateReturned, [Comment] = @Comment, [TypeRefID] = @TypeRefID WHERE [ID] = @ID
	
	IF (@Note != '')
		EXEC dbo.WriteLog 3, 10, @ID, @UserID, @Note
END

GO
