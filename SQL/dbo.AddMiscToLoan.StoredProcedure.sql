USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[AddMiscToLoan]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 13-11-2013
-- Description:	Adds new misc item to loan
-- =============================================
CREATE PROCEDURE [dbo].[AddMiscToLoan] 
	-- Add the parameters for the stored procedure here
	@ItemMiscID int = 0,
	@ItemCount int = 0,
	@LoanID int = 0,
	@AddedBy uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    IF @ItemMiscID NOT IN (SELECT [ItemMiscTypeRefID] FROM [LoanDetailsMiscView] WHERE [LoanID] = @LoanID)
	BEGIN
		INSERT INTO [LoanDetailsMisc] ([ItemMiscTypeRefID], [ItemCount], [LoanID], [AddedBy], [AddedDate]) VALUES(@ItemMiscID, @ItemCount, @LoanID, @AddedBy, GETDATE())
		DECLARE @LastID INT = SCOPE_IDENTITY()
		EXEC dbo.WriteLog 1, 12, @LastID, @AddedBy
	END
	ELSE
		DECLARE @ID INT = (SELECT [ID] FROM [LoanDetailsMisc] WHERE [ItemMiscTypeRefID] = @ItemMiscID AND [LoanID] = @LoanID AND [Deleted] = 0)
		UPDATE [LoanDetailsMisc] SET [ItemCount] = ([ItemCount] + @ItemCount) WHERE [ID] = @ID
		EXEC dbo.WriteLog 3, 12, @ID, @AddedBy, 'Ændret antal'
END

GO
