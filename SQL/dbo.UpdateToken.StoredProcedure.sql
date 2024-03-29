USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[UpdateToken]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 28-08-2014
-- Description:	Updates Token
-- =============================================
CREATE PROCEDURE [dbo].[UpdateToken] 
	-- Add the parameters for the stored procedure here
	@ID INT,
	@Serialnumber VARCHAR(MAX),
	@Discarded BIT,
	@Comment VARCHAR(MAX),
	@UserID UNIQUEIDENTIFIER,
	@Note VARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [Tokens] SET [Serialnumber] = @Serialnumber, [Discarded] = @Discarded, [Comment] = @Comment WHERE [ID] = @ID
	
	IF (@Note != '')
		EXEC dbo.WriteLog 3, 2, @ID, @UserID, @Note
END

GO
