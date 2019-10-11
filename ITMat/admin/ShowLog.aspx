<%@ Page Title="Vis log" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShowLog.aspx.cs" Inherits="admin_ShowLog" %>
<%@ Import Namespace="Stiig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="lblError" runat="server" Text="lblError" Visible="false" CssClass="message-error"></asp:Label><br />
    <asp:TextBox ID="txtDateFrom" runat="server" TextMode="Date"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvDateFrom" ControlToValidate="txtDateFrom" runat="server" CssClass="message-error" ErrorMessage="*"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="cvDateFrom" runat="server" ErrorMessage="*" ControlToValidate="txtDateFrom" Operator="DataTypeCheck" SetFocusOnError="True" Type="Date" Text="*"></asp:CompareValidator>
    <asp:TextBox ID="txtDateTo" runat="server" TextMode="Date"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvDateTo" ControlToValidate="txtDateTo" runat="server" CssClass="message-error" ErrorMessage="*"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="cvDateTo" runat="server" ErrorMessage="*" ControlToValidate="txtDateTo" Operator="DataTypeCheck" SetFocusOnError="True" Type="Date" Text="*"></asp:CompareValidator>
    <br /><asp:Button ID="btnLoadLog" runat="server" Text="Se log" OnClick="btnLoadLog_Click" />
    <asp:GridView ID="gvLog" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="sdsLog" OnRowDataBound="gvLog_RowDataBound">
        <AlternatingRowStyle CssClass="alternatingRow" />
        <RowStyle CssClass="row" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" ReadOnly="True" />
            <asp:BoundField DataField="TimeStamp" HeaderText="Tid" />
            <asp:BoundField DataField="ActionDescription" HeaderText="Handling" />
            <asp:BoundField DataField="TypeDescription" HeaderText="Objekt" />
            <asp:TemplateField HeaderText="Bruger">
                <ItemTemplate>
                    <asp:Label ID="lblUser" runat="server" Text =""></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ItemID" HeaderText="ID" />
            <asp:BoundField DataField="Note" HeaderText="Note" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsLog" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="GetLog" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DbType="Date" Name="DateFrom" />
            <asp:Parameter DbType="Date" Name="DateTo" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>