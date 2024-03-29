USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[InsertLoanDetailsMisc]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 27-08-2014
-- Description:	Inserts LoanDetailsMisc
-- =============================================
CREATE PROCEDURE [dbo].[InsertLoanDetailsMisc] 
	-- Add the parameters for the stored procedure here
	@ItemMiscTypeRefID INT,
	@ItemCount INT = 0,
	@LoanID INT,
	@AddedBy UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @LastID INT;
    
    INSERT INTO [LoanDetailsMisc] ([ItemMiscTypeRefID], [ItemCount], [LoanID], [AddedBy]) VALUES(@ItemMiscTypeRefID, @ItemCount, @LoanID, @AddedBy)
    SET @LastID = SCOPE_IDENTITY();
	
	EXEC dbo.WriteLog 1, 12, @LastID, @AddedBy
END

GO
