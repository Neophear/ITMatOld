<%@ Page Title="Opret bruger" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" FinishDestinationPageUrl="~/public/Login.aspx?t=created" OnCreatedUser="CreateUserWizard1_CreatedUser" CancelButtonText="Annuller" CompleteSuccessText="Din konto er oprettet." ContinueButtonText="Næste" CreateUserButtonText="Opret bruger" DuplicateEmailErrorMessage="Emailen er allerede i brug." DuplicateUserNameErrorMessage="Indtast et andet brugernavn." FinishCompleteButtonText="Færdig" FinishPreviousButtonText="Tilbage" InvalidEmailErrorMessage="Indtast en valid email" InvalidPasswordErrorMessage="Minimum password længde: {0}. Ikke-alphanumeriske tegn påkrævet: {1}." LoginCreatedUser="False" StartNextButtonText="Næste" StepNextButtonText="Næste" StepPreviousButtonText="Tilbage" UnknownErrorMessage="Din konto blev ikke oprettet. Prøv igen." DisableCreatedUser="True" OnCreatingUser="CreateUserWizard1_CreatingUser" RequireEmail="False" ContinueDestinationPageUrl="~/public/Login.aspx?t=created">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" Title="Opret ny bryger">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">MANR<br />(fx. 123456):</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="*" CssClass="message-error" ToolTip="MANR er påkrævet." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblStabsnummer" runat="server" AssociatedControlID="txtStabsnummer">Stabsnummer:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtStabsnummer" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvStabsnummer" runat="server" ControlToValidate="txtStabsnummer" ErrorMessage="*" CssClass="message-error" ToolTip="Stabsnummer er påkrævet." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblFirstname" runat="server" AssociatedControlID="txtFirstname">Fornavn:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFirstname" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFirstname" runat="server" ControlToValidate="txtFirstname" ErrorMessage="*" CssClass="message-error" ToolTip="Fornavn er påkrævet." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblMiddlename" runat="server" AssociatedControlID="txtMiddlename">Mellemnavn:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtMiddlename" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblLastname" runat="server" AssociatedControlID="txtLastname">Efternavn:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtLastname" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvLastname" runat="server" ControlToValidate="txtLastname" ErrorMessage="*" CssClass="message-error" ToolTip="Efternavn er påkrævet." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="*" ToolTip="Password er påkrævet." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Bekræft password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="*" ToolTip="Bekræft password er påkrævet." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="Begge passwords skal være ens." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server" Title="Færdig">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>