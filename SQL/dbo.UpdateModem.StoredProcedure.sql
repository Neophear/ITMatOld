USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[UpdateModem]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 20-03-2014
-- Description:	Updates Modem
-- =============================================
CREATE PROCEDURE [dbo].[UpdateModem] 
	-- Add the parameters for the stored procedure here
	@ID int,
	@IMEI varchar(50),
	@Brand varchar(50),
	@Model varchar(50),
	@SIMcardRefID int,
	@Discarded bit = 0,
	@Comment varchar(MAX),
	@TransferedCMDB bit,
	@UserID UNIQUEIDENTIFIER,
	@Note VARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE
		[Modem]
	SET
		[Modem].[IMEI] = @IMEI,
		[Modem].[Brand] = @Brand,
		[Modem].[Model] = @Model,
		[Modem].[Discarded] = @Discarded,
		[Modem].[Comment] = @Comment,
		[Modem].[TransferedCMDB] = @TransferedCMDB
	WHERE
		[Modem].[ID] = @ID
	
	IF (@SIMcardRefID IS NOT NULL)
	BEGIN
		UPDATE
			[Modem]
		SET
			[Modem].[SIMcardRefID] = @SIMcardRefID
		WHERE
			[Modem].[ID] = @ID
	END
	
	DECLARE @OldSIMcardRefID int = (SELECT [SIMcardRefID] FROM [Modem] WHERE [ID] = @ID)
	
	IF (@OldSIMcardRefID IS NOT NULL)
	BEGIN
		UPDATE
			[SIMcard]
		SET
			[SIMcard].[Discarded] = @Discarded,
			[SIMcard].[TransferedCMDB] = @TransferedCMDB
		WHERE
			[SIMcard].[ID] = @OldSIMcardRefID
	END
	
	IF (@Note != '')
		EXEC dbo.WriteLog 3, 1, @ID, @UserID, @Note
END
GO
