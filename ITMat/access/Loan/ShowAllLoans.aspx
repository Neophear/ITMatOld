<%@ Page Title="Vis udlån" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShowAllLoans.aspx.cs" Inherits="ShowAllLoans" %>
<%@ Import Namespace="Stiig" %>
<%@ Register Src="~/Controls/DetailsTooltip.ascx" TagPrefix="uc1" TagName="DetailsTooltip" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Table ID="tblStats" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                Ialt
            </asp:TableCell>
            <asp:TableCell>
                <asp:HyperLink ID="hplCountAll" NavigateUrl="~/access/Loan/ShowAllLoans.aspx" runat="server">hplCountAll</asp:HyperLink>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Aktive lån
            </asp:TableCell>
            <asp:TableCell>
                <asp:HyperLink ID="hplCountActive" NavigateUrl="~/access/Loan/ShowAllLoans.aspx?filter=active" runat="server">hplCountActive</asp:HyperLink>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Over tid
            </asp:TableCell>
            <asp:TableCell>
                <asp:HyperLink ID="hplCountOverdue" NavigateUrl="~/access/Loan/ShowAllLoans.aspx?filter=overdue" runat="server">hplCountOverdue</asp:HyperLink>  
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Færdige lån
            </asp:TableCell>
            <asp:TableCell>
                <asp:HyperLink ID="hplCountDone" NavigateUrl="~/access/Loan/ShowAllLoans.aspx?filter=done" runat="server">hplCountDone</asp:HyperLink>  
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:GridView ID="gvLoans" runat="server" Caption="<h3>Udlån</h3>" CssClass="lists" AllowPaging="False" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" DataSourceID="sdsLoans" OnRowDataBound="gvLoans_RowDataBound">
        <AlternatingRowStyle CssClass="alternatingRow" />
        <RowStyle CssClass="row" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="#" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="MANR" HeaderText="MANR" SortExpression="MANR" />
            <asp:TemplateField HeaderText="Navn" SortExpression="Firstname, Middlename, Lastname">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server"><%# Eval("Firstname") + " " + Eval("Middlename") + " " + Eval("Lastname")%></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CustomerRefID" Visible="false" HeaderText="CustomerRefID" SortExpression="CustomerRefID" />
            <asp:BoundField DataField="DateFrom" HeaderText="Fra" SortExpression="DateFrom" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="DateTo" HeaderText="Til" SortExpression="DateTo" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="DatePickedUp" HeaderText="Afhentet" SortExpression="DatePickedUp" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="DateReturned" HeaderText="Afleveret" SortExpression="DateReturned" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="LoanType" HeaderText="Type" SortExpression="LoanType" ReadOnly="true" />
            <asp:TemplateField>
                <ItemTemplate>
                    <uc1:DetailsTooltip runat="server" LoanID='<%# Eval("ID") %>' ID="DetailsTooltip" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsLoans" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
</asp:Content>

