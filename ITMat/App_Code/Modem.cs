using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Stiig;

/// <summary>
/// Summary description for Modem
/// </summary>
namespace Stiig
{
    public class Modem
    {
        public Modem()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public Modem(string Serialnumber, string  IMEI, string Brand, string Model, bool Discarded, string Comment, bool TransferedCMDB)
        {
            this.Serialnumber = Serialnumber;
            this.IMEI = IMEI;
            this.Brand = Brand;
            this.Model = Model;
            this.Discarded = Discarded;
            this.Comment = Comment;
            this.TransferedCMDB = TransferedCMDB;

        }

        public string Serialnumber { get; set; }
        public string IMEI { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public bool Discarded { get; set; }
        public string Comment { get; set; }
        public bool TransferedCMDB { get; set; }
    }
}