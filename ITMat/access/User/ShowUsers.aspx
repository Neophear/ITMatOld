<%@ Page Title="Brugere" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShowUsers.aspx.cs" Inherits="access_User_ShowUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:GridView ID="gvUsers" Caption="<h3>Brugere</h3>" CssClass="lists" runat="server" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="gvUsers_RowDataBound">
        <AlternatingRowStyle CssClass="alternatingRow" />
        <RowStyle CssClass="row" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" Visible="false" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="MANR" HeaderText="MANR" SortExpression="MANR" />
            <asp:BoundField DataField="Stabsnummer" HeaderText="Stabsnummer" SortExpression="Stabsnummer" />
            <asp:BoundField DataField="Firstname" HeaderText="Fornavn" SortExpression="Firstname" />
            <asp:BoundField DataField="Middlename" HeaderText="Mellemnavn" SortExpression="Middlename" />
            <asp:BoundField DataField="Lastname" HeaderText="Efternavn" SortExpression="Lastname" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        </Columns>
    </asp:GridView>
</asp:Content>