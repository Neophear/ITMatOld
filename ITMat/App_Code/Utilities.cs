using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.Configuration;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Profile;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;

namespace Stiig
{
    public class Utilities
    {
        public static bool SendMail(string mailTo, string message)
        {
            using (SmtpClient smtp = new SmtpClient())
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(mailTo);
                mailMessage.Bcc.Add("TRR-IT07@mil.dk");
                mailMessage.Subject = "IT Bestilling klar til afhentning";
                mailMessage.Body = message;
                mailMessage.From = new MailAddress("noreply@itmat.dk");
                mailMessage.ReplyToList.Add(new MailAddress("TRR-KTP-IT@fiin.dk"));
                mailMessage.IsBodyHtml = true;
                smtp.EnableSsl = true;
                smtp.Send(mailMessage);
            }
            return true;
        }
        public static bool CompareValues(object A, object B)
        {
            string Astring = A == null ? String.Empty : A.ToString();
            string Bstring = B == null ? String.Empty : B.ToString();

            return Astring == Bstring;
        }
        /// <summary>
        /// Returns a string with the errors that occured:
        /// 1: Serienummer
        /// 2: IMEI
        /// 3: SIM-kort
        /// 4: TLF-nr
        /// 5: GUID
        /// 6: Navn
        /// 7: Beskrivelse
        /// 8: MANR
        /// 9: Stabsnummer
        /// </summary>
        /// <param name="errorString">The string with errornumbers. Fx. "245"</param>
        /// <returns></returns>
        public static string GetErrorMsg(string errorString)
        {
            string ErrorMsg = "Følgende variabler eksisterer allerede i databasen: ";
            
            foreach (char errorNr in errorString.ToCharArray())
            {
                switch (errorNr)
                {
                    case '1':
                        ErrorMsg += "Serienummer, ";
                        break;
                    case '2':
                        ErrorMsg += "IMEI, ";
                        break;
                    case '3':
                        ErrorMsg += "SIM-kortnr, ";
                        break;
                    case '4':
                        ErrorMsg += "TLF-nr, ";
                        break;
                    case '5':
                        ErrorMsg += "GUID, ";
                        break;
                    case '6':
                        ErrorMsg += "Navn, ";
                        break;
                    case '7':
                        ErrorMsg += "Beskrivelse, ";
                        break;
                    case '8':
                        ErrorMsg += "MANR, ";
                        break;
                    case '9':
                        ErrorMsg += "Stabsnummer, ";
                        break;
                    default:
                        break;
                }
            }

            ErrorMsg = Utilities.RemoveEndString(ErrorMsg, ", ");

            return ErrorMsg;
        }

        /// <summary>
        /// Checks if a 3G Modem already exists in the database based on Serialnumber, IMEI, 
        /// SIMcard and Phonenr.
        /// Returns an empty string "" if there are no errors or returns a string with the
        /// numbers representing each error:
        /// 2: IMEI
        /// 3: SIMcard
        /// 4: Phonenr
        /// Fx. it returns "24" meaning that IMEI and Phonenr already exists.
        /// </summary>
        /// <param name="modem">The Modem to check</param>
        /// <returns></returns>
        public static string CheckIfExists(Modem modem)
        {
            return CheckIfExists(modem, "", false);
        }

        /// <summary>
        /// Checks if a 3G Modem already exists in the database based on Serialnumber, IMEI, 
        /// SIMcard and Phonenr and excludes the ID given.
        /// Returns an empty string "" if there are no errors or returns a string with the
        /// numbers representing each error:
        /// 2: IMEI
        /// 3: SIMcard
        /// 4: Phonenr
        /// Fx. it returns "24" meaning that IMEI and Phonenr already exists.
        /// </summary>
        /// <param name="modem">The Modem to check</param>
        /// <param name="ID">The ID of the modem wanting to edit</param>
        /// <returns></returns>
        public static string CheckIfExists(Modem modem, string ID)
        {
            return CheckIfExists(modem, ID, true);
        }

        private static string CheckIfExists(Modem modem, string ID, bool WithID)
        {
            DataAccessLayer dal = new DataAccessLayer();
            string error = "";
            string addID = "";

            if (WithID)
            {
                dal.AddParameter("@ID", ID, System.Data.DbType.String);
                addID = " AND [ID] <> @ID";
            }
            
            dal.AddParameter("@IMEI", modem.IMEI, System.Data.DbType.String);
            error = dal.ExecuteScalar("IF EXISTS (SELECT * FROM [Modem] WHERE [Deleted] = 0 AND UPPER([IMEI]) = UPPER(@IMEI)" + addID + ") SELECT '2' ELSE SELECT ''").ToString();
            dal.ClearParameters();

            return error;
        }

        /// <summary>
        /// Checks if a Token already exists in the database based on Serialnumber and
        /// excludes the token with the ID given.
        /// Returns an empty string "" if there are no errors or returns a string with the
        /// numbers representing each error:
        /// 1: Serialnumber
        /// Fx. it returns "1" meaning that Serialnumber already exists.
        /// </summary>
        /// <param name="token">The Token to check</param>
        /// <returns></returns>
        public static string CheckIfExists(Token token)
        {
            return CheckIfExists(token, "", false);
        }

        /// <summary>
        /// Checks if a Token already exists in the database based on Serialnumber.
        /// Returns an empty string "" if there are no errors or returns a string with the
        /// numbers representing each error:
        /// 1: Serialnumber
        /// Fx. it returns "1" meaning that Serialnumber already exists.
        /// </summary>
        /// <param name="token">The Token to check</param>
        /// <param name="ID">ID of the token editing</param>
        /// <returns></returns>
        public static string CheckIfExists(Token token, string ID)
        {
            return CheckIfExists(token, ID, true);
        }

        private static string CheckIfExists(Token token, string ID, bool WithID)
        {
            DataAccessLayer dal = new DataAccessLayer();
            string error = "";
            string addID = "";

            if (WithID)
            {
                dal.AddParameter("@ID", ID, System.Data.DbType.String);
                addID = " AND [ID] <> @ID";
            }

            dal.AddParameter("@Serialnumber", token.Serialnumber, System.Data.DbType.String);
            error = dal.ExecuteScalar("IF EXISTS (SELECT * FROM [Tokens] WHERE [Deleted] = 0 AND UPPER([Serialnumber]) = UPPER(@Serialnumber)" + addID + ") SELECT '1' ELSE SELECT ''").ToString();
            dal.ClearParameters();

            return error;
        }

        /// <summary>
        /// Checks if a Laptop already exists in the database based on Serialnumber, IMEI, 
        /// SIMcard and Phonenr.
        /// Returns an empty string "" if there are no errors or returns a string with the
        /// numbers representing each error:
        /// 1: Serialnumber
        /// 2: IMEI
        /// 3: SIMcard
        /// 4: Phonenr
        /// Fx. it returns "24" meaning that IMEI and Phonenr already exists.
        /// </summary>
        /// <param name="laptop">The Laptop to check</param>
        /// <returns></returns>
        public static string CheckIfExists(Laptop laptop)
        {
            return CheckIfExists(laptop, "", false);
        }

        /// <summary>
        /// Checks if a Laptop already exists in the database based on Serialnumber, IMEI, 
        /// SIMcard and Phonenr.
        /// Returns an empty string "" if there are no errors or returns a string with the
        /// numbers representing each error:
        /// 1: Serialnumber
        /// 2: IMEI
        /// 3: SIMcard
        /// 4: Phonenr
        /// Fx. it returns "24" meaning that IMEI and Phonenr already exists.
        /// </summary>
        /// <param name="laptop">The Laptop to check</param>
        /// <returns></returns>
        public static string CheckIfExists(Laptop laptop, string ID)
        {
            return CheckIfExists(laptop, ID, true);
        }

        private static string CheckIfExists(Laptop laptop, string ID, bool WithID)
        {
            DataAccessLayer dal = new DataAccessLayer();
            string error = "";
            string addID = "";

            if (WithID)
            {
                dal.AddParameter("@ID", ID, System.Data.DbType.String);
                addID = " AND [ID] <> @ID";
            }

            dal.AddParameter("@Serialnumber", laptop.Serialnumber, System.Data.DbType.String);
            dal.AddParameter("@GUID", laptop.GUID, System.Data.DbType.String);
            dal.AddParameter("@Name", laptop.Name, System.Data.DbType.String);
            dal.AddParameter("@Description", laptop.Description, System.Data.DbType.String);
            error = dal.ExecuteScalar(@"
DECLARE @error varchar(50)
SET @error = ''

IF EXISTS (SELECT * FROM [Laptop] WHERE [Deleted] = 0 AND UPPER([Serialnumber]) = UPPER(@Serialnumber)" + addID + @")
SET @error += '1'

IF EXISTS (SELECT * FROM [Laptop] WHERE [Deleted] = 0 AND UPPER([GUID]) = UPPER(@GUID) AND [GUID] <> ''" + addID + @")
SET @error += '5'

IF EXISTS (SELECT * FROM [Laptop] WHERE [Deleted] = 0 AND UPPER([Name]) = UPPER(@Name) AND [Name] <> ''" + addID + @")
SET @error += '6'

IF EXISTS (SELECT * FROM [Laptop] WHERE [Deleted] = 0 AND UPPER([Description]) = UPPER(@Description) AND [Description] <> ''" + addID + @")
SET @error += '7'

SELECT @error
").ToString();
            dal.ClearParameters();

            return error;
        }

        /// <summary>
        /// Printer
        /// </summary>
        /// <param name="printer">The Printer to check</param>
        /// <returns></returns>
        public static string CheckIfExists(Printer printer)
        {
            return CheckIfExists(printer, "", false);
        }

        public static string CheckIfExists(Printer printer, string ID)
        {
            return CheckIfExists(printer, ID, true);
        }

        private static string CheckIfExists(Printer printer, string ID, bool WithID)
        {
            DataAccessLayer dal = new DataAccessLayer();
            string error = "";
            string addID = "";

            if (WithID)
            {
                dal.AddParameter("@ID", ID, System.Data.DbType.String);
                addID = " AND [ID] <> @ID";
            }

            dal.AddParameter("@Serialnumber", printer.Serialnumber, System.Data.DbType.String);
            dal.AddParameter("@Name", printer.Name, System.Data.DbType.String);
            error = dal.ExecuteScalar(@"
DECLARE @error varchar(50)
SET @error = ''

IF EXISTS (SELECT * FROM [Printer] WHERE [Deleted] = 0 AND UPPER([Serialnumber]) = UPPER(@Serialnumber)" + addID + @")
SET @error += '1'

IF EXISTS (SELECT * FROM [Printer] WHERE [Deleted] = 0 AND UPPER([Name]) = UPPER(@Name) AND [Name] <> ''" + addID + @")
SET @error += '6'

SELECT @error
").ToString();
            dal.ClearParameters();

            return error;
        }

        public static string CheckIfExists(Projector projector)
        {
            return CheckIfExists(projector, "", false);
        }

        public static string CheckIfExists(Projector projector, string ID)
        {
            return CheckIfExists(projector, ID, true);
        }

        private static string CheckIfExists(Projector projector, string ID, bool WithID)
        {
            DataAccessLayer dal = new DataAccessLayer();
            string error = "";
            string addID = "";

            if (WithID)
            {
                dal.AddParameter("@ID", ID, System.Data.DbType.String);
                addID = " AND [ID] <> @ID";
            }

            dal.AddParameter("@Serialnumber", projector.Serialnumber, System.Data.DbType.String);
            error = dal.ExecuteScalar("IF EXISTS (SELECT * FROM [Projector] WHERE [Deleted] = 0 AND UPPER([Serialnumber]) = UPPER(@Serialnumber)" + addID + ") SELECT '1' ELSE SELECT ''").ToString();
            dal.ClearParameters();

            return error;
        }

        /// <summary>
        /// Check if USBKey exists
        /// </summary>
        /// <param name="usbkey">USBKey to check</param>
        /// <returns></returns>
        public static string CheckIfExists(USBKey usbkey)
        {
            return CheckIfExists(usbkey, "", false);
        }

        public static string CheckIfExists(USBKey usbkey, string ID)
        {
            return CheckIfExists(usbkey, ID, true);
        }

        private static string CheckIfExists(USBKey usbkey, string ID, bool WithID)
        {
            DataAccessLayer dal = new DataAccessLayer();
            string error = "";
            string addID = "";

            if (WithID)
            {
                dal.AddParameter("@ID", ID, System.Data.DbType.String);
                addID = " AND [ID] <> @ID";
            }

            dal.AddParameter("@Serialnumber", usbkey.Serialnumber, System.Data.DbType.String);
            error = dal.ExecuteScalar("IF EXISTS (SELECT * FROM [USBKey] WHERE [Deleted] = 0 AND UPPER([Serialnumber]) = UPPER(@Serialnumber)" + addID + ") SELECT '1' ELSE SELECT ''").ToString();
            dal.ClearParameters();

            return error;
        }

        /// <summary>
        /// Phone
        /// </summary>
        /// <param name="phone">The Phone to check</param>
        /// <returns></returns>
        public static string CheckIfExists(Phone phone)
        {
            return CheckIfExists(phone, "", false);
        }

        public static string CheckIfExists(Phone phone, string ID)
        {
            return CheckIfExists(phone, ID, true);
        }

        private static string CheckIfExists(Phone phone, string ID, bool WithID)
        {
            DataAccessLayer dal = new DataAccessLayer();
            string error = "";
            string addID = "";

            if (WithID)
            {
                dal.AddParameter("@ID", ID, System.Data.DbType.String);
                addID = " AND [ID] <> @ID";
            }

            dal.AddParameter("@IMEI", phone.IMEI, System.Data.DbType.String);
            error = dal.ExecuteScalar("IF EXISTS (SELECT * FROM [Phones] WHERE [Deleted] = 0 AND UPPER([IMEI]) = UPPER(@IMEI)" + addID + ") SELECT '2' ELSE SELECT ''").ToString();
            dal.ClearParameters();

            return error;
        }

        /// <summary>
        /// SIMcard
        /// </summary>
        /// <param name="simcard">The SIMcard to check</param>
        /// <returns></returns>
        public static string CheckIfExists(SIMcard simcard)
        {
            return CheckIfExists(simcard, "", false);
        }

        public static string CheckIfExists(SIMcard simcard, string ID)
        {
            return CheckIfExists(simcard, ID, true);
        }

        private static string CheckIfExists(SIMcard simcard, string ID, bool WithID)
        {
            DataAccessLayer dal = new DataAccessLayer();
            string error = "";
            string addID = "";

            if (WithID)
            {
                dal.AddParameter("@ID", ID, System.Data.DbType.String);
                addID = " AND [ID] <> @ID";
            }

            dal.AddParameter("@SIMcardnr", simcard.SIMcardnr, System.Data.DbType.String);
            dal.AddParameter("@Phonenr", simcard.Phonenr, System.Data.DbType.String);
            error = dal.ExecuteScalar(@"
DECLARE @error varchar(50)
SET @error = ''

IF EXISTS (SELECT * FROM [SIMcard] WHERE [Deleted] = 0 AND UPPER([SIMcardnr]) = UPPER(@SIMcardnr)" + addID + @")
SET @error += '3'

IF EXISTS (SELECT * FROM [SIMcard] WHERE [Deleted] = 0 AND UPPER([Phonenr]) = UPPER(@Phonenr) AND [Phonenr] <> ''" + addID + @")
SET @error += '4'

SELECT @error
").ToString();
            dal.ClearParameters();

            return error;
        }

        /// <summary>
        /// Get the outlookname from a profile.
        /// Fx. "TRR-123 Lastname, Middlename Firstname"
        /// </summary>
        /// <param name="profile">The ProfileCommon to use</param>
        /// <returns></returns>
        public static string GetOutlookName(ProfileCommon profile)
        {
            string name = "";

            name = String.Format("{0} {1}, {2} {3}", profile.Stabsnummer, profile.Lastname, profile.Firstname, profile.Middlename);

            name = name.Replace("  ", " ");

            return name;
        }
        /// <summary>
        /// Get the outlookname from a UserID.
        /// Fx. "TRR-123 Lastname, Middlename Firstname"
        /// </summary>
        /// <param name="userID">The UserID to use</param>
        /// <returns></returns>
        public static string GetOutlookName(Guid userID)
        {
            ProfileCommon profile = new ProfileCommon();
            profile = profile.GetProfile(Membership.GetUser(userID).UserName);

            return GetOutlookName(profile);
        }

        /// <summary>
        /// Cuts a string to a specified lenght depending on if it should cut at whole words or not. Fx:
        /// string txt = "I want to cut this string!"
        /// CutText(txt, "...", 10, true)
        /// returns:
        /// "I want to..."
        /// </summary>
        /// <param name="text">String to cut</param>
        /// <param name="addString">String to add after the cut has been made. Fx. "..."</param>
        /// <param name="maxLenght">Max lenght the resulting string shall be without the addString</param>
        /// <param name="wholeWords">True to leave whole words and false to ignore whole words and just cut</param>
        /// <returns></returns>
        public static string CutText(string text, string addString, int maxLenght, bool wholeWords)
        {
            string endString = "";

            if (text.Length <= maxLenght)
            {
                endString = text;
            }
            else
            {
                if (!wholeWords)
                {
                    endString = text.Substring(0, maxLenght);
                    endString = endString.TrimEnd(new char[] { ' ' });
                }
                else
                {
                    endString = text.Substring(0, maxLenght + 1);
                    int lastIndexOfSpace = endString.LastIndexOf(" ");

                    endString = endString.Substring(0, lastIndexOfSpace);
                }

                endString += addString;
            }

            return endString;
        }
        /// <summary>
        /// Returns a more userfriendly date.
        /// </summary>
        /// <param name="date">The DateTime to modify</param>
        /// <returns></returns>
        public static string GetDate(DateTime date)
        {
            string modifieddate = "{0} {1} siden";
            TimeSpan diff = DateTime.Today.Date - date;
            int months = diff.Days / 30;
            int weeks = diff.Days / 7;

            if (months > 0)
            {
                modifieddate = string.Format(modifieddate, months, months > 1 ? "måneder" : "måned");
            }
            else if (weeks > 0)
            {
                modifieddate = string.Format(modifieddate, weeks, weeks > 1 ? "uger" : "uge");
            }
            else if (diff.Days > 1)
            {
                modifieddate = string.Format(modifieddate, diff.Days, "dage");
            }
            else if (diff.Days == 1)
            {
                modifieddate = "I går";
            }
            else
            {
                modifieddate = "I dag";
            }

            return modifieddate;
        }
        /// <summary>
        /// Removes the end of the string.
        /// </summary>
        /// <param name="Text">The string that has to be cut</param>
        /// <param name="TextToRemove">The end string to remove</param>
        /// <returns></returns>
        public static string RemoveEndString(string Text, string TextToRemove)
        {
            string result = Text;

            if (Text.EndsWith(TextToRemove))
            {
                result = Text.Remove(Text.Length - TextToRemove.Length);
            }

            return result;
        }
        public static string GetSiteRoot()
        {
            string Port = System.Web.HttpContext.Current.Request.ServerVariables["SERVER_PORT"];

            if (Port == null || Port == "80" || Port == "443")
            {
                Port = "";
            }
            else
            {
                Port = ":" + Port;
            }

            string Protocol = System.Web.HttpContext.Current.Request.ServerVariables["SERVER_PORT_SECURE"];

            if (Protocol == null || Protocol == "0")
            {
                Protocol = "http://";
            }
            else
            {
                Protocol = "https://";
            }

            string appPath = System.Web.HttpContext.Current.Request.ApplicationPath;

            if (appPath == "/")
            {
                appPath = "";
            }

            string sOut = Protocol + System.Web.HttpContext.Current.Request.ServerVariables["SERVER_NAME"] + Port + appPath;
            return sOut;
        }
        public static string StripHTML(string htmlString)
        {
            return StripHTML(htmlString, "", true);
        }
        public static string StripHTML(string htmlString, string htmlPlaceHolder)
        {
            return StripHTML(htmlString, htmlPlaceHolder, true);
        }
        public static string StripHTML(string htmlString, string htmlPlaceHolder, bool stripExcessSpaces)
        {
            string pattern = @"<(.|\n)*?>";
            string sOut = System.Text.RegularExpressions.Regex.Replace(htmlString, pattern, htmlPlaceHolder);
            sOut = sOut.Replace("&nbsp;", "");
            sOut = sOut.Replace("&amp;", "&");

            if (stripExcessSpaces)
            {
                // If there is excess whitespace, this will remove
                // like "THE      WORD".
                char[] delim = { ' ' };
                string[] lines = sOut.Split(delim, StringSplitOptions.RemoveEmptyEntries);

                sOut = "";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();

                foreach (string s in lines)
                {
                    sb.Append(s);
                    sb.Append(" ");
                }

                return sb.ToString().Trim();
            }
            else
            {
                return sOut;
            }
        }
        public static string ToggleHtmlBR(string text, bool isOn)
        {
            string outS = "";

            if (isOn)
                outS = text.Replace("\n", "<br />");
            else
            {
                outS = text.Replace("<br />", "\n");
                outS = text.Replace("<br>", "\n");
                outS = text.Replace("<br >", "\n");
            }

            return outS;
        }

        public static string HTMLToBB(string OriginalText)
        {
            string text = OriginalText;

            List<Regex> regexlist = new List<Regex>();

            regexlist.Add(new Regex(@"<(?<tag>b)>(?<text>[\w\W]*?)</b>"));
            regexlist.Add(new Regex(@"<(?<tag>i)>(?<text>[\w\W]*?)</i>"));
            regexlist.Add(new Regex(@"<(?<tag>u)>(?<text>[\w\W]*?)</u>"));

            Regex quotewithauthor = new Regex("<table\\ cellpadding=\"2\"><tr><td\\ class=\"quote\">Citat\\ af\\ (?<author>.*?)<br\\ /><i>(?<text>[\\w\\W]*?)</i></td></tr></table>");
            Regex quote = new Regex("<table\\ cellpadding=\"2\"><tr><td\\ class=\"quote\"><i>(?<text>[\\w\\W]*?)</i></td></tr></table>");
            Regex urlwithtitle = new Regex("<a href=\"(?<link>[\\w\\W]*?)\">(?<text>[\\w\\W]*?)</a>");
            Regex url = new Regex("<a\\ href=\"(?<link>[\\w\\W]*?)\">\\1</a>");
            Regex size = new Regex("<span\\ style=\"font-size:(?<size>\\d*?)pt;\">(?<text>[\\w\\W]*?)</span>");
            Regex color = new Regex("<span\\ style=\"color:(?<color>.*?);\">(?<text>[\\w\\W]*?)</span>");

            text = quotewithauthor.Replace(text, @"[quote=$1]$2[/quote]");
            text = quote.Replace(text, @"[quote]$1[/quote]");
            text = url.Replace(text, @"[url]$1[/url]");
            text = urlwithtitle.Replace(text, @"[url=$1]$2[/url]");
            text = size.Replace(text, @"[size=$1]$2[/size]");
            text = color.Replace(text, @"[color=$1]$2[/color]");

            foreach (Regex regex in regexlist)
            {
                text = regex.Replace(text, @"[$1]$2[/$1]");
            }

            text = text.Replace("<table cellpadding=\"2\"><tr><td class=\"quote\"><i>", "[quote]").Replace("</i></td></tr></table>", "[/quote]");
            text = text.Replace("<img src=\"", "[img]").Replace("\"/>", "[/img]");
            text = text.Replace("<table cellpadding=\"2\"><tr><td class=\"code\">", "[code]").Replace("</td></tr></table>", "[/code]");
            text = text.Replace("<br />", "");
            text = text.Replace("&#60;", "<");
            text = text.Replace("&#62;", ">");

            return text;
        }
        public static string BBToHTML(string OriginalText)
        {
            string text;
            List<Regex> regexlist = new List<Regex>();
            text = OriginalText;

            regexlist.Add(new Regex(@"\[(?<tag>b)\](?<text>[\w\W]*?)\[/b\]"));
            regexlist.Add(new Regex(@"\[(?<tag>i)\](?<text>[\w\W]*?)\[/i\]"));
            regexlist.Add(new Regex(@"\[(?<tag>u)\](?<text>[\w\W]*?)\[/u\]"));

            Regex quote = new Regex(@"\[quote\](?<text>[\w\W]*?)\[/quote\]");
            Regex quotewithauthor = new Regex(@"\[quote=(?<author>.*?)\](?<text>[\w\W]*?)\[/quote\]");
            Regex code = new Regex(@"\[code\](?<text>[\w\W]*?)\[/code\]");
            Regex urlWithProtocol = new Regex(@"\[url\]((?:f|ht)tps?://[\w\W]*?)\[/url\]");
            Regex url = new Regex(@"\[url\](?<link>[\w\W]*?)\[/url\]");
            Regex urlwithtitleWithProtocol = new Regex(@"\[url=((?:f|ht)tps?://(?:[\w\W]*?))\](.*?)\[/url\]");
            Regex urlwithtitle = new Regex(@"\[url=([\w\W]*?)\](.*?)\[/url\]");
            Regex image = new Regex(@"\[img\](?<link>[\w\W]*?)\[/img\]");
            Regex size = new Regex(@"\[size=(?<size>\d*?)\](?<text>[\w\W]*?)\[/size\]");
            Regex color = new Regex(@"\[color=(?<color>[\w\W]*?)\](?<text>[\w\W]*?)\[/color\]");

            text = text.Replace("<", "&#60;");
            text = text.Replace(">", "&#62;");

            text = Utilities.ToggleHtmlBR(text, true);

            foreach (Regex regex in regexlist)
            {
                text = regex.Replace(text, "<$1>$2</$1>");
            }

            text = quote.Replace(text, "<table cellpadding=\"2\"><tr><td class=\"quote\"><i>$1</i></td></tr></table>");
            text = code.Replace(text, "<table cellpadding=\"2\"><tr><td class=\"code\">$1</td></tr></table>");
            text = quotewithauthor.Replace(text, "<table cellpadding=\"2\"><tr><td class=\"quote\">Citat af $1<br /><i>$2</i></td></tr></table>");
            text = urlWithProtocol.Replace(text, "<a href=\"$1\">$1</a>");
            text = url.Replace(text, "<a href=\"http://$1\">$1</a>");
            text = urlwithtitleWithProtocol.Replace(text, "<a href=\"$1\">$2</a>");
            text = urlwithtitle.Replace(text, "<a href=\"http://$1\">$2</a>");
            text = image.Replace(text, "<img src=\"$1\"/>");
            text = size.Replace(text, "<span style=\"font-size:$1pt;\">$2</span>");
            text = color.Replace(text, "<span style=\"color:$1;\">$2</span>");
            
            return text;
        }
    }
}