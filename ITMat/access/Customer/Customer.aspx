<%@ Page Title="Kunde" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Customer.aspx.cs" Inherits="Customer" %>
<%@ Import Namespace="Stiig" %>
<%@ Register Src="~/Controls/MyButton.ascx" TagPrefix="uc1" TagName="MyButton" %>
<%@ Register Src="~/Controls/DetailsTooltip.ascx" TagPrefix="uc1" TagName="DetailsTooltip" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="lblError" Visible="false" runat="server" Text="lblError" CssClass="message-error"></asp:Label>
    <asp:DetailsView ID="dvCustomer" runat="server" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="sdsCustomer" OnItemDeleting="dvCustomer_ItemDeleting" OnItemDeleted="dvCustomer_ItemDeleted" OnItemUpdating="dvCustomer_ItemUpdating">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="MANR" SortExpression="MANR">
                <EditItemTemplate>
                    <asp:TextBox ID="txtMANR" runat="server" Text='<%# Bind("MANR") %>' MaxLength="10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMANR" runat="server" ErrorMessage="*" ControlToValidate="txtMANR" ToolTip="Du skal indtaste et MANR" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("MANR") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Stabsnummer" SortExpression="Stabsnummer">
                <EditItemTemplate>
                    <asp:TextBox ID="txtStabsnummer" MaxLength="15" Text='<%# Bind("Stabsnummer") %>' runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvStabsnummer" runat="server" ErrorMessage="*" ControlToValidate="txtStabsnummer" ToolTip="Du skal indtaste et Stabsnummer" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Stabsnummer") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fornavn" SortExpression="Firstname">
                <EditItemTemplate>
                    <asp:TextBox ID="txtFirstname" MaxLength="50" Text='<%# Bind("Firstname") %>' runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFirstname" runat="server" ErrorMessage="*" ControlToValidate="txtFirstname" ToolTip="Du skal indtaste et fornavn" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Firstname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mellemnavn" SortExpression="Middlename">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" MaxLength="50" Text='<%# Bind("Middlename") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Middlename") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Efternavn" SortExpression="Lastname">
                <EditItemTemplate>
                    <asp:TextBox ID="txtLastname" MaxLength="50" Text='<%# Bind("Lastname") %>' runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLastname" runat="server" ErrorMessage="*" ControlToValidate="txtLastname" ToolTip="Du skal indtaste et efternavn" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Lastname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TLF-nr" SortExpression="Phone">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPhone" MaxLength="50" Text='<%# Bind("Phone") %>' runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MYN" SortExpression="MYN">
                <EditItemTemplate>
                    <asp:TextBox ID="txtMYN" runat="server" Text='<%# Bind("MYN") %>' MaxLength="10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMYN" runat="server" ErrorMessage="*" ControlToValidate="txtMYN" ToolTip="Du skal indtaste en MYN" CssClass="message-error"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("MYN") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ENH" SortExpression="ENH">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" MaxLength="20" Text='<%# Bind("ENH") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("ENH") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="AFD" SortExpression="AFD">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" MaxLength="10" Text='<%# Bind("AFD") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("AFD") %>'></asp:Label>
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
                    <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "~/access/User/User.aspx?ID=" + Eval("CreatedBy") %>' runat="server"><%# Utilities.GetOutlookName((Guid)Eval("CreatedBy")) %></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
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
            <asp:TemplateField ShowHeader="false">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# "~/access/Loan/CreateLoan.aspx?MANR=" + Eval("MANR") %>' runat="server">Opret lån</asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommandType="StoredProcedure" DeleteCommand="DeleteCustomer" SelectCommand="SELECT * FROM [Customers] WHERE ([ID] = @ID) AND ([Deleted] = 0)" UpdateCommand="UpdateCustomer" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="DeletedBy" DbType="Guid" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="MANR" Type="String" />
            <asp:Parameter Name="Stabsnummer" />
            <asp:Parameter Name="Firstname" />
            <asp:Parameter Name="Middlename" />
            <asp:Parameter Name="Lastname" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="MYN" Type="String" />
            <asp:Parameter Name="ENH" Type="String" />
            <asp:Parameter Name="AFD" Type="String" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="UserID" DbType="Guid" />
            <asp:Parameter Name="Note" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="gvLoans" runat="server" Caption="<h3>Udlån</h3>" CssClass="lists" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" DataSourceID="sdsLoans" OnRowDataBound="gvLoans_RowDataBound">
        <AlternatingRowStyle CssClass="alternatingRow" />
        <RowStyle CssClass="row" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="#" ReadOnly="True" SortExpression="ID" />
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
    <asp:SqlDataSource ID="sdsLoans" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ID, DateFrom, DateTo, DatePickedUp, DateReturned, LoanType, FailedPickup FROM LoansCustomers WHERE (CustomerRefID = @CustomerRefID) ORDER BY DateFrom DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="CustomerRefID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>