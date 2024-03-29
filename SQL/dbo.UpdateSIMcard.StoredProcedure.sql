USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[UpdateSIMcard]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 28-08-2014
-- Description:	Updates SIMcard
-- =============================================
CREATE PROCEDURE [dbo].[UpdateSIMcard]
	-- Add the parameters for the stored procedure here
	@ID INT,
	@SIMcardnr VARCHAR(50),
	@Phonenr VARCHAR(20),
	@PUK VARCHAR(20),
	@PIN VARCHAR(8),
	@Discarded BIT = 0,
	@Comment VARCHAR(MAX),
	@TransferedCMDB BIT,
	@UserID UNIQUEIDENTIFIER,
	@Note VARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [SIMcard] SET [SIMcardnr] = @SIMcardnr, [Phonenr] = @Phonenr, [PUK] = @PUK, [PIN] = @PIN, [Discarded] = @Discarded, [Comment] = @Comment, [TransferedCMDB] = @TransferedCMDB WHERE [ID] = @ID
	
	IF (@Note != '')
		EXEC dbo.WriteLog 3, 8, @ID, @UserID, @Note
END

GO
