USE [ITMat]
GO
/****** Object:  Table [dbo].[LoanDetailsMisc]    Script Date: 25-01-2018 10:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanDetailsMisc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemMiscTypeRefID] [int] NOT NULL,
	[ItemCount] [int] NOT NULL,
	[LoanID] [int] NOT NULL,
	[AddedBy] [uniqueidentifier] NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[ReturnedDate] [datetime] NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
	[DeletedDate] [date] NULL,
 CONSTRAINT [PK_LoanDetailsMisc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[LoanDetailsMisc] ADD  CONSTRAINT [DF_LoanDetailsMisc_AddedDate]  DEFAULT (getdate()) FOR [AddedDate]
GO
ALTER TABLE [dbo].[LoanDetailsMisc] ADD  CONSTRAINT [DF_LoanDetailsMisc_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[LoanDetailsMisc]  WITH CHECK ADD  CONSTRAINT [FK_LoanDetailsMisc_ItemMiscType] FOREIGN KEY([ItemMiscTypeRefID])
REFERENCES [dbo].[ItemMiscType] ([ID])
GO
ALTER TABLE [dbo].[LoanDetailsMisc] CHECK CONSTRAINT [FK_LoanDetailsMisc_ItemMiscType]
GO
ALTER TABLE [dbo].[LoanDetailsMisc]  WITH CHECK ADD  CONSTRAINT [FK_LoanDetailsMisc_Loans] FOREIGN KEY([LoanID])
REFERENCES [dbo].[Loans] ([ID])
GO
ALTER TABLE [dbo].[LoanDetailsMisc] CHECK CONSTRAINT [FK_LoanDetailsMisc_Loans]
GO
