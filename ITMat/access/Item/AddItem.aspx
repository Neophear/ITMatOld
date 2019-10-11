<%@ Page Title="Tilføj MAT" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddItem.aspx.cs" Inherits="AddItem" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script type="text/javascript">
        var _txtbx;
        function ShowAvailability(txt, type) {
            _txtbx = txt;
            if (txt.value == '') {
                OnSuccess("false");
            }
            else {
                PageMethods.CheckItem(_txtbx.value, type, OnSuccess);
            }
        }

        function OnSuccess(response) {
            switch (response) {
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
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:DropDownList ID="ddlChangeType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlChangeType_SelectedIndexChanged">
        <asp:ListItem Text="Modem" Value="1" Selected="True" />
        <asp:ListItem Text="Token" Value="2" />
        <asp:ListItem Text="Bærbar" Value="3" />
        <asp:ListItem Text="Printer" Value="4" />
        <asp:ListItem Text="Projektor" Value="5" />
        <asp:ListItem Text="USB-key" Value="6" />
        <asp:ListItem Text="Mobiltelefon" Value="7" />
        <asp:ListItem Text="SIM-kort" Value="8" />
    </asp:DropDownList>
    <br />
    <asp:Label ID="lblErrorMsg" runat="server" Text="Fejl" Visible="False" CssClass="message-error"></asp:Label>
    <%-- Modem --%>
    <asp:DetailsView ID="dvModem" runat="server" Enabled="false" Visible="false" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="sdsModem" DefaultMode="Insert" OnItemInserting="dvModem_ItemInserting">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="IMEI *" SortExpression="IMEI">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtIMEI" runat="server" MaxLength="50" Text='<%# Bind("IMEI") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtIMEI" runat="server" ErrorMessage="*" CssClass="message-error"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mærke *" SortExpression="Brand">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtBrand" runat="server" MaxLength="50" Text='<%# Bind("Brand") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvBrand" ControlToValidate="txtBrand" runat="server" ErrorMessage="*" CssClass="message-error"></asp:RequiredFieldValidator>
                    <asp:AutoCompleteExtender ID="aceBrand" ServiceMethod="GetBrand" MinimumPrefixLength="1" CompletionInterval="0" CompletionSetCount="5" TargetControlID="txtBrand" runat="server" FirstRowSelected="True"></asp:AutoCompleteExtender>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Model *" SortExpression="Model">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtModel" runat="server" MaxLength="50" Text='<%# Bind("Model") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvModel" ControlToValidate="txtModel" runat="server" ErrorMessage="*" CssClass="message-error"></asp:RequiredFieldValidator>
                    <asp:AutoCompleteExtender ID="aceModel" ServiceMethod="GetModel" MinimumPrefixLength="1" CompletionInterval="0" CompletionSetCount="5" TargetControlID="txtModel" runat="server" FirstRowSelected="True"></asp:AutoCompleteExtender>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SIM-kort" SortExpression="SIMcardnr">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtNewSIMcard" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:AutoCompleteExtender ID="aceNewSIMcard" ServiceMethod="GetSIMcardList" MinimumPrefixLength="1" CompletionInterval="0" CompletionSetCount="5" TargetControlID="txtNewSIMcard" runat="server"></asp:AutoCompleteExtender>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="Discarded" HeaderText="Kasseret" SortExpression="Discarded" />
            <asp:BoundField DataField="Comment" HeaderText="Bemærkninger" SortExpression="Comment" />
            <asp:CommandField ShowInsertButton="True" ButtonType="Button" CancelText="Annuller" InsertText="Opret" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsModem" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommandType="StoredProcedure" InsertCommand="InsertModem" OnInserted="ItemInserted">
        <InsertParameters>
            <asp:Parameter Direction="ReturnValue" Name="LastID" Type="Int32" />
            <asp:Parameter Name="IMEI" Type="String" />
            <asp:Parameter Name="Brand" Type="String" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="SIMcardnr" Type="String" />
            <asp:Parameter Name="Discarded" Type="Boolean" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="CreatedBy" DbType="Guid" />
        </InsertParameters>
    </asp:SqlDataSource>
    <%-- Token --%>
    <asp:DetailsView ID="dvToken" runat="server" Enabled="false" Visible="false" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="sdsToken" DefaultMode="Insert" OnItemInserting="dvToken_ItemInserting">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="Serienummer *" SortExpression="Serialnumber">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtSerialnumber" runat="server" MaxLength="50" Text='<%# Bind("Serialnumber") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtSerialnumber" runat="server" ErrorMessage="*" CssClass="message-error"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="Discarded" HeaderText="Kasseret" SortExpression="Discarded" />
            <asp:BoundField DataField="Comment" HeaderText="Bemærkninger" SortExpression="Comment" />
            <asp:CommandField ShowInsertButton="True" ButtonType="Button" CancelText="Annuller" InsertText="Opret" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsToken" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommandType="StoredProcedure" InsertCommand="InsertToken" OnInserted="ItemInserted">
        <InsertParameters>
            <asp:Parameter Direction="ReturnValue" Name="LastID" Type="Int32" />
            <asp:Parameter Name="Serialnumber" Type="String" />
            <asp:Parameter Name="Discarded" Type="Boolean" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="CreatedBy" DbType="Guid" />
        </InsertParameters>
    </asp:SqlDataSource>
    <%-- Laptop --%>
    <asp:DetailsView ID="dvLaptop" runat="server" Enabled="false" Visible="false" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="sdsLaptop" DefaultMode="Insert" OnItemInserting="dvLaptop_ItemInserting">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="Serienummer *" SortExpression="Serialnumber">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtSerialnumber" MaxLength="50" runat="server" Text='<%# Bind("Serialnumber") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtSerialnumber" runat="server" ErrorMessage="*" CssClass="message-error"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="GUID" HeaderText="GUID" SortExpression="GUID" />
            <asp:TemplateField HeaderText="Mærke *" SortExpression="Brand">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtBrand" MaxLength="20" runat="server" Text='<%# Bind("Brand") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvBrand" ControlToValidate="txtBrand" runat="server" ErrorMessage="*" CssClass="message-error"></asp:RequiredFieldValidator>
                    <asp:AutoCompleteExtender ID="aceBrand" ServiceMethod="GetBrand" MinimumPrefixLength="1" CompletionInterval="0" CompletionSetCount="5" TargetControlID="txtBrand" runat="server" FirstRowSelected="True"></asp:AutoCompleteExtender>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Model *" SortExpression="Model">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtModel" MaxLength="20" runat="server" Text='<%# Bind("Model") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvModel" ControlToValidate="txtModel" runat="server" ErrorMessage="*" CssClass="message-error"></asp:RequiredFieldValidator>
                    <asp:AutoCompleteExtender ID="aceModel" ServiceMethod="GetModel" MinimumPrefixLength="1" CompletionInterval="0" CompletionSetCount="5" TargetControlID="txtModel" runat="server" FirstRowSelected="True"></asp:AutoCompleteExtender>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="FIIN" HeaderText="FIIN" SortExpression="FIIN" />
            <asp:TemplateField HeaderText="Navn" SortExpression="Name">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtName" MaxLength="20" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    <ajaxToolkit:TextBoxWatermarkExtender ID="txtwextName" TargetControlID="txtName" WatermarkCssClass="watermark" WatermarkText="NRU-A-01234" runat="server"></ajaxToolkit:TextBoxWatermarkExtender>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Beskrivelse" SortExpression="Description">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtDescription" MaxLength="50" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                    <ajaxToolkit:TextBoxWatermarkExtender ID="txtwextDescription" TargetControlID="txtDescription" WatermarkCssClass="watermark" WatermarkText="FSV-FAP-0123" runat="server"></ajaxToolkit:TextBoxWatermarkExtender>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="Discarded" HeaderText="Kasseret" SortExpression="Discarded" />
            <asp:BoundField DataField="Comment" HeaderText="Bemærkninger" SortExpression="Comment" />
            <asp:CommandField ShowInsertButton="True" ButtonType="Button" CancelText="Annuller" InsertText="Opret" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsLaptop" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommandType="StoredProcedure" InsertCommand="InsertLaptop" OnInserted="ItemInserted">
        <InsertParameters>
            <asp:Parameter Direction="ReturnValue" Name="LastID" Type="Int32" />
            <asp:Parameter Name="Serialnumber" Type="String" />
            <asp:Parameter Name="GUID" Type="String" />
            <asp:Parameter Name="Brand" Type="String" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="FIIN" Type="Boolean" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Discarded" Type="Boolean" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="CreatedBy" DbType="Guid" />
        </InsertParameters>
    </asp:SqlDataSource>
    <%-- Printer --%>
    <asp:DetailsView ID="dvPrinter" runat="server" Enabled="false" Visible="false" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="sdsPrinter" DefaultMode="Insert" OnItemInserting="dvPrinter_ItemInserting">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="Serienummer *" SortExpression="Serialnumber">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtSerialnumber" MaxLength="50" runat="server" Text='<%# Bind("Serialnumber") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtSerialnumber" runat="server" ErrorMessage="*" CssClass="message-error"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mærke *" SortExpression="Brand">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtBrand" MaxLength="50" runat="server" Text='<%# Bind("Brand") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvBrand" ControlToValidate="txtBrand" runat="server" ErrorMessage="*" CssClass="message-error"></asp:RequiredFieldValidator>
                    <asp:AutoCompleteExtender ID="aceBrand" ServiceMethod="GetBrand" MinimumPrefixLength="1" CompletionInterval="0" CompletionSetCount="5" TargetControlID="txtBrand" runat="server" FirstRowSelected="True"></asp:AutoCompleteExtender>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Model *" SortExpression="Model">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtModel" MaxLength="50" runat="server" Text='<%# Bind("Model") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvModel" ControlToValidate="txtModel" runat="server" ErrorMessage="*" CssClass="message-error"></asp:RequiredFieldValidator>
                    <asp:AutoCompleteExtender ID="aceModel" ServiceMethod="GetModel" MinimumPrefixLength="1" CompletionInterval="0" CompletionSetCount="5" TargetControlID="txtModel" runat="server" FirstRowSelected="True"></asp:AutoCompleteExtender>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Navn" SortExpression="Name">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" MaxLength="50" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="Discarded" HeaderText="Kasseret" SortExpression="Discarded" />
            <asp:BoundField DataField="Comment" HeaderText="Bemærkninger" SortExpression="Comment" />
            <asp:CommandField ShowInsertButton="True" ButtonType="Button" CancelText="Annuller" InsertText="Opret" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsPrinter" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommandType="StoredProcedure" InsertCommand="InsertPrinter" OnInserted="ItemInserted">
        <InsertParameters>
            <asp:Parameter Direction="ReturnValue" Name="LastID" Type="Int32" />
            <asp:Parameter Name="Serialnumber" Type="String" />
            <asp:Parameter Name="Brand" Type="String" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Discarded" Type="Boolean" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="CreatedBy" DbType="Guid" />
        </InsertParameters>
    </asp:SqlDataSource>
    <%-- Projector --%>
    <asp:DetailsView ID="dvProjector" runat="server" Enabled="false" Visible="false" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="sdsProjector" DefaultMode="Insert" OnItemInserting="dvProjector_ItemInserting">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="Serienummer *" SortExpression="Serialnumber">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtSerialnumber" MaxLength="50" runat="server" Text='<%# Bind("Serialnumber") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtSerialnumber" runat="server" ErrorMessage="*" CssClass="message-error"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mærke *" SortExpression="Brand">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtBrand" MaxLength="50" runat="server" Text='<%# Bind("Brand") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvBrand" ControlToValidate="txtBrand" runat="server" ErrorMessage="*" CssClass="message-error"></asp:RequiredFieldValidator>
                    <asp:AutoCompleteExtender ID="aceBrand" ServiceMethod="GetBrand" MinimumPrefixLength="1" CompletionInterval="0" CompletionSetCount="5" TargetControlID="txtBrand" runat="server" FirstRowSelected="True"></asp:AutoCompleteExtender>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Model *" SortExpression="Model">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtModel" MaxLength="50" runat="server" Text='<%# Bind("Model") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvModel" ControlToValidate="txtModel" runat="server" ErrorMessage="*" CssClass="message-error"></asp:RequiredFieldValidator>
                    <asp:AutoCompleteExtender ID="aceModel" ServiceMethod="GetModel" MinimumPrefixLength="1" CompletionInterval="0" CompletionSetCount="5" TargetControlID="txtModel" runat="server" FirstRowSelected="True"></asp:AutoCompleteExtender>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="Discarded" HeaderText="Kasseret" SortExpression="Discarded" />
            <asp:BoundField DataField="Comment" HeaderText="Bemærkninger" SortExpression="Comment" />
            <asp:CommandField ShowInsertButton="True" ButtonType="Button" CancelText="Annuller" InsertText="Opret" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsProjector" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommandType="StoredProcedure" InsertCommand="InsertProjector" OnInserted="ItemInserted">
        <InsertParameters>
            <asp:Parameter Direction="ReturnValue" Name="LastID" Type="Int32" />
            <asp:Parameter Name="Serialnumber" Type="String" />
            <asp:Parameter Name="Brand" Type="String" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="Discarded" Type="Boolean" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="CreatedBy" DbType="Guid" />
        </InsertParameters>
    </asp:SqlDataSource>
    <%-- USBKey --%>
    <asp:DetailsView ID="dvUSBKey" runat="server" Enabled="false" Visible="false" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="sdsUSBKey" DefaultMode="Insert" OnItemInserting="dvUSBKey_ItemInserting">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="Serienummer *" SortExpression="Serialnumber">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtSerialnumber" MaxLength="50" runat="server" Text='<%# Bind("Serialnumber") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtSerialnumber" runat="server" ErrorMessage="*" CssClass="message-error"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="Discarded" HeaderText="Kasseret" SortExpression="Discarded" />
            <asp:BoundField DataField="Comment" HeaderText="Bemærkninger" SortExpression="Comment" />
            <asp:CommandField ShowInsertButton="True" ButtonType="Button" CancelText="Annuller" InsertText="Opret" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsUSBKey" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommandType="StoredProcedure" InsertCommand="InsertUSBKey" OnInserted="ItemInserted">
        <InsertParameters>
            <asp:Parameter Direction="ReturnValue" Name="LastID" Type="Int32" />
            <asp:Parameter Name="Serialnumber" Type="String" />
            <asp:Parameter Name="Discarded" Type="Boolean" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="CreatedBy" DbType="Guid" />
        </InsertParameters>
    </asp:SqlDataSource>
    <%-- Phone --%>
    <asp:DetailsView ID="dvPhone" runat="server" Enabled="false" Visible="false" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="sdsPhone" DefaultMode="Insert" OnItemInserting="dvPhone_ItemInserting">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="IMEI *" SortExpression="IMEI">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtIMEI" MaxLength="50" runat="server" Text='<%# Bind("IMEI") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtIMEI" runat="server" ErrorMessage="*" CssClass="message-error"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mærke *" SortExpression="Brand">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtBrand" MaxLength="50" runat="server" Text='<%# Bind("Brand") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtBrand" runat="server" ErrorMessage="*" CssClass="message-error"></asp:RequiredFieldValidator>
                    <asp:AutoCompleteExtender ID="aceBrand" ServiceMethod="GetBrand" MinimumPrefixLength="1" CompletionInterval="0" CompletionSetCount="5" TargetControlID="txtBrand" runat="server" FirstRowSelected="True"></asp:AutoCompleteExtender>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Model *" SortExpression="Model">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtModel" MaxLength="50" runat="server" Text='<%# Bind("Model") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvModel" ControlToValidate="txtModel" runat="server" ErrorMessage="*" CssClass="message-error"></asp:RequiredFieldValidator>
                    <asp:AutoCompleteExtender ID="aceModel" ServiceMethod="GetModel" MinimumPrefixLength="1" CompletionInterval="0" CompletionSetCount="5" TargetControlID="txtModel" runat="server" FirstRowSelected="True"></asp:AutoCompleteExtender>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="Discarded" HeaderText="Kasseret" SortExpression="Discarded" />
            <asp:BoundField DataField="Comment" HeaderText="Bemærkninger" SortExpression="Comment" />
            <asp:CommandField ShowInsertButton="True" ButtonType="Button" CancelText="Annuller" InsertText="Opret" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsPhone" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommandType="StoredProcedure" InsertCommand="InsertPhone" OnInserted="ItemInserted">
        <InsertParameters>
            <asp:Parameter Direction="ReturnValue" Name="LastID" Type="Int32" />
            <asp:Parameter Name="IMEI" Type="String" />
            <asp:Parameter Name="Brand" Type="String" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="Discarded" Type="Boolean" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="CreatedBy" DbType="Guid" />
        </InsertParameters>
    </asp:SqlDataSource>
    <%-- SIMcard --%>
    <asp:DetailsView ID="dvSIMcard" runat="server" Enabled="false" Visible="false" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="sdsSIMcard" DefaultMode="Insert" OnItemInserting="dvSIMcard_ItemInserting">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="SIM-kort-nr *" SortExpression="SIMcardnr">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtSIMcardnr" MaxLength="50" runat="server" Text='<%# Bind("SIMcardnr") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtSIMcardnr" runat="server" ErrorMessage="*" CssClass="message-error"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TLF-nr" SortExpression="Phonenr">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" MaxLength="20" runat="server" Text='<%# Bind("Phonenr") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PUK" SortExpression="PUK">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" MaxLength="20" runat="server" Text='<%# Bind("PUK") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PIN" SortExpression="PIN">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" MaxLength="80" runat="server" Text='<%# Bind("PIN") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="Discarded" HeaderText="Kasseret" SortExpression="Discarded" />
            <asp:BoundField DataField="Comment" HeaderText="Bemærkninger" SortExpression="Comment" />
            <asp:CommandField ShowInsertButton="True" ButtonType="Button" CancelText="Annuller" InsertText="Opret" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsSIMcard" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommandType="StoredProcedure" InsertCommand="InsertSIMcard" OnInserted="ItemInserted">
        <InsertParameters>
            <asp:Parameter Direction="ReturnValue" Name="LastID" Type="Int32" />
            <asp:Parameter Name="SIMcardnr" Type="String" />
            <asp:Parameter Name="Phonenr" Type="String" />
            <asp:Parameter Name="PUK" Type="String" />
            <asp:Parameter Name="PIN" Type="String" />
            <asp:Parameter Name="Discarded" Type="Boolean" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="CreatedBy" DbType="Guid" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br /><asp:Label ID="lblRequiredFields" runat="server" Text="Felter med * skal udfyldes"></asp:Label>
</asp:Content>

