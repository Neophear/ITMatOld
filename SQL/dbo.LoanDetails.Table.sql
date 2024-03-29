USE [ITMat]
GO
/****** Object:  Table [dbo].[LoanDetails]    Script Date: 25-01-2018 10:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[ItemRefID] [int] NOT NULL,
	[LoanID] [int] NOT NULL,
	[AddedBy] [uniqueidentifier] NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[ReturnedDate] [datetime] NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
	[DeletedDate] [date] NULL,
 CONSTRAINT [PK_LoanDetails_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[LoanDetails] ADD  CONSTRAINT [DF_LoanDetails_AddedDate]  DEFAULT (getdate()) FOR [AddedDate]
GO
ALTER TABLE [dbo].[LoanDetails] ADD  CONSTRAINT [DF_LoanDetails_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[LoanDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_LoanDetails_Laptop] FOREIGN KEY([ItemRefID], [Type])
REFERENCES [dbo].[Laptop] ([ID], [Type])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[LoanDetails] NOCHECK CONSTRAINT [FK_LoanDetails_Laptop]
GO
ALTER TABLE [dbo].[LoanDetails]  WITH CHECK ADD  CONSTRAINT [FK_LoanDetails_Loans] FOREIGN KEY([LoanID])
REFERENCES [dbo].[Loans] ([ID])
GO
ALTER TABLE [dbo].[LoanDetails] CHECK CONSTRAINT [FK_LoanDetails_Loans]
GO
ALTER TABLE [dbo].[LoanDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_LoanDetails_Modem] FOREIGN KEY([ItemRefID], [Type])
REFERENCES [dbo].[Modem] ([ID], [Type])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[LoanDetails] NOCHECK CONSTRAINT [FK_LoanDetails_Modem]
GO
ALTER TABLE [dbo].[LoanDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_LoanDetails_Phones] FOREIGN KEY([ItemRefID], [Type])
REFERENCES [dbo].[Phones] ([ID], [Type])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[LoanDetails] NOCHECK CONSTRAINT [FK_LoanDetails_Phones]
GO
ALTER TABLE [dbo].[LoanDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_LoanDetails_Printer] FOREIGN KEY([ItemRefID], [Type])
REFERENCES [dbo].[Printer] ([ID], [Type])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[LoanDetails] NOCHECK CONSTRAINT [FK_LoanDetails_Printer]
GO
ALTER TABLE [dbo].[LoanDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_LoanDetails_Projector] FOREIGN KEY([ItemRefID], [Type])
REFERENCES [dbo].[Projector] ([ID], [Type])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[LoanDetails] NOCHECK CONSTRAINT [FK_LoanDetails_Projector]
GO
ALTER TABLE [dbo].[LoanDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_LoanDetails_SIMcard] FOREIGN KEY([ItemRefID], [Type])
REFERENCES [dbo].[SIMcard] ([ID], [Type])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[LoanDetails] NOCHECK CONSTRAINT [FK_LoanDetails_SIMcard]
GO
ALTER TABLE [dbo].[LoanDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_LoanDetails_Tokens] FOREIGN KEY([ItemRefID], [Type])
REFERENCES [dbo].[Tokens] ([ID], [Type])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[LoanDetails] NOCHECK CONSTRAINT [FK_LoanDetails_Tokens]
GO
ALTER TABLE [dbo].[LoanDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_LoanDetails_USBKeys1] FOREIGN KEY([ItemRefID], [Type])
REFERENCES [dbo].[USBKey] ([ID], [Type])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[LoanDetails] NOCHECK CONSTRAINT [FK_LoanDetails_USBKeys1]
GO
