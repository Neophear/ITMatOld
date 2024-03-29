USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[CleanUp]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 26-11-2013
-- Description:	Permenantly deletes items which has been set to Deleted
-- =============================================
CREATE PROCEDURE [dbo].[CleanUp] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DELETE FROM [LoanDetailsMisc] WHERE [Deleted] = 1
    DELETE FROM [LoanDetails] WHERE [Deleted] = 1
    DELETE FROM [Loans] WHERE [Deleted] = 1
    DELETE FROM [Customers] WHERE [Deleted] = 1
    DELETE FROM [Modem] WHERE [Deleted] = 1
    DELETE FROM [Tokens] WHERE [Deleted] = 1
    DELETE FROM [Laptop] WHERE [Deleted] = 1
    DELETE FROM [Printer] WHERE [Deleted] = 1
    DELETE FROM [Projector] WHERE [Deleted] = 1
    DELETE FROM [USBkey] WHERE [Deleted] = 1
    DELETE FROM [Phones] WHERE [Deleted] = 1
    DELETE FROM [SIMcard] WHERE [Deleted] = 1
END

GO
