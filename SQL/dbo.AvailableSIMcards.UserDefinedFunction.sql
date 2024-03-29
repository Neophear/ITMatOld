USE [ITMat]
GO
/****** Object:  UserDefinedFunction [dbo].[AvailableSIMcards]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 12-12-2013
-- Description:	Gets available modems
-- =============================================
CREATE FUNCTION [dbo].[AvailableSIMcards] 
(	
	-- Add the parameters for the function here
	@StartDate date, 
	@EndDate date
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT [SIMcard].[ID], [SIMcard].[SIMcardnr]
	FROM [SIMcard]
	WHERE [SIMcard].[ID] NOT IN (
		SELECT [ItemRefID] FROM [dbo].[GetUnAvailableItems](@StartDate, @EndDate, 8))
	AND [SIMcard].[ID] NOT IN (
		SELECT [SIMcardRefID] FROM [Modem] WHERE [SIMcardRefID] IS NOT NULL)
	AND (dbo.SIMcard.TransferedCMDB = 0)
	AND (dbo.SIMcard.Discarded = 0)
	AND (dbo.SIMcard.Deleted = 0)
)

GO
