USE [ITMat]
GO
/****** Object:  View [dbo].[ModemCustomerOut]    Script Date: 25-01-2018 10:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ModemCustomerOut]
AS
SELECT     dbo.Loans.ID AS LoanID, dbo.Loans.DateFrom, dbo.Loans.DateTo, dbo.Modem.ID AS ModemID, dbo.Modem.IMEI, dbo.Modem.Brand, dbo.Modem.Model, 
                      dbo.SIMcard.SIMcardnr, dbo.Loans.CustomerRefID, dbo.Customers.MANR, dbo.Customers.Stabsnummer, dbo.Customers.Firstname, dbo.Customers.Middlename, 
                      dbo.Customers.Lastname
FROM         dbo.LoanDetailsModem INNER JOIN
                      dbo.Loans ON dbo.LoanDetailsModem.LoanID = dbo.Loans.ID INNER JOIN
                      dbo.Modem ON dbo.LoanDetailsModem.ItemRefID = dbo.Modem.ID LEFT OUTER JOIN
                      dbo.SIMcard ON dbo.Modem.SIMcardRefID = dbo.SIMcard.ID INNER JOIN
                      dbo.Customers ON dbo.Loans.CustomerRefID = dbo.Customers.ID
WHERE     (dbo.Modem.Deleted = 0) AND (dbo.ItemIsIn(dbo.Loans.DateFrom, dbo.Loans.DateTo, dbo.Loans.DatePickedUp, dbo.Loans.DateReturned) = 0) AND 
                      (dbo.Loans.FailedPickup = 0) AND (dbo.LoanDetailsModem.ReturnedDate IS NULL) AND (dbo.Modem.TransferedCMDB = 0) AND (dbo.Modem.Discarded = 0)

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "LoanDetailsModem"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Loans"
            Begin Extent = 
               Top = 6
               Left = 227
               Bottom = 114
               Right = 381
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Modem"
            Begin Extent = 
               Top = 6
               Left = 419
               Bottom = 114
               Right = 580
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SIMcard"
            Begin Extent = 
               Top = 6
               Left = 618
               Bottom = 114
               Right = 779
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customers"
            Begin Extent = 
               Top = 6
               Left = 817
               Bottom = 114
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
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
         Or = 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ModemCustomerOut'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ModemCustomerOut'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ModemCustomerOut'
GO
