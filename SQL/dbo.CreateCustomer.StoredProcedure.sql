USE [ITMat]
GO
/****** Object:  StoredProcedure [dbo].[CreateCustomer]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stiig Gade
-- Create date: 27-08-2014
-- Description:	Creates a customer
-- =============================================
CREATE PROCEDURE [dbo].[CreateCustomer] 
	-- Add the parameters for the stored procedure here
	@MANR VARCHAR(8),
	@Stabsnummer VARCHAR(MAX),
	@Firstname VARCHAR(MAX),
	@Middlename VARCHAR(MAX),
	@Lastname VARCHAR(MAX),
	@Phone VARCHAR(MAX),
	@MYN VARCHAR(MAX),
	@ENH VARCHAR(MAX),
	@AFD VARCHAR(MAX),
	@Comment VARCHAR(MAX),
	@CreatedBy UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @LastID INT
	DECLARE @error VARCHAR(2) = ''
	
	EXEC @error = dbo.CustomerExists @MANR, @Stabsnummer
	
	IF (@error != '0')
	BEGIN
		SET @LastID = 0
	END
	ELSE
	BEGIN
		INSERT INTO [Customers] ([MANR], [Stabsnummer], [Firstname], [Middlename], [Lastname], [Phone], [MYN], [ENH], [AFD], [Comment], [CreatedBy]) VALUES(@MANR, @Stabsnummer, @Firstname, @Middlename, @Lastname, @Phone, @MYN, @ENH, @AFD, @Comment, @CreatedBy)
		SET @LastID = SCOPE_IDENTITY()
		
		EXEC dbo.WriteLog 1, 9, @LastID, @CreatedBy
	END
	
	RETURN @LastID
END

GO
