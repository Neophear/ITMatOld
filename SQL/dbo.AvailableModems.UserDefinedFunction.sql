USE [ITMat]
GO
/****** Object:  UserDefinedFunction [dbo].[AvailableModems]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 12-12-2013
-- Description:	Gets available modems
-- =============================================
CREATE FUNCTION [dbo].[AvailableModems] 
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
	SELECT [Modem].[ID], [Modem].[IMEI]
	FROM [Modem]
	WHERE [Modem].[ID] NOT IN (
		SELECT [ItemRefID] FROM [dbo].[GetUnAvailableItems](@StartDate, @EndDate, 1))
	AND (dbo.Modem.TransferedCMDB = 0)
	AND (dbo.Modem.Discarded = 0)
	AND (dbo.Modem.Deleted = 0)
)

GO
