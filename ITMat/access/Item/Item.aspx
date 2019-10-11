<%@ Page Title="Vis MAT" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Item.aspx.cs" Inherits="Item" %>
<%@ Import Namespace="Stiig" %>
<%@ Import Namespace="System" %>
<%@ Register Src="~/Controls/MyButton.ascx" TagPrefix="uc1" TagName="MyButton" %>
<%@ Register Src="~/Controls/DetailsTooltip.ascx" TagPrefix="uc1" TagName="DetailsTooltip" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="lblError" runat="server" Text="Fejl" CssClass="message-error" Visible="False"></asp:Label>
    <asp:HyperLink ID="hplBack" runat="server">hplBack</asp:HyperLink>
    <%-- Modem --%>
    <asp:DetailsView ID="dvModem" runat="server" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="sdsModem" OnItemUpdating="dvModem_ItemUpdating" OnItemDeleted="ItemDeleted" OnItemDeleting="dv_ItemDeleting" OnModeChanged="dvModem_ModeChanged">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="IMEI" SortExpression="IMEI">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("IMEI") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1IMEI" runat="server" ErrorMessage="*" ToolTip="Du skal indtaste et IMEI" ControlToValidate="TextBox3" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("IMEI") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mærke" SortExpression="Brand">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Brand") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1Brand" runat="server" ErrorMessage="*" ToolTip="Du skal indtaste et mærke" ControlToValidate="TextBox4" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Brand") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Model" SortExpression="Model">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Model") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1Model" runat="server" ErrorMessage="*" ToolTip="Du skal indtaste en model" ControlToValidate="TextBox5" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Model") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SIM-kort" SortExpression="SIMcardnr">
                <EditItemTemplate>
                    <asp:HyperLink ID="HyperLink1" Visible='<%# Eval("SIMcardRefID") != DBNull.Value %>' NavigateUrl='<%# ResolveClientUrl("~/access/Item/Item.aspx?type=8&ID=" + Eval("SIMcardRefID")) %>' runat="server" Text='<%# Eval("SIMcardnr") %>'></asp:HyperLink> <asp:LinkButton ID="lnkbtnRemoveSIMFromModem" OnClick="lnkbtnRemoveSIMFromModem_Click" Visible='<%# Eval("SIMcardRefID") != DBNull.Value %>' runat="server">Fjern</asp:LinkButton>
                    <asp:DropDownList ID="ddlSIMcard" runat="server" Visible='<%# Eval("SIMcardRefID") == DBNull.Value %>' DataSourceID="sdsModemSIMcard" DataTextField="Text" DataValueField="ID"></asp:DropDownList>
                    <asp:SqlDataSource ID="sdsModemSIMcard" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT '0' AS [ID], '-Vælg nyt SIM-kort-' AS [Text] UNION SELECT [ID], (CONVERT(VARCHAR,[ID]) + ' - ' + [SIMcardnr]) AS [Text] FROM [SIMcard] WHERE [ID] NOT IN (SELECT [SIMcardRefID] FROM [Modem] WHERE [Deleted] = 0 AND [SIMcardRefID] IS NOT null) AND [Deleted] = 0">
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# ResolveClientUrl("~/access/Item/Item.aspx?type=8&ID=" + Eval("SIMcardID")) %>' runat="server" Text='<%# Eval("SIMcardnr") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kasseret" SortExpression="Discarded">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Discarded") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# (bool)Eval("Discarded") ? "Ja" : "Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Overført CMDB" SortExpression="TransferedCMDB">
                <EditItemTemplate>
                    <asp:CheckBox ID="chkbxTransferedCMDB" runat="server" Checked='<%# Bind("TransferedCMDB") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblTransferedCMDB" runat="server" Text='<%# (bool)Eval("TransferedCMDB") ? "Ja" : "Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("Comment").ToString().Replace("\n", "<br />") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Oprettet af" SortExpression="CreatedBy">
                <ItemTemplate>
                    <asp:HyperLink ID="hplCreatedBy" NavigateUrl='<%# "~/access/User/User.aspx?ID=" + Eval("CreatedBy") %>' runat="server"><%# Utilities.GetOutlookName((Guid)Eval("CreatedBy")) %></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataFormatString="{0:dd/MM/yyyy}" HeaderText="Oprettet d." DataField="CreatedDate" ReadOnly="true" />
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <uc1:MyButton runat="server" ID="mbUpdate" Type="Save" />
                    <uc1:MyButton runat="server" ID="mbCancel" Type="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <uc1:MyButton runat="server" ID="mbEdit" Type="Edit" />
                    <uc1:MyButton runat="server" ID="mbDelete" Type="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsModem" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DeleteItem" SelectCommand="SELECT [Modem].*, [SIMcard].[ID] AS [SIMcardID], [SIMcard].[SIMcardnr] FROM [Modem] LEFT OUTER JOIN [SIMcard] ON [Modem].[SIMcardRefID] = [SIMcard].[ID] WHERE ([Modem].[ID] = @ID) AND [Modem].[Deleted] = 0" UpdateCommand="UpdateModem" UpdateCommandType="StoredProcedure" DeleteCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="UserID" DbType="Guid" />
            <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="Type" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="SIMcardRefID" Type="Int32" />
            <asp:Parameter Name="Discarded" Type="Boolean" />
            <asp:Parameter Name="UserID" DbType="Guid" />
            <asp:Parameter Name="Note" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <%-- Token --%>
    <asp:DetailsView ID="dvToken" runat="server" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="sdsToken" OnItemUpdating="dvToken_ItemUpdating" OnItemDeleted="ItemDeleted">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="Serienummer" SortExpression="Serialnumber">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Serialnumber") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv2Serialnumber" runat="server" ErrorMessage="*" ToolTip="Du skal indtaste et Serienummer" ControlToValidate="TextBox2" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("Serialnumber") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kasseret" SortExpression="Discarded">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Discarded") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# (bool)Eval("Discarded") ? "Ja" : "Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label13" runat="server" Text='<%# Eval("Comment").ToString().Replace("\n", "<br />") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Oprettet af" SortExpression="CreatedBy">
                <ItemTemplate>
                    <asp:HyperLink ID="hplCreatedBy" NavigateUrl='<%# "~/access/User/User.aspx?ID=" + Eval("CreatedBy") %>' runat="server"><%# Utilities.GetOutlookName((Guid)Eval("CreatedBy")) %></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataFormatString="{0:dd/MM/yyyy}" HeaderText="Oprettet d." DataField="CreatedDate" ReadOnly="true" />
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <uc1:MyButton runat="server" ID="mbUpdate" Type="Save" />
                    <uc1:MyButton runat="server" ID="mbCancel" Type="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <uc1:MyButton runat="server" ID="mbEdit" Type="Edit" />
                    <uc1:MyButton runat="server" ID="mbDelete" Type="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsToken" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DeleteItem" SelectCommand="SELECT * FROM [Tokens] WHERE ([ID] = @ID) AND [Deleted] = 0" UpdateCommand="UpdateToken" UpdateCommandType="StoredProcedure" DeleteCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="UserID" DbType="Guid" />
            <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int32" />
            <asp:Parameter DefaultValue="2" Name="Type" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Serialnumber" Type="String" />
            <asp:Parameter Name="Discarded" Type="Boolean" />
            <asp:Parameter Name="Comment" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Serialnumber" Type="String" />
            <asp:Parameter Name="Discarded" Type="Boolean" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="UserID" DbType="Guid" />
            <asp:Parameter Name="Note" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <%-- Laptop --%>
    <asp:DetailsView ID="dvLaptop" runat="server" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="sdsLaptop" OnItemUpdating="dvLaptop_ItemUpdating" OnItemDeleted="ItemDeleted">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="Serialnumber" SortExpression="Serialnumber">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Serialnumber") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv3Serialnumber" runat="server" ErrorMessage="*" ToolTip="Du skal indtaste et Serienummer" ControlToValidate="TextBox2" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("Serialnumber") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="GUID" HeaderText="GUID" SortExpression="GUID" />
            <asp:TemplateField HeaderText="Brand" SortExpression="Brand">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Brand") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv3Brand" runat="server" ErrorMessage="*" ToolTip="Du skal indtaste et mærke" ControlToValidate="TextBox4" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label16" runat="server" Text='<%# Bind("Brand") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Model" SortExpression="Model">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Model") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv3Model" runat="server" ErrorMessage="*" ToolTip="Du skal indtaste en model" ControlToValidate="TextBox5" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label17" runat="server" Text='<%# Bind("Model") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="FIIN" SortExpression="FIIN">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("FIIN") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label21" runat="server" Text='<%# (bool)Eval("FIIN") ? "Ja":"Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Navn" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Beskrivelse" SortExpression="Description" />
            <asp:TemplateField HeaderText="Kasseret" SortExpression="Discarded">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Discarded") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label23" runat="server" Text='<%# (bool)Eval("Discarded") ? "Ja" : "Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label22" runat="server" Text='<%# Eval("Comment").ToString().Replace("\n", "<br />") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Oprettet af" SortExpression="CreatedBy">
                <ItemTemplate>
                    <asp:HyperLink ID="hplCreatedBy" NavigateUrl='<%# "~/access/User/User.aspx?ID=" + Eval("CreatedBy") %>' runat="server"><%# Utilities.GetOutlookName((Guid)Eval("CreatedBy")) %></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataFormatString="{0:dd/MM/yyyy}" HeaderText="Oprettet d." DataField="CreatedDate" ReadOnly="true" />
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <uc1:MyButton runat="server" ID="mbUpdate" Type="Save" />
                    <uc1:MyButton runat="server" ID="mbCancel" Type="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <uc1:MyButton runat="server" ID="mbEdit" Type="Edit" />
                    <uc1:MyButton runat="server" ID="mbDelete" Type="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsLaptop" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Laptop] WHERE ([ID] = @ID) AND [Deleted] = 0" DeleteCommand="DeleteItem" UpdateCommand="UpdateLaptop" UpdateCommandType="StoredProcedure" DeleteCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="UserID" DbType="Guid" />
            <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int32" />
            <asp:Parameter DefaultValue="3" Name="Type" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Serialnumber" Type="String" />
            <asp:Parameter Name="GUID" Type="String" />
            <asp:Parameter Name="Brand" Type="String" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="FIIN" Type="Boolean" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Discarded" Type="Boolean" />
            <asp:Parameter Name="Comment" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Serialnumber" Type="String" />
            <asp:Parameter Name="GUID" Type="String" />
            <asp:Parameter Name="Brand" Type="String" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="FIIN" Type="Boolean" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Discarded" Type="Boolean" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="UserID" DbType="Guid" />
            <asp:Parameter Name="Note" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <%-- Printer --%>
    <asp:DetailsView ID="dvPrinter" runat="server" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="sdsPrinter" OnItemUpdating="dvPrinter_ItemUpdating" OnItemDeleted="ItemDeleted">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="Serienummer" SortExpression="Serialnumber">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Serialnumber") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1Serialnumber" runat="server" ErrorMessage="*" ToolTip="Du skal indtaste et serienummer" ControlToValidate="TextBox3" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Serialnumber") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mærke" SortExpression="Brand">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Brand") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1Brand" runat="server" ErrorMessage="*" ToolTip="Du skal indtaste et mærke" ControlToValidate="TextBox4" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Brand") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Model" SortExpression="Model">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Model") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1Model" runat="server" ErrorMessage="*" ToolTip="Du skal indtaste en model" ControlToValidate="TextBox5" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Model") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Navn" SortExpression="Name" />
            <asp:TemplateField HeaderText="Kasseret" SortExpression="Discarded">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Discarded") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# (bool)Eval("Discarded") ? "Ja" : "Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("Comment").ToString().Replace("\n", "<br />") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Oprettet af" SortExpression="CreatedBy">
                <ItemTemplate>
                    <asp:HyperLink ID="hplCreatedBy" NavigateUrl='<%# "~/access/User/User.aspx?ID=" + Eval("CreatedBy") %>' runat="server"><%# Utilities.GetOutlookName((Guid)Eval("CreatedBy")) %></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataFormatString="{0:dd/MM/yyyy}" HeaderText="Oprettet d." DataField="CreatedDate" ReadOnly="true" />
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <uc1:MyButton runat="server" ID="mbUpdate" Type="Save" />
                    <uc1:MyButton runat="server" ID="mbCancel" Type="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <uc1:MyButton runat="server" ID="mbEdit" Type="Edit" />
                    <uc1:MyButton runat="server" ID="mbDelete" Type="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsPrinter" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DeleteItem" SelectCommand="SELECT * FROM [Printer] WHERE ([ID] = @ID) AND [Deleted] = 0" UpdateCommand="UpdatePrinter" UpdateCommandType="StoredProcedure" DeleteCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="UserID" DbType="Guid" />
            <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="Type" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Serialnumber" Type="String" />
            <asp:Parameter Name="Brand" Type="String" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Discarded" Type="Boolean" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="UserID" DbType="Guid" />
            <asp:Parameter Name="Note" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <%-- Projector --%>
    <asp:DetailsView ID="dvProjector" runat="server" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="sdsProjector" OnItemUpdating="dvProjector_ItemUpdating" OnItemDeleted="ItemDeleted">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="Serienummer" SortExpression="Serialnumber">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Serialnumber") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1Serialnumber" runat="server" ErrorMessage="*" ToolTip="Du skal indtaste et serienummer" ControlToValidate="TextBox3" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Serialnumber") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mærke" SortExpression="Brand">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Brand") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1Brand" runat="server" ErrorMessage="*" ToolTip="Du skal indtaste et mærke" ControlToValidate="TextBox4" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Brand") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Model" SortExpression="Model">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Model") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1Model" runat="server" ErrorMessage="*" ToolTip="Du skal indtaste en model" ControlToValidate="TextBox5" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Model") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kasseret" SortExpression="Discarded">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Discarded") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# (bool)Eval("Discarded") ? "Ja" : "Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("Comment").ToString().Replace("\n", "<br />") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Oprettet af" SortExpression="CreatedBy">
                <ItemTemplate>
                    <asp:HyperLink ID="hplCreatedBy" NavigateUrl='<%# "~/access/User/User.aspx?ID=" + Eval("CreatedBy") %>' runat="server"><%# Utilities.GetOutlookName((Guid)Eval("CreatedBy")) %></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataFormatString="{0:dd/MM/yyyy}" HeaderText="Oprettet d." DataField="CreatedDate" ReadOnly="true" />
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <uc1:MyButton runat="server" ID="mbUpdate" Type="Save" />
                    <uc1:MyButton runat="server" ID="mbCancel" Type="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <uc1:MyButton runat="server" ID="mbEdit" Type="Edit" />
                    <uc1:MyButton runat="server" ID="mbDelete" Type="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsProjector" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DeleteItem" SelectCommand="SELECT * FROM [Projector] WHERE ([ID] = @ID) AND [Deleted] = 0" UpdateCommand="UpdateProjector" UpdateCommandType="StoredProcedure" DeleteCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="UserID" DbType="Guid" />
            <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="Type" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Serialnumber" Type="String" />
            <asp:Parameter Name="Brand" Type="String" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="Discarded" Type="Boolean" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="UserID" DbType="Guid" />
            <asp:Parameter Name="Note" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <%-- USBKey --%>
    <asp:DetailsView ID="dvUSBKey" runat="server" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="sdsUSBKey" OnItemUpdating="dvUSBKey_ItemUpdating" OnItemDeleted="ItemDeleted">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="Serienummer" SortExpression="Serialnumber">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Serialnumber") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv2Serialnumber" runat="server" ErrorMessage="*" ToolTip="Du skal indtaste et Serienummer" ControlToValidate="TextBox2" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("Serialnumber") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kasseret" SortExpression="Discarded">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Discarded") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# (bool)Eval("Discarded") ? "Ja" : "Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label13" runat="server" Text='<%# Eval("Comment").ToString().Replace("\n", "<br />") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Oprettet af" SortExpression="CreatedBy">
                <ItemTemplate>
                    <asp:HyperLink ID="hplCreatedBy" NavigateUrl='<%# "~/access/User/User.aspx?ID=" + Eval("CreatedBy") %>' runat="server"><%# Utilities.GetOutlookName((Guid)Eval("CreatedBy")) %></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataFormatString="{0:dd/MM/yyyy}" HeaderText="Oprettet d." DataField="CreatedDate" ReadOnly="true" />
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <uc1:MyButton runat="server" ID="mbUpdate" Type="Save" />
                    <uc1:MyButton runat="server" ID="mbCancel" Type="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <uc1:MyButton runat="server" ID="mbEdit" Type="Edit" />
                    <uc1:MyButton runat="server" ID="mbDelete" Type="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsUSBKey" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DeleteItem" SelectCommand="SELECT * FROM [USBKey] WHERE ([ID] = @ID) AND [Deleted] = 0" UpdateCommand="UpdateUSBKey" UpdateCommandType="StoredProcedure" DeleteCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="UserID" DbType="Guid" />
            <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int32" />
            <asp:Parameter DefaultValue="2" Name="Type" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Serialnumber" Type="String" />
            <asp:Parameter Name="Discarded" Type="Boolean" />
            <asp:Parameter Name="Comment" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Serialnumber" Type="String" />
            <asp:Parameter Name="Discarded" Type="Boolean" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="UserID" DbType="Guid" />
            <asp:Parameter Name="Note" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <%-- Phone --%>
    <asp:DetailsView ID="dvPhone" runat="server" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="sdsPhone" OnItemUpdating="dvPhone_ItemUpdating" OnItemDeleted="ItemDeleted">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="IMEI" SortExpression="IMEI">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("IMEI") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1IMEI" runat="server" ErrorMessage="*" ToolTip="Du skal indtaste et IMEI" ControlToValidate="TextBox3" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("IMEI") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mærke" SortExpression="Brand">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Brand") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1Brand" runat="server" ErrorMessage="*" ToolTip="Du skal indtaste et mærke" ControlToValidate="TextBox4" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Brand") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Model" SortExpression="Model">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Model") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1Model" runat="server" ErrorMessage="*" ToolTip="Du skal indtaste en model" ControlToValidate="TextBox5" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Model") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kasseret" SortExpression="Discarded">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Discarded") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# (bool)Eval("Discarded") ? "Ja" : "Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Overført CMDB" SortExpression="TransferedCMDB">
                <EditItemTemplate>
                    <asp:CheckBox ID="chkbxTransferedCMDB" runat="server" Checked='<%# Bind("TransferedCMDB") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblTransferedCMDB" runat="server" Text='<%# (bool)Eval("TransferedCMDB") ? "Ja" : "Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("Comment").ToString().Replace("\n", "<br />") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Oprettet af" SortExpression="CreatedBy">
                <ItemTemplate>
                    <asp:HyperLink ID="hplCreatedBy" NavigateUrl='<%# "~/access/User/User.aspx?ID=" + Eval("CreatedBy") %>' runat="server"><%# Utilities.GetOutlookName((Guid)Eval("CreatedBy")) %></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataFormatString="{0:dd/MM/yyyy}" HeaderText="Oprettet d." DataField="CreatedDate" ReadOnly="true" />
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <uc1:MyButton runat="server" ID="mbUpdate" Type="Save" />
                    <uc1:MyButton runat="server" ID="mbCancel" Type="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <uc1:MyButton runat="server" ID="mbEdit" Type="Edit" />
                    <uc1:MyButton runat="server" ID="mbDelete" Type="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsPhone" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DeleteItem" SelectCommand="SELECT * FROM [Phones] WHERE ([ID] = @ID) AND [Deleted] = 0" UpdateCommand="UpdatePhone" UpdateCommandType="StoredProcedure" DeleteCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="UserID" DbType="Guid" />
            <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="Type" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="IMEI" Type="String" />
            <asp:Parameter Name="Brand" Type="String" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="Discarded" Type="Boolean" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="TransferedCMDB" Type="Boolean" />
            <asp:Parameter Name="UserID" DbType="Guid" />
            <asp:Parameter Name="Note" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <%-- SIMcard --%>
    <asp:DetailsView ID="dvSIMcard" runat="server" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="sdsSIMcard" OnItemUpdating="dvSIMcard_ItemUpdating" OnItemDeleted="ItemDeleted">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="SIMcardnr" HeaderText="SIMkort-nr" SortExpression="SIMcardnr" />
            <asp:TemplateField HeaderText="Modem ID" SortExpression="ModemID">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# ResolveClientUrl("~/access/Item/Item.aspx?type=1&ID=" + Eval("ModemID")) %>' runat="server" Text='<%# Eval("ModemID") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Phonenr" HeaderText="TLF-nr" SortExpression="Phonenr" />
            <asp:BoundField DataField="PUK" HeaderText="PUK" SortExpression="PUK" />
            <asp:BoundField DataField="PIN" HeaderText="PIN" SortExpression="PIN" />
            <asp:TemplateField HeaderText="Kasseret" SortExpression="Discarded">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Discarded") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# (bool)Eval("Discarded") ? "Ja" : "Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Overført CMDB" SortExpression="TransferedCMDB">
                <EditItemTemplate>
                    <asp:CheckBox ID="chkbxTransferedCMDB" runat="server" Checked='<%# Bind("TransferedCMDB") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblTransferedCMDB" runat="server" Text='<%# (bool)Eval("TransferedCMDB") ? "Ja" : "Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("Comment").ToString().Replace("\n", "<br />") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Oprettet af" SortExpression="CreatedBy">
                <ItemTemplate>
                    <asp:HyperLink ID="hplCreatedBy" NavigateUrl='<%# "~/access/User/User.aspx?ID=" + Eval("CreatedBy") %>' runat="server"><%# Utilities.GetOutlookName((Guid)Eval("CreatedBy")) %></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataFormatString="{0:dd/MM/yyyy}" HeaderText="Oprettet d." DataField="CreatedDate" ReadOnly="true" />
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <uc1:MyButton runat="server" ID="mbUpdate" Type="Save" />
                    <uc1:MyButton runat="server" ID="mbCancel" Type="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <uc1:MyButton runat="server" ID="mbEdit" Type="Edit" />
                    <uc1:MyButton runat="server" ID="mbDelete" Type="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsSIMcard" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DeleteItem" SelectCommand="SELECT [SIMcard].*, (SELECT [ID] FROM [Modem] WHERE [SIMcardRefID] = @ID AND [Deleted] = 0) AS [ModemID] FROM [SIMcard] WHERE [SIMcard].[ID] = @ID AND [SIMcard].[Deleted] = 0" UpdateCommand="UpdateSIMcard" UpdateCommandType="StoredProcedure" DeleteCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="UserID" DbType="Guid" />
            <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="Type" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="SIMcardnr" Type="String" />
            <asp:Parameter Name="Phonenr" Type="String" />
            <asp:Parameter Name="PUK" Type="String" />
            <asp:Parameter Name="PIN" Type="String" />
            <asp:Parameter Name="Discarded" Type="Boolean" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="TransferedCMDB" Type="Boolean" />
            <asp:Parameter Name="UserID" DbType="Guid" />
            <asp:Parameter Name="Note" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <%-- Loans --%>
    <asp:GridView ID="gvLoans" runat="server" Caption="<h3>Udlån</h3>" CssClass="lists" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="gvLoans_RowDataBound" OnSorting="gvLoans_Sorting">
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
</asp:Content>

