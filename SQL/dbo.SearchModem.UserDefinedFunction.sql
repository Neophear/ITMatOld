USE [ITMat]
GO
/****** Object:  UserDefinedFunction [dbo].[SearchModem]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 24-06-2014
-- Description:	Search Modems
-- =============================================
CREATE FUNCTION [dbo].[SearchModem] 
(	
	-- Add the parameters for the function here
	@Query VARCHAR(MAX)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT * FROM [Modem] WHERE
		([IMEI] LIKE @Query) OR 
		([Brand] LIKE @Query) OR 
		([Model] LIKE @Query) OR
		([Comment] LIKE @Query)
)

GO
