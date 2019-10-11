using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.WebControls;
using Stiig;

public partial class LoanDetails : System.Web.UI.Page
{
    public int ID;
    public Loan loan;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!int.TryParse(Request.QueryString["ID"], out ID) || dvLoanDetails.Rows.Count == 0)
            Response.Redirect("~/Error.aspx?c=NoID", true);

        lblOrderID.Text = "Ordrenummer: " + ID;
        loan = new Loan(ID);
        lblFailedPickup.Visible = loan.FailedPickup;

        lblError.Visible = false;
        lblErrorMisc.Visible = false;
    }
    protected void ItemRowDatabound(object sender, GridViewRowEventArgs e)
    {
        int type = 0;

        switch (((GridView)sender).ID)
        {
            case "gvModem":
                type = 1;
                break;
            case "gvToken":
                type = 2;
                break;
            case "gvLaptop":
                type = 3;
                break;
            case "gvPrinter":
                type = 4;
                break;
            case "gvProjector":
                type = 5;
                break;
            case "gvUSBkey":
                type = 6;
                break;
            case "gvPhones":
                type = 7;
                break;
            case "gvSIMcard":
                type = 8;
                break;
            default:
                break;
        }

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string ID = DataBinder.Eval(e.Row.DataItem, "ID").ToString();
            string Location = ResolveUrl("~/access/Item/Item.aspx") + "?type=" + type + "&ID=" + ID;

            for (int i = 1; i < e.Row.Cells.Count; i++)
            {
                e.Row.Cells[i].Attributes["onClick"] = string.Format("javascript:window.location='{0}';", Location);
                e.Row.Cells[i].Style["cursor"] = "pointer";
            }
        }
    }
    protected void lnkbtnAddItem_Command(object sender, CommandEventArgs e)
    {
        switch (e.CommandArgument.ToString())
        {
            case "Show":
                FillModemTable();
                FillTokenTable();
                FillLaptopTable();
                FillPrinterTable();
                FillProjectorTable();
                FillUSBkeyTable();
                FillPhonesTable();
                FillSIMcardTable();

                lnkbtnAddItem.Text = "Skjul 'Tilføj MAT'";
                lnkbtnAddItem.CommandArgument = "Hide";
                tcAddItem.Visible = true;
                break;
            case "Hide":
                lnkbtnAddItem.Text = "Tilføj MAT";
                lnkbtnAddItem.CommandArgument = "Show";
                tcAddItem.Visible = false;
                break;
            default:
                break;
        }
    }
    protected void FillModemTable()
    {
        DataAccessLayer dal = new DataAccessLayer();

        DataTable tblModem = new DataTable();
        List<ListItem> lstModemID = new List<ListItem>();

        dal.AddParameter("@ID", ID, DbType.Int32);
        dal.AddParameter("@StartDate", loan.DateFrom, DbType.Date);
        dal.AddParameter("@EndDate", loan.DateTo, DbType.Date);
        tblModem = dal.ExecuteDataTable("SELECT * FROM dbo.AvailableModems(@StartDate, @EndDate) WHERE [ID] NOT IN (SELECT [ID] FROM [LoanDetails] WHERE [LoanID] = @ID)");
        dal.ClearParameters();

        foreach (DataRow row in tblModem.Rows) { lstModemID.Add(new ListItem(row[0].ToString() + " - " + row[1].ToString(), row[0].ToString())); }
        btn1Add.Visible = lstModemID.Count > 0;
        lstb1ID.Items.Clear();
        lstb1ID.Items.AddRange(lstModemID.ToArray());
    }
    protected void FillTokenTable()
    {
        DataAccessLayer dal = new DataAccessLayer();

        DataTable tblToken = new DataTable();
        List<ListItem> lstTokenSerialnumber = new List<ListItem>();

        dal.AddParameter("@ID", ID, DbType.Int32);
        tblToken = dal.ExecuteDataTable("SELECT * FROM [Tokens] WHERE [Tokens].[ID] NOT IN (SELECT [ItemRefID] FROM [LoanDetails] WHERE [LoanID] = @ID AND [Type] = 2)");
        dal.ClearParameters();

        foreach (DataRow row in tblToken.Rows) { lstTokenSerialnumber.Add(new ListItem(row[1].ToString(), row[0].ToString())); }
        btn2Add.Visible = lstTokenSerialnumber.Count > 0;
        lstb2Serialnumber.Items.Clear();
        lstb2Serialnumber.Items.AddRange(lstTokenSerialnumber.ToArray());
    }
    protected void FillLaptopTable()
    {
        DataAccessLayer dal = new DataAccessLayer();

        DataTable tblLaptop = new DataTable();
        List<ListItem> lstLaptopSerialnumber = new List<ListItem>();

        dal.AddParameter("@ID", ID, DbType.Int32);
        tblLaptop = dal.ExecuteDataTable("SELECT * FROM [Laptop] WHERE [Laptop].[ID] NOT IN (SELECT [ItemRefID] FROM [LoanDetails] WHERE [LoanID] = @ID AND [Type] = 3)");
        dal.ClearParameters();

        foreach (DataRow row in tblLaptop.Rows) { lstLaptopSerialnumber.Add(new ListItem(row[1].ToString(), row[0].ToString())); }
        btn3Add.Visible = lstLaptopSerialnumber.Count > 0;
        lstb3Serialnumber.Items.Clear();
        lstb3Serialnumber.Items.AddRange(lstLaptopSerialnumber.ToArray());
    }
    protected void FillPrinterTable()
    {
        DataAccessLayer dal = new DataAccessLayer();

        DataTable tblPrinter = new DataTable();
        List<ListItem> lstPrinterSerialnumber = new List<ListItem>();

        dal.AddParameter("@ID", ID, DbType.Int32);
        tblPrinter = dal.ExecuteDataTable("SELECT * FROM [Printer] WHERE [Printer].[ID] NOT IN (SELECT [ItemRefID] FROM [LoanDetails] WHERE [LoanID] = @ID AND [Type] = 4)");
        dal.ClearParameters();

        foreach (DataRow row in tblPrinter.Rows) { lstPrinterSerialnumber.Add(new ListItem(row[1].ToString(), row[0].ToString())); }
        btn4Add.Visible = lstPrinterSerialnumber.Count > 0;
        lstb4Serialnumber.Items.Clear();
        lstb4Serialnumber.Items.AddRange(lstPrinterSerialnumber.ToArray());
    }
    protected void FillProjectorTable()
    {
        DataAccessLayer dal = new DataAccessLayer();

        DataTable tblProjector = new DataTable();
        List<ListItem> lstProjectorSerialnumber = new List<ListItem>();

        dal.AddParameter("@ID", ID, DbType.Int32);
        tblProjector = dal.ExecuteDataTable("SELECT * FROM [Projector] WHERE [Projector].[ID] NOT IN (SELECT [ItemRefID] FROM [LoanDetails] WHERE [LoanID] = @ID AND [Type] = 5)");
        dal.ClearParameters();

        foreach (DataRow row in tblProjector.Rows) { lstProjectorSerialnumber.Add(new ListItem(row[1].ToString(), row[0].ToString())); }
        btn5Add.Visible = lstProjectorSerialnumber.Count > 0;
        lstb5Serialnumber.Items.Clear();
        lstb5Serialnumber.Items.AddRange(lstProjectorSerialnumber.ToArray());
    }
    protected void FillUSBkeyTable()
    {
        DataAccessLayer dal = new DataAccessLayer();

        DataTable tblUSBkey = new DataTable();
        List<ListItem> lstUSBkeySerialnumber = new List<ListItem>();

        dal.AddParameter("@ID", ID, DbType.Int32);
        tblUSBkey = dal.ExecuteDataTable("SELECT * FROM [USBKey] WHERE [USBKey].[ID] NOT IN (SELECT [ItemRefID] FROM [LoanDetails] WHERE [LoanID] = @ID AND [Type] = 6)");
        dal.ClearParameters();

        foreach (DataRow row in tblUSBkey.Rows) { lstUSBkeySerialnumber.Add(new ListItem(row[1].ToString(), row[0].ToString())); }
        btn6Add.Visible = lstUSBkeySerialnumber.Count > 0;
        lstb6Serialnumber.Items.Clear();
        lstb6Serialnumber.Items.AddRange(lstUSBkeySerialnumber.ToArray());
    }
    protected void FillPhonesTable()
    {
        DataAccessLayer dal = new DataAccessLayer();

        DataTable tblPhones = new DataTable();
        List<ListItem> lstPhonesID = new List<ListItem>();

        dal.AddParameter("@ID", ID, DbType.Int32);
        tblPhones = dal.ExecuteDataTable("SELECT * FROM [Phones] WHERE [Phones].[ID] NOT IN (SELECT [ItemRefID] FROM [LoanDetails] WHERE [LoanID] = @ID AND [Type] = 7)");
        dal.ClearParameters();

        foreach (DataRow row in tblPhones.Rows) { lstPhonesID.Add(new ListItem(row[0].ToString(), row[0].ToString())); }
        btn7Add.Visible = lstPhonesID.Count > 0;
        lstb7ID.Items.Clear();
        lstb7ID.Items.AddRange(lstPhonesID.ToArray());
    }
    protected void FillSIMcardTable()
    {
        DataAccessLayer dal = new DataAccessLayer();

        DataTable tblSIMcard = new DataTable();
        List<ListItem> lstSIMcardSIMcardnr = new List<ListItem>();

        dal.AddParameter("@ID", ID, DbType.Int32);
        tblSIMcard = dal.ExecuteDataTable("SELECT * FROM [SIMcard] WHERE [SIMcard].[ID] NOT IN (SELECT [ItemRefID] FROM [LoanDetails] WHERE [LoanID] = @ID AND [Type] = 8) AND [SIMcard].[ID] NOT IN (SELECT [SIMcardRefID] FROM [Modem] WHERE [SIMcardRefID] IS NOT NULL)");
        dal.ClearParameters();

        foreach (DataRow row in tblSIMcard.Rows) { lstSIMcardSIMcardnr.Add(new ListItem(row[1].ToString(), row[0].ToString())); }
        btn8Add.Visible = lstSIMcardSIMcardnr.Count > 0;
        lstb8SIMcardnr.Items.Clear();
        lstb8SIMcardnr.Items.AddRange(lstSIMcardSIMcardnr.ToArray());
    }
    protected void AddItem_Command(object sender, CommandEventArgs e)
    {
        //Button to add item clicked

        DataAccessLayer dal = new DataAccessLayer();

        switch (e.CommandName)
        {
            case "Modem":
                //3G Modem add
                //Checking if there is a selected item
                if (lstb1ID.SelectedItem != null)
                {
                    dal.AddParameter("@ItemRefID", lstb1ID.SelectedValue, DbType.Int32);
                    dal.AddParameter("@LoanID", ID, DbType.Int32);
                    dal.AddParameter("@AddedBy", Membership.GetUser().ProviderUserKey, DbType.Guid);
                    dal.ExecuteNonQuery("EXEC dbo.[InsertLoanDetails] 1, @ItemRefID, @LoanID, @AddedBy");
                    dal.ClearParameters();

                    //Remove the selected item from the first list
                    lstb1ID.Items.Remove(lstb1ID.SelectedItem);

                    //If the first list becomes empty then turn the btn1Add invisible
                    btn1Add.Visible = lstb1ID.Items.Count != 0;

                    gvModem.DataBind();
                }
                break;
            case "Token":
                //Token add
                if (lstb2Serialnumber.SelectedItem != null)
                {
                    dal.AddParameter("@ItemRefID", lstb2Serialnumber.SelectedValue, DbType.Int32);
                    dal.AddParameter("@LoanID", ID, DbType.Int32);
                    dal.AddParameter("@AddedBy", Membership.GetUser().ProviderUserKey, DbType.Guid);
                    dal.ExecuteNonQuery("EXEC dbo.[InsertLoanDetails] 2, @ItemRefID, @LoanID, @AddedBy");
                    dal.ClearParameters();

                    lstb2Serialnumber.Items.Remove(lstb2Serialnumber.SelectedItem);

                    btn2Add.Visible = lstb2Serialnumber.Items.Count != 0;

                    gvToken.DataBind();
                }
                break;
            case "Laptop":
                //Laptop add
                if (lstb3Serialnumber.SelectedItem != null)
                {
                    dal.AddParameter("@ItemRefID", lstb3Serialnumber.SelectedValue, DbType.Int32);
                    dal.AddParameter("@LoanID", ID, DbType.Int32);
                    dal.AddParameter("@AddedBy", Membership.GetUser().ProviderUserKey, DbType.Guid);
                    dal.ExecuteNonQuery("EXEC dbo.[InsertLoanDetails] 3, @ItemRefID, @LoanID, @AddedBy");
                    dal.ClearParameters();

                    lstb3Serialnumber.Items.Remove(lstb3Serialnumber.SelectedItem);

                    btn3Add.Visible = lstb3Serialnumber.Items.Count != 0;

                    gvLaptop.DataBind();
                }
                break;
            case "Printer":
                //Printer add
                if (lstb4Serialnumber.SelectedItem != null)
                {
                    dal.AddParameter("@ItemRefID", lstb4Serialnumber.SelectedValue, DbType.Int32);
                    dal.AddParameter("@LoanID", ID, DbType.Int32);
                    dal.AddParameter("@AddedBy", Membership.GetUser().ProviderUserKey, DbType.Guid);
                    dal.ExecuteNonQuery("EXEC dbo.[InsertLoanDetails] 4, @ItemRefID, @LoanID, @AddedBy");
                    dal.ClearParameters();

                    lstb4Serialnumber.Items.Remove(lstb4Serialnumber.SelectedItem);

                    btn4Add.Visible = lstb4Serialnumber.Items.Count != 0;

                    gvPrinter.DataBind();
                }
                break;
            case "Projector":
                //Projector add
                if (lstb5Serialnumber.SelectedItem != null)
                {
                    dal.AddParameter("@ItemRefID", lstb5Serialnumber.SelectedValue, DbType.Int32);
                    dal.AddParameter("@LoanID", ID, DbType.Int32);
                    dal.AddParameter("@AddedBy", Membership.GetUser().ProviderUserKey, DbType.Guid);
                    dal.ExecuteNonQuery("EXEC dbo.[InsertLoanDetails] 5, @ItemRefID, @LoanID, @AddedBy");
                    dal.ClearParameters();

                    lstb5Serialnumber.Items.Remove(lstb5Serialnumber.SelectedItem);

                    btn5Add.Visible = lstb5Serialnumber.Items.Count != 0;

                    gvProjector.DataBind();
                }
                break;
            case "USBkey":
                //USBkey add
                if (lstb6Serialnumber.SelectedItem != null)
                {
                    dal.AddParameter("@ItemRefID", lstb6Serialnumber.SelectedValue, DbType.Int32);
                    dal.AddParameter("@LoanID", ID, DbType.Int32);
                    dal.AddParameter("@AddedBy", Membership.GetUser().ProviderUserKey, DbType.Guid);
                    dal.ExecuteNonQuery("EXEC dbo.[InsertLoanDetails] 6, @ItemRefID, @LoanID, @AddedBy");
                    dal.ClearParameters();

                    lstb6Serialnumber.Items.Remove(lstb6Serialnumber.SelectedItem);

                    btn6Add.Visible = lstb6Serialnumber.Items.Count != 0;

                    gvUSBkey.DataBind();
                }
                break;
            case "Phone":
                //Phone add
                if (lstb7ID.SelectedItem != null)
                {
                    dal.AddParameter("@ItemRefID", lstb7ID.SelectedValue, DbType.Int32);
                    dal.AddParameter("@LoanID", ID, DbType.Int32);
                    dal.AddParameter("@AddedBy", Membership.GetUser().ProviderUserKey, DbType.Guid);
                    dal.ExecuteNonQuery("EXEC dbo.[InsertLoanDetails] 7, @ItemRefID, @LoanID, @AddedBy");
                    dal.ClearParameters();

                    lstb7ID.Items.Remove(lstb7ID.SelectedItem);

                    btn7Add.Visible = lstb7ID.Items.Count != 0;

                    gvPhones.DataBind();
                }
                break;
            case "SIMcard":
                //SIMcard add
                if (lstb8SIMcardnr.SelectedItem != null)
                {
                    dal.AddParameter("@ItemRefID", lstb8SIMcardnr.SelectedValue, DbType.Int32);
                    dal.AddParameter("@LoanID", ID, DbType.Int32);
                    dal.AddParameter("@AddedBy", Membership.GetUser().ProviderUserKey, DbType.Guid);
                    dal.ExecuteNonQuery("EXEC dbo.[InsertLoanDetails] 8, @ItemRefID, @LoanID, @AddedBy");
                    dal.ClearParameters();

                    lstb8SIMcardnr.Items.Remove(lstb8SIMcardnr.SelectedItem);

                    btn8Add.Visible = lstb8SIMcardnr.Items.Count != 0;

                    gvSIMcard.DataBind();
                }
                break;
            case "Misc":
                //Misc item add
                if (Convert.ToInt32(txtItemCount.Text) < 1)
                {
                    lblErrorMisc.Visible = true;
                    lblErrorMisc.Text = "Antal skal være 1 eller mere";
                }
                else
                {
                    lblErrorMisc.Visible = false;
                    dal.AddParameter("@ItemID", ddlMisc.SelectedValue, DbType.Int32);
                    dal.AddParameter("@ItemCount", txtItemCount.Text, DbType.Int32);
                    dal.AddParameter("@LoanID", ID, DbType.Int32);
                    dal.AddParameter("@AddedBy", Membership.GetUser().ProviderUserKey, DbType.Guid);
                    dal.ExecuteNonQuery("EXEC dbo.[AddMiscToLoan] @ItemID, @ItemCount, @LoanID, @AddedBy");
                    dal.ClearParameters();

                    gvMisc.DataBind();
                }
                break;
            default:
                break;
        }
    }
    protected void gvModem_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (!lnkbtnAddItem.Visible)
            FillModemTable();
    }
    protected void gvToken_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (!lnkbtnAddItem.Visible)
            FillTokenTable();
    }
    protected void gvLaptop_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (!lnkbtnAddItem.Visible)
            FillLaptopTable();
    }
    protected void gvPrinter_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (!lnkbtnAddItem.Visible)
            FillPrinterTable();
    }
    protected void gvProjector_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (!lnkbtnAddItem.Visible)
            FillProjectorTable();
    }
    protected void gvUSBkey_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (!lnkbtnAddItem.Visible)
            FillUSBkeyTable();
    }
    protected void gvPhones_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (!lnkbtnAddItem.Visible)
            FillPhonesTable();
    }
    protected void gvSIMcard_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (!lnkbtnAddItem.Visible)
            FillSIMcardTable();
    }
    protected void SetDate_Command(object sender, CommandEventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();

        switch (e.CommandArgument.ToString())
        {
            case "PickedUp":
                dal.AddParameter("@ID", ID, DbType.Int32);
                dal.AddParameter("@UserID", Membership.GetUser().ProviderUserKey, DbType.Guid);
                dal.ExecuteScalar("UPDATE [Loans] SET [DatePickedUp] = GETDATE() WHERE [ID] = @ID;EXEC dbo.WriteLog 3, 10, @ID, @UserID, 'Afhentet'");
                dal.ClearParameters();
                break;
            case "Returned":
                dal.AddParameter("@ID", ID, DbType.Int32);
                dal.AddParameter("@UserID", Membership.GetUser().ProviderUserKey, DbType.Guid);
                dal.ExecuteScalar("UPDATE [Loans] SET [DateReturned] = GETDATE() WHERE [ID] = @ID;EXEC dbo.WriteLog 3, 10, @ID, @UserID, 'Afleveret'");
                dal.ClearParameters();
                break;
            default:
                break;
        }

        dvLoanDetails.DataBind();
    }
    protected void dvLoanDetails_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        e.Keys["DeletedBy"] = Membership.GetUser().ProviderUserKey;
    }
    protected void dvLoanDetails_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        Response.Redirect("~/access/Loan/ShowAllLoans.aspx", true);
    }
    protected void dvLoanDetails_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        if (e.NewValues["DateTo"] == null)
        {
            e.NewValues["DateTo"] = new DateTime(9999, 12, 31);
        }
        else
        {
            if (Convert.ToDateTime(e.NewValues["DateTo"]) < Convert.ToDateTime(e.NewValues["DateFrom"]))
            {
                lblError.Text = "Slutdato kan ikke være før startdato";
                lblError.Visible = true;
                e.Cancel = true;
            }
        }

        e.NewValues["TypeRefID"] = ((DropDownList)dvLoanDetails.FindControl("ddlLoanType")).SelectedValue;
        e.NewValues["UserID"] = Membership.GetUser().ProviderUserKey;

        string changedNote = "";
        
        if (!Utilities.CompareValues(e.OldValues["DateFrom"], e.NewValues["DateFrom"]))
            changedNote += "Dato fra, ";
        if (DateTime.Parse(e.NewValues["DateTo"].ToString()) == new DateTime(9999, 12, 31))
        {
            if (!Utilities.CompareValues(e.OldValues["DateTo"], null))
                changedNote += "Dato til, ";
        }
        else
        {
            if (!Utilities.CompareValues(e.OldValues["DateTo"], e.NewValues["DateTo"]))
                changedNote += "Dato til, ";
        }
        if (!Utilities.CompareValues(e.OldValues["DatePickedUp"], e.NewValues["DatePickedUp"]))
            changedNote += "Dato afhentet, ";
        if (!Utilities.CompareValues(e.OldValues["DateReturned"], e.NewValues["DateReturned"]))
            changedNote += "Dato afleveret, ";
        if (!Utilities.CompareValues(e.OldValues["Comment"], e.NewValues["Comment"]))
            changedNote += "Bemærkninger, ";
        if (!Utilities.CompareValues(loan.TypeRefID, e.NewValues["TypeRefID"]))
            changedNote += "Udlånstype, ";

        changedNote = Utilities.RemoveEndString(changedNote, ", ");

        e.NewValues["Note"] = changedNote;
    }
    protected void gvItem_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();

        switch (e.CommandName)
        {
            case "Return":
                dal.AddParameter("@LoanDetailsID", e.CommandArgument, DbType.Int32);
                dal.AddParameter("@UserID", Membership.GetUser().ProviderUserKey, DbType.Guid);
                dal.ExecuteNonQuery("UPDATE [LoanDetails] SET [ReturnedDate] = GETDATE() WHERE [ID] = @LoanDetailsID;EXEC dbo.WriteLog 3, 11, @LoanDetailsID, @UserID, 'Aflever'");
                dal.ClearParameters();
                ((GridView)sender).DataBind();
                break;
            case "UnReturn":
                dal.AddParameter("@LoanDetailsID", e.CommandArgument, DbType.Int32);
                dal.AddParameter("@UserID", Membership.GetUser().ProviderUserKey, DbType.Guid);
                dal.ExecuteNonQuery("UPDATE [LoanDetails] SET [ReturnedDate] = NULL WHERE [ID] = @LoanDetailsID;EXEC dbo.WriteLog 3, 11, @LoanDetailsID, @UserID, 'Annuller aflever'");
                dal.ClearParameters();
                ((GridView)sender).DataBind();
                break;
            default:
                break;
        }
    }
    protected void FailedPickup_Command(object sender, CommandEventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();
        bool value = false;

        switch (e.CommandName)
        {
            case "FailedPickup":
                dal.AddParameter("@ID", ID, DbType.Int32);
                dal.AddParameter("@Value", true, DbType.Boolean);
                dal.AddParameter("@UserID", Membership.GetUser().ProviderUserKey, DbType.Guid);
                dal.ExecuteScalar("UPDATE [Loans] SET [FailedPickup] = @Value WHERE [ID] = @ID;EXEC dbo.WriteLog 3, 10, @ID, @UserID, 'Ikke afhentet'");
                dal.ClearParameters();
                break;
            case "CancelFailedPickup":
                dal.AddParameter("@ID", ID, DbType.Int32);
                dal.AddParameter("@Value", false, DbType.Boolean);
                dal.AddParameter("@UserID", Membership.GetUser().ProviderUserKey, DbType.Guid);
                dal.ExecuteScalar("UPDATE [Loans] SET [FailedPickup] = @Value WHERE [ID] = @ID;EXEC dbo.WriteLog 3, 10, @ID, @UserID, 'Annuller ikke afhentet'");
                dal.ClearParameters();
                break;
            default:
                break;
        }

        lblFailedPickup.Visible = value;

        dvLoanDetails.DataBind();
    }
    protected void ddlLoanType_DataBound(object sender, EventArgs e)
    {
        DropDownList ddlLoanType = (DropDownList)sender;

        ddlLoanType.Items.FindByValue(loan.TypeRefID.ToString()).Selected = true;
    }
    protected void dvLoanDetails_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "SendMail")
        {
            DataAccessLayer dal = new DataAccessLayer();
            dal.AddParameter("@LoanID", loan.ID, DbType.Int32);
            string itemInfo = dal.ExecuteScalar("SELECT dbo.GetMailInfo(@LoanID)").ToString();
            dal.ClearParameters();

            dal.AddParameter("@LoanID", loan.ID, DbType.Int32);
            DataTable miscItemsTable = dal.ExecuteDataTable("SELECT LDM.ID, LDM.ItemCount, IMT.Name FROM [LoanDetailsMisc] LDM INNER JOIN [ItemMiscType] IMT ON LDM.ItemMiscTypeRefID = IMT.ID WHERE LDM.Deleted = 0 AND LDM.LoanID = @LoanID");
            dal.ClearParameters();

            foreach (DataRow row in miscItemsTable.Rows)
            {
                itemInfo += String.Format("{0}x {1}\\n", row["ItemCount"].ToString(), row["Name"].ToString());
            }

            string message = File.ReadAllText(Server.MapPath("~/mail.html"));
            message = message.Replace("%NR%", loan.ID.ToString());
            message = message.Replace("%ITEMS%", itemInfo.Replace("\\n", "<br />"));

            bool sent = Utilities.SendMail(("TRR-IT07@mil.dk"), message);
            //bool sent = Utilities.SendMail((loan.Customer.Stabsnummer + "@mil.dk"), message);

            if (sent)
            {
                dal.AddParameter("@LoanID", loan.ID, DbType.Int32);
                dal.AddParameter("@UserID", Membership.GetUser().ProviderUserKey, DbType.Guid);
                dal.ExecuteNonQuery("EXEC dbo.[MailSent] @LoanID, @UserID");
                dal.ClearParameters();

                MyButton mbSendMail = (MyButton)dvLoanDetails.FindControl("mbSendMail");
                mbSendMail.Type = MyButton.ButtonType.NoMail;
            }
        }
    }
    protected void dvLoanDetails_DataBound(object sender, EventArgs e)
    {
        if ((dvLoanDetails.CurrentMode == DetailsViewMode.ReadOnly) && dvLoanDetails.DataItemCount > 0)
        {
            DataAccessLayer dal = new DataAccessLayer();
            MyButton mbSendMail = (MyButton)dvLoanDetails.FindControl("mbSendMail");

            dal.AddParameter("@LoanID", ID, DbType.Int32);
            bool mailEnabled = (bool)dal.ExecuteScalar("SELECT dbo.MailEnabled(@LoanID)");
            dal.ClearParameters();

            if (mailEnabled)
                mbSendMail.Type = MyButton.ButtonType.Mail;
            else
                mbSendMail.Type = MyButton.ButtonType.NoMail;
        }
    }
    protected void gvItem_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        e.Keys["UserID"] = Membership.GetUser().ProviderUserKey;
    }
    protected void gvMisc_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        e.Keys["UserID"] = Membership.GetUser().ProviderUserKey;
    }
}