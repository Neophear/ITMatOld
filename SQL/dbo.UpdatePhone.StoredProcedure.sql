USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[UpdatePhone]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 28-08-2014
-- Description:	Updates Phone
-- =============================================
CREATE PROCEDURE [dbo].[UpdatePhone]
	-- Add the parameters for the stored procedure here
	@ID INT,
	@IMEI VARCHAR(MAX),
	@Brand VARCHAR(MAX),
	@Model VARCHAR(MAX),
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
	UPDATE [Phones] SET [IMEI] = @IMEI, [Brand] = @Brand, [Model] = @Model, [Discarded] = @Discarded, [Comment] = @Comment, [TransferedCMDB] = @TransferedCMDB WHERE [ID] = @ID
	
	IF (@Note != '')
		EXEC dbo.WriteLog 3, 7, @ID, @UserID, @Note
END

GO
