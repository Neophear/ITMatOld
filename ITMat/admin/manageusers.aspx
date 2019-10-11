<%@ Page Title="Brugerstyring" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manageusers.aspx.cs" Inherits="admin_manageusers" %>
<%@ Import Namespace="Stiig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Panel ID="pnlApprove" DefaultButton="btnSave" runat="server">
        <asp:Label ID="lblMsg" runat="server" Visible="false" Text="lblMsg"></asp:Label>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="10" OnRowDataBound="GridView2_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="Bruger">
                    <ItemTemplate>
                        <asp:Label ID="lblUsername" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Navn">
                    <ItemTemplate>
                        <asp:Label ID="lblFullName" runat="server" Text='<%# Utilities.GetOutlookName(Profile.GetProfile(Eval("Username").ToString())) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Godkendt">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkbxApproved" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Admin">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkbxAdmin" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Button ID="btnSave" runat="server" Text="Gem" OnClick="btnSave_Click" />
    </asp:Panel>
    <br />
    <asp:Panel ID="pnlChangePassword" DefaultButton="btnChangePassword" runat="server">
        <table>
            <tr>
                <td colspan="2">
                    <b>Skift password på bruger</b>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblPasswordMsg" runat="server" Text="lblError" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    MANR:
                </td>
                <td>
                    <asp:TextBox ID="txtMANR" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Password:
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Gentag password:
                </td>
                <td>
                    <asp:TextBox ID="txtPassword2" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnChangePassword" runat="server" Text="Skift password" OnClick="btnChangePassword_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>