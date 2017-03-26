using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
////using VoiceMail;
using System.Net;

public partial class NotActive : System.Web.UI.Page
{
    cUserDetail user;
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (sendMailLid())
        {
           
            lb_okregistersend.Visible = true;
            Button1.Visible = false;
        }
            //Response.Redirect("okRegister.aspx");

    }
    private bool sendMailLid()
    {
   
        user= (cUserDetail) Session["UserObj"];
		//Response.Write(user.IdUser+" "+user.email );
        string subject = "";
        string msg = "<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.0 Transitional//EN'>" + Environment.NewLine;
        msg += "<html>" + Environment.NewLine;
        msg += "<head>" + Environment.NewLine;
        subject = Resources.Resource.registration_approval + "-red-e-tech";
        msg += " <title>" + Resources.Resource.registration_approval + "</title>" + Environment.NewLine;
		//string style="height: 200px;color: #333;padding: 20px;background-color: #D7E9F5;-webkit-box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.4);-moz-box-shadow: 0px 1px 6px rgba(23, 69, 88, .5);-webkit-border-radius: 12px;-moz-border-radius: 7px;border-radius: 7px;background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, white), color-stop(15%, white), color-stop(100%, #D7E9F5));background: -moz-linear-gradient(top, white 0%, white 55%, #D5E4F3 130%);";
        msg += "</head>";
        msg += " <table align='right'  style='width:500px;' dir='rtl'>";
        msg += "<tr><td align='left'><br/></td></tr>";
        msg += "<tr>";
        msg += "<td style='font-family:Arial;font-size: 12px;font-weight: bold;'><br/>";
        //msg += "חשבונך נפתח בהצלחה";
        msg += "<p>" + Resources.Resource.please_authorize_receiving + "</p>";
       // msg += "מאת -<b> " + name + " </b><br/>";
        //msg += "אימייל -<b> " + email + " </b><br/>";
        msg += "<p><a href='https://Spix.co.il/activation.aspx?idUser=" + user.IdUser + "&mail=" + user.email + "'>" + Resources.Resource.press_here_to_authorize + "</a></p><br/><br/><br/>";
        msg += "</td></tr></table>";
        msg += "</body>";
        msg += "</html>";

        if (SendMail( subject, msg))
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
            MailAddress from = new MailAddress("info@spix.co.il", "Spix");
			MailAddress to = new MailAddress(user.email, user.email);
			//MailMessage message = new MailMessage(from, to);
			
            MailMessage mail = new MailMessage(from, to);
            mail.BodyEncoding = System.Text.Encoding.GetEncoding("utf-8");
            //mail.To.Add(TB_Email.Text);
            //mail.From="chagay@red-e.co.il";//new MailAddress("chagay@red-e.co.il");
            mail.Subject = Resources.Resource.account_opening_approval;
            string Body = Resources.Resource.account_opening_approval;
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
           // tbcheckpass.Text = ex.Message;
            return false;
        }
    
    }
    protected void Page_Load(object sender, EventArgs e)
    {
      
        lb_okregistersend.Visible = false;
    }
}