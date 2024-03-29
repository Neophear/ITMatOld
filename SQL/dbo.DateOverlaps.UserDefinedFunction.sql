USE [ITMat]
GO
/****** Object:  UserDefinedFunction [dbo].[DateOverlaps]    Script Date: 25-01-2018 10:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DateOverlaps]
	(
	@DateFrom date,
	@DateTo date,
	@DateReturned date,
	@StartDate date,
	@EndDate date
	)
RETURNS INT
AS
	BEGIN
		DECLARE @Result int = 1
		DECLARE @ActualEndDate date;
		
		IF (@DateReturned IS NOT NULL)
			SET @ActualEndDate = @DateReturned
		ELSE
			SET @ActualEndDate = @DateTo
			
		IF ((@StartDate > = @DateFrom AND @StartDate < @ActualEndDate)
				OR (@EndDate > = @DateFrom AND @EndDate < @ActualEndDate)) OR
			((@DateFrom > = @StartDate AND @DateFrom < @EndDate)
				OR (@ActualEndDate > = @StartDate AND @ActualEndDate < @EndDate))
			SET @Result = 1
		ELSE
			SET @Result = 0
		RETURN @Result
	END
GO
