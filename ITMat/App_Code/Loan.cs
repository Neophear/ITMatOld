using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Stiig;

/// <summary>
/// Summary description for Loan
/// </summary>
public class Loan
{
    private int id;
    private Customer customer;
    private DateTime datefrom;
    private DateTime dateto;
    private DateTime datepickedup;
    private DateTime datereturned;
    private int typerefid;
    private string comment;
    private Guid createdby;
    private bool failedpickup;

    public int ID
    {
        get { return id; }
        set { id = value; }
    }
    public Customer Customer
    {
        get { return customer; }
        set { customer = value; }
    }
    public DateTime DateFrom
    {
        get { return datefrom; }
        set { datefrom = value; }
    }
    public DateTime DateTo
    {
        get
        {
            if (dateto == DateTime.MinValue)
                return DateTime.MaxValue;
            else
                return dateto;
        }
        set { dateto = value; }
    }
    public DateTime DatePickedUp
    {
        get { return datepickedup; }
        set { datepickedup = value; }
    }
    public DateTime DateReturned
    {
        get { return datereturned; }
        set { datereturned = value; }
    }
    public int TypeRefID
    {
        get { return typerefid; }
        set { typerefid = value; }
    }
    public string Comment
    {
        get { return comment; }
        set { comment = value; }
    }
    public Guid CreatedBy
    {
        get { return createdby; }
        set { createdby = value; }
    }
    public bool FailedPickup
    {
        get { return failedpickup; }
        set { failedpickup = value; }
    }
    public bool Returned
    {
        get
        {
            return datereturned != DateTime.MinValue;
        }
    }
    public bool PickedUp
    {
        get
        {
            return datepickedup != DateTime.MinValue;
        }
    }

    /// <summary>
    /// Gets the Loan from the Database
    /// </summary>
    /// <param name="ID">The LoanID to retrieve</param>
	public Loan(int ID)
	{
        DataAccessLayer dal = new DataAccessLayer();

        dal.AddParameter("@ID", ID, DbType.Int32);
        DataTable table = dal.ExecuteDataTable("SELECT * FROM [LoansCustomers] WHERE [ID] = @ID");
        dal.ClearParameters();

        id = ID;
        CreateFromTable(table);
	}
    public Loan(DataTable table)
    {
        CreateFromTable(table);
    }

    private void CreateFromTable(DataTable table)
    {
        if (table != null)
        {
            customer = new Customer((int)table.Rows[0]["CustomerRefID"]);
            datefrom = (DateTime)table.Rows[0]["DateFrom"];

            if (table.Rows[0]["DateTo"] != DBNull.Value)
                dateto = (DateTime)table.Rows[0]["DateTo"];

            if (table.Rows[0]["DatePickedUp"] != DBNull.Value)
                datepickedup = (DateTime)table.Rows[0]["DatePickedUp"];

            if (table.Rows[0]["DateReturned"] != DBNull.Value)
                datereturned = (DateTime)table.Rows[0]["DateReturned"];

            typerefid = (int)table.Rows[0]["TypeRefID"];
            comment = table.Rows[0]["Comment"].ToString();
            createdby = (Guid)table.Rows[0]["CreatedBy"];
            failedpickup = (bool)table.Rows[0]["FailedPickup"];
        }
    }

}