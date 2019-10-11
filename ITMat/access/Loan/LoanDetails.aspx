<%@ Page Title="Udlån detaljer" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LoanDetails.aspx.cs" Inherits="LoanDetails" %>
<%@ Import Namespace="Stiig" %>
<%@ Register Src="~/Controls/MyButton.ascx" TagPrefix="uc1" TagName="MyButton" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="lblError" runat="server" Visible="false" CssClass="message-error" Text="lblError"></asp:Label>
    <asp:Label ID="lblFailedPickup" ForeColor="Red" Visible="false" runat="server" Text="Ikke afhentet"></asp:Label>
    <br /><asp:Label ID="lblOrderID" runat="server" Text="lblOrderID" Font-Size="Larger"></asp:Label>
    <asp:DetailsView ID="dvLoanDetails" CssClass="details" runat="server" FieldHeaderStyle-Width="85px" Width="400px" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="sdsLoan" OnItemCommand="dvLoanDetails_ItemCommand" OnItemDeleting="dvLoanDetails_ItemDeleting" OnItemDeleted="dvLoanDetails_ItemDeleted" OnItemUpdating="dvLoanDetails_ItemUpdating" OnDataBound="dvLoanDetails_DataBound">
        <Fields>
            <asp:TemplateField HeaderText="MANR" SortExpression="MANR">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "~/access/Customer/Customer.aspx?ID=" + Eval("CustomerRefID") %>' runat="server"><%# Eval("MANR") %></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Stabsnummer" SortExpression="Stabsnummer">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink3" NavigateUrl='<%# "~/access/Customer/Customer.aspx?ID=" + Eval("CustomerRefID") %>' runat="server"><%# Eval("Stabsnummer")%></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Navn" SortExpression="Firstname, Middlename, Lastname">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# "~/access/Customer/Customer.aspx?ID=" + Eval("CustomerRefID") %>' runat="server"><%# (Eval("Firstname") + " " + Eval("Middlename") + " " + Eval("Lastname")).Replace("  ", " ")%></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Udlånstype" SortExpression="LoanType">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlLoanType" runat="server" DataSourceID="sdsLoanType" OnDataBound="ddlLoanType_DataBound" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                    <asp:SqlDataSource ID="sdsLoanType" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [LoanType]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblLoanType" runat="server" Text='<%# Bind("LoanType") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Dato fra" SortExpression="DateFrom">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" TextMode="Date" runat="server" Text='<%# Bind("DateFrom", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="message-error" runat="server" ControlToValidate="TextBox4" ErrorMessage="*"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("DateFrom", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Dato til" SortExpression="DateTo">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" TextMode="Date" runat="server" Text='<%# Bind("DateTo", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("DateTo", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Dato afhentet" SortExpression="DatePickedUp">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" TextMode="Date" runat="server" Visible='<%# !(bool)Eval("FailedPickup") %>' Text='<%# Bind("DatePickedUp", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkbtnPickedUp" runat="server" Visible='<%# (Eval("DatePickedUp").ToString() == string.Empty) && (!(bool)Eval("FailedPickup")) %>' CommandArgument="PickedUp" OnCommand="SetDate_Command">Afhentet i dag</asp:LinkButton>
                    <asp:Label ID="lblPickedUp" runat="server" Visible='<%# (Eval("DatePickedUp").ToString() != string.Empty) && (!(bool)Eval("FailedPickup")) %>' Text='<%# Bind("DatePickedUp", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Dato afleveret" SortExpression="DateReturned">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" TextMode="Date" runat="server" Visible='<%# !(bool)Eval("FailedPickup") %>' Text='<%# Bind("DateReturned", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkbtnReturned" runat="server" Visible='<%# (Eval("DateReturned").ToString() == string.Empty) && (!(bool)Eval("FailedPickup")) %>' CommandArgument="Returned" OnCommand="SetDate_Command">Afleveret i dag</asp:LinkButton>
                    <asp:Label ID="lblReturned" runat="server" Visible='<%# (Eval("DateReturned").ToString() != string.Empty) && (!(bool)Eval("FailedPickup")) %>' Text='<%# Bind("DateReturned", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" TextMode="MultiLine" Width="250px" Height="40px" Text='<%# Bind("Comment") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("Comment").ToString().Replace("\n", "<br />") %>'></asp:Label>
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
                    <asp:HyperLink ID="hplPrint" ImageUrl="~/Images/icon_print.png" BorderStyle="None" Target="_blank" NavigateUrl='<%# ResolveClientUrl("~/access/report.aspx?ID=" + ID) %>' runat="server"></asp:HyperLink>
                    <uc1:MyButton runat="server" ID="mbSendMail" Type="NoMail" />
                    <uc1:MyButton runat="server" ID="mbEdit" Type="Edit" />
                    <uc1:MyButton runat="server" ID="mbDelete" Type="Delete" />
                    <asp:LinkButton ID="lnkbtnFailedPickup" runat="server" Visible='<%# (Eval("DatePickedUp").ToString() == string.Empty) && !(bool)Eval("FailedPickup") %>' CausesValidation="False" CommandName="FailedPickup" OnCommand="FailedPickup_Command" Text="Ikke afhentet"></asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnCancelFailedPickup" runat="server" Visible='<%# (bool)Eval("FailedPickup") %>' CausesValidation="False" CommandName="CancelFailedPickup" OnCommand="FailedPickup_Command" Text="Annuller ikke afhentet"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsLoan" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommandType="StoredProcedure" DeleteCommand="DeleteLoan" SelectCommand="SELECT * FROM [LoansCustomers] WHERE ([ID] = @ID)" UpdateCommand="UpdateLoan" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="DeletedBy" DbType="Guid" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="DateFrom" />
            <asp:Parameter DbType="Date" Name="DateTo" />
            <asp:Parameter DbType="Date" Name="DatePickedUp" />
            <asp:Parameter DbType="Date" Name="DateReturned" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="TypeRefID" Type="Int32" />
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="UserID" DbType="Guid" />
            <asp:Parameter Name="Note" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
            <asp:LinkButton ID="lnkbtnAddItem" runat="server" Text="Tilføj MAT" CommandArgument="Show" OnCommand="lnkbtnAddItem_Command"></asp:LinkButton>
            <br />
            <br />
            <ajaxToolkit:TabContainer ID="tcAddItem" runat="server" Visible="false" Width="575px" ActiveTabIndex="4">
                <ajaxToolkit:TabPanel ID="tpModem" HeaderText="Modem" runat="server">
                    <ContentTemplate>
                        <br />
                        <asp:ListBox ID="lstb1ID" runat="server" Width="200px"></asp:ListBox>
                        <ajaxToolkit:ListSearchExtender ID="lse1ID" runat="server" TargetControlID="lstb1ID" PromptText="Skriv for at søge" QueryPattern="Contains"></ajaxToolkit:ListSearchExtender><br />
                        <asp:Button ID="btn1Add" runat="server" Text="Tilføj 3G Modem" CommandName="Modem" OnCommand="AddItem_Command" Visible="false" />
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel ID="tpToken" HeaderText="Token" runat="server">
                    <ContentTemplate>
                        <br />
                        <asp:ListBox ID="lstb2Serialnumber" runat="server" Width="200px"></asp:ListBox>
                        <ajaxToolkit:ListSearchExtender ID="lse2Serialnumber" runat="server" TargetControlID="lstb2Serialnumber" PromptText="Skriv for at søge" QueryPattern="Contains"></ajaxToolkit:ListSearchExtender><br />
                        <asp:Button ID="btn2Add" runat="server" Text="Tilføj Token" Visible="false" CommandName="Token" OnCommand="AddItem_Command" />
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel ID="tpLaptop" HeaderText="Bærbar" runat="server">
                    <ContentTemplate>
                        <br />
                        <asp:ListBox ID="lstb3Serialnumber" runat="server" Width="200px"></asp:ListBox>
                        <ajaxToolkit:ListSearchExtender ID="lse3Serialnumber" runat="server" TargetControlID="lstb3Serialnumber" PromptText="Skriv for at søge" QueryPattern="Contains"></ajaxToolkit:ListSearchExtender><br />
                        <asp:Button ID="btn3Add" runat="server" Text="Tilføj Bærbar" Visible="false" CommandName="Laptop" OnCommand="AddItem_Command" />
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel ID="tpPrinter" HeaderText="Printer" runat="server">
                    <ContentTemplate>
                        <br />
                        <asp:ListBox ID="lstb4Serialnumber" runat="server" Width="200px"></asp:ListBox>
                        <ajaxToolkit:ListSearchExtender ID="lse4Serialnumber" runat="server" TargetControlID="lstb4Serialnumber" PromptText="Skriv for at søge" QueryPattern="Contains"></ajaxToolkit:ListSearchExtender><br />
                        <asp:Button ID="btn4Add" runat="server" Text="Tilføj Printer" Visible="false" CommandName="Printer" OnCommand="AddItem_Command" />
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel ID="tpProjektor" HeaderText="Projektor" runat="server">
                    <ContentTemplate>
                        <br />
                        <asp:ListBox ID="lstb5Serialnumber" runat="server" Width="200px"></asp:ListBox>
                        <ajaxToolkit:ListSearchExtender ID="lse5Serialnumber" runat="server" TargetControlID="lstb5Serialnumber" PromptText="Skriv for at søge" QueryPattern="Contains"></ajaxToolkit:ListSearchExtender><br />
                        <asp:Button ID="btn5Add" runat="server" Text="Tilføj Projektor" Visible="false" CommandName="Projector" OnCommand="AddItem_Command" />
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel ID="tpUSBkey" HeaderText="USB-nøgle" runat="server">
                    <ContentTemplate>
                        <br />
                        <asp:ListBox ID="lstb6Serialnumber" runat="server" Width="200px"></asp:ListBox>
                        <ajaxToolkit:ListSearchExtender ID="lse6Serialnumber" runat="server" TargetControlID="lstb6Serialnumber" PromptText="Skriv for at søge" QueryPattern="Contains"></ajaxToolkit:ListSearchExtender><br />
                        <asp:Button ID="btn6Add" runat="server" Text="Tilføj USB-nøgle" Visible="false" CommandName="USBkey" OnCommand="AddItem_Command" />
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel ID="tpPhones" HeaderText="Mobiltelefon" runat="server">
                    <ContentTemplate>
                        <br />
                        <asp:ListBox ID="lstb7ID" runat="server" Width="200px"></asp:ListBox>
                        <ajaxToolkit:ListSearchExtender ID="lse7Serialnumber" runat="server" TargetControlID="lstb7ID" PromptText="Skriv for at søge" QueryPattern="Contains"></ajaxToolkit:ListSearchExtender><br />
                        <asp:Button ID="btn7Add" runat="server" Text="Tilføj Mobiltelefon" Visible="false" CommandName="Phone" OnCommand="AddItem_Command" />
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel ID="tpSIMcard" HeaderText="SIM-kort" runat="server">
                    <ContentTemplate>
                        <br />
                        <asp:ListBox ID="lstb8SIMcardnr" runat="server" Width="200px"></asp:ListBox>
                        <ajaxToolkit:ListSearchExtender ID="lse8Serialnumber" runat="server" TargetControlID="lstb8SIMcardnr" PromptText="Skriv for at søge" QueryPattern="Contains"></ajaxToolkit:ListSearchExtender><br />
                        <asp:Button ID="btn8Add" runat="server" Text="Tilføj SIM-kort" Visible="false" CommandName="SIMcard" OnCommand="AddItem_Command" />
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel ID="tpMisc" HeaderText="Diverse" runat="server">
                    <ContentTemplate>
                        <asp:Table ID="Table1" runat="server">
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="2">
                                    <asp:Label ID="lblErrorMisc" runat="server" Visible="false" CssClass="message-error" Text="lblErrorMisc"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    Genstand
                                </asp:TableCell>
                                <asp:TableCell>
                                    Antal
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:DropDownList ID="ddlMisc" runat="server" DataSourceID="sdsMisc_ddl" DataValueField="ID" DataTextField="Name"></asp:DropDownList>
                                    <asp:SqlDataSource ID="sdsMisc_ddl" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ID, Name FROM ItemMiscType"></asp:SqlDataSource>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox ID="txtItemCount" TextMode="Number" Text="1" runat="server"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="2">
                                    <asp:Button ID="btnMiscAdd" runat="server" Text="Tilføj genstand" CommandName="Misc" OnCommand="AddItem_Command" />
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
            </ajaxToolkit:TabContainer>
            <br />
            <%-- Modem --%>
            <asp:GridView ID="gvModem" Caption="<h3>Modem</h3>" CssClass="lists" runat="server" AllowSorting="True" CellPadding="10" AutoGenerateColumns="False" DataKeyNames="LoanDetailsID" DataSourceID="sds1LoanDetails" OnRowDataBound="ItemRowDatabound" OnRowDeleted="gvModem_RowDeleted" OnRowCommand="gvItem_RowCommand" OnRowDeleting="gvItem_RowDeleting">
                <AlternatingRowStyle CssClass="alternatingRow" />
                <RowStyle CssClass="row" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <uc1:MyButton runat="server" ID="mbRemoveItem" Type="Delete" />
                            <asp:LinkButton ID="lnkbtnReturn" Visible='<%# !loan.Returned %>' runat="server" CausesValidation="False" CommandName='<%# Eval("ReturnedDate").ToString() == string.Empty ? "Return" : "UnReturn" %>' CommandArgument='<%# Eval("LoanDetailsID") %>' Text='<%# Eval("ReturnedDate").ToString() == string.Empty ? "Aflever" : "Ikke afleveret" %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
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
                            <asp:Label ID="Label2" runat="server" ToolTip='<%# Eval("Comment") %>' Text='<%# Utilities.CutText(Eval("Comment").ToString(), "...", 20, false) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sds1LoanDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DeleteLoanDetail" DeleteCommandType="StoredProcedure" SelectCommand="SELECT * FROM LoanDetailsModem WHERE (LoanID = @LoanID)">
                <DeleteParameters>
                    <asp:Parameter Name="UserID" DbType="Guid" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="LoanID" QueryStringField="ID" DefaultValue="1" />
                </SelectParameters>
            </asp:SqlDataSource>
            <%-- Token --%>
            <asp:GridView ID="gvToken" Caption="<h3>Token</h3>" CssClass="lists" Width="100%" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="LoanDetailsID" DataSourceID="sds2LoanDetails" OnRowDataBound="ItemRowDatabound" OnRowDeleted="gvToken_RowDeleted" OnRowCommand="gvItem_RowCommand" OnRowDeleting="gvItem_RowDeleting">
                <AlternatingRowStyle CssClass="alternatingRow" />
                <RowStyle CssClass="row" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <uc1:MyButton runat="server" ID="mbRemoveItem" Type="Delete" />
                            <asp:LinkButton ID="lnkbtnReturn" Visible='<%# !loan.Returned %>' runat="server" CausesValidation="False" CommandName='<%# Eval("ReturnedDate").ToString() == string.Empty ? "Return" : "UnReturn" %>' CommandArgument='<%# Eval("LoanDetailsID") %>' Text='<%# Eval("ReturnedDate").ToString() == string.Empty ? "Aflever" : "Ikke afleveret" %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Serialnumber" HeaderText="Serienummer" SortExpression="Serialnumber" />
                    <asp:TemplateField HeaderText="Kasseret" SortExpression="Discarded">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# (bool)Eval("Discarded") ? "Ja" : "Nej" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" ToolTip='<%# Eval("Comment") %>' Text='<%# Utilities.CutText(Eval("Comment").ToString(), "...", 20, false) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sds2LoanDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DeleteLoanDetail" DeleteCommandType="StoredProcedure" SelectCommand="SELECT * FROM LoanDetailsToken WHERE (LoanID = @LoanID)">
                <DeleteParameters>
                    <asp:Parameter Name="UserID" DbType="Guid" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="LoanID" QueryStringField="ID" DefaultValue="1" />
                </SelectParameters>
            </asp:SqlDataSource>
            <%-- Laptop --%>
            <asp:GridView ID="gvLaptop" Caption="<h3>Bærbar</h3>" Width="100%" runat="server" CssClass="lists" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="LoanDetailsID" DataSourceID="sds3LoanDetails" OnRowDataBound="ItemRowDatabound" OnRowDeleted="gvLaptop_RowDeleted" OnRowCommand="gvItem_RowCommand" OnRowDeleting="gvItem_RowDeleting">
                <AlternatingRowStyle CssClass="alternatingRow" />
                <RowStyle CssClass="row" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <uc1:MyButton runat="server" ID="mbRemoveItem" Type="Delete" />
                            <asp:LinkButton ID="lnkbtnReturn" Visible='<%# !loan.Returned %>' runat="server" CausesValidation="False" CommandName='<%# Eval("ReturnedDate").ToString() == string.Empty ? "Return" : "UnReturn" %>' CommandArgument='<%# Eval("LoanDetailsID") %>' Text='<%# Eval("ReturnedDate").ToString() == string.Empty ? "Aflever" : "Ikke afleveret" %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Serialnumber" HeaderText="Serienummer" SortExpression="Serialnumber" />
                    <asp:BoundField DataField="GUID" HeaderText="GUID" SortExpression="GUID" />
                    <asp:BoundField DataField="Brand" HeaderText="Mærke" SortExpression="Brand" />
                    <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                    <asp:TemplateField HeaderText="FIIN" SortExpression="FIIN">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# (bool)Eval("FIIN") ? "Ja" : "Nej" %>'></asp:Label>
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
                            <asp:Label ID="Label2" runat="server" ToolTip='<%# Eval("Comment") %>' Text='<%# Utilities.CutText(Eval("Comment").ToString(), "...", 20, false) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sds3LoanDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DeleteLoanDetail" DeleteCommandType="StoredProcedure" SelectCommand="SELECT * FROM LoanDetailsLaptop WHERE (LoanID = @LoanID)">
                <DeleteParameters>
                    <asp:Parameter Name="UserID" DbType="Guid" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="LoanID" QueryStringField="ID" DefaultValue="1" />
                </SelectParameters>
            </asp:SqlDataSource>
            <%-- Printer --%>
            <asp:GridView ID="gvPrinter" Caption="<h3>Printer</h3>" Width="100%" runat="server" CssClass="lists" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="LoanDetailsID" DataSourceID="sds4LoanDetails" OnRowDataBound="ItemRowDatabound" OnRowDeleted="gvPrinter_RowDeleted" OnRowCommand="gvItem_RowCommand" OnRowDeleting="gvItem_RowDeleting">
                <AlternatingRowStyle CssClass="alternatingRow" />
                <RowStyle CssClass="row" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <uc1:MyButton runat="server" ID="mbRemoveItem" Type="Delete" />
                            <asp:LinkButton ID="lnkbtnReturn" Visible='<%# !loan.Returned %>' runat="server" CausesValidation="False" CommandName='<%# Eval("ReturnedDate").ToString() == string.Empty ? "Return" : "UnReturn" %>' CommandArgument='<%# Eval("LoanDetailsID") %>' Text='<%# Eval("ReturnedDate").ToString() == string.Empty ? "Aflever" : "Ikke afleveret" %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
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
                            <asp:Label ID="Label2" runat="server" ToolTip='<%# Eval("Comment") %>' Text='<%# Utilities.CutText(Eval("Comment").ToString(), "...", 20, false) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sds4LoanDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DeleteLoanDetail" DeleteCommandType="StoredProcedure" SelectCommand="SELECT * FROM LoanDetailsPrinter WHERE (LoanID = @LoanID)">
                <DeleteParameters>
                    <asp:Parameter Name="LoanDetailsID" />
                    <asp:Parameter Name="UserID" DbType="Guid" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="LoanID" QueryStringField="ID" DefaultValue="1" />
                </SelectParameters>
            </asp:SqlDataSource>
            <%-- Projector --%>
            <asp:GridView ID="gvProjector" Caption="<h3>Projektor</h3>" Width="100%" runat="server" CssClass="lists" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="LoanDetailsID" DataSourceID="sds5LoanDetails" OnRowDataBound="ItemRowDatabound" OnRowDeleted="gvProjector_RowDeleted" OnRowCommand="gvItem_RowCommand" OnRowDeleting="gvItem_RowDeleting">
                <AlternatingRowStyle CssClass="alternatingRow" />
                <RowStyle CssClass="row" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <uc1:MyButton runat="server" ID="mbRemoveItem" Type="Delete" />
                            <asp:LinkButton ID="lnkbtnReturn" Visible='<%# !loan.Returned %>' runat="server" CausesValidation="False" CommandName='<%# Eval("ReturnedDate").ToString() == string.Empty ? "Return" : "UnReturn" %>' CommandArgument='<%# Eval("LoanDetailsID") %>' Text='<%# Eval("ReturnedDate").ToString() == string.Empty ? "Aflever" : "Ikke afleveret" %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
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
                            <asp:Label ID="Label2" runat="server" ToolTip='<%# Eval("Comment") %>' Text='<%# Utilities.CutText(Eval("Comment").ToString(), "...", 20, false) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sds5LoanDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DeleteLoanDetail" DeleteCommandType="StoredProcedure" SelectCommand="SELECT * FROM LoanDetailsProjector WHERE (LoanID = @LoanID)">
                <DeleteParameters>
                    <asp:Parameter Name="UserID" DbType="Guid" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="LoanID" QueryStringField="ID" DefaultValue="1" />
                </SelectParameters>
            </asp:SqlDataSource>
            <%-- USBkey --%>
            <asp:GridView ID="gvUSBkey" Caption="<h3>USB-nøgle</h3>" Width="100%" runat="server" CssClass="lists" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="LoanDetailsID" DataSourceID="sds6LoanDetails" OnRowDataBound="ItemRowDatabound" OnRowDeleted="gvUSBkey_RowDeleted" OnRowCommand="gvItem_RowCommand" OnRowDeleting="gvItem_RowDeleting">
                <AlternatingRowStyle CssClass="alternatingRow" />
                <RowStyle CssClass="row" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <uc1:MyButton runat="server" ID="mbRemoveItem" Type="Delete" />
                            <asp:LinkButton ID="lnkbtnReturn" Visible='<%# !loan.Returned %>' runat="server" CausesValidation="False" CommandName='<%# Eval("ReturnedDate").ToString() == string.Empty ? "Return" : "UnReturn" %>' CommandArgument='<%# Eval("LoanDetailsID") %>' Text='<%# Eval("ReturnedDate").ToString() == string.Empty ? "Aflever" : "Ikke afleveret" %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Serialnumber" HeaderText="Serienummer" SortExpression="Serialnumber" />
                    <asp:TemplateField HeaderText="Kasseret" SortExpression="Discarded">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# (bool)Eval("Discarded") ? "Ja" : "Nej" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" ToolTip='<%# Eval("Comment") %>' Text='<%# Utilities.CutText(Eval("Comment").ToString(), "...", 20, false) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sds6LoanDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DeleteLoanDetail" DeleteCommandType="StoredProcedure" SelectCommand="SELECT * FROM LoanDetailsUSBKey WHERE (LoanID = @LoanID)">
                <DeleteParameters>
                    <asp:Parameter Name="UserID" DbType="Guid" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="LoanID" QueryStringField="ID" DefaultValue="1" />
                </SelectParameters>
            </asp:SqlDataSource>
            <%-- Phone --%>
            <asp:GridView ID="gvPhones" Caption="<h3>Mobiltelefon</h3>" Width="100%" runat="server" CssClass="lists" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="LoanDetailsID" DataSourceID="sds7LoanDetails" OnRowDataBound="ItemRowDatabound" OnRowDeleted="gvPhones_RowDeleted" OnRowCommand="gvItem_RowCommand" OnRowDeleting="gvItem_RowDeleting">
                <AlternatingRowStyle CssClass="alternatingRow" />
                <RowStyle CssClass="row" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <uc1:MyButton runat="server" ID="mbRemoveItem" Type="Delete" />
                            <asp:LinkButton ID="lnkbtnReturn" Visible='<%# !loan.Returned %>' runat="server" CausesValidation="False" CommandName='<%# Eval("ReturnedDate").ToString() == string.Empty ? "Return" : "UnReturn" %>' CommandArgument='<%# Eval("LoanDetailsID") %>' Text='<%# Eval("ReturnedDate").ToString() == string.Empty ? "Aflever" : "Ikke afleveret" %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
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
                            <asp:Label ID="Label2" runat="server" ToolTip='<%# Eval("Comment") %>' Text='<%# Utilities.CutText(Eval("Comment").ToString(), "...", 20, false) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sds7LoanDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DeleteLoanDetail" DeleteCommandType="StoredProcedure" SelectCommand="SELECT * FROM LoanDetailsPhones WHERE (LoanID = @LoanID)">
                <DeleteParameters>
                    <asp:Parameter Name="UserID" DbType="Guid" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="LoanID" QueryStringField="ID" DefaultValue="1" />
                </SelectParameters>
            </asp:SqlDataSource>
            <%-- SIMcard --%>
            <asp:GridView ID="gvSIMcard" Caption="<h3>SIM-kort</h3>" Width="100%" runat="server" CssClass="lists" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="LoanDetailsID" DataSourceID="sds8LoanDetails" OnRowDataBound="ItemRowDatabound" OnRowDeleted="gvSIMcard_RowDeleted" OnRowCommand="gvItem_RowCommand" OnRowDeleting="gvItem_RowDeleting">
                <AlternatingRowStyle CssClass="alternatingRow" />
                <RowStyle CssClass="row" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <uc1:MyButton runat="server" ID="mbRemoveItem" Type="Delete" />
                            <asp:LinkButton ID="lnkbtnReturn" Visible='<%# !loan.Returned %>' runat="server" CausesValidation="False" CommandName='<%# Eval("ReturnedDate").ToString() == string.Empty ? "Return" : "UnReturn" %>' CommandArgument='<%# Eval("LoanDetailsID") %>' Text='<%# Eval("ReturnedDate").ToString() == string.Empty ? "Aflever" : "Ikke afleveret" %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="SIMcardnr" HeaderText="SIM-kort-nr" SortExpression="SIMcardnr" />
                    <asp:TemplateField HeaderText="Kasseret" SortExpression="Discarded">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# (bool)Eval("Discarded") ? "Ja" : "Nej" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Bemærkninger" SortExpression="Comment">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" ToolTip='<%# Eval("Comment") %>' Text='<%# Utilities.CutText(Eval("Comment").ToString(), "...", 20, false) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sds8LoanDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DeleteLoanDetail" DeleteCommandType="StoredProcedure" SelectCommand="SELECT * FROM LoanDetailsSIMcard WHERE (LoanID = @LoanID)">
                <DeleteParameters>
                    <asp:Parameter Name="UserID" DbType="Guid" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="LoanID" QueryStringField="ID" DefaultValue="1" />
                </SelectParameters>
            </asp:SqlDataSource>
            <%-- Misc --%>
            <asp:GridView ID="gvMisc" Caption="<h3>Tilføjelser</h3>" Width="100%" runat="server" CssClass="lists" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="ID" DataSourceID="sdsMisc" OnRowUpdating="gvMisc_RowUpdating" OnRowDeleting="gvItem_RowDeleting">
                <AlternatingRowStyle CssClass="alternatingRow" />
                <RowStyle CssClass="row" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <uc1:MyButton runat="server" ID="mbEdit" Type="Edit" />
                            <uc1:MyButton runat="server" ID="mbRemoveItem" Type="Delete" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <uc1:MyButton runat="server" ID="mbSave" Type="Save" />
                            <uc1:MyButton runat="server" ID="mbCancel" Type="Cancel" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ItemMiscTypeRefID" HeaderText="ID" Visible="false" ReadOnly="True" SortExpression="ItemMiscTypeRefID" />
                    <asp:BoundField DataField="Name" ReadOnly="true" HeaderText="Genstand" SortExpression="Name" />
                    <asp:TemplateField HeaderText="Antal">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ItemCount") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" TextMode="Number" Text='<%# Bind("ItemCount") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sdsMisc" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" UpdateCommand="UPDATE LoanDetailsMisc SET ItemCount =  @ItemCount WHERE ID = @ID;EXEC dbo.WriteLog 3, 12, @ID, @UserID" DeleteCommand="DeleteLoanDetailMisc" DeleteCommandType="StoredProcedure" SelectCommand="SELECT * FROM LoanDetailsMiscView WHERE (LoanID = @LoanID)">
                <DeleteParameters>
                    <asp:Parameter Name="UserID" DbType="Guid" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ID" />
                    <asp:Parameter Name="ItemCount" />
                    <asp:Parameter Name="UserID" DbType="Guid" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="LoanID" QueryStringField="ID" DefaultValue="1" />
                </SelectParameters>
            </asp:SqlDataSource>
        <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>