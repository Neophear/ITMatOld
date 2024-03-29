USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[CreateLoan]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 27-08-2014
-- Description:	Creates a Loan
-- =============================================
CREATE PROCEDURE [dbo].[CreateLoan] 
	-- Add the parameters for the stored procedure here
	@CustomerRefID INT,
	@DateFrom DATETIME,
	@DateTo DATETIME,
	@TypeRefID INT,
	@Comment VARCHAR(MAX),
	@CreatedBy UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DECLARE @LastID INT
    
    INSERT INTO [Loans] ([CustomerRefID], [DateFrom], [DateTo], [TypeRefID], [Comment], [CreatedBy]) VALUES(@CustomerRefID, @DateFrom, @DateTo, @TypeRefID, @Comment, @CreatedBy)
    SET @LastID = SCOPE_IDENTITY()
	
	EXEC dbo.WriteLog 1, 10, @LastID, @CreatedBy
	RETURN @LastID
END

GO
