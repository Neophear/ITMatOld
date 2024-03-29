USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[InsertLoanDetails]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 27-08-2014
-- Description:	Insert into LoanDetails
-- =============================================
CREATE PROCEDURE [dbo].[InsertLoanDetails] 
	-- Add the parameters for the stored procedure here
	@Type INT = 0, 
	@ItemRefID INT = 0,
	@LoanID INT = 0,
	@AddedBy UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DECLARE @LastID INT;
    
    INSERT INTO [LoanDetails] ([Type], [ItemRefID], [LoanID], [AddedBy]) VALUES(@Type, @ItemRefID, @LoanID, @AddedBy)
    SET @LastID = SCOPE_IDENTITY();
	
	EXEC dbo.WriteLog 1, 11, @LastID, @AddedBy
END

GO
