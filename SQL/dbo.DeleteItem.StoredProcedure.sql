USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[DeleteItem]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 04-10-2013
-- Description:	Deletes an Item with loandetails
-- =============================================
CREATE PROCEDURE [dbo].[DeleteItem] 
	-- Add the parameters for the stored procedure here
	@ID int = 0,
	@Type int = 0,
	@UserID uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    IF @Type = 1
		UPDATE [Modem] SET [Deleted] = 1, [DeletedBy] = @UserID, [DeletedDate] = GETDATE() WHERE [ID] = @ID
	ELSE IF @Type = 2
		UPDATE [Tokens] SET [Deleted] = 1, [DeletedBy] = @UserID, [DeletedDate] = GETDATE() WHERE [ID] = @ID
	ELSE IF @Type = 3
		UPDATE [Laptop] SET [Deleted] = 1, [DeletedBy] = @UserID, [DeletedDate] = GETDATE() WHERE [ID] = @ID
	ELSE IF @Type = 4
		UPDATE [Printer] SET [Deleted] = 1, [DeletedBy] = @UserID, [DeletedDate] = GETDATE() WHERE [ID] = @ID
	ELSE IF @Type = 5
		UPDATE [Projector] SET [Deleted] = 1, [DeletedBy] = @UserID, [DeletedDate] = GETDATE() WHERE [ID] = @ID
	ELSE IF @Type = 6
		UPDATE [USBKey] SET [Deleted] = 1, [DeletedBy] = @UserID, [DeletedDate] = GETDATE() WHERE [ID] = @ID
	ELSE IF @Type = 7
		UPDATE [Phones] SET [Deleted] = 1, [DeletedBy] = @UserID, [DeletedDate] = GETDATE() WHERE [ID] = @ID
	ELSE IF @Type = 8
		UPDATE [SIMcard] SET [Deleted] = 1, [DeletedBy] = @UserID, [DeletedDate] = GETDATE() WHERE [ID] = @ID
    
    UPDATE [LoanDetails] SET [Deleted] = 1 WHERE [Type] = @Type AND [ItemRefID] = @ID
    
    EXEC dbo.WriteLog 2, @Type, @ID, @UserID
END
GO
