USE [ITMat]
GO
/****** Object:  User [itmat]    Script Date: 25-01-2018 10:59:09 ******/
CREATE USER [itmat] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [itmat]
GO
ALTER ROLE [db_datareader] ADD MEMBER [itmat]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [itmat]
GO
