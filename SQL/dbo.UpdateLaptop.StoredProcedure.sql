USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[UpdateLaptop]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 28-08-2014
-- Description:	Updates Laptop
-- =============================================
CREATE PROCEDURE [dbo].[UpdateLaptop] 
	-- Add the parameters for the stored procedure here
	@ID INT,
	@Serialnumber VARCHAR(MAX),
	@GUID VARCHAR(50),
	@Brand VARCHAR(20),
	@Model VARCHAR(20),
	@FIIN BIT,
	@Name VARCHAR(50),
	@Description VARCHAR(50),
	@Discarded BIT = 0,
	@Comment VARCHAR(MAX),
	@UserID UNIQUEIDENTIFIER,
	@Note VARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [Laptop] SET [Serialnumber] = @Serialnumber, [GUID] = @GUID, [Brand] = @Brand, [Model] = @Model, [FIIN] = @FIIN, [Name] = @Name, [Description] = @Description, [Discarded] = @Discarded, [Comment] = @Comment WHERE [ID] = @ID
	
	IF (@Note != '')
		EXEC dbo.WriteLog 3, 3, @ID, @UserID, @Note
END

GO
