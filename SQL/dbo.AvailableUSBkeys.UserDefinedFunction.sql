USE [ITMat]
GO
/****** Object:  UserDefinedFunction [dbo].[AvailableUSBkeys]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 12-12-2013
-- Description:	Gets available modems
-- =============================================
CREATE FUNCTION [dbo].[AvailableUSBkeys] 
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
	SELECT [USBKey].[ID], [USBKey].[Serialnumber]
	FROM [USBKey]
	WHERE [USBKey].[ID] NOT IN (
		SELECT [ItemRefID] FROM [dbo].[GetUnAvailableItems](@StartDate, @EndDate, 6))
	AND (dbo.USBKey.Discarded = 0)
	AND (dbo.USBKey.Deleted = 0)
)

GO
