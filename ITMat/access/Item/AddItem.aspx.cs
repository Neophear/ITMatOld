using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Stiig;

public partial class AddItem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int type = 0;

        if (Request.QueryString["type"] == null)
            type = 1;
        else if (!int.TryParse(Request.QueryString["type"], out type) || type < 1 || type > 8)
            Response.Redirect("~/Error.aspx?c=WrongType", true);

        lblErrorMsg.Visible = false;
        if (!IsPostBack)
        {
            ((TextBox)dvModem.FindControl("txtIMEI")).Attributes.Add("OnBlur", "ShowAvailability(this, 1)");
            ((TextBox)dvToken.FindControl("txtSerialnumber")).Attributes.Add("OnBlur", "ShowAvailability(this, 2)");
            ((TextBox)dvLaptop.FindControl("txtSerialnumber")).Attributes.Add("OnBlur", "ShowAvailability(this, 3)");
            ((TextBox)dvPrinter.FindControl("txtSerialnumber")).Attributes.Add("OnBlur", "ShowAvailability(this, 4)");
            ((TextBox)dvProjector.FindControl("txtSerialnumber")).Attributes.Add("OnBlur", "ShowAvailability(this, 5)");
            ((TextBox)dvUSBKey.FindControl("txtSerialnumber")).Attributes.Add("OnBlur", "ShowAvailability(this, 6)");
            ((TextBox)dvPhone.FindControl("txtIMEI")).Attributes.Add("OnBlur", "ShowAvailability(this, 7)");
            ((TextBox)dvSIMcard.FindControl("txtSIMcardnr")).Attributes.Add("OnBlur", "ShowAvailability(this, 8)");
            ChangeType(type);
        }
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static string[] GetSIMcardList(string prefixText, int count)
    {
        // Get the SIMcards From Data Source. Change this method to use Database
        List<string> SIMcards = new List<string>();
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.ExecuteDataTable("SELECT [SIMcardnr] FROM [SIMcard] WHERE [ID] NOT IN (SELECT [SIMcardRefID] FROM [Modem] WHERE [Deleted] = 0 AND [SIMcardRefID] IS NOT null) AND [Deleted] = 0");

        foreach (DataRow row in dt.Rows)
        {
            SIMcards.Add(row[0].ToString());
        }

        // Find All Matching SIMcards
        var list = from p in SIMcards
                   where p.Contains(prefixText)
                   select p;

        //Convert to Array as We need to return Array
        string[] prefixTextArray = list.ToArray<string>();

        //Return Selected SIMcards
        return prefixTextArray;
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static string[] GetBrand(string prefixText, int count)
    {
        List<string> brands = new List<string>();
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.ExecuteDataTable("EXEC [dbo].[GetBrands]");

        foreach (DataRow row in dt.Rows)
        {
            brands.Add(row[0].ToString());
        }

        var list = from p in brands
                   where p.ToLower().StartsWith(prefixText.ToLower())
                   select p;

        string[] prefixTextArray = list.ToArray<string>();

        return prefixTextArray;
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static string[] GetModel(string prefixText, int count)
    {
        List<string> models = new List<string>();
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.ExecuteDataTable("EXEC [dbo].[GetModels]");

        foreach (DataRow row in dt.Rows)
        {
            models.Add(row[0].ToString());
        }

        var list = from p in models
                   where p.ToLower().StartsWith(prefixText.ToLower())
                   select p;

        string[] prefixTextArray = list.ToArray<string>();

        return prefixTextArray;
    }

    protected void ddlChangeType_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("~/access/Item/AddItem.aspx?type=" + ddlChangeType.SelectedValue, true);
    }
    private void ChangeType(int type)
    {
        switch (type)
        {
            case 1:
                dvModem.Visible = dvModem.Enabled = true;
                break;
            case 2:
                dvToken.Visible = dvToken.Enabled = true;
                break;
            case 3:
                dvLaptop.Visible = dvLaptop.Enabled = true;
                break;
            case 4:
                dvPrinter.Visible = dvPrinter.Enabled = true;
                break;
            case 5:
                dvProjector.Visible = dvProjector.Enabled = true;
                break;
            case 6:
                dvUSBKey.Visible = dvUSBKey.Enabled = true;
                break;
            case 7:
                dvPhone.Visible = dvPhone.Enabled = true;
                break;
            case 8:
                dvSIMcard.Visible = dvSIMcard.Enabled = true;
                break;
            default:
                break;
        }

        ddlChangeType.SelectedValue = type.ToString();
    }

    protected void SetError(string errorCodes)
    {
        lblErrorMsg.Visible = true;
        lblErrorMsg.Text = Utilities.GetErrorMsg(errorCodes);
    }

    protected void ItemInserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        Response.Redirect("~/access/Item/Item.aspx?type=" + ddlChangeType.SelectedValue + "&ID=" + e.Command.Parameters["@LastID"].Value);
    }

    protected void dvModem_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        Modem modem = new Modem();
        TextBox txtNewSIMcard = (TextBox)dvModem.FindControl("txtNewSIMcard");

        modem.IMEI = e.Values["IMEI"].ToString();

        string errors = Utilities.CheckIfExists(modem);

        if (errors.Length > 0)
        {
            e.Cancel = true;
            SetError(errors);
        }

        if (txtNewSIMcard.Text.Length != 0)
        {
            DataAccessLayer dal = new DataAccessLayer();

            dal.AddParameter("@SIMcardnr", txtNewSIMcard.Text, DbType.String);
            object BoundModemID = dal.ExecuteScalar("SELECT M.[ID] FROM [Modem] M INNER JOIN [SIMcard] S ON M.SIMcardRefID = S.ID WHERE S.SIMcardnr = @SIMcardnr");


            if (BoundModemID != null)
            {
                lblErrorMsg.Visible = true;
                lblErrorMsg.Text = "SIM-kortet er allerede forbundet til modem #" + BoundModemID.ToString();
                e.Cancel = true;
            }
            else
            {
                e.Values["SIMcardnr"] = txtNewSIMcard.Text;
            }
        }

        e.Values["CreatedBy"] = Membership.GetUser().ProviderUserKey;
    }
    protected void dvToken_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        Token token = new Token();

        token.Serialnumber = e.Values["Serialnumber"].ToString();

        string errors = Utilities.CheckIfExists(token);

        if (errors.Length > 0)
        {
            e.Cancel = true;
            SetError(errors);
        }

        e.Values["CreatedBy"] = Membership.GetUser().ProviderUserKey;
    }
    protected void dvLaptop_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        Laptop laptop = new Laptop();

        laptop.Serialnumber = e.Values["Serialnumber"].ToString();
        laptop.GUID = e.Values["GUID"] != null ? e.Values["GUID"].ToString() : String.Empty;
        laptop.Name = e.Values["Name"] != null ? e.Values["Name"].ToString() : String.Empty;
        laptop.Description = e.Values["Description"] != null ? e.Values["Description"].ToString() : String.Empty;

        string errors = Utilities.CheckIfExists(laptop);

        if (errors.Length > 0)
        {
            e.Cancel = true;
            SetError(errors);
        }

        e.Values["CreatedBy"] = Membership.GetUser().ProviderUserKey;
    }
    protected void dvPrinter_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        Printer printer = new Printer();

        printer.Serialnumber = e.Values["Serialnumber"].ToString();
        printer.Name = e.Values["Name"] != null ? e.Values["Name"].ToString() : String.Empty;

        string errors = Utilities.CheckIfExists(printer);

        if (errors.Length > 0)
        {
            e.Cancel = true;
            SetError(errors);
        }

        e.Values["CreatedBy"] = Membership.GetUser().ProviderUserKey;
    }
    protected void dvProjector_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        Projector projector = new Projector();

        projector.Serialnumber = e.Values["Serialnumber"].ToString();

        string errors = Utilities.CheckIfExists(projector);

        if (errors.Length > 0)
        {
            e.Cancel = true;
            SetError(errors);
        }

        e.Values["CreatedBy"] = Membership.GetUser().ProviderUserKey;
    }
    protected void dvUSBKey_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        USBKey usbkey = new USBKey();

        usbkey.Serialnumber = e.Values["Serialnumber"].ToString();

        string errors = Utilities.CheckIfExists(usbkey);

        if (errors.Length > 0)
        {
            e.Cancel = true;
            SetError(errors);
        }

        e.Values["CreatedBy"] = Membership.GetUser().ProviderUserKey;
    }
    protected void dvPhone_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        Phone phone = new Phone();

        phone.IMEI = e.Values["IMEI"].ToString();

        string errors = Utilities.CheckIfExists(phone);

        if (errors.Length > 0)
        {
            e.Cancel = true;
            SetError(errors);
        }

        e.Values["CreatedBy"] = Membership.GetUser().ProviderUserKey;
    }
    protected void dvSIMcard_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        SIMcard simcard = new SIMcard();

        simcard.SIMcardnr = e.Values["SIMcardnr"].ToString();
        simcard.Phonenr = e.Values["Phonenr"] == null ? String.Empty : e.Values["Phonenr"].ToString();

        string errors = Utilities.CheckIfExists(simcard);

        if (errors.Length > 0)
        {
            e.Cancel = true;
            SetError(errors);
        }

        e.Values["CreatedBy"] = Membership.GetUser().ProviderUserKey;
    }

    [System.Web.Services.WebMethod]
    public static string CheckItem(string item, int type)
    {
        DataAccessLayer dal = new DataAccessLayer();
        string exists = String.Empty;
        dal.AddParameter("@text", item.ToUpper(), DbType.String);

        switch (type)
        {
            case 1:
                exists = dal.ExecuteScalar("IF EXISTS (SELECT * FROM [Modem] WHERE [IMEI] = @text) SELECT 'false' ELSE SELECT 'true'").ToString();
                break;
            case 2:
                exists = dal.ExecuteScalar("IF EXISTS (SELECT * FROM [Tokens] WHERE [Serialnumber] = @text) SELECT 'false' ELSE SELECT 'true'").ToString();
                break;
            case 3:
                exists = dal.ExecuteScalar("IF EXISTS (SELECT * FROM [Laptop] WHERE [Serialnumber] = @text) SELECT 'false' ELSE SELECT 'true'").ToString();
                break;
            case 4:
                exists = dal.ExecuteScalar("IF EXISTS (SELECT * FROM [Printer] WHERE [Serialnumber] = @text) SELECT 'false' ELSE SELECT 'true'").ToString();
                break;
            case 5:
                exists = dal.ExecuteScalar("IF EXISTS (SELECT * FROM [Projector] WHERE [Serialnumber] = @text) SELECT 'false' ELSE SELECT 'true'").ToString();
                break;
            case 6:
                exists = dal.ExecuteScalar("IF EXISTS (SELECT * FROM [USBkey] WHERE [Serialnumber] = @text) SELECT 'false' ELSE SELECT 'true'").ToString();
                break;
            case 7:
                exists = dal.ExecuteScalar("IF EXISTS (SELECT * FROM [Phones] WHERE [IMEI] = @text) SELECT 'false' ELSE SELECT 'true'").ToString();
                break;
            case 8:
                exists = dal.ExecuteScalar("IF EXISTS (SELECT * FROM [SIMcard] WHERE [SIMcardnr] = @text) SELECT 'false' ELSE SELECT 'true'").ToString();
                break;
            default:
                break;
        }

        dal.ClearParameters();
        return exists;
    }
}