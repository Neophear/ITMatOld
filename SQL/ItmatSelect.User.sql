USE [ITMat]
GO
/****** Object:  User [ItmatSelect]    Script Date: 25-01-2018 10:59:09 ******/
CREATE USER [ItmatSelect] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ItmatSelect]
GO
