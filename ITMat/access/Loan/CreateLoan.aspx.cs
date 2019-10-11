using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Stiig;

public partial class CreateLoan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Visible = false;
        hplAddNewCustomer.Visible = false;

        txtMANR.Attributes.Add("OnBlur", "ShowAvailability(this)");

        if (!Page.IsPostBack)
        {
            ViewState["itemListsFilled"] = false;

            txtDateFrom.Text = DateTime.Today.ToString("yyyy-MM-dd");

            txtMANR.Text = Request.QueryString["MANR"];
        }
    }

    private void UpdateCounters(UpdateItemType type)
    {
        switch (type)
        {
            case UpdateItemType.Modem:
                lbl1ItemCounter.Text = lstb1ID.Items.Count.ToString();
                lbl1AddedCounter.Text = lstb1Added.Items.Count.ToString();
                break;
            case UpdateItemType.Token:
                lbl2ItemCounter.Text = lstb2Serialnumber.Items.Count.ToString();
                lbl2AddedCounter.Text = lstb2Added.Items.Count.ToString();
                break;
            case UpdateItemType.Laptop:
                lbl3ItemCounter.Text = lstb3Serialnumber.Items.Count.ToString();
                lbl3AddedCounter.Text = lstb3Added.Items.Count.ToString();
                break;
            case UpdateItemType.Printer:
                lbl4ItemCounter.Text = lstb4Serialnumber.Items.Count.ToString();
                lbl4AddedCounter.Text = lstb4Added.Items.Count.ToString();
                break;
            case UpdateItemType.Projector:
                lbl5ItemCounter.Text = lstb5Serialnumber.Items.Count.ToString();
                lbl5AddedCounter.Text = lstb5Added.Items.Count.ToString();
                break;
            case UpdateItemType.USBkey:
                lbl6ItemCounter.Text = lstb6Serialnumber.Items.Count.ToString();
                lbl6AddedCounter.Text = lstb6Added.Items.Count.ToString();
                break;
            case UpdateItemType.Phone:
                lbl7ItemCounter.Text = lstb7ID.Items.Count.ToString();
                lbl7AddedCounter.Text = lstb7Added.Items.Count.ToString();
                break;
            case UpdateItemType.SIMcard:
                lbl8ItemCounter.Text = lstb8SIMcardnr.Items.Count.ToString();
                lbl8AddedCounter.Text = lstb8Added.Items.Count.ToString();
                break;
            case UpdateItemType.All:
                lbl1ItemCounter.Text = lstb1ID.Items.Count.ToString();
                lbl1AddedCounter.Text = lstb1Added.Items.Count.ToString();
                lbl2ItemCounter.Text = lstb2Serialnumber.Items.Count.ToString();
                lbl2AddedCounter.Text = lstb2Added.Items.Count.ToString();
                lbl3ItemCounter.Text = lstb3Serialnumber.Items.Count.ToString();
                lbl3AddedCounter.Text = lstb3Added.Items.Count.ToString();
                lbl4ItemCounter.Text = lstb4Serialnumber.Items.Count.ToString();
                lbl4AddedCounter.Text = lstb4Added.Items.Count.ToString();
                lbl5ItemCounter.Text = lstb5Serialnumber.Items.Count.ToString();
                lbl5AddedCounter.Text = lstb5Added.Items.Count.ToString();
                lbl6ItemCounter.Text = lstb6Serialnumber.Items.Count.ToString();
                lbl6AddedCounter.Text = lstb6Added.Items.Count.ToString();
                lbl7ItemCounter.Text = lstb7ID.Items.Count.ToString();
                lbl7AddedCounter.Text = lstb7Added.Items.Count.ToString();
                lbl8ItemCounter.Text = lstb8SIMcardnr.Items.Count.ToString();
                lbl8AddedCounter.Text = lstb8Added.Items.Count.ToString();
                break;
            default:
                break;
        }
    }

    [System.Web.Services.WebMethod]
    public static string CheckUserName(string MANR)
    {
        DataAccessLayer dal = new DataAccessLayer();

        dal.AddParameter("@MANR", MANR, DbType.String);
        string exists = dal.ExecuteScalar("IF EXISTS (SELECT * FROM [Customers] WHERE [MANR] = @MANR) SELECT 'true' ELSE SELECT 'false'").ToString();
        dal.ClearParameters();

        return exists;
    }

    protected void btn1Add_Click(object sender, EventArgs e)
    {
        //3G Modem add
        //Checking if there is a selected item
        if (lstb1ID.SelectedItem != null)
        {
            //Checking if there is a selected item in the added list. If true then unselect the item
            //(This is due to the fact that an error will occur that there can only be one selected item in a list)
            if (lstb1Added.SelectedItem != null)
                lstb1Added.SelectedItem.Selected = false;
            
            //Add the selected item from the first list to the added list
            lstb1Added.Items.Add(lstb1ID.SelectedItem);
            
            //Remove the selected item from the first list
            lstb1ID.Items.Remove(lstb1ID.SelectedItem);

            //If the first list becomes empty then turn the btn1Add grey
            btn1Add.Enabled = lstb1ID.Items.Count == 0 ? false : true;
            
            //Turning the remove button grey since it now has items
            btn1Remove.Enabled = true;

            UpdateCounters(UpdateItemType.Modem);
        }
    }
    protected void btn2Add_Click(object sender, EventArgs e)
    {
        //Token add
        if (lstb2Serialnumber.SelectedItem != null)
        {
            if (lstb2Added.SelectedItem != null)
                lstb2Added.SelectedItem.Selected = false;

            lstb2Added.Items.Add(lstb2Serialnumber.SelectedItem);
            lstb2Serialnumber.Items.Remove(lstb2Serialnumber.SelectedItem);

            btn2Add.Enabled = lstb2Serialnumber.Items.Count == 0 ? false : true;
            btn2Remove.Enabled = true;

            UpdateCounters(UpdateItemType.Token);
        }
    }
    protected void btn3Add_Click(object sender, EventArgs e)
    {
        //Laptop add
        if (lstb3Serialnumber.SelectedItem != null)
        {
            if (lstb3Added.SelectedItem != null)
                lstb3Added.SelectedItem.Selected = false;

            lstb3Added.Items.Add(lstb3Serialnumber.SelectedItem);
            lstb3Serialnumber.Items.Remove(lstb3Serialnumber.SelectedItem);

            btn3Add.Enabled = lstb3Serialnumber.Items.Count == 0 ? false : true;
            btn3Remove.Enabled = true;

            UpdateCounters(UpdateItemType.Laptop);
        }
    }
    protected void btn4Add_Click(object sender, EventArgs e)
    {
        //Printer add
        if (lstb4Serialnumber.SelectedItem != null)
        {
            if (lstb4Added.SelectedItem != null)
                lstb4Added.SelectedItem.Selected = false;

            lstb4Added.Items.Add(lstb4Serialnumber.SelectedItem);
            lstb4Serialnumber.Items.Remove(lstb4Serialnumber.SelectedItem);

            btn4Add.Enabled = lstb4Serialnumber.Items.Count == 0 ? false : true;
            btn4Remove.Enabled = true;

            UpdateCounters(UpdateItemType.Printer);
        }
    }
    protected void btn5Add_Click(object sender, EventArgs e)
    {
        //Projector add
        if (lstb5Serialnumber.SelectedItem != null)
        {
            if (lstb5Added.SelectedItem != null)
                lstb5Added.SelectedItem.Selected = false;

            lstb5Added.Items.Add(lstb5Serialnumber.SelectedItem);
            lstb5Serialnumber.Items.Remove(lstb5Serialnumber.SelectedItem);

            btn5Add.Enabled = lstb5Serialnumber.Items.Count == 0 ? false : true;
            btn5Remove.Enabled = true;

            UpdateCounters(UpdateItemType.Projector);
        }
    }
    protected void btn6Add_Click(object sender, EventArgs e)
    {
        //USB-key add
        if (lstb6Serialnumber.SelectedItem != null)
        {
            if (lstb6Added.SelectedItem != null)
                lstb6Added.SelectedItem.Selected = false;

            lstb6Added.Items.Add(lstb6Serialnumber.SelectedItem);
            lstb6Serialnumber.Items.Remove(lstb6Serialnumber.SelectedItem);

            btn6Add.Enabled = lstb6Serialnumber.Items.Count == 0 ? false : true;
            btn6Remove.Enabled = true;

            UpdateCounters(UpdateItemType.USBkey);
        }
    }
    protected void btn7Add_Click(object sender, EventArgs e)
    {
        //Phone add
        if (lstb7ID.SelectedItem != null)
        {
            if (lstb7Added.SelectedItem != null)
                lstb7Added.SelectedItem.Selected = false;

            lstb7Added.Items.Add(lstb7ID.SelectedItem);
            lstb7ID.Items.Remove(lstb7ID.SelectedItem);

            btn7Add.Enabled = lstb7ID.Items.Count == 0 ? false : true;
            btn7Remove.Enabled = true;

            UpdateCounters(UpdateItemType.Phone);
        }
    }
    protected void btn8Add_Click(object sender, EventArgs e)
    {
        //SIMcard add
        if (lstb8SIMcardnr.SelectedItem != null)
        {
            if (lstb8Added.SelectedItem != null)
                lstb8Added.SelectedItem.Selected = false;

            lstb8Added.Items.Add(lstb8SIMcardnr.SelectedItem);
            lstb8SIMcardnr.Items.Remove(lstb8SIMcardnr.SelectedItem);

            btn8Add.Enabled = lstb8SIMcardnr.Items.Count == 0 ? false : true;
            btn8Remove.Enabled = true;

            UpdateCounters(UpdateItemType.SIMcard);
        }
    }
    protected void btn1Remove_Click(object sender, EventArgs e)
    {
        //3G Modem
        //Remove the item from the added list
        if (lstb1Added.SelectedItem != null)
        {
            if (lstb1ID.SelectedItem != null)
                lstb1ID.SelectedItem.Selected = false;

            lstb1ID.Items.Add(lstb1Added.SelectedItem);
            lstb1Added.Items.Remove(lstb1Added.SelectedItem);

            btn1Remove.Enabled = lstb1Added.Items.Count == 0 ? false : true;

            btn1Add.Enabled = true;

            UpdateCounters(UpdateItemType.Modem);
        }
    }
    protected void btn2Remove_Click(object sender, EventArgs e)
    {
        //Token
        //Remove the item from the added list
        if (lstb2Added.SelectedItem != null)
        {
            if (lstb2Serialnumber.SelectedItem != null)
                lstb2Serialnumber.SelectedItem.Selected = false;

            lstb2Serialnumber.Items.Add(lstb2Added.SelectedItem);
            lstb2Added.Items.Remove(lstb2Added.SelectedItem);

            btn2Remove.Enabled = lstb2Added.Items.Count == 0 ? false : true;

            btn2Add.Enabled = true;

            UpdateCounters(UpdateItemType.Token);
        }
    }
    protected void btn3Remove_Click(object sender, EventArgs e)
    {
        //Laptop
        //Remove the item from the added list
        if (lstb3Added.SelectedItem != null)
        {
            if (lstb3Serialnumber.SelectedItem != null)
                lstb3Serialnumber.SelectedItem.Selected = false;

            lstb3Serialnumber.Items.Add(lstb3Added.SelectedItem);
            lstb3Added.Items.Remove(lstb3Added.SelectedItem);

            btn3Remove.Enabled = lstb3Added.Items.Count == 0 ? false : true;

            btn3Add.Enabled = true;

            UpdateCounters(UpdateItemType.Laptop);
        }
    }
    protected void btn4Remove_Click(object sender, EventArgs e)
    {
        //Printer
        //Remove the item from the added list
        if (lstb4Added.SelectedItem != null)
        {
            if (lstb4Serialnumber.SelectedItem != null)
                lstb4Serialnumber.SelectedItem.Selected = false;

            lstb4Serialnumber.Items.Add(lstb4Added.SelectedItem);
            lstb4Added.Items.Remove(lstb4Added.SelectedItem);

            btn4Remove.Enabled = lstb4Added.Items.Count == 0 ? false : true;

            btn4Add.Enabled = true;

            UpdateCounters(UpdateItemType.Printer);
        }
    }
    protected void btn5Remove_Click(object sender, EventArgs e)
    {
        //Projector
        //Remove the item from the added list
        if (lstb5Added.SelectedItem != null)
        {
            if (lstb5Serialnumber.SelectedItem != null)
                lstb5Serialnumber.SelectedItem.Selected = false;

            lstb5Serialnumber.Items.Add(lstb5Added.SelectedItem);
            lstb5Added.Items.Remove(lstb5Added.SelectedItem);

            btn5Remove.Enabled = lstb5Added.Items.Count == 0 ? false : true;

            btn5Add.Enabled = true;

            UpdateCounters(UpdateItemType.Projector);
        }
    }
    protected void btn6Remove_Click(object sender, EventArgs e)
    {
        //USB-key
        //Remove the item from the added list
        if (lstb6Added.SelectedItem != null)
        {
            if (lstb6Serialnumber.SelectedItem != null)
                lstb6Serialnumber.SelectedItem.Selected = false;

            lstb6Serialnumber.Items.Add(lstb6Added.SelectedItem);
            lstb6Added.Items.Remove(lstb6Added.SelectedItem);

            btn6Remove.Enabled = lstb6Added.Items.Count == 0 ? false : true;

            btn6Add.Enabled = true;

            UpdateCounters(UpdateItemType.USBkey);
        }
    }
    protected void btn7Remove_Click(object sender, EventArgs e)
    {
        //Phone
        //Remove the item from the added list
        if (lstb7Added.SelectedItem != null)
        {
            if (lstb7ID.SelectedItem != null)
                lstb7ID.SelectedItem.Selected = false;

            lstb7ID.Items.Add(lstb7Added.SelectedItem);
            lstb7Added.Items.Remove(lstb7Added.SelectedItem);

            btn7Remove.Enabled = lstb7Added.Items.Count == 0 ? false : true;

            btn7Add.Enabled = true;

            UpdateCounters(UpdateItemType.Phone);
        }
    }
    protected void btn8Remove_Click(object sender, EventArgs e)
    {
        //SIM-card
        //Remove the item from the added list
        if (lstb8Added.SelectedItem != null)
        {
            if (lstb8SIMcardnr.SelectedItem != null)
                lstb8SIMcardnr.SelectedItem.Selected = false;

            lstb8SIMcardnr.Items.Add(lstb8Added.SelectedItem);
            lstb8Added.Items.Remove(lstb8Added.SelectedItem);

            btn8Remove.Enabled = lstb8Added.Items.Count == 0 ? false : true;

            btn8Add.Enabled = true;

            UpdateCounters(UpdateItemType.SIMcard);
        }
    }
    protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        Page.Validate();
        if (!Page.IsValid)
        {
            e.Cancel = true;
        }
        else
        {
            if (Wizard1.ActiveStepIndex == 0)
            {
                DataAccessLayer dal = new DataAccessLayer();
                string MANR;

                dal.AddParameter("@MANR", txtMANR.Text, DbType.String);
                MANR = dal.ExecuteScalar("SELECT dbo.MANRExists(@MANR)").ToString();
                dal.ClearParameters();

                if (MANR == "0")
                {
                    e.Cancel = true;
                    ShowError("MANR existerer ikke");
                    hplAddNewCustomer.Visible = true;
                }

                DateTime dateFrom;
                DateTime dateTo;

                if (!DateTime.TryParse(txtDateFrom.Text, out dateFrom))
                {
                    e.Cancel = true;
                    ShowError("Du skal indtaste en valid startdato");
                }

                if (!DateTime.TryParse(txtDateTo.Text, out dateTo) && txtDateTo.Text != String.Empty)
                {
                    e.Cancel = true;
                    ShowError("Du skal indtaste en valid slutdato");
                }
                
                if (txtDateTo.Text == "")
                {
                    dateTo = new DateTime(9999, 12, 31);
                }

                if (dateFrom > dateTo)
                {
                    e.Cancel = true;
                    ShowError("Slutdatoen kan ikke komme før startdatoen");
                }

                if (ddlLoanType.SelectedIndex == 0)
                {
                    ShowError("Du skal vælge en udlånstype");
                    e.Cancel = true;
                }
            }
        }
    }
    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        Page.Validate();
        if (!Page.IsValid)
        {
            e.Cancel = true;
        }
        else if (CheckIfDatesOverlap())
        {
            ShowError("En genstand viste sig at være optaget i tidsrummet. Prøv igen.");
            e.Cancel = true;
            Wizard1.ActiveStepIndex = 1;
        }
        else
        {
            DataAccessLayer dal = new DataAccessLayer();
            string CustomerID = "";
            dal.AddParameter("@MANR", txtMANR.Text, DbType.String);
            CustomerID = dal.ExecuteScalar("SELECT [ID] FROM [Customers] WHERE [MANR] = @MANR").ToString();
            dal.ClearParameters();

            if (CustomerID == "0")
            {
                ShowError("MANR existerer ikke");
                Wizard1.ActiveStepIndex = 0;
                e.Cancel = true;
            }
            else
            {
                AddLoan(CustomerID);
            }
        }
    }

    protected bool CheckIfDatesOverlap()
    {
        DataAccessLayer dal = new DataAccessLayer();

        bool Result = false;

        List<ListBox> boxes = new List<ListBox>();
        boxes.AddRange(new ListBox[] { lstb1Added, lstb2Added, lstb3Added, lstb4Added, lstb5Added, lstb6Added, lstb7Added, lstb8Added });

        foreach (ListBox lstbox in boxes)
        {
            foreach (ListItem item in lstbox.Items)
            {
                dal.AddParameter("@ItemID", item.Value, DbType.Int32);
                dal.AddParameter("@StartDate", txtDateFrom.Text, DbType.Date);
                dal.AddParameter("@EndDate", txtDateTo.Text, DbType.Date);
                dal.AddParameter("@Type", lstbox.ID[4], DbType.Int32);
                string DateOverlaps = dal.ExecuteScalar("SELECT dbo.ItemAvailable(@StartDate, @EndDate, @ItemID, @Type)").ToString();
                dal.ClearParameters();

                Result = DateOverlaps == "1" ? true : false;
            }
        }

        return Result;
    }
    protected void AddLoan(string CustomerID)
    {
        DateTime dateFrom = Convert.ToDateTime(txtDateFrom.Text);
        DateTime dateTo = txtDateTo.Text == String.Empty ? new DateTime(9999, 12, 31) : Convert.ToDateTime(txtDateTo.Text);

        DataAccessLayer dal = new DataAccessLayer();

        dal.AddParameter("@CustomerRefID", CustomerID, DbType.Int32);
        dal.AddParameter("@DateFrom", dateFrom, DbType.Date);
        dal.AddParameter("@DateTo", dateTo, DbType.Date);
        dal.AddParameter("@TypeRefID", ddlLoanType.SelectedValue, DbType.Int32);
        dal.AddParameter("@Comment", txtComment.Text, DbType.String);
        dal.AddParameter("@CreatedBy", Membership.GetUser().ProviderUserKey, DbType.Guid);
        string LoanID = dal.ExecuteScalar("DECLARE @LastID INT;EXEC @LastID = dbo.CreateLoan @CustomerRefID, @DateFrom, @DateTo, @TypeRefID, @Comment, @CreatedBy;SELECT @LastID").ToString();
        dal.ClearParameters();

        List<ListBox> boxes = new List<ListBox>();
        boxes.AddRange(new ListBox[]{lstb1Added, lstb2Added, lstb3Added, lstb4Added, lstb5Added, lstb6Added, lstb7Added, lstb8Added});

        foreach (ListBox lstbox in boxes)
        {
            foreach (ListItem item in lstbox.Items)
            {
                dal.AddParameter("@Type", lstbox.ID[4], DbType.Int32);
                dal.AddParameter("@ItemRefID", item.Value, DbType.Int32);
                dal.AddParameter("@LoanID", LoanID, DbType.Int32);
                dal.AddParameter("@AddedBy", Membership.GetUser().ProviderUserKey, DbType.Guid);
                dal.ExecuteNonQuery("EXEC dbo.[InsertLoanDetails] @Type, @ItemRefID, @LoanID, @AddedBy");
                dal.ClearParameters();
            }
        }

        for (int row = 0; row < gvMisc.Rows.Count; row++)
        {
            int count = Convert.ToInt32(((TextBox)gvMisc.Rows[row].FindControl("txtCount")).Text);

            if (count > 0)
            {
                dal.AddParameter("@ItemMiscTypeRefID", gvMisc.DataKeys[row]["ID"], DbType.Int32);
                dal.AddParameter("@ItemCount", count, DbType.Int32);
                dal.AddParameter("@LoanID", LoanID, DbType.Int32);
                dal.AddParameter("@AddedBy", Membership.GetUser().ProviderUserKey, DbType.Guid);
                dal.ExecuteNonQuery("EXEC dbo.[InsertLoanDetailsMisc] @ItemMiscTypeRefID, @ItemCount, @LoanID, @AddedBy");
                dal.ClearParameters();
            }
        }

        Response.Redirect("LoanDetails.aspx?ID=" + LoanID);
    }
    protected void Wizard1_ActiveStepChanged(object sender, EventArgs e)
    {
        if (Wizard1.ActiveStepIndex == 1 && !(bool)ViewState["itemListsFilled"])
        {
            FillItemLists();
            ViewState["itemListsFilled"] = true;
        }
    }

    private void FillItemLists()
    {
        DateTime dateFrom = Convert.ToDateTime(txtDateFrom.Text);
        DateTime dateTo = txtDateFrom.Text == String.Empty ? new DateTime(9999, 12, 31) : Convert.ToDateTime(txtDateFrom.Text);

        DataAccessLayer dal = new DataAccessLayer();

        DataTable tblModem = new DataTable();
        DataTable tblToken = new DataTable();
        DataTable tblLaptop = new DataTable();
        DataTable tblPrinter = new DataTable();
        DataTable tblProjector = new DataTable();
        DataTable tblUSBKey = new DataTable();
        DataTable tblPhone = new DataTable();
        DataTable tblSIMcard = new DataTable();
        List<ListItem> lstModemID = new List<ListItem>();
        List<ListItem> lstTokenSerialnumber = new List<ListItem>();
        List<ListItem> lstLaptopSerialnumber = new List<ListItem>();
        List<ListItem> lstPrinterSerialnumber = new List<ListItem>();
        List<ListItem> lstProjectorSerialnumber = new List<ListItem>();
        List<ListItem> lstUSBKeySerialnumber = new List<ListItem>();
        List<ListItem> lstPhoneID = new List<ListItem>();
        List<ListItem> lstSIMcardSIMcardnr = new List<ListItem>();

        dal.AddParameter("@StartDate", dateFrom, DbType.Date);
        dal.AddParameter("@EndDate", dateTo, DbType.Date);
        tblModem = dal.ExecuteDataTable("SELECT * FROM dbo.AvailableModems(@StartDate, @EndDate) ORDER BY [ID]");
        dal.ClearParameters();

        dal.AddParameter("@StartDate", dateFrom, DbType.Date);
        dal.AddParameter("@EndDate", dateTo, DbType.Date);
        tblToken = dal.ExecuteDataTable("SELECT * FROM dbo.AvailableTokens(@StartDate, @EndDate) ORDER BY [ID]");
        dal.ClearParameters();

        dal.AddParameter("@StartDate", dateFrom, DbType.Date);
        dal.AddParameter("@EndDate", dateTo, DbType.Date);
        tblLaptop = dal.ExecuteDataTable("SELECT * FROM dbo.AvailableLaptops(@StartDate, @EndDate) ORDER BY [ID]");
        dal.ClearParameters();

        dal.AddParameter("@StartDate", dateFrom, DbType.Date);
        dal.AddParameter("@EndDate", dateTo, DbType.Date);
        tblPrinter = dal.ExecuteDataTable("SELECT * FROM dbo.AvailablePrinters(@StartDate, @EndDate) ORDER BY [ID]");
        dal.ClearParameters();

        dal.AddParameter("@StartDate", dateFrom, DbType.Date);
        dal.AddParameter("@EndDate", dateTo, DbType.Date);
        tblProjector = dal.ExecuteDataTable("SELECT * FROM dbo.AvailableProjectors(@StartDate, @EndDate) ORDER BY [ID]");
        dal.ClearParameters();

        dal.AddParameter("@StartDate", dateFrom, DbType.Date);
        dal.AddParameter("@EndDate", dateTo, DbType.Date);
        tblUSBKey = dal.ExecuteDataTable("SELECT * FROM dbo.AvailableUSBkeys(@StartDate, @EndDate) ORDER BY [ID]");
        dal.ClearParameters();

        dal.AddParameter("@StartDate", dateFrom, DbType.Date);
        dal.AddParameter("@EndDate", dateTo, DbType.Date);
        tblPhone = dal.ExecuteDataTable("SELECT * FROM dbo.AvailablePhones(@StartDate, @EndDate) ORDER BY [ID]");
        dal.ClearParameters();

        dal.AddParameter("@StartDate", dateFrom, DbType.Date);
        dal.AddParameter("@EndDate", dateTo, DbType.Date);
        tblSIMcard = dal.ExecuteDataTable("SELECT * FROM dbo.AvailableSIMcards(@StartDate, @EndDate) ORDER BY [ID]");
        dal.ClearParameters();

        foreach (DataRow row in tblModem.Rows) { lstModemID.Add(new ListItem((row[0].ToString() + " - " + row[1].ToString()), row[0].ToString())); }
        foreach (DataRow row in tblToken.Rows) { lstTokenSerialnumber.Add(new ListItem(row[1].ToString(), row[0].ToString())); }
        foreach (DataRow row in tblLaptop.Rows) { lstLaptopSerialnumber.Add(new ListItem(row[0].ToString() + " - " + row[1].ToString(), row[0].ToString())); }
        foreach (DataRow row in tblPrinter.Rows) { lstPrinterSerialnumber.Add(new ListItem(row[1].ToString(), row[0].ToString())); }
        foreach (DataRow row in tblProjector.Rows) { lstProjectorSerialnumber.Add(new ListItem(row[1].ToString(), row[0].ToString())); }
        foreach (DataRow row in tblUSBKey.Rows) { lstUSBKeySerialnumber.Add(new ListItem(row[1].ToString(), row[0].ToString())); }
        foreach (DataRow row in tblPhone.Rows) { lstPhoneID.Add(new ListItem((row[0].ToString() + " - " + row[1].ToString()), row[0].ToString())); }
        foreach (DataRow row in tblSIMcard.Rows) { lstSIMcardSIMcardnr.Add(new ListItem(row[1].ToString(), row[0].ToString())); }

        if (lstModemID.Count > 0) { btn1Add.Enabled = true; }
        if (lstTokenSerialnumber.Count > 0) { btn2Add.Enabled = true; }
        if (lstLaptopSerialnumber.Count > 0) { btn3Add.Enabled = true; }
        if (lstPrinterSerialnumber.Count > 0) { btn4Add.Enabled = true; }
        if (lstProjectorSerialnumber.Count > 0) { btn5Add.Enabled = true; }
        if (lstUSBKeySerialnumber.Count > 0) { btn6Add.Enabled = true; }
        if (lstPhoneID.Count > 0) { btn7Add.Enabled = true; }
        if (lstSIMcardSIMcardnr.Count > 0) { btn8Add.Enabled = true; }

        lstb1ID.Items.Clear();
        lstb2Serialnumber.Items.Clear();
        lstb3Serialnumber.Items.Clear();
        lstb4Serialnumber.Items.Clear();
        lstb5Serialnumber.Items.Clear();
        lstb6Serialnumber.Items.Clear();
        lstb7ID.Items.Clear();
        lstb8SIMcardnr.Items.Clear();

        lstb1ID.Items.AddRange(lstModemID.ToArray());
        lstb2Serialnumber.Items.AddRange(lstTokenSerialnumber.ToArray());
        lstb3Serialnumber.Items.AddRange(lstLaptopSerialnumber.ToArray());
        lstb4Serialnumber.Items.AddRange(lstPrinterSerialnumber.ToArray());
        lstb5Serialnumber.Items.AddRange(lstProjectorSerialnumber.ToArray());
        lstb6Serialnumber.Items.AddRange(lstUSBKeySerialnumber.ToArray());
        lstb7ID.Items.AddRange(lstPhoneID.ToArray());
        lstb8SIMcardnr.Items.AddRange(lstSIMcardSIMcardnr.ToArray());

        lstb1Added.Items.Clear();
        lstb2Added.Items.Clear();
        lstb3Added.Items.Clear();
        lstb4Added.Items.Clear();
        lstb5Added.Items.Clear();
        lstb6Added.Items.Clear();
        lstb7Added.Items.Clear();
        lstb8Added.Items.Clear();

        btn1Remove.Enabled = false;
        btn2Remove.Enabled = false;
        btn3Remove.Enabled = false;
        btn4Remove.Enabled = false;
        btn5Remove.Enabled = false;
        btn6Remove.Enabled = false;
        btn7Remove.Enabled = false;
        btn8Remove.Enabled = false;

        UpdateCounters(UpdateItemType.All);
    }
    private void ShowError(string msg)
    {
        lblError.Text = msg;
        lblError.Visible = true;
    }
    protected void lnkbtnUpdateMAT_Click(object sender, EventArgs e)
    {
        List<ListItem> lstModemID = new List<ListItem>();
        List<ListItem> lstTokenSerialnumber = new List<ListItem>();
        List<ListItem> lstLaptopSerialnumber = new List<ListItem>();
        List<ListItem> lstPrinterSerialnumber = new List<ListItem>();
        List<ListItem> lstProjectorSerialnumber = new List<ListItem>();
        List<ListItem> lstUSBKeySerialnumber = new List<ListItem>();
        List<ListItem> lstPhoneID = new List<ListItem>();
        List<ListItem> lstSIMcardSIMcardnr = new List<ListItem>();

        foreach (ListItem item in lstb1Added.Items)
            lstModemID.Add(item);
        foreach (ListItem item in lstb2Added.Items)
            lstTokenSerialnumber.Add(item);
        foreach (ListItem item in lstb3Added.Items)
            lstLaptopSerialnumber.Add(item);
        foreach (ListItem item in lstb4Added.Items)
            lstPrinterSerialnumber.Add(item);
        foreach (ListItem item in lstb5Added.Items)
            lstProjectorSerialnumber.Add(item);
        foreach (ListItem item in lstb6Added.Items)
            lstUSBKeySerialnumber.Add(item);
        foreach (ListItem item in lstb7Added.Items)
            lstPhoneID.Add(item);
        foreach (ListItem item in lstb8Added.Items)
            lstSIMcardSIMcardnr.Add(item);

        FillItemLists();

        foreach (ListItem item in lstModemID)
        {
            if (lstb1ID.Items.Contains(item))
            {
                lstb1ID.Items.Remove(item);
                lstb1Added.Items.Add(item);
            }
        }
        foreach (ListItem item in lstTokenSerialnumber)
        {
            if (lstb2Serialnumber.Items.Contains(item))
            {
                lstb2Serialnumber.Items.Remove(item);
                lstb2Added.Items.Add(item);
            }
        }
        foreach (ListItem item in lstLaptopSerialnumber)
        {
            if (lstb3Serialnumber.Items.Contains(item))
            {
                lstb3Serialnumber.Items.Remove(item);
                lstb3Added.Items.Add(item);
            }
        }
        foreach (ListItem item in lstPrinterSerialnumber)
        {
            if (lstb4Serialnumber.Items.Contains(item))
            {
                lstb4Serialnumber.Items.Remove(item);
                lstb4Added.Items.Add(item);
            }
        }
        foreach (ListItem item in lstProjectorSerialnumber)
        {
            if (lstb5Serialnumber.Items.Contains(item))
            {
                lstb5Serialnumber.Items.Remove(item);
                lstb5Added.Items.Add(item);
            }
        }
        foreach (ListItem item in lstUSBKeySerialnumber)
        {
            if (lstb6Serialnumber.Items.Contains(item))
            {
                lstb6Serialnumber.Items.Remove(item);
                lstb6Added.Items.Add(item);
            }
        }
        foreach (ListItem item in lstPhoneID)
        {
            if (lstb7ID.Items.Contains(item))
            {
                lstb7ID.Items.Remove(item);
                lstb7Added.Items.Add(item);
            }
        }
        foreach (ListItem item in lstSIMcardSIMcardnr)
        {
            if (lstb8SIMcardnr.Items.Contains(item))
            {
                lstb8SIMcardnr.Items.Remove(item);
                lstb8Added.Items.Add(item);
            }
        }

        UpdateCounters(UpdateItemType.All);
    }

    enum UpdateItemType
    {
        Modem,
        Token,
        Laptop,
        Printer,
        Projector,
        USBkey,
        Phone,
        SIMcard,
        All
    }
}