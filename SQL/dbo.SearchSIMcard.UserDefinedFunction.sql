USE [ITMat]
GO
/****** Object:  UserDefinedFunction [dbo].[SearchSIMcard]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[SearchSIMcard] 
(	
	-- Add the parameters for the function here
	@Query VARCHAR(MAX)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT * FROM [SIMcard] WHERE
		([SIMcardnr] LIKE @Query) OR
		([Phonenr] LIKE @Query) OR
		([PUK] LIKE @Query) OR
		([PIN] LIKE @Query) OR
		([Comment] LIKE @Query)
)

GO
