USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[InsertPhone]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 01-11-2013
-- Description:	Insert item into Items DB
-- =============================================
CREATE PROCEDURE [dbo].[InsertPhone] 
	-- Add the parameters for the stored procedure here
	@IMEI VARCHAR(50),
	@Brand VARCHAR(50),
	@Model VARCHAR(50),
	@Discarded BIT = 0,
	@Comment VARCHAR(MAX),
	@CreatedBy UNIQUEIDENTIFIER
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DECLARE @LastID INT;
    
	INSERT INTO dbo.[Phones] ([IMEI], [Brand], [Model], [Discarded], [Comment], [CreatedBy]) VALUES(@IMEI, @Brand, @Model, @Discarded, @Comment, @CreatedBy);
	SET @LastID = SCOPE_IDENTITY();
	
	EXEC dbo.WriteLog 1, 7, @LastID, @CreatedBy
	RETURN @LastID;
END

GO
