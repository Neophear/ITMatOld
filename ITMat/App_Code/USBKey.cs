using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Stiig;

/// <summary>
/// Summary description for USBKey
/// </summary>
namespace Stiig
{
    public class USBKey
    {
        public USBKey()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public USBKey(string Serialnumber, bool Discarded, string Comment)
        {
            this.Serialnumber = Serialnumber;
            this.Discarded = Discarded;
            this.Comment = Comment;
        }

        public string Serialnumber { get; set; }
        public bool Discarded { get; set; }
        public string Comment { get; set; }
    }
}