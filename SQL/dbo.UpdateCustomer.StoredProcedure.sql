USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomer]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 28-08-2014
-- Description:	Update Customer
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCustomer] 
	-- Add the parameters for the stored procedure here
	@ID INT,
	@MANR VARCHAR(10),
	@Stabsnummer VARCHAR(15),
	@Firstname VARCHAR(50),
	@Middlename VARCHAR(50),
	@Lastname VARCHAR(50),
	@Phone VARCHAR(50),
	@MYN VARCHAR(10),
	@ENH VARCHAR(20),
	@AFD VARCHAR(10),
	@Comment VARCHAR(MAX),
	@UserID UNIQUEIDENTIFIER,
	@Note VARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Customers SET MANR = @MANR, Stabsnummer = @Stabsnummer, Firstname = @Firstname, Middlename = @Middlename, Lastname = @Lastname, Phone = @Phone, MYN = @MYN, ENH = @ENH, AFD = @AFD, Comment = @Comment WHERE (ID = @ID)
	
	IF (@Note != '')
		EXEC dbo.WriteLog 3, 9, @ID, @UserID, @Note
END

GO
