using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Stiig;

/// <summary>
/// Summary description for Token
/// </summary>
namespace Stiig
{
    public class Token
    {
        public Token()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public Token(string Serialnumber, bool Discarded, string Comment)
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