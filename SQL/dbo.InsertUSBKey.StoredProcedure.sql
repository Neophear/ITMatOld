USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[InsertUSBKey]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 01-11-2013
-- Description:	Insert item into Items DB
-- =============================================
CREATE PROCEDURE [dbo].[InsertUSBKey] 
	-- Add the parameters for the stored procedure here
	@Serialnumber VARCHAR(50),
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
    
	INSERT INTO dbo.[USBKey] ([Serialnumber], [Discarded], [Comment], [CreatedBy]) VALUES(UPPER(@Serialnumber), @Discarded, @Comment, @CreatedBy);
	SET @LastID = SCOPE_IDENTITY();
	
	EXEC dbo.WriteLog 1, 6, @LastID, @CreatedBy
	RETURN @LastID;
END

GO
