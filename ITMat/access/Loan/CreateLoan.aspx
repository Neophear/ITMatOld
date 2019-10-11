<%@ Page Title="Opret udlån" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateLoan.aspx.cs" Inherits="CreateLoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script type="text/javascript">
        var _txtbx;
        function ShowAvailability(txt) {
            _txtbx = txt;
            if (txt.value == '') {
                OnSuccess("false");
            }
            else {
                PageMethods.CheckUserName(_txtbx.value, OnSuccess);
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
    <asp:Label ID="lblError" runat="server" Text="Fejl" Visible="false" CssClass="message-error"></asp:Label><br />
    <asp:Wizard ID="Wizard1" runat="server" CancelButtonText="Annuller" CancelButtonType="Button" OnActiveStepChanged="Wizard1_ActiveStepChanged" FinishCompleteButtonText="Opret lån" FinishPreviousButtonText="Tilbage" StartNextButtonText="Næste" StepNextButtonText="Næste" StepPreviousButtonText="Tilbage" CancelDestinationPageUrl="~/Default.aspx" DisplayCancelButton="True" DisplaySideBar="False" OnNextButtonClick="Wizard1_NextButtonClick" OnFinishButtonClick="Wizard1_FinishButtonClick">
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" Title="Dato">
                <asp:Table ID="Table3" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblMANR" runat="server" Text="MANR *"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtMANR" runat="server" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvMANR" ControlToValidate="txtMANR" runat="server" CssClass="message-error" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <asp:HyperLink ID="hplAddNewCustomer" Target="_blank" NavigateUrl="~/access/Customer/CreateCustomer.aspx" Visible="false" runat="server">Tilføj MA (nyt vindue)</asp:HyperLink>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblDateFrom" runat="server" Text="Dato fra *"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtDateFrom" runat="server" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDateFrom" ControlToValidate="txtDateFrom" runat="server" CssClass="message-error" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtDateFrom" Operator="DataTypeCheck" SetFocusOnError="True" Type="Date" Text="*"></asp:CompareValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblDateTo" runat="server" Text="Dato til"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtDateTo" runat="server" TextMode="Date"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtDateTo" Operator="DataTypeCheck" SetFocusOnError="True" Type="Date" Text="*"></asp:CompareValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblLoanType" runat="server" Text="Udlånstype *"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddlLoanType" runat="server" DataSourceID="sdsLoanType" AppendDataBoundItems="true" DataTextField="Name" DataValueField="ID">
                                <asp:ListItem Value="0" Text="-Vælg type-" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sdsLoanType" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [LoanType]"></asp:SqlDataSource>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <br /><asp:Label ID="lblRequiredFields" runat="server" Text="Felter med * skal udfyldes"></asp:Label>
            </asp:WizardStep>
            <%-- Step 2 --%>
            <asp:WizardStep ID="WizardStep2" runat="server" Title="Vælg genstande">
                <asp:HyperLink ID="hplAddNewItem" NavigateUrl="~/access/Item/AddItem.aspx" Target="_blank" runat="server">Tilføj MAT (nyt vindue)</asp:HyperLink>
                <asp:LinkButton ID="lnkbtnUpdateMAT" OnClick="lnkbtnUpdateMAT_Click" runat="server">Opdater lister</asp:LinkButton>
                <br />
                <br />
                <ajaxToolkit:TabContainer ID="TabContainer1" runat="server">
                    <%-- Modem --%>
                    <ajaxToolkit:TabPanel HeaderText="Modem" runat="server">
                        <ContentTemplate>
                            <asp:Table ID="Table2" runat="server">
                                <asp:TableRow CssClass="tr-bottom">
                                    <asp:TableCell>
                                        <asp:ListBox ID="lstb1ID" runat="server" Width="200px" Height="200px"></asp:ListBox>
                                        <ajaxToolkit:ListSearchExtender ID="lse1ID" runat="server" TargetControlID="lstb1ID" PromptText="Skriv for at søge" QueryPattern="Contains"></ajaxToolkit:ListSearchExtender><br />
                                        
                                        <div style="float:left;">
                                            <asp:Button ID="btn1Add" runat="server" Text="Tilføj 3G Modem" Visible="true" Enabled="false" OnClick="btn1Add_Click" />
                                        </div>
                                        <div style="overflow:hidden;"></div>
                                        <div style="float:right;">
                                            <asp:Label ID="lbl1ItemCounter" runat="server" Text="lbl1ItemCounter"></asp:Label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:ListBox ID="lstb1Added" runat="server" Width="200px" Height="200px"></asp:ListBox><br />

                                        <div style="float:left;">
                                            <asp:Button ID="btn1Remove" runat="server" Text="Fjern 3G Modem" Visible="true" Enabled="false" OnClick="btn1Remove_Click" />
                                        </div>
                                        <div style="overflow:hidden;"></div>
                                        <div style="float:right;">
                                            <asp:Label ID="lbl1AddedCounter" runat="server" Text="lbl1AddedCounter"></asp:Label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <%-- Token --%>
                    <ajaxToolkit:TabPanel HeaderText="Token" runat="server">
                        <ContentTemplate>
                            <asp:Table ID="Table5" runat="server">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:ListBox ID="lstb2Serialnumber" runat="server" Width="200px" Height="200px"></asp:ListBox>
                                        <ajaxToolkit:ListSearchExtender ID="lse2Serialnumber" runat="server" TargetControlID="lstb2Serialnumber" PromptText="Skriv for at søge" QueryPattern="Contains"></ajaxToolkit:ListSearchExtender><br />
                                        
                                        <div style="float:left;">
                                            <asp:Button ID="btn2Add" runat="server" Text="Tilføj Token" Visible="true" Enabled="false" OnClick="btn2Add_Click" />
                                        </div>
                                        <div style="overflow:hidden;"></div>
                                        <div style="float:right;">
                                            <asp:Label ID="lbl2ItemCounter" runat="server" Text="lbl2ItemCounter"></asp:Label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:ListBox ID="lstb2Added" runat="server" Width="200px" Height="200px"></asp:ListBox><br />
                                        
                                        <div style="float:left;">
                                            <asp:Button ID="btn2Remove" runat="server" Text="Fjern Token" Visible="true" Enabled="false" OnClick="btn2Remove_Click" />
                                        </div>
                                        <div style="overflow:hidden;"></div>
                                        <div style="float:right;">
                                            <asp:Label ID="lbl2AddedCounter" runat="server" Text="lbl2ItemCounter"></asp:Label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <%-- Laptop --%>
                    <ajaxToolkit:TabPanel HeaderText="Bærbar" runat="server">
                        <ContentTemplate>
                            <asp:Table ID="Table6" runat="server">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:ListBox ID="lstb3Serialnumber" runat="server" Width="200px" Height="200px"></asp:ListBox>
                                        <ajaxToolkit:ListSearchExtender ID="lse3Serialnumber" runat="server" TargetControlID="lstb3Serialnumber" PromptText="Skriv for at søge" QueryPattern="Contains"></ajaxToolkit:ListSearchExtender><br />
                                        
                                        <div style="float:left;">
                                            <asp:Button ID="btn3Add" runat="server" Text="Tilføj Bærbar" Visible="true" Enabled="false" OnClick="btn3Add_Click" />
                                        </div>
                                        <div style="overflow:hidden;"></div>
                                        <div style="float:right;">
                                            <asp:Label ID="lbl3ItemCounter" runat="server" Text="lbl3ItemCounter"></asp:Label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:ListBox ID="lstb3Added" runat="server" Width="200px" Height="200px"></asp:ListBox><br />

                                        <div style="float:left;">
                                            <asp:Button ID="btn3Remove" runat="server" Text="Fjern Bærbar" Visible="true" Enabled="false" OnClick="btn3Remove_Click" />
                                        </div>
                                        <div style="overflow:hidden;"></div>
                                        <div style="float:right;">
                                            <asp:Label ID="lbl3AddedCounter" runat="server" Text="lbl3ItemCounter"></asp:Label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <%-- Printer --%>
                    <ajaxToolkit:TabPanel HeaderText="Printer" runat="server">
                        <ContentTemplate>
                            <asp:Table ID="Table7" runat="server">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:ListBox ID="lstb4Serialnumber" runat="server" Width="200px" Height="200px"></asp:ListBox>
                                        <ajaxToolkit:ListSearchExtender ID="lse4Serialnumber" runat="server" TargetControlID="lstb4Serialnumber" PromptText="Skriv for at søge" QueryPattern="Contains"></ajaxToolkit:ListSearchExtender><br />
                                        
                                        <div style="float:left;">
                                            <asp:Button ID="btn4Add" runat="server" Text="Tilføj Printer" Visible="true" Enabled="false" OnClick="btn4Add_Click" />
                                        </div>
                                        <div style="overflow:hidden;"></div>
                                        <div style="float:right;">
                                            <asp:Label ID="lbl4ItemCounter" runat="server" Text="lbl4ItemCounter"></asp:Label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:ListBox ID="lstb4Added" runat="server" Width="200px" Height="200px"></asp:ListBox><br />
                                        
                                        <div style="float:left;">
                                            <asp:Button ID="btn4Remove" runat="server" Text="Fjern Printer" Visible="true" Enabled="false" OnClick="btn4Remove_Click" />
                                        </div>
                                        <div style="overflow:hidden;"></div>
                                        <div style="float:right;">
                                            <asp:Label ID="lbl4AddedCounter" runat="server" Text="lbl4ItemCounter"></asp:Label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <%-- Projector --%>
                    <ajaxToolkit:TabPanel HeaderText="Projektor" runat="server">
                        <ContentTemplate>
                            <asp:Table ID="Table8" runat="server">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:ListBox ID="lstb5Serialnumber" runat="server" Width="200px" Height="200px"></asp:ListBox>
                                        <ajaxToolkit:ListSearchExtender ID="lse5Serialnumber" runat="server" TargetControlID="lstb5Serialnumber" PromptText="Skriv for at søge" QueryPattern="Contains"></ajaxToolkit:ListSearchExtender><br />
                                        
                                        <div style="float:left;">
                                            <asp:Button ID="btn5Add" runat="server" Text="Tilføj Projektor" Visible="true" Enabled="false" OnClick="btn5Add_Click" />
                                        </div>
                                        <div style="overflow:hidden;"></div>
                                        <div style="float:right;">
                                            <asp:Label ID="lbl5ItemCounter" runat="server" Text="lbl5ItemCounter"></asp:Label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:ListBox ID="lstb5Added" runat="server" Width="200px" Height="200px"></asp:ListBox><br />
                                        
                                        <div style="float:left;">
                                            <asp:Button ID="btn5Remove" runat="server" Text="Fjern Projektor" Visible="true" Enabled="false" OnClick="btn5Remove_Click" />
                                        </div>
                                        <div style="overflow:hidden;"></div>
                                        <div style="float:right;">
                                            <asp:Label ID="lbl5AddedCounter" runat="server" Text="lbl5ItemCounter"></asp:Label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <%-- USB-key --%>
                    <ajaxToolkit:TabPanel HeaderText="USB-nøgle" runat="server">
                        <ContentTemplate>
                            <asp:Table ID="Table1" runat="server">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:ListBox ID="lstb6Serialnumber" runat="server" Width="200px" Height="200px"></asp:ListBox>
                                        <ajaxToolkit:ListSearchExtender ID="lse6Serialnumber" runat="server" TargetControlID="lstb6Serialnumber" PromptText="Skriv for at søge" QueryPattern="Contains"></ajaxToolkit:ListSearchExtender><br />
                                        
                                        <div style="float:left;">
                                            <asp:Button ID="btn6Add" runat="server" Text="Tilføj USB-nøgle" Visible="true" Enabled="false" OnClick="btn6Add_Click" />
                                        </div>
                                        <div style="overflow:hidden;"></div>
                                        <div style="float:right;">
                                            <asp:Label ID="lbl6ItemCounter" runat="server" Text="lbl6ItemCounter"></asp:Label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:ListBox ID="lstb6Added" runat="server" Width="200px" Height="200px"></asp:ListBox><br />
                                        
                                        <div style="float:left;">
                                            <asp:Button ID="btn6Remove" runat="server" Text="Fjern USB-nøgle" Visible="true" Enabled="false" OnClick="btn6Remove_Click" />
                                        </div>
                                        <div style="overflow:hidden;"></div>
                                        <div style="float:right;">
                                            <asp:Label ID="lbl6AddedCounter" runat="server" Text="lbl6ItemCounter"></asp:Label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <%-- Phone --%>
                    <ajaxToolkit:TabPanel HeaderText="Mobiltelefon" runat="server">
                        <ContentTemplate>
                            <asp:Table ID="Table9" runat="server">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:ListBox ID="lstb7ID" runat="server" Width="200px" Height="200px"></asp:ListBox>
                                        <ajaxToolkit:ListSearchExtender ID="lse7ID" runat="server" TargetControlID="lstb7ID" PromptText="Skriv for at søge" QueryPattern="Contains"></ajaxToolkit:ListSearchExtender><br />
                                        
                                        <div style="float:left;">
                                            <asp:Button ID="btn7Add" runat="server" Text="Tilføj Mobiltelefon" Visible="true" Enabled="false" OnClick="btn7Add_Click" />
                                        </div>
                                        <div style="overflow:hidden;"></div>
                                        <div style="float:right;">
                                            <asp:Label ID="lbl7ItemCounter" runat="server" Text="lbl7ItemCounter"></asp:Label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:ListBox ID="lstb7Added" runat="server" Width="200px" Height="200px"></asp:ListBox><br />
                                        
                                        <div style="float:left;">
                                            <asp:Button ID="btn7Remove" runat="server" Text="Fjern Mobiltelefon" Visible="true" Enabled="false" OnClick="btn7Remove_Click" />
                                        </div>
                                        <div style="overflow:hidden;"></div>
                                        <div style="float:right;">
                                            <asp:Label ID="lbl7AddedCounter" runat="server" Text="lbl7ItemCounter"></asp:Label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <%-- SIMcard --%>
                    <ajaxToolkit:TabPanel HeaderText="SIM-kort" runat="server">
                        <ContentTemplate>
                            <asp:Table ID="Table10" runat="server">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:ListBox ID="lstb8SIMcardnr" runat="server" Width="200px" Height="200px"></asp:ListBox>
                                        <ajaxToolkit:ListSearchExtender ID="lse8SIMcardnr" runat="server" TargetControlID="lstb8SIMcardnr" PromptText="Skriv for at søge" QueryPattern="Contains"></ajaxToolkit:ListSearchExtender><br />
                                        
                                        <div style="float:left;">
                                            <asp:Button ID="btn8Add" runat="server" Text="Tilføj SIM-kort" Visible="true" Enabled="false" OnClick="btn8Add_Click" />
                                        </div>
                                        <div style="overflow:hidden;"></div>
                                        <div style="float:right;">
                                            <asp:Label ID="lbl8ItemCounter" runat="server" Text="lbl8ItemCounter"></asp:Label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:ListBox ID="lstb8Added" runat="server" Width="200px" Height="200px"></asp:ListBox><br />
                                        
                                        <div style="float:left;">
                                            <asp:Button ID="btn8Remove" runat="server" Text="Fjern SIM-kort" Visible="true" Enabled="false" OnClick="btn8Remove_Click" />
                                        </div>
                                        <div style="overflow:hidden;"></div>
                                        <div style="float:right;">
                                            <asp:Label ID="lbl8AddedCounter" runat="server" Text="lbl8ItemCounter"></asp:Label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                </ajaxToolkit:TabContainer>
            </asp:WizardStep>
            <%-- Step 3 --%>
            <asp:WizardStep ID="WizardStep3" runat="server" Title="Diverse tilføjelser">
                <asp:GridView ID="gvMisc" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="sdsMisc">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="Name" HeaderText="Genstand" SortExpression="Name" />
                        <asp:TemplateField HeaderText="Antal">
                            <ItemTemplate>
                                <asp:TextBox ID="txtCount" runat="server" TextMode="Number" Text="0"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="sdsMisc" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ItemMiscType]"></asp:SqlDataSource>
            </asp:WizardStep>
            <%-- Step 4 --%>
            <asp:WizardStep ID="WizardStep4" runat="server" Title="Bemærkninger">
                <asp:Table ID="Table4" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblComment" runat="server" Text="Bemærkninger"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
</asp:Content>

