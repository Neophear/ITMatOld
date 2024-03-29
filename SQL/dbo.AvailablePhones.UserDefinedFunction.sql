USE [ITMat]
GO
/****** Object:  UserDefinedFunction [dbo].[AvailablePhones]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 12-12-2013
-- Description:	Gets available modems
-- =============================================
CREATE FUNCTION [dbo].[AvailablePhones] 
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
	SELECT [Phones].[ID], [Phones].[IMEI]
	FROM [Phones]
	WHERE [Phones].[ID] NOT IN (
		SELECT [ItemRefID] FROM [dbo].[GetUnAvailableItems](@StartDate, @EndDate, 7))
	AND (dbo.Phones.TransferedCMDB = 0)
	AND (dbo.Phones.Discarded = 0)
	AND (dbo.Phones.Deleted = 0)
)

GO
