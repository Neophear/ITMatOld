<%@ Page Language="C#" AutoEventWireup="true" CodeFile="report.aspx.cs" Inherits="report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        window.print();
    </script>
</head>
<body style="margin:20px;font-family:Calibri;">
    <form id="form1" runat="server">
        <asp:Table ID="Table1" runat="server" Height="1100" CellPadding="10" CellSpacing="0" BorderStyle="Solid" BorderColor="Black" BorderWidth="1" Width="800">
            <asp:TableRow>
                <asp:TableCell VerticalAlign="Middle">
                    <asp:Image ID="Image1" ImageUrl="~/Images/logo.png" Height="133" Width="100" runat="server" />
                </asp:TableCell>
                <asp:TableCell VerticalAlign="Middle" ColumnSpan="2">
                    <asp:Label ID="lblHeader" runat="server" Text="Trænregimentet" Font-Bold="true" Font-Size="22"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="3">
                    <asp:Label ID="lblSubheader" runat="server" Font-Size="18" Text="Udlånsblanket IT-udstyr"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Table ID="Table2" Width="300" CellPadding="0" CellSpacing="0" GridLines="Both" BorderStyle="Solid" BorderColor="Black" BorderWidth="1" runat="server">
                        <asp:TableRow>
                            <asp:TableCell BorderStyle="Solid" BorderWidth="1" BorderColor="Black">
                                Fra:
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell Width="300">
                                <asp:Label ID="lblUserName" runat="server" Text="lblUserName"></asp:Label><br />
                                <asp:Label ID="lblUserMail" runat="server" Text="lblUserMail"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Center" Font-Size="Small">
                                IT-Sektionen / Logistikafdelingen / Trænregimentet<br />
                                <asp:Label ID="lblKTP" runat="server" Text="lblKTP"></asp:Label><br />
                                <asp:Label ID="lblPhone" runat="server" Text="lblPhone"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
                <asp:TableCell Width="100%"></asp:TableCell>
                <asp:TableCell VerticalAlign="Top">
                    <asp:Table ID="Table4" Width="300px" CellPadding="0" CellSpacing="0" BorderStyle="Solid" BorderColor="Black" BorderWidth="1" runat="server">
                        <asp:TableRow>
                            <asp:TableCell Width="130">
                                Ordrenummer
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblOrderID" runat="server" Text="lblOrderID"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                Dato
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblDate" runat="server" Text="lblDate"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                Udlånstype
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblLoanType" runat="server" Text="lblLoanType"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                Fra dato
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblDateFrom" runat="server" Text="lblDateFrom"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                Til dato
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblDateTo" runat="server" Text="lblDateTo"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="3">
                    <asp:Table ID="Table3" CellPadding="0" CellSpacing="0" BorderStyle="Solid" BorderColor="Black" BorderWidth="1" runat="server">
                        <asp:TableRow>
                            <asp:TableCell BorderStyle="Solid" BorderWidth="1" BorderColor="Black" ColumnSpan="2">
                                Til:
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell Width="130">
                                MA-NR
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblMANR" runat="server" Text="lblMANR"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell Width="130">
                                Navn
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblName" runat="server" Text="lblName"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell Width="130">
                                Enhed
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblUnit" runat="server" Text="lblUnit"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="3">
                    <asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1" BorderColor="Black" DataSourceID="SqlDataSource1" OnRowDataBound="gvDetails_RowDataBound" Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="Genstand" SortExpression="Type">
                                <ItemTemplate>
                                    <asp:Label ID="lblType" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ItemRefID" HeaderText="ID" SortExpression="ItemRefID" />
                            <asp:BoundField DataField="Serialnumber" HeaderText="Serienummer/IMEI" SortExpression="Serialnumber" />
                            <asp:BoundField DataField="Name" HeaderText="Navn/SIM-kort-nr" SortExpression="Name" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM dbo.CompleteLoanDetails(@LoanID) ORDER BY [Type], [ItemRefID]">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="LoanID" QueryStringField="ID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:GridView ID="gvDetailsMisc" runat="server" AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1" BorderColor="Black" DataSourceID="sdsDetailsMisc" Width="300px">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Genstand" SortExpression="Name" />
                            <asp:BoundField DataField="ItemCount" HeaderText="Antal" SortExpression="ItemCount" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sdsDetailsMisc" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [LoanDetailsMiscView] WHERE [LoanID] = @LoanID">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="LoanID" QueryStringField="ID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="3">
                    <asp:Table ID="tblComment" Visible="false" CellPadding="0" CellSpacing="0" GridLines="Both" runat="server" Width="100%" BorderStyle="Solid" BorderWidth="1" BorderColor="Black">
                        <asp:TableRow>
                            <asp:TableCell>
                                Bemærkninger:
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblComment" runat="server" Text="lblComment"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell Height="100%" ColumnSpan="3"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="3">
                    <asp:Table ID="Table5" CellPadding="0" CellSpacing="0" GridLines="Both" runat="server" Width="100%" BorderStyle="Solid" BorderWidth="1" BorderColor="Black">
                        <asp:TableRow>
                            <asp:TableCell>
                                Dato:
                            </asp:TableCell>
                            <asp:TableCell>
                                Underskrift Låner:
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Height="50px">
                            <asp:TableCell>

                            </asp:TableCell>
                            <asp:TableCell>

                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </form>
</body>
</html>