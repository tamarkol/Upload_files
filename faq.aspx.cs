using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using VoiceMail;
using System.Net.Mail;
public partial class about : System.Web.UI.Page
{
    cUserDetail user;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = Resources.Resource.title_faq;
        Master.titleheader = Resources.Resource.questions_and_answers;
        Master.picHeader = "about";
    }
    
    private bool sendMailLid()
    {

        user = (cUserDetail)Session["UserObj"];
        Response.Write(user.IdUser + " " + user.email);
        string subject = "";
        string msg = "<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.0 Transitional//EN'>" + Environment.NewLine;
        msg += "<html>" + Environment.NewLine;
        msg += "<head>" + Environment.NewLine;
        subject = "אישור הרשמה-red-e-tech";
        msg += " <title>אישור הרשמה</title>" + Environment.NewLine;
        //string style="height: 200px;color: #333;padding: 20px;background-color: #D7E9F5;-webkit-box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.4);-moz-box-shadow: 0px 1px 6px rgba(23, 69, 88, .5);-webkit-border-radius: 12px;-moz-border-radius: 7px;border-radius: 7px;background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, white), color-stop(15%, white), color-stop(100%, #D7E9F5));background: -moz-linear-gradient(top, white 0%, white 55%, #D5E4F3 130%);";
        msg += "</head>";
        msg += " <table align='right'  style='width:500px;' dir='rtl'>";
        msg += "<tr><td align='left'><br/></td></tr>";
        msg += "<tr>";
        msg += "<td style='font-family:Arial;font-size: 12px;font-weight: bold;'><br/>";
        //msg += "חשבונך נפתח בהצלחה";
        msg += "<p>נא אשר קבלת המייל בלינק המצורף.</p>";
        // msg += "מאת -<b> " + name + " </b><br/>";
        //msg += "אימייל -<b> " + email + " </b><br/>";
        msg += "<p><a href='http://spix.co.il/activation.aspx?idUser=" + user.IdUser + "&mail=" + user.email + "'>לחץ כאן לאישור הרשמה</a></p><br/><br/><br/>";
        msg += "</td></tr></table>";
        msg += "</body>";
        msg += "</html>";

        if (SendMail(subject, msg))
            return true;
        return false;

    }

    private cUserDetail cUserDetail(object p)
    {
        throw new NotImplementedException();
    }


    private bool SendMail(string subject, string message)
    {
        try
        {
            MailAddress from = new MailAddress("chagay@red-e.co.il", "MailMessage");
            MailAddress to = new MailAddress(user.email, user.email);
            //MailMessage message = new MailMessage(from, to);

            MailMessage mail = new MailMessage(from, to);
            mail.BodyEncoding = System.Text.Encoding.GetEncoding("utf-8");
            //mail.To.Add(TB_Email.Text);
            //mail.From="chagay@red-e.co.il";//new MailAddress("chagay@red-e.co.il");
            mail.Subject = "אישור פתיחת חשבון";
            string Body = "אישור פתיחת חשבון";
            mail.Body = message;
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "mailgw.netvision.net.il";
            smtp.Credentials = new System.Net.NetworkCredential("pcenter", "05231299");
            //smtp.EnableSsl = true;    
            smtp.Send(mail);
            return true;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            // tbcheckpass.Text = ex.Message;
            return false;
        }
    }
    protected void aboutMyaccount_Click(object sender, EventArgs e)
    {
        if (Session["UserObj"] == null)
            Response.Redirect("register.aspx");
        else
            Response.Redirect("dashboard.aspx");
    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        if (Session["UserObj"] == null)
            Response.Redirect("register.aspx");
        else
            Response.Redirect("selectProject.aspx");
    }
    protected void Unnamed2_Click(object sender, EventArgs e)
    {
        if (Session["UserObj"] == null)
            Response.Redirect("register.aspx");
        else
            Response.Redirect("mailingList.aspx");
    }
    protected void UpdateBtn_Click(object sender, EventArgs e)
    {
        if (Session["UserObj"] == null)
            Response.Redirect("register.aspx");
        else
            Response.Redirect("updateDetails.aspx");
    }
    protected void creditBtn_Click(object sender, EventArgs e)
    {
            if (Session["UserObj"] == null)
            Response.Redirect("register.aspx");
        else
            Response.Redirect("movements.aspx");
            
    }
}