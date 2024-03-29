USE [ITMat]
GO
/****** Object:  UserDefinedFunction [dbo].[SearchCustomer]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 
-- Description:	Search Customers
-- =============================================
CREATE FUNCTION [dbo].[SearchCustomer] 
(	
	-- Add the parameters for the function here
	@Query VARCHAR(MAX)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT * FROM [Customers] WHERE
		(([MANR] LIKE @Query) OR
		([Stabsnummer] LIKE @Query) OR
		([Firstname] LIKE @Query) OR
		([Middlename] LIKE @Query) OR
		([Lastname] LIKE @Query) OR
		([Phone] LIKE @Query) OR
		([MYN] LIKE @Query) OR
		([ENH] LIKE @Query) OR
		([AFD] LIKE @Query) OR
		([Comment] LIKE @Query))
		AND [Deleted] = 0
)

GO
