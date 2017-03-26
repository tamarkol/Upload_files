using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Net.Mail;

public partial class redeminisite : System.Web.UI.Page
{
    string name="", email="", phone="";
	string gclid="",utm_source="",utm_medium="",utm_term="",utm_content="",utm_campaign="";
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.AppendHeader("Access-Control-Allow-Origin", "*");
        name = Request["name"];
        email = Request["email"];
        phone = Request["phone"];
		
        gclid = Request["gclid"];
        utm_source = Request["utm_source"];
        utm_medium = Request["utm_medium"];
        utm_term = Request["utm_term"];
        utm_content = Request["utm_content"];
        utm_campaign = Request["utm_campaign"];

        if (email == null)
            return;
        string strHTMLShort = "<p>name: " + name + "</p>";
        strHTMLShort += "<p>email: " + email + "</p>";
        strHTMLShort += "<p>phone: " + phone + "</p>";
        strHTMLShort += "<hr/>";
        strHTMLShort += "<p><b>Campagin:</b></p>";
		 strHTMLShort += "<p>gclid: " + gclid + "</p>";
		 strHTMLShort += "<p>utm_source: " + utm_source + "</p>";
		 strHTMLShort += "<p>utm_medium: " + utm_medium + "</p>";
		 strHTMLShort += "<p>utm_term: " + utm_term + "</p>";
		 strHTMLShort += "<p>utm_content: " + utm_content + "</p>";
		 strHTMLShort += "<p>utm_campaign: " + utm_campaign + "</p>";


         powerLinkObj.saveLidRedEtech(name, email, phone, gclid, utm_source, utm_medium, utm_term, utm_content, utm_campaign, Request.UserHostAddress);
        string subject = "ליד מדף נחיתה רדיטק";
        if (SendMail("sales@red-e.co.il", "lid@red-e.com", "Red-E - lead", subject, strHTMLShort))
            Response.Write(true);
        else
            Response.Write(true);
        Response.End();
    }

   
    private bool SendMail(string mail, string fromMail, string fromName, string subject, string message)
    {
        try
        {
            MailMessage objMail = new MailMessage(fromMail, mail, subject, message);
            objMail.Bcc.Add("shuki@red-e.co.il");
            objMail.Bcc.Add("eitzikgr@gmail.com");
            NetworkCredential objNC = new NetworkCredential("sales@red-e.co.il", "sara0524");
            SmtpClient objsmtp = new SmtpClient("smtp.gmail.com");
            objsmtp.Port = 587;
            objsmtp.EnableSsl = true;
            objsmtp.Credentials = objNC;
            objMail.IsBodyHtml = true;

            objsmtp.Send(objMail);
            return true;
        }
        catch (Exception ex)
        {
            // refMsg = ex.Message;
            return false;
        }
    }
      private string GetWebPageAsStringShort(string strURI)
     {
         Uri objURI = new Uri(strURI);
         WebRequest objWebRequest = WebRequest.Create(objURI);
         WebResponse objWebResponse = objWebRequest.GetResponse();
         Stream objStream = objWebResponse.GetResponseStream();
         StreamReader objStreamReader = new StreamReader(objStream);
         string strHTML = objStreamReader.ReadToEnd();

         return strHTML;
         //GetWebPageAsStringShort = strHTML;
     }

}