USE [ITMat]
GO
/****** Object:  Table [dbo].[LogType]    Script Date: 25-01-2018 10:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LogType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
