using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Stiig;

public partial class Item : System.Web.UI.Page
{
    public int itemID = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();
        int Type = 0;

        if (!int.TryParse(Request.QueryString["type"], out Type))
        {
            Response.Redirect("~/Error.aspx?c=WrongType", true);
        }
        if (!int.TryParse(Request.QueryString["ID"], out itemID))
        {
            Response.Redirect("~/Error.aspx?c=NoID", true);
        }
        hplBack.NavigateUrl = "~/access/Item/ShowItems.aspx?type=" + Type;
        hplBack.Text = "< Alle " + GetTypeString(Type);
        string whereClause = "";
        lblError.Visible = false;

        dvModem.Visible = dvModem.Enabled = Type == 1 ? true : false;
        dvToken.Visible = dvToken.Enabled = Type == 2 ? true : false;
        dvLaptop.Visible = dvLaptop.Enabled = Type == 3 ? true : false;
        dvPrinter.Visible = dvPrinter.Enabled = Type == 4 ? true : false;
        dvProjector.Visible = dvProjector.Enabled = Type == 5 ? true : false;
        dvUSBKey.Visible = dvUSBKey.Enabled = Type == 6 ? true : false;
        dvPhone.Visible = dvPhone.Enabled = Type == 7 ? true : false;
        dvSIMcard.Visible = dvSIMcard.Enabled = Type == 8 ? true : false;

        switch (Type)
        {
            case 1:
                whereClause = @" WHERE ([ID] IN
                                    (SELECT [LoanID]
                                    FROM [LoanDetailsModem]
                                        WHERE [ID] = @itemID))";
                break;
            case 2:
                whereClause = @" WHERE ([ID] IN
                                    (SELECT [LoanID]
                                    FROM [LoanDetailsToken]
                                        WHERE [ID] = @itemID))";
                break;
            case 3:
                whereClause = @" WHERE ([ID] IN
                                    (SELECT [LoanID]
                                    FROM [LoanDetailsLaptop]
                                        WHERE [ID] = @itemID))";
                break;
            case 4:
                whereClause = @" WHERE ([ID] IN
                                    (SELECT [LoanID]
                                    FROM [LoanDetailsPrinter]
                                        WHERE [ID] = @itemID))";
                break;
            case 5:
                whereClause = @" WHERE ([ID] IN
                                    (SELECT [LoanID]
                                    FROM [LoanDetailsProjector]
                                        WHERE [ID] = @itemID))";
                break;
            case 6:
                whereClause = @" WHERE ([ID] IN
                                    (SELECT [LoanID]
                                    FROM [LoanDetailsUSBKey]
                                        WHERE [ID] = @itemID))";
                break;
            case 7:
                whereClause = @" WHERE ([ID] IN
                                    (SELECT [LoanID]
                                    FROM [LoanDetailsPhones]
                                        WHERE [ID] = @itemID))";
                break;
            case 8:
                whereClause = @" WHERE ([ID] IN
                                    (SELECT [LoanID]
                                    FROM [LoanDetailsSIMcard]
                                        WHERE [ID] = @itemID))";
                break;
            default:
                Response.Redirect("~/Error.aspx?c=WrongType");
                break;
        }

        dal.AddParameter("@itemID", itemID, DbType.String);
        DataTable table = dal.ExecuteDataTable("SELECT * FROM [LoansCustomers]" + whereClause);
        gvLoans.DataSource = table;
        gvLoans.DataBind();
    }
    private string GetTypeString(int TypeNr)
    {
        string result = String.Empty;

        switch (TypeNr)
        {
            case 1:
                result = "Modems";
                break;
            case 2:
                result = "Tokens";
                break;
            case 3:
                result = "Bærbarer";
                break;
            case 4:
                result = "Printere";
                break;
            case 5:
                result = "Projektorer";
                break;
            case 6:
                result = "USB-nøgler";
                break;
            case 7:
                result = "Mobiltelefoner";
                break;
            case 8:
                result = "SIM-kort";
                break;
            default:
                break;
        }

        return result;
    }
    protected void dvModem_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        Page.Validate();

        if (Page.IsValid)
        {
            Modem modem = new Modem();
            string error = "";
            DropDownList ddlSIMcard = (DropDownList)dvModem.FindControl("ddlSIMcard");
            modem.IMEI = e.NewValues["IMEI"].ToString().ToUpper();

            error = Utilities.CheckIfExists(modem, e.Keys["ID"].ToString());

            if (ddlSIMcard.SelectedIndex != 0)
            {
                e.NewValues["SIMcardRefID"] = ddlSIMcard.SelectedValue;
            }

            e.NewValues["IMEI"] = e.NewValues["IMEI"].ToString().ToUpper();
            e.NewValues["UserID"] = Membership.GetUser().ProviderUserKey;

            string changedNote = "";

            if (!Utilities.CompareValues(e.OldValues["IMEI"], e.NewValues["IMEI"]))
                changedNote += "IMEI, ";
            if (!Utilities.CompareValues(e.OldValues["Brand"], e.NewValues["Brand"]))
                changedNote += "Mærke, ";
            if (!Utilities.CompareValues(e.OldValues["Model"], e.NewValues["Model"]))
                changedNote += "Model, ";
            if (!Utilities.CompareValues(e.OldValues["SIMcardRefID"], e.NewValues["SIMcardRefID"]))
                changedNote += "Tilknyttet SIM-kort, ";
            if (!Utilities.CompareValues(e.OldValues["Discarded"], e.NewValues["Discarded"]))
                changedNote += "Kasseret, ";
            if (!Utilities.CompareValues(e.OldValues["TransferedCMDB"], e.NewValues["TransferedCMDB"]))
                changedNote += "Overført CMDB, ";
            if (!Utilities.CompareValues(e.OldValues["Comment"], e.NewValues["Comment"]))
                changedNote += "Bemærkninger, ";

            changedNote = Utilities.RemoveEndString(changedNote, ", ");

            e.NewValues["Note"] = changedNote;
        }
    }
    protected void dvToken_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        Page.Validate();

        if (Page.IsValid)
        {
            Token token = new Token();
            string error = "";

            token.Serialnumber = e.NewValues["Serialnumber"].ToString().ToUpper();

            error = Utilities.CheckIfExists(token, e.Keys["ID"].ToString());

            if (error.Length > 0)
            {
                lblError.Text = Utilities.GetErrorMsg(error);
                lblError.Visible = true;
                e.Cancel = true;
            }

            e.NewValues["UserID"] = Membership.GetUser().ProviderUserKey;

            string changedNote = "";

            if (!Utilities.CompareValues(e.OldValues["Serialnumber"], e.NewValues["Serialnumber"]))
                changedNote += "Serienummer, ";
            if (!Utilities.CompareValues(e.OldValues["Discarded"], e.NewValues["Discarded"]))
                changedNote += "Kasseret, ";
            if (!Utilities.CompareValues(e.OldValues["Comment"], e.NewValues["Comment"]))
                changedNote += "Bemærkninger, ";

            changedNote = Utilities.RemoveEndString(changedNote, ", ");

            e.NewValues["Note"] = changedNote;
        }
    }
    protected void dvLaptop_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        Page.Validate();

        if (Page.IsValid)
        {
            Laptop laptop = new Laptop();
            string error = "";

            laptop.Serialnumber = e.NewValues["Serialnumber"].ToString().ToUpper();
            laptop.GUID = e.NewValues["GUID"] != null ? e.NewValues["GUID"].ToString().ToUpper() : "";
            laptop.Name = e.NewValues["Name"] != null ? e.NewValues["Name"].ToString().ToUpper() : "";
            laptop.Description = e.NewValues["Description"] != null ? e.NewValues["Description"].ToString().ToUpper() : "";

            error = Utilities.CheckIfExists(laptop, e.Keys["ID"].ToString());

            if (error.Length > 0)
            {
                lblError.Text = Utilities.GetErrorMsg(error);
                lblError.Visible = true;
                e.Cancel = true;
            }

            e.NewValues["UserID"] = Membership.GetUser().ProviderUserKey;
            
            string changedNote = "";

            if (!Utilities.CompareValues(e.OldValues["Serialnumber"], e.NewValues["Serialnumber"]))
                changedNote += "Serienummer, ";
            if (!Utilities.CompareValues(e.OldValues["GUID"], e.NewValues["GUID"]))
                changedNote += "GUID, ";
            if (!Utilities.CompareValues(e.OldValues["Brand"], e.NewValues["Brand"]))
                changedNote += "Mærke, ";
            if (!Utilities.CompareValues(e.OldValues["Model"], e.NewValues["Model"]))
                changedNote += "Model, ";
            if (!Utilities.CompareValues(e.OldValues["FIIN"], e.NewValues["FIIN"]))
                changedNote += "FIIN, ";
            if (!Utilities.CompareValues(e.OldValues["Name"], e.NewValues["Name"]))
                changedNote += "Navn, ";
            if (!Utilities.CompareValues(e.OldValues["Description"], e.NewValues["Description"]))
                changedNote += "Beskrivelse, ";
            if (!Utilities.CompareValues(e.OldValues["Discarded"], e.NewValues["Discarded"]))
                changedNote += "Kasseret, ";
            if (!Utilities.CompareValues(e.OldValues["Comment"], e.NewValues["Comment"]))
                changedNote += "Bemærkninger, ";

            changedNote = Utilities.RemoveEndString(changedNote, ", ");

            e.NewValues["Note"] = changedNote;
        }
    }
    protected void dvPrinter_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        Page.Validate();

        if (Page.IsValid)
        {
            Printer printer = new Printer();
            string error = "";

            printer.Serialnumber = e.NewValues["Serialnumber"].ToString().ToUpper();
            printer.Name = e.NewValues["Name"] != null ? e.NewValues["Name"].ToString().ToUpper() : "";

            error = Utilities.CheckIfExists(printer, e.Keys["ID"].ToString());

            if (error.Length > 0)
            {
                lblError.Text = Utilities.GetErrorMsg(error);
                lblError.Visible = true;
                e.Cancel = true;
            }

            e.NewValues["Serialnumber"] = e.NewValues["Serialnumber"].ToString().ToUpper();
            e.NewValues["Name"] = e.NewValues["Name"] != null ? e.NewValues["Name"].ToString().ToUpper() : "";
            e.NewValues["UserID"] = Membership.GetUser().ProviderUserKey;

            string changedNote = "";

            if (!Utilities.CompareValues(e.OldValues["Serialnumber"], e.NewValues["Serialnumber"]))
                changedNote += "Serienummer, ";
            if (!Utilities.CompareValues(e.OldValues["Brand"], e.NewValues["Brand"]))
                changedNote += "Mærke, ";
            if (!Utilities.CompareValues(e.OldValues["Model"], e.NewValues["Model"]))
                changedNote += "Model, ";
            if (!Utilities.CompareValues(e.OldValues["Name"], e.NewValues["Name"]))
                changedNote += "Navn, ";
            if (!Utilities.CompareValues(e.OldValues["Discarded"], e.NewValues["Discarded"]))
                changedNote += "Kasseret, ";
            if (!Utilities.CompareValues(e.OldValues["Comment"], e.NewValues["Comment"]))
                changedNote += "Bemærkninger, ";

            changedNote = Utilities.RemoveEndString(changedNote, ", ");

            e.NewValues["Note"] = changedNote;
        }
    }
    protected void dvProjector_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        Page.Validate();

        if (Page.IsValid)
        {
            Projector projector = new Projector();
            string error = "";

            projector.Serialnumber = e.NewValues["Serialnumber"].ToString().ToUpper();

            error = Utilities.CheckIfExists(projector, e.Keys["ID"].ToString());

            if (error.Length > 0)
            {
                lblError.Text = Utilities.GetErrorMsg(error);
                lblError.Visible = true;
                e.Cancel = true;
            }

            e.NewValues["Serialnumber"] = e.NewValues["Serialnumber"].ToString().ToUpper();
            e.NewValues["UserID"] = Membership.GetUser().ProviderUserKey;

            string changedNote = "";

            if (!Utilities.CompareValues(e.OldValues["Serialnumber"], e.NewValues["Serialnumber"]))
                changedNote += "Serienummer, ";
            if (!Utilities.CompareValues(e.OldValues["Brand"], e.NewValues["Brand"]))
                changedNote += "Mærke, ";
            if (!Utilities.CompareValues(e.OldValues["Model"], e.NewValues["Model"]))
                changedNote += "Model, ";
            if (!Utilities.CompareValues(e.OldValues["Discarded"], e.NewValues["Discarded"]))
                changedNote += "Kasseret, ";
            if (!Utilities.CompareValues(e.OldValues["Comment"], e.NewValues["Comment"]))
                changedNote += "Bemærkninger, ";

            changedNote = Utilities.RemoveEndString(changedNote, ", ");

            e.NewValues["Note"] = changedNote;
        }
    }
    protected void dvUSBKey_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        Page.Validate();

        if (Page.IsValid)
        {
            USBKey usbkey = new USBKey();
            string error = "";

            usbkey.Serialnumber = e.NewValues["Serialnumber"].ToString().ToUpper();

            error = Utilities.CheckIfExists(usbkey, e.Keys["ID"].ToString());

            if (error.Length > 0)
            {
                lblError.Text = Utilities.GetErrorMsg(error);
                lblError.Visible = true;
                e.Cancel = true;
            }

            e.NewValues["Serialnumber"] = e.NewValues["Serialnumber"].ToString().ToUpper();
            e.NewValues["UserID"] = Membership.GetUser().ProviderUserKey;

            string changedNote = "";

            if (!Utilities.CompareValues(e.OldValues["Serialnumber"], e.NewValues["Serialnumber"]))
                changedNote += "Serienummer, ";
            if (!Utilities.CompareValues(e.OldValues["Discarded"], e.NewValues["Discarded"]))
                changedNote += "Kasseret, ";
            if (!Utilities.CompareValues(e.OldValues["Comment"], e.NewValues["Comment"]))
                changedNote += "Bemærkninger, ";

            changedNote = Utilities.RemoveEndString(changedNote, ", ");

            e.NewValues["Note"] = changedNote;
        }
    }
    protected void dvPhone_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        Page.Validate();

        if (Page.IsValid)
        {
            Phone phone = new Phone();
            string error = "";

            phone.IMEI = e.NewValues["IMEI"].ToString();

            error = Utilities.CheckIfExists(phone, e.Keys["ID"].ToString());

            if (error.Length > 0)
            {
                lblError.Text = Utilities.GetErrorMsg(error);
                lblError.Visible = true;
                e.Cancel = true;
            }

            e.NewValues["UserID"] = Membership.GetUser().ProviderUserKey;

            string changedNote = "";

            if (!Utilities.CompareValues(e.OldValues["IMEI"], e.NewValues["IMEI"]))
                changedNote += "IMEI, ";
            if (!Utilities.CompareValues(e.OldValues["Brand"], e.NewValues["Brand"]))
                changedNote += "Mærke, ";
            if (!Utilities.CompareValues(e.OldValues["Model"], e.NewValues["Model"]))
                changedNote += "Model, ";
            if (!Utilities.CompareValues(e.OldValues["Discarded"], e.NewValues["Discarded"]))
                changedNote += "Kasseret, ";
            if (!Utilities.CompareValues(e.OldValues["TransferedCMDB"], e.NewValues["TransferedCMDB"]))
                changedNote += "Overført CMDB, ";
            if (!Utilities.CompareValues(e.OldValues["Comment"], e.NewValues["Comment"]))
                changedNote += "Bemærkninger, ";

            changedNote = Utilities.RemoveEndString(changedNote, ", ");

            e.NewValues["Note"] = changedNote;
        }
    }
    protected void dvSIMcard_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        Page.Validate();

        if (Page.IsValid)
        {
            SIMcard simcard = new SIMcard();
            string error = "";

            simcard.SIMcardnr = e.NewValues["SIMcardnr"].ToString();
            simcard.Phonenr = e.NewValues["Phonenr"] != null ? e.NewValues["Phonenr"].ToString() : "";

            error = Utilities.CheckIfExists(simcard, e.Keys["ID"].ToString());

            if (error.Length > 0)
            {
                lblError.Text = Utilities.GetErrorMsg(error);
                lblError.Visible = true;
                e.Cancel = true;
            }

            e.NewValues["UserID"] = Membership.GetUser().ProviderUserKey;

            string changedNote = "";

            if (!Utilities.CompareValues(e.OldValues["SIMcardnr"], e.NewValues["SIMcardnr"]))
                changedNote += "SIMkort-nr, ";
            if (!Utilities.CompareValues(e.OldValues["Phonenr"], e.NewValues["Phonenr"]))
                changedNote += "TLF-nr, ";
            if (!Utilities.CompareValues(e.OldValues["PUK"], e.NewValues["PUK"]))
                changedNote += "PUK, ";
            if (!Utilities.CompareValues(e.OldValues["PIN"], e.NewValues["PIN"]))
                changedNote += "PIN, ";
            if (!Utilities.CompareValues(e.OldValues["Discarded"], e.NewValues["Discarded"]))
                changedNote += "Kasseret, ";
            if (!Utilities.CompareValues(e.OldValues["TransferedCMDB"], e.NewValues["TransferedCMDB"]))
                changedNote += "Overført CMDB, ";
            if (!Utilities.CompareValues(e.OldValues["Comment"], e.NewValues["Comment"]))
                changedNote += "Bemærkninger, ";

            changedNote = Utilities.RemoveEndString(changedNote, ", ");

            e.NewValues["Note"] = changedNote;
        }
    }
    protected void gvLoans_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string ID = DataBinder.Eval(e.Row.DataItem, "ID").ToString();
            string Location = ResolveUrl("~/access/Loan/LoanDetails.aspx") + "?ID=" + ID;
            e.Row.Attributes["onClick"] = string.Format("javascript:window.location='{0}';", Location);
            e.Row.Style["cursor"] = "pointer";
        }
    }
    protected void ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        Response.Redirect("~/access/Item/ShowItems.aspx?type=" + Request.QueryString["type"]);
    }
    protected void gvLoans_Sorting(object sender, GridViewSortEventArgs e)
    {
        gvLoans.DataBind();
    }
    protected void dvModem_ModeChanged(object sender, EventArgs e)
    {
        if (dvModem.CurrentMode == DetailsViewMode.Edit)
        {
//            DataAccessLayer dal = new DataAccessLayer();
//            DataTable tblSIMcard = new DataTable();
//            DataTable tblCurrentSIMcard = new DataTable();
//            List<ListItem> lstSIMcardSIMcardnr = new List<ListItem>();

//            dal.AddParameter("@ModemID", itemID, DbType.Int32);
//            tblCurrentSIMcard = dal.ExecuteDataTable("SELECT [SIMcard].[ID], [SIMcard].[SIMcardnr] FROM [Modem] LEFT OUTER JOIN [SIMcard] ON [Modem].[SIMcardRefID] = [SIMcard].[ID]");
//            dal.ClearParameters();
//            ListItem currentSIM = new ListItem();

//            if (tblCurrentSIMcard.Rows.Count != 0)
//            {
//                currentSIM.Value = tblCurrentSIMcard.Rows[0]["ID"].ToString();
//                currentSIM.Text = (tblCurrentSIMcard.Rows[0]["ID"] + " - " + tblCurrentSIMcard.Rows[0]["SIMcardnr"]);
//            }

//            dal.AddParameter("@ModemID", itemID, DbType.Int32);
//            tblSIMcard = dal.ExecuteDataTable(@"
//SELECT [SIMcard].[ID], [SIMcard].[SIMcardnr]
//FROM [SIMcard]
//WHERE [SIMcard].[ID] NOT IN (SELECT [SIMcardRefID] FROM [Modem] WHERE [Deleted] = 0 AND [Modem].[ID] != @ModemID)
//AND [Deleted] = 0
//ORDER BY [ID]");
//            dal.ClearParameters();

//            lstSIMcardSIMcardnr.Clear();
//            foreach (DataRow row in tblSIMcard.Rows) { lstSIMcardSIMcardnr.Add(new ListItem((row[0].ToString() + " - " + row[1].ToString()), row[0].ToString())); }

//            ListBox lstbxSIMcard = ((ListBox)dvModem.Rows[0].Cells[0].FindControl("lstbxSIMcard"));
//            lstbxSIMcard.Items.Clear();

//            lstbxSIMcard.Items.AddRange(lstSIMcardSIMcardnr.ToArray());
//            lstbxSIMcard.SelectedIndex = lstbxSIMcard.Items.IndexOf(currentSIM);
        }
    }
    protected void lnkbtnRemoveSIMFromModem_Click(object sender, EventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();

        dal.AddParameter("@ModemID", itemID, DbType.Int32);
        dal.AddParameter("@UserID", Membership.GetUser().ProviderUserKey, DbType.Guid);
        dal.ExecuteNonQuery("UPDATE [Modem] SET [SIMcardRefID] = null WHERE [ID] = @ModemID;EXEC dbo.WriteLog 3, 1, @ModemID, @UserID, 'Tilknyttet SIM-kort fjernet'");
        dal.ClearParameters();

        dvModem.DataBind();
    }
    protected void dv_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        e.Keys["UserID"] = Membership.GetUser().ProviderUserKey;
    }
}