<%@ Page Title="Log ind" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="public_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="lblMessage" runat="server" Visible="false" Text="Du er blevet oprettet. Du skal nu godkendes af en Administrator."></asp:Label>
    <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/access/Default.aspx" FailureText="Du blev ikke logget ind. Prøv igen." LoginButtonText="Log ind" PasswordRequiredErrorMessage="Password er påkrævet." RememberMeText="Husk mig" TitleText="" UserNameLabelText="MANR:" UserNameRequiredErrorMessage="MANR er påkrævet."></asp:Login>
</asp:Content>

