USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[InsertSIMcard]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 01-11-2013
-- Description:	Insert item into Items DB
-- =============================================
CREATE PROCEDURE [dbo].[InsertSIMcard] 
	-- Add the parameters for the stored procedure here
	@SIMcardnr VARCHAR(50),
	@Phonenr VARCHAR(20) = '',
	@PUK VARCHAR(20) = '',
	@PIN VARCHAR(8) = '',
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
    
	INSERT INTO dbo.[SIMcard] ([SIMcardnr], [Phonenr], [PUK], [PIN], [Discarded], [Comment], [CreatedBy]) VALUES(@SIMcardnr, @Phonenr, @PUK, @PIN, @Discarded, @Comment, @CreatedBy);
	SET @LastID = SCOPE_IDENTITY();
	
	EXEC dbo.WriteLog 1, 8, @LastID, @CreatedBy
	RETURN @LastID;
END

GO
