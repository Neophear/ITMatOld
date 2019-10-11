<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DetailsTooltip.ascx.cs" Inherits="DetailsTooltip" %>

<asp:Image ID="imgDetails" ImageUrl="~/Images/icon_details.png" runat="server" />
<ajaxToolkit:PopupControlExtender ID="popDetails" PopupControlID="pnlTooltip" OffsetX="25" TargetControlID="imgDetails" runat="server"></ajaxToolkit:PopupControlExtender>
<asp:Panel ID="pnlTooltip" runat="server">
    <div class="tooltip">
        <div class="tooltipHeader">
            <asp:Label ID="lblTooltipHeader" runat="server" Text="lblTooltipHeader"></asp:Label>
        </div>
        <asp:GridView ID="gvDetails" runat="server" CssClass="tooltipTable" AutoGenerateColumns="False" ShowHeader="false" DataSourceID="sdsDetails" OnRowDataBound="gvDetails_RowDataBound">
            <AlternatingRowStyle CssClass="alternatingRow" />
            <RowStyle CssClass="row" />
            <Columns>
                <asp:TemplateField HeaderText="Genstand" SortExpression="Type">
                    <ItemTemplate>
                        <asp:Label ID="lblType" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ItemRefID" HeaderText="ID" SortExpression="ItemRefID" />
                <asp:BoundField DataField="Serialnumber" HeaderText="Serienummer/IMEI" SortExpression="Serialnumber" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sdsDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM dbo.CompleteLoanDetails(@LoanID) ORDER BY [Type], [ItemRefID]">
            <SelectParameters>
                <asp:Parameter Name="LoanID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="gvDetailsMisc" runat="server" AutoGenerateColumns="False" ShowHeader="false" CssClass="tooltipTable" Width="100%" DataSourceID="sdsDetailsMisc">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Genstand" SortExpression="Name" />
                <asp:BoundField DataField="ItemCount" HeaderText="Antal" SortExpression="ItemCount" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sdsDetailsMisc" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [LoanDetailsMiscView] WHERE [LoanID] = @LoanID">
            <SelectParameters>
                <asp:QueryStringParameter Name="LoanID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Panel>