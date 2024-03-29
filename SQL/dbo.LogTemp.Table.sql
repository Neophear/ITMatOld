USE [ITMat]
GO
/****** Object:  Table [dbo].[LogTemp]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogTemp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ActionRefID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[ItemTypeRefID] [int] NOT NULL,
	[ItemRefID] [int] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[Note] [varchar](max) NULL,
 CONSTRAINT [PK_LogTemp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
