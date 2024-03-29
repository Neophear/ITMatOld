USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCustomer]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 26-11-2013
-- Description:	Deletes a customer
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCustomer] 
	-- Add the parameters for the stored procedure here
	@ID int = 0, 
	@DeletedBy uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [Customers] SET [Deleted] = 1, [DeletedBy] = @DeletedBy, [DeletedDate] = GETDATE() WHERE [ID] = @ID
	
	EXEC dbo.WriteLog 2, 9, @ID, @DeletedBy
END

GO
