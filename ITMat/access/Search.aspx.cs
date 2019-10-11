using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Stiig;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string searchString = Request.QueryString["s"];

        if (searchString != null)
        {
            int QuerystringCount = Request.QueryString.Count;

            if (!IsPostBack)
            {
                txtSearch.Text = searchString;

                if (QuerystringCount > 1)
                    foreach (ListItem checkbox in cblSearchItems.Items)
                        checkbox.Selected = Request.QueryString[checkbox.Value] == "1";
            }

            bool searchModem = Request.QueryString["modem"] == "1";
            bool searchToken = Request.QueryString["token"] == "1";
            bool searchLaptop = Request.QueryString["laptop"] == "1";
            bool searchPrinter = Request.QueryString["printer"] == "1";
            bool searchProjector = Request.QueryString["projector"] == "1";
            bool searchUSBkey = Request.QueryString["usbkey"] == "1";
            bool searchPhone = Request.QueryString["phone"] == "1";
            bool searchSIMcard = Request.QueryString["simcard"] == "1";
            bool searchCustomer = Request.QueryString["customer"] == "1";
            bool searchAll = QuerystringCount == 1;

            DataAccessLayer dal = new DataAccessLayer();

            //Modem
            if (searchModem || searchAll)
            {
                dal.AddParameter("@Query", "%" + searchString + "%", DbType.String);
                DataTable modemTable = dal.ExecuteDataTable("SELECT * FROM dbo.SearchModem(@Query)");
                dal.ClearParameters();

                gvModem.DataSource = modemTable;
                gvModem.DataBind();
            }

            //Token
            if (searchToken || searchAll)
            {
                dal.AddParameter("@Query", "%" + searchString + "%", DbType.String);
                DataTable tokenTable = dal.ExecuteDataTable("SELECT * FROM dbo.SearchToken(@Query)");
                dal.ClearParameters();

                gvToken.DataSource = tokenTable;
                gvToken.DataBind();
            }

            //Laptop
            if (searchLaptop || searchAll)
            {
                dal.AddParameter("@Query", "%" + searchString + "%", DbType.String);
                DataTable laptopTable = dal.ExecuteDataTable("SELECT * FROM dbo.SearchLaptop(@Query)");
                dal.ClearParameters();

                gvLaptop.DataSource = laptopTable;
                gvLaptop.DataBind();
            }

            //Printer
            if (searchPrinter || searchAll)
            {
                dal.AddParameter("@Query", "%" + searchString + "%", DbType.String);
                DataTable printerTable = dal.ExecuteDataTable("SELECT * FROM dbo.SearchPrinter(@Query)");
                dal.ClearParameters();

                gvPrinter.DataSource = printerTable;
                gvPrinter.DataBind();
            }

            //Projector
            if (searchProjector || searchAll)
            {
                dal.AddParameter("@Query", "%" + searchString + "%", DbType.String);
                DataTable projectorTable = dal.ExecuteDataTable("SELECT * FROM dbo.SearchProjector(@Query)");
                dal.ClearParameters();

                gvProjector.DataSource = projectorTable;
                gvProjector.DataBind();
            }

            //USBkey
            if (searchUSBkey || searchAll)
            {
                dal.AddParameter("@Query", "%" + searchString + "%", DbType.String);
                DataTable usbKeyTable = dal.ExecuteDataTable("SELECT * FROM dbo.SearchUSBkey(@Query)");
                dal.ClearParameters();

                gvUSBkey.DataSource = usbKeyTable;
                gvUSBkey.DataBind();
            }

            //Phone
            if (searchPhone || searchAll)
            {
                dal.AddParameter("@Query", "%" + searchString + "%", DbType.String);
                DataTable phoneTable = dal.ExecuteDataTable("SELECT * FROM dbo.SearchPhone(@Query)");
                dal.ClearParameters();

                gvPhone.DataSource = phoneTable;
                gvPhone.DataBind();
            }

            //SIMcard
            if (searchSIMcard || searchAll)
            {
                dal.AddParameter("@Query", "%" + searchString + "%", DbType.String);
                DataTable simCardTable = dal.ExecuteDataTable("SELECT * FROM dbo.SearchSIMcard(@Query)");
                dal.ClearParameters();

                gvSIMcard.DataSource = simCardTable;
                gvSIMcard.DataBind();
            }

            //Customers
            if (searchCustomer || searchAll)
            {
                dal.AddParameter("@Query", "%" + searchString + "%", DbType.String);
                DataTable customersTable = dal.ExecuteDataTable("SELECT * FROM dbo.SearchCustomer(@Query)");
                dal.ClearParameters();

                gvCustomers.DataSource = customersTable;
                gvCustomers.DataBind();
            }
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string searchString = "~/access/Search.aspx?s=" + txtSearch.Text;

        foreach (ListItem checkbox in cblSearchItems.Items)
        {
            searchString += "&" + checkbox.Value;

            searchString += checkbox.Selected ? "=1" : "=0";
        }

        Response.Redirect(searchString);
    }
    protected void ItemDataBound(object sender, GridViewRowEventArgs e)
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
            case "gvPhone":
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
            string Location = String.Format("{0}?type={1}&ID={2}", ResolveUrl("~/access/Item/Item.aspx"), type, ID);
            e.Row.Attributes["onClick"] = string.Format("javascript:window.location='{0}';", Location);
            e.Row.Style["cursor"] = "pointer";
        }
    }
    protected void gvCustomers_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string ID = DataBinder.Eval(e.Row.DataItem, "ID").ToString();
            string Location = ResolveUrl("~/access/Customer/Customer.aspx") + "?ID=" + ID;
            e.Row.Attributes["onClick"] = string.Format("javascript:window.location='{0}';", Location);
            e.Row.Style["cursor"] = "pointer";
        }
    }
}