using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
//using VoiceMail;
using System.Net.Mail;
using System.Net;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        L_msgMail.Text = Resources.Resource.Email_address;
        B_SendMail.Text = Resources.Resource.send;
        //Master.logOut = false;
        L_msgMail.Visible = false;
    }
    protected void B_SendMail_Click(object sender, EventArgs e)
    {
        if (TB_ForgotMail.Text != "")
        { 
            cUserDetail User=new cUserDetail ();
            if (User.ForgotMail(TB_ForgotMail.Text))
            {
                L_msgMail.Visible = true;
                L_msgMail.Text = Resources.Resource.password_was_sent;
                sendMailLid(User.Password);
            }
            else
            {
                L_msgMail.Visible = true;
                L_msgMail.Text = Resources.Resource.Email_address;
            }
        
        }
    }
    private bool sendMailLid(string password)
    {
        string subject = "";
        string msg = "<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.0 Transitional//EN'>" + Environment.NewLine;
        msg += "<html>" + Environment.NewLine;
        msg += "<head>" + Environment.NewLine;
        subject = Resources.Resource.titlle_restore_password;
        msg += " <title>"+Resources.Resource.restore_password+"</title>" + Environment.NewLine;
        msg += "</head>";
        msg += " <table align='right' style='background-color:#d0dff6; border:2px solid #2469E0; width:500px;' dir='rtl'>";
        msg += "<tr><td align='left'><br/></td></tr>";
        msg += "<tr>";
        msg += "<td style='font-family:Arial;font-size: 12px;font-weight: bold;'><br/>";
        msg += "<p>"+Resources.Resource.your_password_is+"</p>";
        msg += "<p>"+password+"</p>";
        msg += "</td></tr></table>";
        msg += "</body>";
        msg += "</html>";

        if (SendMail(subject, msg))
            return true;
        return false;

    }
    private bool SendMail(string subject, string message)
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.BodyEncoding = System.Text.Encoding.GetEncoding("utf-8");
            mail.To.Add(TB_ForgotMail.Text);
            mail.From = new MailAddress(TB_ForgotMail.Text);
            mail.Subject = subject;
            //string Body = "אישור פתיחת חשבון";
            mail.Body = message;
            mail.IsBodyHtml = true;
            NetworkCredential objNC = new NetworkCredential("sales@red-e.co.il", "sara0524");
            SmtpClient objsmtp = new SmtpClient("smtp.gmail.com");
            objsmtp.Port = 587;
            objsmtp.Credentials = objNC;
            objsmtp.EnableSsl = true;
            objsmtp.Send(mail);
            /*
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "mailgw.netvision.net.il";
            smtp.Credentials = new System.Net.NetworkCredential("pcenter", "05231299");
            //smtp.EnableSsl = true;    
            smtp.Send(mail);
             * */
            return true;

        }
        catch (Exception ex)
        {
            // tbcheckpass.Text = ex.Message;
            return false;
        }
    }
}
