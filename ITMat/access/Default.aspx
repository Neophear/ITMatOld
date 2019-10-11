<%@ Page Title="Forside" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="access_Default" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Src="~/Controls/DetailsTooltip.ascx" TagPrefix="uc1" TagName="DetailsTooltip" %>

<%@ Import Namespace="Stiig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td style="width:50%;">
                <asp:Panel ID="pnlOrder" runat="server" DefaultButton="btnGoToOrder">
                    <asp:Label ID="lblErrorOrder" runat="server" CssClass="message-error" Visible="false" Text="lblErrorOrder"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtOrderID" runat="server"></asp:TextBox>
                    <asp:Button ID="btnGoToOrder" runat="server" OnClick="btnGoToOrder_Click" Text="Gå til ordre" />
                </asp:Panel>
                <asp:Panel ID="pnlGetMANR" runat="server" DefaultButton="btnGoToMANR">
                    <asp:Label ID="lblErrorMANR" runat="server" CssClass="message-error" Visible="false" Text="lblErrorMANR"> </asp:Label> <asp:HyperLink ID="hplCreateCustomer" Visible="false" runat="server">Opret</asp:HyperLink>
                    <br />
                    <asp:TextBox ID="txtMANR" runat="server"></asp:TextBox>
                    <asp:Button ID="btnGoToMANR" runat="server" OnClick="btnGoToMANR_Click" Text="Gå til MANR" />
                </asp:Panel>
                <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearch">
                    <br />
                    <asp:TextBox ID="txtSearchQuery" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Søg" OnClick="btnSearch_Click" />
                </asp:Panel>
            </td>
            <td>
                <asp:Label ID="lblGuidelinesTitle" Font-Bold="true" runat="server" Text="Retningslinjer"></asp:Label><br />
                <asp:Label ID="lblGuidelinesText" runat="server" Text="lblGuidelinesText"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <table style="width:100%;">
        <tr>
            <td>
                <asp:GridView ID="gvLoansIn" runat="server" Caption="<h3>Udløber</h3>" CssClass="lists" AllowPaging="False" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" DataSourceID="sdsLoansIn" OnRowDataBound="gvLoans_RowDataBound">
                    <AlternatingRowStyle CssClass="alternatingRow" />
                    <RowStyle CssClass="row" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="#" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Stabsnummer" HeaderText="Stabsnr" SortExpression="Stabsnummer" />
                        <asp:TemplateField HeaderText="Navn" SortExpression="Firstname, Middlename, Lastname">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server"><%# Eval("Firstname") + " " + Eval("Middlename") + " " + Eval("Lastname")%></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Skal afleveres" SortExpression="DateTo">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" ToolTip='<%# ((DateTime)Eval("DateTo")).ToShortDateString() %>'><%# Utilities.GetDate((DateTime)Eval("DateTo")) %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <uc1:DetailsTooltip runat="server" LoanID='<%# Eval("ID") %>' ID="DetailsTooltip" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="sdsLoansIn" runat="server" SelectCommand="SELECT [ID], [MANR], [Stabsnummer], [Firstname], [Middlename], [Lastname], [CustomerRefID], [DateFrom], [DateTo], [DatePickedUp] FROM [LoansCustomers] WHERE [DateReturned] IS NULL AND [DateTo] IS NOT NULL AND CONVERT(DATE, [DateTo]) < = CONVERT(DATE, GETDATE()) AND [FailedPickup] = 0 ORDER BY [DateTo] DESC" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
            </td>
            <td>
                <asp:GridView ID="gvLoansOut" runat="server" Caption="<h3>Skal hentes</h3>" CssClass="lists" AllowPaging="False" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" DataSourceID="sdsLoansOut" OnRowDataBound="gvLoans_RowDataBound">
                    <AlternatingRowStyle CssClass="alternatingRow" />
                    <RowStyle CssClass="row" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="#" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Stabsnummer" HeaderText="Stabsnr" SortExpression="Stabsnummer" />
                        <asp:TemplateField HeaderText="Navn" SortExpression="Firstname, Middlename, Lastname">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server"><%# Eval("Firstname") + " " + Eval("Middlename") + " " + Eval("Lastname")%></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Skal afhentes" SortExpression="DateFrom">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" ToolTip='<%# ((DateTime)Eval("DateFrom")).ToShortDateString() %>'><%# Utilities.GetDate((DateTime)Eval("DateFrom")) %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <uc1:DetailsTooltip runat="server" LoanID='<%# Eval("ID") %>' ID="DetailsTooltip" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="sdsLoansOut" runat="server" SelectCommand="SELECT [ID], [MANR], [Stabsnummer], [Firstname], [Middlename], [Lastname], [CustomerRefID], [DateFrom], [DateTo], [DatePickedUp] FROM [LoansCustomers] WHERE [DatePickedUp] IS NULL AND CONVERT(DATE, [DateFrom]) < = CONVERT(DATE, GETDATE()) AND [FailedPickup] = 0 ORDER BY [DateFrom] DESC" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>