USE [ITMat]
GO
/****** Object:  Table [dbo].[MailLog]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LoanID] [int] NOT NULL,
	[TimeSent] [datetime] NOT NULL,
	[SentBy] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[MailLog] ADD  CONSTRAINT [DF_MailLog_TimeSent]  DEFAULT (getdate()) FOR [TimeSent]
GO
