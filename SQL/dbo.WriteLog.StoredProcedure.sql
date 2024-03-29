USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[WriteLog]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 28-08-2014
-- Description:	Writes in the Log
-- =============================================
CREATE PROCEDURE [dbo].[WriteLog] 
	-- Add the parameters for the stored procedure here
	@Action INT, -- 1=Create, 2=Delete, 3=Edit, 4=Send Mail
	@Type INT,
	@ID INT,
	@UserID UNIQUEIDENTIFIER,
	@Note VARCHAR(MAX) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [Log] ([ActionRefID], [ItemTypeRefID], [ItemRefID], [UserID], [Note]) VALUES(@Action, @Type, @ID, @UserID, @Note)
END

GO
