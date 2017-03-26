using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using VoiceMail;
using System.Net.Mail;
using System.Data;
using System.Net;
public partial class package_site : System.Web.UI.Page
{
    cUserDetail user;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = Resources.Resource.title_about;
        Master.titleheader = Resources.Resource.price_list;
        Master.picHeader = Resources.Resource.price_list;
        txt_name.Attributes.Add("placeholder", Resources.Resource.name_);
        txt_mail.Attributes.Add("placeholder", Resources.Resource.email);
        txt_tell.Attributes.Add("placeholder", Resources.Resource.phone);
        txt_company.Attributes.Add("placeholder", Resources.Resource.company_);
        txt_msg.Attributes.Add("placeholder", Resources.Resource.more_details);
        register.Text = Resources.Resource.send;

        cPackages package = new cPackages();
        DataTable tbPack = package.getData_site().Tables[0];
        DataRow[] row = tbPack.Select("id=1");
        DataList1.DataSource = package.getData_site();
        DataList1.DataBind();

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


    protected void register_Click(object sender, EventArgs e)
    {
        if (sendMailLid())
            Response.Redirect("msgMaster2.aspx");
    
    }

    private bool sendMailLid()
    {


        string subject = "";
        string msg = "<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.0 Transitional//EN'>" + Environment.NewLine;
        msg += "<html>" + Environment.NewLine;
        msg += "<head>" + Environment.NewLine;
        subject = "פניית לקוח לרכישת הודעות - SPIX ";
        msg += " <title>פניית לקוח</title>" + Environment.NewLine;
        //string style="height: 200px;color: #333;padding: 20px;background-color: #D7E9F5;-webkit-box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.4);-moz-box-shadow: 0px 1px 6px rgba(23, 69, 88, .5);-webkit-border-radius: 12px;-moz-border-radius: 7px;border-radius: 7px;background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, white), color-stop(15%, white), color-stop(100%, #D7E9F5));background: -moz-linear-gradient(top, white 0%, white 55%, #D5E4F3 130%);";
        msg += "</head>";
        msg += " <table align='right'  style='width:500px;font-family:Arial;font-size: 12px;font-weight: bold;' dir='rtl'>";
        msg += "<tr><td align='left'><br/></td></tr>";

        msg += "<tr>";
        msg += "<td>";
        msg += "<span>שם לקוח:  </span>";
        msg += "<span>" + txt_name.Text + " </span>";
        msg += "</td>";
        msg += "</tr>";

        msg += "<tr><td>";
        msg += "<span>מייל:  </span>";
        msg += "<span>" + txt_mail.Text + " </span>";
        msg += "</td></tr>";



        msg += "<tr><td>";
        msg += "<span>טלפון:  </span>";
        msg += "<span>" + txt_tell.Text + " </span>";
        msg += "</td></tr>";

        msg += "<tr><td>";
        msg += "<span>חברה:  </span>";
        msg += "<span>" + txt_company.Text + " </span>";
        msg += "</td></tr>";

        msg += "<tr><td>";
        msg += "<span>פרטים נוספים:  </span>";
        msg += "<span>" + txt_msg.Text + " </span>";
        msg += "</td></tr>";


        msg += "</table>";
        msg += "</body>";
        msg += "</html>";


        powerLinkObj.LidSpix(txt_name.Text, txt_tell.Text, txt_company.Text, txt_mail.Text, txt_msg.Text, Request.UserHostAddress, SPIX_LID_TYPE.LID);
        if (SendMail(subject, msg))
            return true;
        return false;

    }


    private bool SendMail(string subject, string message)
    {
        try
        {

            MailAddress from = new MailAddress("info@spix.co.il", "Spix");
            MailAddress to = new MailAddress("sales@red-e.co.il");
            MailMessage mail = new MailMessage(from, to);
            mail.CC.Add(new MailAddress("tamar@red-e.co.il"));
            mail.CC.Add(new MailAddress("shuki@red-e.co.il"));
            mail.Bcc.Add(new MailAddress("eitzikgr@gmail.com"));
            mail.BodyEncoding = System.Text.Encoding.GetEncoding("utf-8");
            mail.Subject = subject;
            string Body = message;
            mail.Body = message;
            mail.IsBodyHtml = true;
            NetworkCredential objNC = new NetworkCredential("sales@red-e.co.il", "sara0524");
            SmtpClient objsmtp = new SmtpClient("smtp.gmail.com");
            objsmtp.Port = 587;
            objsmtp.Credentials = objNC;
            objsmtp.EnableSsl = true;
            objsmtp.Send(mail);
            return true;

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            return false;
        }
    }


    private bool sendMailLidError(string error_message, string mailto)
    {
        string subject = "";
        string msg = "<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.0 Transitional//EN'>" + Environment.NewLine;
        msg += "<html>" + Environment.NewLine;
        msg += "<head>" + Environment.NewLine;
        subject = "שגיאת הרשמה";
        msg += " <title>שגיאת הרשמה</title>" + Environment.NewLine;
        msg += "</head>";
        msg += " <table align='right' style='border:2px solid #2469E0; width:500px;' dir='rtl'>";
        msg += "<tr>";
        msg += "<td style='font-family:Arial;font-size: 12px;font-weight: bold;'><br/>";
        msg += "<p>" + error_message + "</p>";
        msg += "</td></tr></table>";
        msg += "</body>";
        msg += "</html>";

        if (SendMailError(subject, msg, mailto))
            return true;
        return false;
    }




    private bool SendMailError(string subject, string msg, string mailto)
    {
        try
        {

            MailAddress from = new MailAddress("info@spix.co.il", "Spix");
            MailAddress to = new MailAddress(mailto, mailto);
            MailMessage mail = new MailMessage(from, to);
            mail.BodyEncoding = System.Text.Encoding.GetEncoding("utf-8");
            mail.Subject = subject;
            string Body = msg;
            mail.Body = msg;
            mail.IsBodyHtml = true;
            NetworkCredential objNC = new NetworkCredential("sales@red-e.co.il", "sara0524");
            SmtpClient objsmtp = new SmtpClient("smtp.gmail.com");
            objsmtp.Port = 587;
            objsmtp.Credentials = objNC;
            objsmtp.EnableSsl = true;
            objsmtp.Send(mail);
            return true;

        }
        catch (Exception ex)
        {
            //Response.Write(ex.Message);
            return false;
        }
    }

}