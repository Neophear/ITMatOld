USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[InsertLaptop]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 01-11-2013
-- Description:	Insert item into Items DB
-- =============================================
CREATE PROCEDURE [dbo].[InsertLaptop] 
	-- Add the parameters for the stored procedure here
	@Serialnumber VARCHAR(50),
	@GUID VARCHAR(50),
	@Brand VARCHAR(20),
	@Model VARCHAR(20),
	@FIIN BIT,
	@Name VARCHAR(50),
	@Description VARCHAR(50),
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
    
	INSERT INTO dbo.[Laptop] ([Serialnumber], [GUID], [Brand], [Model], [FIIN], [Name], [Description], [Discarded], [Comment], [CreatedBy]) VALUES(UPPER(@Serialnumber), @GUID, @Brand, @Model, @FIIN, @Name, @Description, @Discarded, @Comment, @CreatedBy);
	SET @LastID = SCOPE_IDENTITY();
	
	EXEC dbo.WriteLog 1, 3, @LastID, @CreatedBy
	RETURN @LastID;
END

GO
