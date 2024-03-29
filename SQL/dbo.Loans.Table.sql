USE [ITMat]
GO
/****** Object:  Table [dbo].[Loans]    Script Date: 25-01-2018 10:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loans](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerRefID] [int] NOT NULL,
	[DateFrom] [date] NOT NULL,
	[DateTo] [date] NULL,
	[DatePickedUp] [date] NULL,
	[DateReturned] [date] NULL,
	[TypeRefID] [int] NOT NULL,
	[Comment] [varchar](max) NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
	[DeletedDate] [date] NULL,
	[FailedPickup] [bit] NOT NULL,
 CONSTRAINT [PK_Loans] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Loans] ADD  CONSTRAINT [DF_Loans_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Loans] ADD  CONSTRAINT [DF_Loans_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Loans] ADD  CONSTRAINT [DF_Loans_FailedPickup]  DEFAULT ((0)) FOR [FailedPickup]
GO
ALTER TABLE [dbo].[Loans]  WITH CHECK ADD  CONSTRAINT [FK_Loans_Customers] FOREIGN KEY([CustomerRefID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Loans] CHECK CONSTRAINT [FK_Loans_Customers]
GO
ALTER TABLE [dbo].[Loans]  WITH CHECK ADD  CONSTRAINT [FK_Loans_LoanType] FOREIGN KEY([TypeRefID])
REFERENCES [dbo].[LoanType] ([ID])
GO
ALTER TABLE [dbo].[Loans] CHECK CONSTRAINT [FK_Loans_LoanType]
GO
