USE [ITMat]
GO
/****** Object:  UserDefinedFunction [dbo].[SearchUSBKey]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[SearchUSBKey] 
(	
	-- Add the parameters for the function here
	@Query VARCHAR(MAX)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT * FROM [USBKey] WHERE
		([Serialnumber] LIKE @Query) OR
		([Comment] LIKE @Query)
)

GO
