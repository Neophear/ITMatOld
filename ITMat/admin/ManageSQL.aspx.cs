using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClosedXML.Excel;
using Stiig;

public partial class admin_ManageSQL : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMsg.Visible = false;
        btnExport.Visible = false;
    }
    protected void btnRunSQL_Click(object sender, EventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer("SelectConnection");

        try
        {
            hfSQLStatement.Value = txtSQL.Text;
            gvSQL.DataSource = dal.ExecuteDataTable(txtSQL.Text);
            gvSQL.DataBind();
            btnExport.Visible = true;
        }
        catch (Exception msg)
        {
            lblErrorMsg.Text = msg.Message;
            lblErrorMsg.Visible = true;
        }
    }
    protected void btnExport_Click(object sender, EventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer("SelectConnection");

        var workbook = new XLWorkbook();
        workbook.Worksheets.Add(dal.ExecuteDataTable(hfSQLStatement.Value), "ITMAT");

        Response.Clear();
        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
        Response.AddHeader("content-disposition", String.Format("attachment;filename=ITMAT_{0}_{1}.xlsx", DateTime.Today.ToShortDateString(), DateTime.Now.ToShortTimeString()));

        using (var ms = new System.IO.MemoryStream())
        {
            workbook.SaveAs(ms);
            ms.WriteTo(Response.OutputStream);
            ms.Close();
        }

        Response.End();
    }
}