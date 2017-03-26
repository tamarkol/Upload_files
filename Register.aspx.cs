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

public partial class Register : System.Web.UI.Page
{
	cUserDetail user;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = Resources.Resource.register;
        TB_Password.Attributes.Add("placeholder", Resources.Resource.password);
        TB_Email.Attributes.Add("placeholder", Resources.Resource.email);
        TB_PasswordConfirmation.Attributes.Add("placeholder", Resources.Resource.validate_password);
        B_Register.Text= Resources.Resource.register;
       // L_UserName.Text = "";
        //TB_Email.Attributes.Add("onFocus", "clearText1(this)");
        TB_Password.Attributes.Add("onFocus", "clearText1(this)");
        TB_PasswordConfirmation.Attributes.Add("onFocus", "clearText1(this)");
		/*user = new cUserDetail("eitzikgr@gmail.com", "1234");
		Session["UserObj"]=user;
		sendMailLid();
         */
    }
    //public bool ckeckNamePassword()
    //{
    //    bool ok = true;
    //    /*if (TB_UserName.Text.Length > 5)
    //        L_userErrorLength.Visible = false;
    //    else
    //    {
    //        ok = false;
    //        L_userErrorLength.Visible = true;
    //    }*/
    //    if (TB_Password.Text.Length > 5)
    //        L_PasswordErrorLength.Visible = false;
    //    else
    //    {
    //        ok = false;
    //        L_PasswordErrorLength.Visible = true;
    //    }
    //    return ok;   
            
           
    //}
    protected void B_Register_Click(object sender, EventArgs e)
    {
        
            //L_PasswordErrorLength.Visible = false;
        cUserDetail User = new cUserDetail(TB_Email.Text, TB_Password.Text);



        int IdUser = User.SaveNewUser();
        Session["UserObj"] = User;
        if (sendMailLid())
            Response.Redirect("okRegister.aspx");

    }
    private bool sendMailLid()
    {
		
        user= (cUserDetail) Session["UserObj"];
		//Response.Write(user.IdUser+" "+user.email );
        string subject = "";
        string msg = "<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.0 Transitional//EN'>" + Environment.NewLine;
        msg += "<html>" + Environment.NewLine;
        msg += "<head>" + Environment.NewLine;
        subject = Resources.Resource.registration_approval+"-red-e-tech";
        msg += " <title>"+ Resources.Resource.registration_approval+"</title>" + Environment.NewLine;
		//string style="height: 200px;color: #333;padding: 20px;background-color: #D7E9F5;-webkit-box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.4);-moz-box-shadow: 0px 1px 6px rgba(23, 69, 88, .5);-webkit-border-radius: 12px;-moz-border-radius: 7px;border-radius: 7px;background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, white), color-stop(15%, white), color-stop(100%, #D7E9F5));background: -moz-linear-gradient(top, white 0%, white 55%, #D5E4F3 130%);";
        msg += "</head>";
        msg += " <table align='right'  style='width:500px;' dir='rtl'>";
        msg += "<tr><td align='left'><br/></td></tr>";
        msg += "<tr>";
        msg += "<td style='font-family:Arial;font-size: 12px;font-weight: bold;'><br/>";
        //msg += "חשבונך נפתח בהצלחה";
        msg += "<p>"+Resources.Resource.please_authorize_receiving+"</p>";
       // msg += "מאת -<b> " + name + " </b><br/>";
        //msg += "אימייל -<b> " + email + " </b><br/>";
        msg += "<p><a href='https://Spix.co.il/activation.aspx?idUser=" + user.IdUser + "&mail=" + user.email + "'>"+Resources.Resource.press_here_to_authorize+"</a></p><br/><br/><br/>";
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
           // MailAddress to = new MailAddress("yafiprintz@gmail.com");
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
		//	Response.Write(ex.Message);
           // tbcheckpass.Text = ex.Message;

            sendMailLidError(ex.Message, "tamar@red-e.co.il");
            sendMailLidError(ex.Message, "yafiprintz@gmail.com");
            sendMailLidError(ex.Message, "eitzikgr@gmail.com");
            return false;
        }
    }

    private bool sendMailLidError(string error_message, string mailto)
    {
        string subject = "";
        string msg = "<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.0 Transitional//EN'>" + Environment.NewLine;
        msg += "<html>" + Environment.NewLine;
        msg += "<head>" + Environment.NewLine;
        subject = Resources.Resource.registration_error;
        msg += " <title>"+Resources.Resource.registration_error+"</title>" + Environment.NewLine;
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
