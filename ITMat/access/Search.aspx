<%@ Page Title="Søg" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>
<%@ Import Namespace="Stiig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="float:left;">
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox><br />
        <asp:Button ID="btnSearch" runat="server" Text="Søg" OnClick="btnSearch_Click" />
    </div>
    <div style="float:left;padding-left:10px;">
        <asp:Panel ID="pnlSearchItemsHeader" runat="server" CssClass="cpHeader">
            <asp:Label ID="lblSearchItems" runat="server" />
        </asp:Panel>
        <asp:Panel ID="pnlSearchItemsBody" runat="server" CssClass="cpBody">
            <asp:CheckBoxList ID="cblSearchItems" runat="server">
                <asp:ListItem Text="Modem" Value="modem" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Token" Value="token" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Bærbar" Value="laptop" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Printer" Value="printer" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Projektor" Value="projector" Selected="True"></asp:ListItem>
                <asp:ListItem Text="USB-nøgle" Value="usbkey" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Mobiltelefon" Value="phone" Selected="True"></asp:ListItem>
                <asp:ListItem Text="SIM-kort" Value="simcard" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Kunder" Value="customer" Selected="True"></asp:ListItem>
            </asp:CheckBoxList>
        </asp:Panel>
        <ajaxToolkit:CollapsiblePanelExtender ID="cpeSearchItems" runat="server" TargetControlID="pnlSearchItemsBody" CollapseControlID="pnlSearchItemsHeader" ExpandControlID="pnlSearchItemsHeader" Collapsed="true" TextLabelID="lblSearchItems" CollapsedText="Vis indstillinger..." ExpandedText="Skjul indstillinger..." CollapsedSize="0">
        </ajaxToolkit:CollapsiblePanelExtender>
    </div>

    <%-- Modem --%>
    <asp:GridView ID="gvModem" Caption="<h3>Modems</h3>" CssClass="lists" runat="server" AllowPaging="False" AllowSorting="False" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="ItemDataBound">
        <AlternatingRowStyle CssClass="alternatingRow" />
        <RowStyle CssClass="row" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="IMEI" HeaderText="IMEI" SortExpression="IMEI" />
            <asp:BoundField DataField="Brand" HeaderText="Mærke" SortExpression="Brand" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:TemplateField HeaderText="Kasseret" SortExpression="Discarded">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# (bool)Eval("Discarded") ? "Ja" : "Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" ToolTip='<%# Eval("Comment") %>' Text='<%# Utilities.CutText(Eval("Comment").ToString(), "...", 20, false) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <%-- Token --%>
    <asp:GridView ID="gvToken" runat="server" Caption="<h3>Tokens</h3>" CssClass="lists" AllowPaging="False" AllowSorting="false" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="ItemDataBound">
        <AlternatingRowStyle CssClass="alternatingRow" />
        <RowStyle CssClass="row" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Serialnumber" HeaderText="Serienummer" SortExpression="Serialnumber" />
            <asp:TemplateField HeaderText="Kasseret" SortExpression="Discarded">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# (bool)Eval("Discarded") ? "Ja" : "Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" ToolTip='<%# Eval("Comment") %>' Text='<%# Utilities.CutText(Eval("Comment").ToString(), "...", 20, false) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <%-- Laptop --%>
    <asp:GridView ID="gvLaptop" runat="server" Caption="<h3>Bærbar</h3>" CssClass="lists" AllowPaging="False" AllowSorting="false" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="ItemDataBound">
        <AlternatingRowStyle CssClass="alternatingRow" />
        <RowStyle CssClass="row" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Serialnumber" HeaderText="Serienummer" SortExpression="Serialnumber" />
            <asp:BoundField DataField="GUID" HeaderText="GUID" SortExpression="GUID" />
            <asp:BoundField DataField="Brand" HeaderText="Mærke" SortExpression="Brand" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:TemplateField HeaderText="FIIN" SortExpression="FIIN">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# (bool)Eval("FIIN") ? "Ja" : "Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Navn" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Beskrivelse" SortExpression="Description" />
            <asp:TemplateField HeaderText="Kasseret" SortExpression="Discarded">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# (bool)Eval("Discarded") ? "Ja" : "Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" ToolTip='<%# Eval("Comment") %>' Text='<%# Utilities.CutText(Eval("Comment").ToString(), "...", 20, false) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <%-- Printer --%>
    <asp:GridView ID="gvPrinter" runat="server" Caption="<h3>Printer</h3>" CssClass="lists" AllowPaging="False" AllowSorting="false" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="ItemDataBound">
        <AlternatingRowStyle CssClass="alternatingRow" />
        <RowStyle CssClass="row" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Serialnumber" HeaderText="Serienummer" SortExpression="Serialnumber" />
            <asp:BoundField DataField="Brand" HeaderText="Mærke" SortExpression="Brand" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Name" HeaderText="Navn" SortExpression="Name" />
            <asp:TemplateField HeaderText="Kasseret" SortExpression="Discarded">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# (bool)Eval("Discarded") ? "Ja" : "Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" ToolTip='<%# Eval("Comment") %>' Text='<%# Utilities.CutText(Eval("Comment").ToString(), "...", 20, false) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <%-- Projector --%>
    <asp:GridView ID="gvProjector" runat="server" Caption="<h3>Projektor</h3>" CssClass="lists" AllowPaging="False" AllowSorting="false" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="ItemDataBound">
        <AlternatingRowStyle CssClass="alternatingRow" />
        <RowStyle CssClass="row" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Serialnumber" HeaderText="Serienummer" SortExpression="Serialnumber" />
            <asp:BoundField DataField="Brand" HeaderText="Mærke" SortExpression="Brand" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:TemplateField HeaderText="Kasseret" SortExpression="Discarded">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# (bool)Eval("Discarded") ? "Ja" : "Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" ToolTip='<%# Eval("Comment") %>' Text='<%# Utilities.CutText(Eval("Comment").ToString(), "...", 20, false) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <%-- USBkey --%>
    <asp:GridView ID="gvUSBkey" runat="server" Caption="<h3>USB-nøgle</h3>" CssClass="lists" AllowPaging="False" AllowSorting="false" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="ItemDataBound">
        <AlternatingRowStyle CssClass="alternatingRow" />
        <RowStyle CssClass="row" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Serialnumber" HeaderText="Serienummer" SortExpression="Serialnumber" />
            <asp:TemplateField HeaderText="Kasseret" SortExpression="Discarded">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# (bool)Eval("Discarded") ? "Ja" : "Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" ToolTip='<%# Eval("Comment") %>' Text='<%# Utilities.CutText(Eval("Comment").ToString(), "...", 20, false) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <%-- Phone --%>
    <asp:GridView ID="gvPhone" runat="server" Caption="<h3>Mobiltelefoner</h3>" CssClass="lists" AllowPaging="False" AllowSorting="False" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="ItemDataBound">
        <AlternatingRowStyle CssClass="alternatingRow" />
        <RowStyle CssClass="row" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="IMEI" HeaderText="IMEI" SortExpression="IMEI" />
            <asp:BoundField DataField="Brand" HeaderText="Mærke" SortExpression="Brand" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:TemplateField HeaderText="Kasseret" SortExpression="Discarded">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# (bool)Eval("Discarded") ? "Ja" : "Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" ToolTip='<%# Eval("Comment") %>' Text='<%# Utilities.CutText(Eval("Comment").ToString(), "...", 20, false) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <%-- SIMcard --%>
    <asp:GridView ID="gvSIMcard" runat="server" Caption="<h3>SIM-kort</h3>" CssClass="lists" AllowPaging="False" AllowSorting="False" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="ItemDataBound">
        <AlternatingRowStyle CssClass="alternatingRow" />
        <RowStyle CssClass="row" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="SIMcardnr" HeaderText="SIM-kort-nr" SortExpression="SIMcardnr" />
            <asp:TemplateField HeaderText="Kasseret" SortExpression="Discarded">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# (bool)Eval("Discarded") ? "Ja" : "Nej" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" ToolTip='<%# Eval("Comment") %>' Text='<%# Utilities.CutText(Eval("Comment").ToString(), "...", 20, false) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <%-- Customers --%>
    <asp:GridView ID="gvCustomers" runat="server" Caption="<h3>Kunder</h3>" CssClass="lists" AllowPaging="False" AllowSorting="False" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="gvCustomers_RowDataBound">
        <AlternatingRowStyle CssClass="alternatingRow" />
        <RowStyle CssClass="row" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="MANR" HeaderText="MANR" SortExpression="MANR" />
            <asp:BoundField DataField="Stabsnummer" HeaderText="Stabsnummer" SortExpression="Stabsnummer" />
            <asp:BoundField DataField="Firstname" HeaderText="Fornavn" SortExpression="Firstname" />
            <asp:BoundField DataField="Middlename" HeaderText="Mellemnavn(e)" SortExpression="Middlename" />
            <asp:BoundField DataField="Lastname" HeaderText="Efternavn" SortExpression="Lastname" />
            <asp:BoundField DataField="Phone" HeaderText="TLF-nr" SortExpression="Phone" />
            <asp:BoundField DataField="MYN" HeaderText="MYN" SortExpression="MYN" />
            <asp:BoundField DataField="ENH" HeaderText="ENH" SortExpression="ENH" />
            <asp:BoundField DataField="AFD" HeaderText="AFD" SortExpression="AFD" />
        </Columns>
    </asp:GridView>
</asp:Content>