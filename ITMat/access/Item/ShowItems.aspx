<%@ Page Title="Vis al MAT" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShowItems.aspx.cs" Inherits="ShowItems" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="Stiig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Table ID="tblStats" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                Ialt
            </asp:TableCell>
            <asp:TableCell>
                <asp:HyperLink ID="hplCountAll" runat="server">hplCountAll</asp:HyperLink>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                På lager
            </asp:TableCell>
            <asp:TableCell>
                <asp:HyperLink ID="hplCountIn" runat="server">hplCountIn</asp:HyperLink>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Udlånt
            </asp:TableCell>
            <asp:TableCell>
                <asp:HyperLink ID="hplCountOut" runat="server">hplCountOut</asp:HyperLink>  
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Kasseret
            </asp:TableCell>
            <asp:TableCell>
                <asp:HyperLink ID="hplCountDiscarded" runat="server">hplCountDiscarded</asp:HyperLink>  
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:LinkButton ID="lnkbtnExportToExcel" runat="server" OnClick="lnkbtnExportToExcel_Click">Export</asp:LinkButton>
    <asp:MultiView ID="mvwType" runat="server">
        <%-- Modem --%>
        <asp:View ID="vwModem" runat="server">
            <asp:GridView ID="gvModem" Caption="<h3>Modems</h3>" CssClass="lists" Visible="false" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="Gridview_RowDataBound" DataSourceID="sdsModem">
                <AlternatingRowStyle CssClass="alternatingRow" />
                <RowStyle CssClass="row" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="IMEI" HeaderText="IMEI" SortExpression="IMEI" />
                    <asp:BoundField DataField="Brand" HeaderText="Mærke" SortExpression="Brand" />
                    <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                    <asp:BoundField DataField="SIMcardnr" HeaderText="SIM-kort-nr" SortExpression="SIMcardnr" />
                    <asp:TemplateField HeaderText="Kasseret" SortExpression="Discarded">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# (bool)Eval("Discarded") ? "Ja" : "Nej" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Overført CMDB" SortExpression="TransferedCMDB">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# (bool)Eval("TransferedCMDB") ? "Ja" : "Nej" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" ToolTip='<%# Eval("Comment") %>' Text='<%# Utilities.CutText(Eval("Comment").ToString(), "...", 20, false) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sdsModem" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
        </asp:View>
        <%-- Token --%>
        <asp:View ID="vwToken" runat="server">
            <asp:GridView ID="gvToken" runat="server" Caption="<h3>Tokens</h3>" Visible="false" CssClass="lists" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="Gridview_RowDataBound" DataSourceID="sdsTokens">
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
            <asp:SqlDataSource ID="sdsTokens" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
        </asp:View>
        <%-- Laptop --%>
        <asp:View ID="vwLaptop" runat="server">
            <asp:GridView ID="gvLaptop" runat="server" Caption="<h3>Bærbar</h3>" Visible="false" CssClass="lists" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="Gridview_RowDataBound" DataSourceID="sdsLaptop">
                <AlternatingRowStyle CssClass="alternatingRow" />
                <RowStyle CssClass="row" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Serialnumber" HeaderText="Serialnumber" SortExpression="Serialnumber" />
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
            <asp:SqlDataSource ID="sdsLaptop" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
        </asp:View>
        <%-- Printer --%>
        <asp:View ID="vwPrinter" runat="server">
            <asp:GridView ID="gvPrinter" Caption="<h3>Printere</h3>" CssClass="lists" Visible="false" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="Gridview_RowDataBound" DataSourceID="sdsPrinter">
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
            <asp:SqlDataSource ID="sdsPrinter" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
        </asp:View>
        <%-- Projector --%>
        <asp:View ID="vwProjector" runat="server">
            <asp:GridView ID="gvProjector" Caption="<h3>Projektorer</h3>" CssClass="lists" Visible="false" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="Gridview_RowDataBound" DataSourceID="sdsProjector">
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
            <asp:SqlDataSource ID="sdsProjector" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
        </asp:View>
        <%-- USBKey --%>
        <asp:View ID="vwUSBKey" runat="server">
            <asp:GridView ID="gvUSBKey" runat="server" Caption="<h3>USBKey</h3>" Visible="false" CssClass="lists" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="Gridview_RowDataBound" DataSourceID="sdsUSBKey">
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
            <asp:SqlDataSource ID="sdsUSBKey" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
        </asp:View>
        <%-- Phone --%>
        <asp:View ID="vwPhone" runat="server">
                <asp:GridView ID="gvPhone" Caption="<h3>Mobiltelefoner</h3>" CssClass="lists" Visible="false" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="Gridview_RowDataBound" DataSourceID="sdsPhone">
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
            <asp:SqlDataSource ID="sdsPhone" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
        </asp:View>
        <%-- SIMcard --%>
        <asp:View ID="vwSIMcard" runat="server">
                <asp:GridView ID="gvSIMcard" Caption="<h3>SIM-kort</h3>" CssClass="lists" Visible="false" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="Gridview_RowDataBound" DataSourceID="sdsSIMcard">
                <AlternatingRowStyle CssClass="alternatingRow" />
                <RowStyle CssClass="row" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="SIMcardnr" HeaderText="SIM-kort-nr" SortExpression="SIMcardnr" />
                    <asp:BoundField DataField="Phonenr" HeaderText="TLF-nr" SortExpression="Phonenr" />
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
            <asp:SqlDataSource ID="sdsSIMcard" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>

