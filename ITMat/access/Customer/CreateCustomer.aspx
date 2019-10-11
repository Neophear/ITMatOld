<%@ Page Title="Opret kunde" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateCustomer.aspx.cs" Inherits="access_CreateCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script type="text/javascript">
        var _txtbx;
        function ShowAvailability(txt, fieldToCheck)
        {
            _txtbx = txt;
            if (txt.value == '') {
                OnSuccess("false");
            }
            else {
                PageMethods.CheckUser(_txtbx.value, fieldToCheck, OnSuccess);
            }
        }

        function OnSuccess(response)
        {
            switch (response)
            {
                case "true":
                    _txtbx.style.backgroundColor = "#99FF99";
                    break;
                case "false":
                    _txtbx.style.backgroundColor = "#FFCCCC";
                    break;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Table ID="Table2" runat="server">
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <asp:Label ID="lblError" runat="server" Text="lblError" CssClass="message-error" Visible="False"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblMANR" runat="server" Text="MANR *"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtMANR" runat="server" MaxLength="10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMANR" runat="server" ErrorMessage="*" ControlToValidate="txtMANR" ToolTip="Du skal indtaste et MANR" CssClass="message-error"></asp:RequiredFieldValidator>
                <ajaxToolkit:TextBoxWatermarkExtender ID="txtwextMANR" TargetControlID="txtMANR" WatermarkCssClass="watermark" WatermarkText="123456" runat="server"></ajaxToolkit:TextBoxWatermarkExtender>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblStabsnummer" runat="server" Text="Stabsnummer *"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtStabsnummer" MaxLength="15" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvStabsnummer" runat="server" ErrorMessage="*" ControlToValidate="txtStabsnummer" ToolTip="Du skal indtaste et Stabsnummer" CssClass="message-error"></asp:RequiredFieldValidator>
                <ajaxToolkit:TextBoxWatermarkExtender ID="txtwextStabsnummer" TargetControlID="txtStabsnummer" WatermarkCssClass="watermark" WatermarkText="TRR-IT07" runat="server"></ajaxToolkit:TextBoxWatermarkExtender>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblFirstname" runat="server" Text="Fornavn *"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtFirstname" MaxLength="50" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFirstname" runat="server" ErrorMessage="*" ControlToValidate="txtFirstname" ToolTip="Du skal indtaste et fornavn" CssClass="message-error"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblMiddlename" runat="server" Text="Mellemnavn(e)"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtMiddlename" MaxLength="50" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblLastname" runat="server" Text="Efternavn *"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtLastname" MaxLength="50" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLastname" runat="server" ErrorMessage="*" ControlToValidate="txtLastname" ToolTip="Du skal indtaste et efternavn" CssClass="message-error"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPhone" runat="server" Text="TLF-nr"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtPhone" MaxLength="50" runat="server"></asp:TextBox>
                <ajaxToolkit:TextBoxWatermarkExtender ID="txtwextPhone" TargetControlID="txtPhone" WatermarkCssClass="watermark" WatermarkText="98197654" runat="server"></ajaxToolkit:TextBoxWatermarkExtender>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblMYN" runat="server" Text="MYN *"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtMYN" runat="server" MaxLength="10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMYN" runat="server" ErrorMessage="*" ControlToValidate="txtMYN" ToolTip="Du skal indtaste en MYN" CssClass="message-error"></asp:RequiredFieldValidator>
                <ajaxToolkit:TextBoxWatermarkExtender ID="txtwextMYN" TargetControlID="txtMYN" WatermarkCssClass="watermark" WatermarkText="TRR" runat="server"></ajaxToolkit:TextBoxWatermarkExtender>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblENH" runat="server" Text="ENH"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtENH" runat="server" MaxLength="20"></asp:TextBox>
                <ajaxToolkit:TextBoxWatermarkExtender ID="txtwextENH" TargetControlID="txtENH" WatermarkCssClass="watermark" WatermarkText="2 FSBTN" runat="server"></ajaxToolkit:TextBoxWatermarkExtender>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAFD" runat="server" Text="AFD/KMP"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtAFD" runat="server" MaxLength="10"></asp:TextBox>
                <ajaxToolkit:TextBoxWatermarkExtender ID="txtwextAFD" TargetControlID="txtAFD" WatermarkCssClass="watermark" WatermarkText="1 KMP" runat="server"></ajaxToolkit:TextBoxWatermarkExtender>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblComment" runat="server" Text="Bemærkninger"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtComment" TextMode="MultiLine" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <asp:Button ID="btnCreateCustomer" runat="server" Text="Opret kunde" OnClick="btnCreateCustomer_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br /><asp:Label ID="lblRequiredFields" runat="server" Text="Felter med * skal udfyldes"></asp:Label>
</asp:Content>