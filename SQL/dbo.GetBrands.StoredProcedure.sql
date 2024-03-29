USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[GetBrands]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 11-12-2013
-- Description:	Gets all brands in DB
-- =============================================
CREATE PROCEDURE [dbo].[GetBrands] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT [Brand] FROM [Modem]
	UNION
	SELECT [Brand] FROM [Laptop]
	UNION
	SELECT [Brand] FROM [Printer]
	UNION
	SELECT [Brand] FROM [Projector]
	UNION
	SELECT [Brand] FROM [Phones]
END

GO
