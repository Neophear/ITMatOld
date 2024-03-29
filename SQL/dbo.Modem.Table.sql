USE [ITMat]
GO
/****** Object:  Table [dbo].[Modem]    Script Date: 25-01-2018 10:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IMEI] [varchar](50) NOT NULL,
	[Brand] [varchar](50) NOT NULL,
	[Model] [varchar](50) NOT NULL,
	[SIMcardRefID] [int] NULL,
	[Discarded] [bit] NOT NULL,
	[Comment] [varchar](max) NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
	[DeletedDate] [datetime] NULL,
	[TransferedCMDB] [bit] NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_3gmodem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Modem] ADD  CONSTRAINT [DF_Modem_Faulty]  DEFAULT ((0)) FOR [Discarded]
GO
ALTER TABLE [dbo].[Modem] ADD  CONSTRAINT [DF_Modem_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Modem] ADD  CONSTRAINT [DF_3gmodem_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Modem] ADD  CONSTRAINT [DF_Modem_TransferedCMDB]  DEFAULT ((0)) FOR [TransferedCMDB]
GO
ALTER TABLE [dbo].[Modem] ADD  CONSTRAINT [DF_Modem_Type]  DEFAULT ((1)) FOR [Type]
GO
