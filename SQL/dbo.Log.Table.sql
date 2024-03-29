USE [ITMat]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 25-01-2018 10:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ActionRefID] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[ItemTypeRefID] [int] NOT NULL,
	[ItemRefID] [int] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Log] ADD  CONSTRAINT [DF_Log_Date]  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_LogAction] FOREIGN KEY([ActionRefID])
REFERENCES [dbo].[LogAction] ([ID])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_LogAction]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_LogType] FOREIGN KEY([ItemTypeRefID])
REFERENCES [dbo].[LogType] ([ID])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_LogType]
GO
