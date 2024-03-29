USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[GetModels]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 11-12-2013
-- Description:	Gets all models in DB
-- =============================================
CREATE PROCEDURE [dbo].[GetModels]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT [Model] FROM [Modem]
	UNION
	SELECT [Model] FROM [Laptop]
	UNION
	SELECT [Model] FROM [Printer]
	UNION
	SELECT [Model] FROM [Projector]
	UNION
	SELECT [Model] FROM [Phones]
END

GO
