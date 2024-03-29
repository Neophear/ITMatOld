USE [ITMat]
GO
/****** Object:  View [dbo].[LoansCustomers]    Script Date: 25-01-2018 10:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[LoansCustomers]
AS
SELECT     dbo.Loans.ID, dbo.Loans.CustomerRefID, dbo.Loans.DateFrom, CASE DateTo WHEN '9999-12-31' THEN NULL ELSE DateTo END AS DateTo, dbo.Loans.DatePickedUp,
                       dbo.Loans.DateReturned, dbo.Loans.TypeRefID, dbo.Loans.Comment, dbo.Customers.MANR, dbo.Customers.Stabsnummer, dbo.Customers.Firstname, 
                      dbo.Customers.Middlename, dbo.Customers.Lastname, dbo.Customers.Phone, dbo.Customers.MYN, dbo.Customers.ENH, dbo.Customers.AFD, 
                      dbo.LoanType.Name AS LoanType, dbo.Loans.CreatedBy, dbo.Loans.FailedPickup, dbo.[Log].TimeStamp AS CreatedDate
FROM         dbo.Loans INNER JOIN
                      dbo.Customers ON dbo.Loans.CustomerRefID = dbo.Customers.ID INNER JOIN
                      dbo.LoanType ON dbo.Loans.TypeRefID = dbo.LoanType.ID INNER JOIN
                      dbo.[Log] ON dbo.Loans.ID = dbo.[Log].ItemRefID
WHERE     (dbo.Loans.Deleted = 0) AND (dbo.Customers.Deleted = 0) AND (dbo.[Log].ItemTypeRefID = 10) AND (dbo.[Log].ActionRefID = 1)

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[29] 4[17] 2[23] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customers"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 114
               Right = 397
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LoanType"
            Begin Extent = 
               Top = 6
               Left = 435
               Bottom = 84
               Right = 586
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Loans"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Log"
            Begin Extent = 
               Top = 6
               Left = 624
               Bottom = 114
               Right = 778
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 23
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LoansCustomers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        Column = 3360
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LoansCustomers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LoansCustomers'
GO
