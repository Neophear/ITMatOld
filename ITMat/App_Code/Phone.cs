using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Stiig;

/// <summary>
/// Summary description for Phone
/// </summary>
namespace Stiig
{
    public class Phone
    {
        public Phone()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public Phone(string IMEI, string Brand, string Model, bool Discarded, string Comment)
        {
            this.IMEI = IMEI;
            this.Brand = Brand;
            this.Model = Model;
            this.Discarded = Discarded;
            this.Comment = Comment;
        }

        public string IMEI { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public bool Discarded { get; set; }
        public string Comment { get; set; }
    }
}