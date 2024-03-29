USE [ITMat]
GO
/****** Object:  Table [dbo].[Printer]    Script Date: 25-01-2018 10:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Printer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Serialnumber] [varchar](50) NOT NULL,
	[Brand] [varchar](50) NOT NULL,
	[Model] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
	[Discarded] [bit] NOT NULL,
	[Comment] [varchar](max) NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
	[DeletedDate] [date] NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_Printer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Printer] ADD  CONSTRAINT [DF_Printer_Faulty]  DEFAULT ((0)) FOR [Discarded]
GO
ALTER TABLE [dbo].[Printer] ADD  CONSTRAINT [DF_Printer_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Printer] ADD  CONSTRAINT [DF_Printer_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Printer] ADD  CONSTRAINT [DF_Printer_Type]  DEFAULT ((4)) FOR [Type]
GO
