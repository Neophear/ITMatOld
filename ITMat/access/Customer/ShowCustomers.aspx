<%@ Page Title="Vis alle kunder" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShowCustomers.aspx.cs" Inherits="ShowCustomers" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Web.Security" %>
<%@ Import Namespace="Stiig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Table ID="tblStats" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                Ialt
            </asp:TableCell>
            <asp:TableCell>
                <asp:HyperLink ID="hplCountAll" NavigateUrl="~/access/Customer/ShowCustomers.aspx" runat="server">hplCountAll</asp:HyperLink>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Aktive lån
            </asp:TableCell>
            <asp:TableCell>
                <asp:HyperLink ID="hplCountActive" NavigateUrl="~/access/Customer/ShowCustomers.aspx?filter=active" runat="server">hplCountActive</asp:HyperLink>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Ingen aktive lån
            </asp:TableCell>
            <asp:TableCell>
                <asp:HyperLink ID="hplCountInactive" NavigateUrl="~/access/Customer/ShowCustomers.aspx?filter=inactive" runat="server">hplCountInactive</asp:HyperLink>  
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:GridView ID="gvCustomers" Caption="<h3>Kunder</h3>" CssClass="lists" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="gvCustomers_RowDataBound" DataSourceID="sdsCustomers">
        <AlternatingRowStyle CssClass="alternatingRow" />
        <RowStyle CssClass="row" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="MANR" HeaderText="MANR" SortExpression="MANR" />
            <asp:BoundField DataField="Stabsnummer" HeaderText="Stabsnummer" SortExpression="Stabsnummer" />
            <asp:BoundField DataField="Firstname" HeaderText="Fornavn" SortExpression="Firstname" />
            <asp:BoundField DataField="Middlename" HeaderText="Mellemnavn" SortExpression="Middlename" />
            <asp:BoundField DataField="Lastname" HeaderText="Efternavn" SortExpression="Lastname" />
            <asp:BoundField DataField="Phone" HeaderText="TLF-nr" SortExpression="Phone" />
            <asp:BoundField DataField="MYN" HeaderText="MYN" SortExpression="MYN" />
            <asp:BoundField DataField="ENH" HeaderText="ENH" SortExpression="ENH" />
            <asp:BoundField DataField="AFD" HeaderText="AFD" SortExpression="AFD" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>">
    </asp:SqlDataSource>
</asp:Content>

