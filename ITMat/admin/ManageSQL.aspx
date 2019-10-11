<%@ Page Title="SQL" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageSQL.aspx.cs" Inherits="admin_ManageSQL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:TextBox ID="txtSQL" runat="server" TextMode="MultiLine" Height="170px" Width="500px"></asp:TextBox><br />
    <asp:Button ID="btnRunSQL" runat="server" Text="Kør" OnClick="btnRunSQL_Click" /> <asp:Button ID="btnExport" Visible="false" runat="server" Text="Export" OnClick="btnExport_Click" /><br />
    <asp:Label ID="lblErrorMsg" Visible="false" ForeColor="red" runat="server" Text="lblErrorMsg"></asp:Label>
    <asp:GridView ID="gvSQL" AutoGenerateColumns="true" runat="server"></asp:GridView>
    <asp:HiddenField ID="hfSQLStatement" runat="server" />
</asp:Content>