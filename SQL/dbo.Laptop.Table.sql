USE [ITMat]
GO
/****** Object:  Table [dbo].[Laptop]    Script Date: 25-01-2018 10:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laptop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Serialnumber] [varchar](50) NOT NULL,
	[GUID] [varchar](50) NULL,
	[Brand] [varchar](20) NOT NULL,
	[Model] [varchar](20) NOT NULL,
	[FIIN] [bit] NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[Discarded] [bit] NOT NULL,
	[Comment] [varchar](max) NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
	[DeletedDate] [datetime] NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_Laptop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Laptop] ADD  CONSTRAINT [DF_Laptop_FIIN]  DEFAULT ((1)) FOR [FIIN]
GO
ALTER TABLE [dbo].[Laptop] ADD  CONSTRAINT [DF_Laptop_Faulty]  DEFAULT ((0)) FOR [Discarded]
GO
ALTER TABLE [dbo].[Laptop] ADD  CONSTRAINT [DF_Laptop_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Laptop] ADD  CONSTRAINT [DF_Laptop_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Laptop] ADD  CONSTRAINT [DF_Laptop_Type]  DEFAULT ((3)) FOR [Type]
GO
