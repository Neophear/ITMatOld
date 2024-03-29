USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[GetLog]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 02-09-2014
-- Description:	Gets log from Dates
-- =============================================
CREATE PROCEDURE [dbo].[GetLog] 
	-- Add the parameters for the stored procedure here
	@DateFrom DATE = NULL,
	@DateTo DATE = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SET @DateFrom = ISNULL(@DateFrom, GETDATE())
    SET @DateTo = ISNULL(@DateTo, GETDATE())
    
	SELECT * FROM [LogView] WHERE CONVERT(DATE, [TimeStamp]) >= @DateFrom AND CONVERT(DATE, [TimeStamp]) <= @DateTo ORDER BY [ID] DESC
END

GO
