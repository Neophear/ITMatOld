USE [ITMat]
GO
/****** Object:  Table [dbo].[SIMcard]    Script Date: 25-01-2018 10:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIMcard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SIMcardnr] [varchar](50) NOT NULL,
	[Phonenr] [varchar](20) NULL,
	[PUK] [varchar](20) NULL,
	[PIN] [varchar](8) NULL,
	[Discarded] [bit] NOT NULL,
	[Comment] [varchar](max) NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
	[DeletedDate] [date] NULL,
	[TransferedCMDB] [bit] NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_SIMcard] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[SIMcard] ADD  CONSTRAINT [DF_SIMcard_Faulty]  DEFAULT ((0)) FOR [Discarded]
GO
ALTER TABLE [dbo].[SIMcard] ADD  CONSTRAINT [DF_SIMcard_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SIMcard] ADD  CONSTRAINT [DF_SIMcard_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SIMcard] ADD  CONSTRAINT [DF_SIMcard_TransferedCMDB]  DEFAULT ((0)) FOR [TransferedCMDB]
GO
ALTER TABLE [dbo].[SIMcard] ADD  CONSTRAINT [DF_SIMcard_Type]  DEFAULT ((8)) FOR [Type]
GO
