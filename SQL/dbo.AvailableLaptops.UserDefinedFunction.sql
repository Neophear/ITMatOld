USE [ITMat]
GO
/****** Object:  UserDefinedFunction [dbo].[AvailableLaptops]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 12-12-2013
-- Description:	Gets available modems
-- =============================================
CREATE FUNCTION [dbo].[AvailableLaptops]
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
	SELECT [Laptop].[ID], [Laptop].[Serialnumber]
	FROM [Laptop]
	WHERE [Laptop].[ID] NOT IN (
		SELECT [ItemRefID] FROM [dbo].[GetUnAvailableItems](@StartDate, @EndDate, 3))
	AND (dbo.Laptop.Discarded = 0)
	AND (dbo.Laptop.Deleted = 0)
)

GO
