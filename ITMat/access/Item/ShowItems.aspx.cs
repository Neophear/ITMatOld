using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClosedXML.Excel;
using Stiig;

public partial class ShowItems : System.Web.UI.Page
{
    private int type = 0;
    private string filter = "0";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!int.TryParse(Request.QueryString["type"], out type))
            Response.Redirect("~/Error.aspx?c=WrongType", true);
        
        filter = Request.QueryString["filter"] == null ? "all" : Request.QueryString["filter"];

        lnkbtnExportToExcel.Visible = filter == "out";

        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = new DataTable();

        if (!IsPostBack)
        {
            switch (type)
            {
                case 1:
                    dt = dal.ExecuteDataTable("SELECT (SELECT COUNT(*) FROM [Modem] WHERE [Deleted] = 0), (SELECT COUNT(*) FROM [ModemIn]), (SELECT COUNT(*) FROM [ModemOut]), (SELECT COUNT(*) FROM [ModemDiscarded])");
                    
                    switch (filter)
	                {
                        case "all":
                            ViewState["modemSQL"] = "SELECT [Modem].*, [SIMcard].[SIMcardnr] FROM [Modem] LEFT JOIN [SIMcard] ON [Modem].[SIMcardRefID] = [SIMcard].[ID] WHERE [Modem].[Deleted] = 0";
                            break;
                        case "in":
                            ViewState["modemSQL"] = "SELECT * FROM [ModemIn]";
                            break;
                        case "out":
                            ViewState["modemSQL"] = "SELECT * FROM [ModemOut]";
                            break;
                        case "discarded":
                            ViewState["modemSQL"] = "SELECT * FROM [ModemDiscarded]";
                            break;
                        default:
                            Response.Redirect("~/Error.aspx?c=WrongFilter");
                            break;
	                }
                    
                    gvModem.Visible = true;
                    break;
                case 2:
                    dt = dal.ExecuteDataTable("SELECT (SELECT COUNT(*) FROM [Tokens] WHERE [Deleted] = 0), (SELECT COUNT(*) FROM [TokenIn]), (SELECT COUNT(*) FROM [TokenOut]), (SELECT COUNT(*) FROM [TokenDiscarded])");

                    switch (filter)
                    {
                        case "all":
                            ViewState["tokenSQL"] = "SELECT * FROM [Tokens] WHERE [Deleted] = 0";
                            break;
                        case "in":
                            ViewState["tokenSQL"] = "SELECT * FROM [TokenIn]";
                            break;
                        case "out":
                            ViewState["tokenSQL"] = "SELECT * FROM [TokenOut]";
                            break;
                        case "discarded":
                            ViewState["tokenSQL"] = "SELECT * FROM [TokenDiscarded]";
                            break;
                        default:
                            Response.Redirect("~/Error.aspx?c=WrongFilter");
                            break;
                    }

                    gvToken.Visible = true;
                    break;
                case 3:
                    dt = dal.ExecuteDataTable("SELECT (SELECT COUNT(*) FROM [Laptop] WHERE [Deleted] = 0), (SELECT COUNT(*) FROM [LaptopIn]), (SELECT COUNT(*) FROM [LaptopOut]), (SELECT COUNT(*) FROM [LaptopDiscarded])");

                    switch (filter)
                    {
                        case "all":
                            ViewState["laptopSQL"] = "SELECT * FROM [Laptop] WHERE [Deleted] = 0";
                            break;
                        case "in":
                            ViewState["laptopSQL"] = "SELECT * FROM [LaptopIn]";
                            break;
                        case "out":
                            ViewState["laptopSQL"] = "SELECT * FROM [LaptopOut]";
                            break;
                        case "discarded":
                            ViewState["laptopSQL"] = "SELECT * FROM [LaptopDiscarded]";
                            break;
                        default:
                            Response.Redirect("~/Error.aspx?c=WrongFilter");
                            break;
                    }

                    gvLaptop.Visible = true;
                    break;
                case 4:
                    dt = dal.ExecuteDataTable("SELECT (SELECT COUNT(*) FROM [Printer] WHERE [Deleted] = 0), (SELECT COUNT(*) FROM [PrinterIn]), (SELECT COUNT(*) FROM [PrinterOut]), (SELECT COUNT(*) FROM [PrinterDiscarded])");

                    switch (filter)
                    {
                        case "all":
                            ViewState["printerSQL"] = "SELECT * FROM [Printer] WHERE [Deleted] = 0";
                            break;
                        case "in":
                            ViewState["printerSQL"] = "SELECT * FROM [PrinterIn]";
                            break;
                        case "out":
                            ViewState["printerSQL"] = "SELECT * FROM [PrinterOut]";
                            break;
                        case "discarded":
                            ViewState["printerSQL"] = "SELECT * FROM [PrinterDiscarded]";
                            break;
                        default:
                            Response.Redirect("~/Error.aspx?c=WrongFilter");
                            break;
                    }

                    gvPrinter.Visible = true;
                    break;
                case 5:
                    dt = dal.ExecuteDataTable("SELECT (SELECT COUNT(*) FROM [Projector] WHERE [Deleted] = 0), (SELECT COUNT(*) FROM [ProjectorIn]), (SELECT COUNT(*) FROM [ProjectorOut]), (SELECT COUNT(*) FROM [ProjectorDiscarded])");

                    switch (filter)
                    {
                        case "all":
                            ViewState["projectorSQL"] = "SELECT * FROM [Projector] WHERE [Deleted] = 0";
                            break;
                        case "in":
                            ViewState["projectorSQL"] = "SELECT * FROM [ProjectorIn]";
                            break;
                        case "out":
                            ViewState["projectorSQL"] = "SELECT * FROM [ProjectorOut]";
                            break;
                        case "discarded":
                            ViewState["projectorSQL"] = "SELECT * FROM [ProjectorDiscarded]";
                            break;
                        default:
                            Response.Redirect("~/Error.aspx?c=WrongFilter");
                            break;
                    }

                    gvProjector.Visible = true;
                    break;
                case 6:
                    dt = dal.ExecuteDataTable("SELECT (SELECT COUNT(*) FROM [USBKey] WHERE [Deleted] = 0), (SELECT COUNT(*) FROM [USBKeyIn]), (SELECT COUNT(*) FROM [USBKeyOut]), (SELECT COUNT(*) FROM [USBKeyDiscarded])");

                    switch (filter)
                    {
                        case "all":
                            ViewState["usbkeySQL"] = "SELECT * FROM [USBKey] WHERE [Deleted] = 0";
                            break;
                        case "in":
                            ViewState["usbkeySQL"] = "SELECT * FROM [USBKeyIn]";
                            break;
                        case "out":
                            ViewState["usbkeySQL"] = "SELECT * FROM [USBKeyOut]";
                            break;
                        case "discarded":
                            ViewState["usbkeySQL"] = "SELECT * FROM [USBKeyDiscarded]";
                            break;
                        default:
                            Response.Redirect("~/Error.aspx?c=WrongFilter");
                            break;
                    }

                    gvUSBKey.Visible = true;
                    break;
                case 7:
                    dt = dal.ExecuteDataTable("SELECT (SELECT COUNT(*) FROM [Phones] WHERE [Deleted] = 0), (SELECT COUNT(*) FROM [PhonesIn]), (SELECT COUNT(*) FROM [PhonesOut]), (SELECT COUNT(*) FROM [PhonesDiscarded])");

                    switch (filter)
                    {
                        case "all":
                            ViewState["phonesSQL"] = "SELECT * FROM [Phones] WHERE [Deleted] = 0";
                            break;
                        case "in":
                            ViewState["phonesSQL"] = "SELECT * FROM [PhonesIn]";
                            break;
                        case "out":
                            ViewState["phonesSQL"] = "SELECT * FROM [PhonesOut]";
                            break;
                        case "discarded":
                            ViewState["phonesSQL"] = "SELECT * FROM [PhonesDiscarded]";
                            break;
                        default:
                            Response.Redirect("~/Error.aspx?c=WrongFilter");
                            break;
                    }

                    gvPhone.Visible = true;
                    break;
                case 8:
                    dt = dal.ExecuteDataTable("SELECT (SELECT COUNT(*) FROM [SIMcard] WHERE [Deleted] = 0), (SELECT COUNT(*) FROM [SIMcardIn]), (SELECT COUNT(*) FROM [SIMcardOut]), (SELECT COUNT(*) FROM [SIMcardDiscarded])");

                    switch (filter)
                    {
                        case "all":
                            ViewState["simcardSQL"] = "SELECT * FROM [SIMcard] WHERE [Deleted] = 0";
                            break;
                        case "in":
                            ViewState["simcardSQL"] = "SELECT * FROM [SIMcardIn]";
                            break;
                        case "out":
                            ViewState["simcardSQL"] = "SELECT * FROM [SIMcardOut]";
                            break;
                        case "discarded":
                            ViewState["simcardSQL"] = "SELECT * FROM [SIMcardDiscarded]";
                            break;
                        default:
                            Response.Redirect("~/Error.aspx?c=WrongFilter");
                            break;
                    }

                    gvSIMcard.Visible = true;
                    break;
                default:
                    Response.Redirect("~/Error.aspx?c=WrongType");
                    break;
            }
            
            mvwType.ActiveViewIndex = (type - 1);
            hplCountAll.Text = dt.Rows[0][0].ToString();
            hplCountAll.NavigateUrl = "~/access/Item/ShowItems.aspx?type=" + type;
            hplCountIn.Text = dt.Rows[0][1].ToString();
            hplCountIn.NavigateUrl = "~/access/Item/ShowItems.aspx?type=" + type + "&filter=in";
            hplCountOut.Text = dt.Rows[0][2].ToString();
            hplCountOut.NavigateUrl = "~/access/Item/ShowItems.aspx?type=" + type + "&filter=out";
            hplCountDiscarded.Text = dt.Rows[0][3].ToString();
            hplCountDiscarded.NavigateUrl = "~/access/Item/ShowItems.aspx?type=" + type + "&filter=discarded";
        }

        switch (type)
        {
            case 1:
                sdsModem.SelectCommand = ViewState["modemSQL"].ToString();
                break;
            case 2:
                sdsTokens.SelectCommand = ViewState["tokenSQL"].ToString();
                break;
            case 3:
                sdsLaptop.SelectCommand = ViewState["laptopSQL"].ToString();
                break;
            case 4:
                sdsPrinter.SelectCommand = ViewState["printerSQL"].ToString();
                break;
            case 5:
                sdsProjector.SelectCommand = ViewState["projectorSQL"].ToString();
                break;
            case 6:
                sdsUSBKey.SelectCommand = ViewState["usbkeySQL"].ToString();
                break;
            case 7:
                sdsPhone.SelectCommand = ViewState["phonesSQL"].ToString();
                break;
            case 8:
                sdsSIMcard.SelectCommand = ViewState["simcardSQL"].ToString();
                break;
            default:
                break;
        }
    }
    protected void Gridview_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string ID = DataBinder.Eval(e.Row.DataItem, "ID").ToString();
            string Location = ResolveUrl("~/access/Item/Item.aspx") + "?type=" + type + "&ID=" + ID;
            e.Row.Attributes["onClick"] = string.Format("javascript:window.location='{0}';", Location);
            e.Row.Style["cursor"] = "pointer";
        }
    }
    protected void ExportToExcel()
    {
        string SQL = "";
        string name = "";

        switch (type)
        {
            case 1:
                SQL = "SELECT * FROM ModemCustomerOut";
                name = "Modem";
                break;
            case 2:
                SQL = "SELECT * FROM TokenCustomerOut";
                name = "Token";
                break;
            case 3:
                SQL = "SELECT * FROM LaptopCustomerOut";
                name = "Bærbar";
                break;
            case 4:
                SQL = "SELECT * FROM PrinterCustomerOut";
                name = "Printer";
                break;
            case 5:
                SQL = "SELECT * FROM ProjectorCustomerOut";
                name = "Projektor";
                break;
            case 6:
                SQL = "SELECT * FROM USBKeyCustomerOut";
                name = "USB-nøgle";
                break;
            case 7:
                SQL = "SELECT * FROM PhoneCustomerOut";
                name = "Mobiltelefon";
                break;
            case 8:
                SQL = "SELECT * FROM SIMcardCustomerOut";
                name = "SIM-kort";
                break;
            default:
                break;
        }

        DataAccessLayer dal = new DataAccessLayer("SelectConnection");

        var workbook = new XLWorkbook();
        workbook.Worksheets.Add(dal.ExecuteDataTable(SQL), "ITMAT");

        Response.Clear();
        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
        Response.AddHeader("content-disposition", String.Format("attachment;filename={0}_udlån_{1}_{2}.xlsx", name, DateTime.Today.ToShortDateString(), DateTime.Now.ToShortTimeString()));

        using (var ms = new System.IO.MemoryStream())
        {
            workbook.SaveAs(ms);
            ms.WriteTo(Response.OutputStream);
            ms.Close();
        }

        Response.End();
    }
    protected void lnkbtnExportToExcel_Click(object sender, EventArgs e)
    {
        ExportToExcel();
    }
}