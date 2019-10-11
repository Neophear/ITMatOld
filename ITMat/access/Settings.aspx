<%@ Page Title="Indstillinger" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Settings.aspx.cs" Inherits="access_Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Panel ID="pnlChangePassword" runat="server">
        <asp:Table ID="tblChangePassword" runat="server">
            <asp:TableRow>
                <asp:TableHeaderCell ColumnSpan="2">
                    <asp:Label ID="lblChangePassword" runat="server" Text="Skift Password"></asp:Label>
                </asp:TableHeaderCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblOldPassword" runat="server" Text="Gammelt password"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtOldPassword" TextMode="Password" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblNewPassword" runat="server" Text="Nyt password"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtNewPassword" TextMode="Password" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblNewPassword2" runat="server" Text="Gentag nyt password"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtNewPassword2" TextMode="Password" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                    <asp:Label ID="lblChangePasswordMsg" runat="server" Visible="false" Text="lblChangePasswordMsg"></asp:Label><br />
                    <asp:Button ID="btnNewPassword" runat="server" OnClick="btnNewPassword_Click" Text="Skift password" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </asp:Panel>
    <br />
    <asp:Panel ID="pnlChangeMail" runat="server">
        <asp:Table ID="tblChangeMail" runat="server">
            <asp:TableRow>
                <asp:TableHeaderCell ColumnSpan="2">
                    <asp:Label ID="lblChangeMail" runat="server" Text="Skift mail"></asp:Label>
                </asp:TableHeaderCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblMsgChangeMail" runat="server" Text="lblMsgChangeMail" Visible="false"></asp:Label><br />
                    <asp:TextBox ID="txtChangeMail" runat="server"></asp:TextBox> <asp:Button ID="btnChangeMail" OnClick="btnChangeMail_Click" runat="server" Text="Skift" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </asp:Panel>
</asp:Content>