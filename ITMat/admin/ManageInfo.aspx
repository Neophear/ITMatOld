<%@ Page Title="Rediger Info" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="ManageInfo.aspx.cs" Inherits="admin_ManageInfo" %>

<%@ Register Src="~/Controls/AdvancedTextbox.ascx" TagPrefix="uc1" TagName="AdvancedTextbox" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sdsInfo" DataKeyNames="ID">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Opdater"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Annuller"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkbtnEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Rediger"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible="False" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="Name" HeaderText="Navn" SortExpression="Name" ReadOnly="True" />
            <asp:BoundField DataField="Value" HeaderText="Værdi" SortExpression="Value" />
            <asp:BoundField DataField="Description" HeaderText="Beskrivelse" ReadOnly="True" SortExpression="Description" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsInfo" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ITInfo] WHERE [Special] = 0" UpdateCommand="UPDATE [ITInfo] SET [Value] = @Value WHERE [ID] = @ID">
        <UpdateParameters>
            <asp:Parameter Name="Value" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Panel ID="pnlGuidelines" runat="server">
        <asp:Label ID="lblGuidelinesTitle" Font-Bold="true" Font-Size="Larger" runat="server" Text="Rediger retningslinjer"></asp:Label><br />
        <asp:Label ID="lblGuidelinesSaved" runat="server" Text="Gemt<br />" Visible="false"></asp:Label>
        <uc1:AdvancedTextbox runat="server" ID="advtxtGuidelines" />
        <asp:Button ID="btnGuidelines" runat="server" Text="Gem" OnClick="btnGuidelines_Click" />
    </asp:Panel>
</asp:Content>