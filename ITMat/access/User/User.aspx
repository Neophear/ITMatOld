<%@ Page Title="Bruger" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="access_User_User" %>
<%@ Import Namespace="Stiig" %>
<%@ Register Src="~/Controls/DetailsTooltip.ascx" TagPrefix="uc1" TagName="DetailsTooltip" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:DetailsView ID="dvUser" runat="server" AutoGenerateRows="False" DataKeyNames="ID">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" Visible="false" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="MANR" SortExpression="MANR">
                <ItemTemplate>
                    <asp:Label ID="Label1" Visible='<%# !((bool)Eval("HasCustomer")) %>' runat="server"><%# Eval("MANR") %></asp:Label>
                    <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# ResolveClientUrl("~/access/Customer/Customer.aspx?ID=" + Eval("CustomerID")) %>' Visible='<%# ((bool)Eval("HasCustomer")) %>' runat="server"><%# Eval("MANR") %></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Stabsnummer" HeaderText="Stabsnummer" SortExpression="Stabsnummer" />
            <asp:TemplateField HeaderText="Navn" SortExpression="Firstname, Middlename, Lastname">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server"><%# Eval("Firstname") + " " + Eval("Middlename") + " " + Eval("Lastname")%></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        </Fields>
    </asp:DetailsView>
    <%-- Loans --%>
    <asp:GridView ID="gvLoans" runat="server" Caption="<h3>Udlån</h3>" CssClass="lists" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" DataSourceID="sdsLoans" OnRowDataBound="gvLoans_RowDataBound">
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
            <asp:BoundField DataField="DateFrom" HeaderText="Dato fra" SortExpression="DateFrom" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="DateTo" HeaderText="Dato til" SortExpression="DateTo" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="DatePickedUp" HeaderText="Afhentet" SortExpression="DatePickedUp" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="DateReturned" HeaderText="Afleveret" SortExpression="DateReturned" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" ToolTip='<%# Eval("Comment") %>' Text='<%# Utilities.CutText(Eval("Comment").ToString(), "...", 20, false) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <%--<uc1:DetailsTooltip runat="server" LoanID='<%# Eval("ID") %>' ID="DetailsTooltip" />--%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsLoans" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [LoansCustomers] WHERE ([CreatedBy] = @CreatedBy)">
        <SelectParameters>
            <asp:QueryStringParameter Name="CreatedBy" QueryStringField="ID" DbType="Guid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%-- Customers --%>
    <asp:GridView ID="gvCustomers" Caption="<h3>Kunder</h3>" CssClass="lists" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="gvCustomers_RowDataBound" DataSourceID="sdsCustomers">
        <AlternatingRowStyle CssClass="alternatingRow" />
        <RowStyle CssClass="row" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="MANR" HeaderText="MANR" SortExpression="MANR" />
            <asp:BoundField DataField="Stabsnummer" HeaderText="Stabsnummer" SortExpression="Stabsnummer" />
            <asp:BoundField DataField="Firstname" HeaderText="Fornavn" SortExpression="Firstname" />
            <asp:BoundField DataField="Middlename" HeaderText="Mellemnavn" SortExpression="Middlename" />
            <asp:BoundField DataField="Lastname" HeaderText="Efternavn" SortExpression="Lastname" />
            <asp:BoundField DataField="Phone" HeaderText="TLF-nr" SortExpression="Phone" />
            <asp:BoundField DataField="MYN" HeaderText="MYN" SortExpression="MYN" />
            <asp:BoundField DataField="ENH" HeaderText="ENH" SortExpression="ENH" />
            <asp:BoundField DataField="AFD" HeaderText="AFD" SortExpression="AFD" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ID], [MANR], [Stabsnummer], [Firstname], [Middlename], [Lastname], [Phone], [MYN], [ENH], [AFD] FROM [Customers] WHERE ([Deleted] = 0) AND ([CreatedBy] = @CreatedBy)">
        <SelectParameters>
            <asp:QueryStringParameter Name="CreatedBy" QueryStringField="ID" DbType="Guid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%-- Modem --%>
    <asp:GridView ID="gvModem" Caption="<h3>Modems</h3>" CssClass="lists" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="Gridview_RowDataBound" DataSourceID="sdsModem">
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
            <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" ToolTip='<%# Eval("Comment") %>' Text='<%# Utilities.CutText(Eval("Comment").ToString(), "...", 20, false) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsModem" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Modem].*, [SIMcard].[SIMcardnr] FROM [Modem] LEFT JOIN [SIMcard] ON [Modem].[SIMcardRefID] = [SIMcard].[ID] WHERE [Modem].[Deleted] = 0 AND ([Modem].[CreatedBy] = @CreatedBy)">
        <SelectParameters>
            <asp:QueryStringParameter Name="CreatedBy" QueryStringField="ID" DbType="Guid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%-- Token --%>
    <asp:GridView ID="gvToken" runat="server" Caption="<h3>Tokens</h3>" CssClass="lists" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="Gridview_RowDataBound" DataSourceID="sdsTokens">
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
    <asp:SqlDataSource ID="sdsTokens" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Tokens] WHERE [Deleted] = 0 AND ([CreatedBy] = @CreatedBy)">
        <SelectParameters>
            <asp:QueryStringParameter Name="CreatedBy" QueryStringField="ID" DbType="Guid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%-- Laptop --%>
    <asp:GridView ID="gvLaptop" runat="server" Caption="<h3>Bærbar</h3>" CssClass="lists" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="Gridview_RowDataBound" DataSourceID="sdsLaptop">
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
    <asp:SqlDataSource ID="sdsLaptop" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Laptop] WHERE [Deleted] = 0 AND ([CreatedBy] = @CreatedBy)">
        <SelectParameters>
            <asp:QueryStringParameter Name="CreatedBy" QueryStringField="ID" DbType="Guid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%-- Printer --%>
    <asp:GridView ID="gvPrinter" Caption="<h3>Printere</h3>" CssClass="lists" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="Gridview_RowDataBound" DataSourceID="sdsPrinter">
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
    <asp:SqlDataSource ID="sdsPrinter" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Printer] WHERE [Deleted] = 0 AND ([CreatedBy] = @CreatedBy)">
        <SelectParameters>
            <asp:QueryStringParameter Name="CreatedBy" QueryStringField="ID" DbType="Guid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%-- Projector --%>
    <asp:GridView ID="gvProjector" Caption="<h3>Projektorer</h3>" CssClass="lists" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="Gridview_RowDataBound" DataSourceID="sdsProjector">
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
    <asp:SqlDataSource ID="sdsProjector" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Projector] WHERE [Deleted] = 0 AND ([CreatedBy] = @CreatedBy)">
        <SelectParameters>
            <asp:QueryStringParameter Name="CreatedBy" QueryStringField="ID" DbType="Guid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%-- USBKey --%>
    <asp:GridView ID="gvUSBKey" runat="server" Caption="<h3>USBKey</h3>" CssClass="lists" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="Gridview_RowDataBound" DataSourceID="sdsUSBKey">
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
    <asp:SqlDataSource ID="sdsUSBKey" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [USBkey] WHERE [Deleted] = 0 AND ([CreatedBy] = @CreatedBy)">
        <SelectParameters>
            <asp:QueryStringParameter Name="CreatedBy" QueryStringField="ID" DbType="Guid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%-- Phone --%>
    <asp:GridView ID="gvPhone" Caption="<h3>Mobiltelefoner</h3>" CssClass="lists" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="Gridview_RowDataBound" DataSourceID="sdsPhone">
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
    <asp:SqlDataSource ID="sdsPhone" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Phones] WHERE [Deleted] = 0 AND ([CreatedBy] = @CreatedBy)">
        <SelectParameters>
            <asp:QueryStringParameter Name="CreatedBy" QueryStringField="ID" DbType="Guid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%-- SIMcard --%>
        <asp:GridView ID="gvSIMcard" Caption="<h3>SIM-kort</h3>" CssClass="lists" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" OnRowDataBound="Gridview_RowDataBound" DataSourceID="sdsSIMcard">
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
    <asp:SqlDataSource ID="sdsSIMcard" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [SIMcard] WHERE [Deleted] = 0 AND ([CreatedBy] = @CreatedBy)">
        <SelectParameters>
            <asp:QueryStringParameter Name="CreatedBy" QueryStringField="ID" DbType="Guid" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>