using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
//using VoiceMail;
using System.Drawing;
using System.Web.Services;


public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = Resources.Resource.sign_in;
        TB_Email.Attributes.Add("placeholder", Resources.Resource.email);
        TB_Password.Attributes.Add("placeholder", Resources.Resource.password);
        bb.Text = Resources.Resource.havent_registered_yet;
        lErrorActive.Text = Resources.Resource.complete_your_registration;
        B_login.Text = Resources.Resource.logon;
        lErrorActive.Visible = false;
        L_errorLogin.Visible = false;
        //TB_Email.Attributes.Add("onFocus", "clearText1(this)");
        TB_Password.Attributes.Add("onFocus", "clearText1(this)");
        if (Request["ctl00$txt_name"] != null && Request["ctl00$txt_name"] != Resources.Resource.user_name && Request.Form["ctl00$txt_pass"] != null)
        {
            string userName = Request["ctl00$txt_name"].ToString();
            string Pass =  Request["ctl00$txt_pass"].ToString();
            //login..
            cUserDetail User = new cUserDetail(userName, Pass);
            login(User);
        }
    }
    protected void B_Login_Click(object sender, EventArgs e)
    {
        cUserDetail User = new cUserDetail(TB_Email.Text, TB_Password.Text);
        login(User);      
    }
     void login(cUserDetail User)
    {
        if (User.Login())
        {
          //if (User.active)
      // {
            HttpCookie kk = new HttpCookie("username", User.email);
            kk.Expires = DateTime.Now.AddDays(3);
            Response.Cookies.Add(kk);
            kk = new HttpCookie("pass",User.Password);
            kk.Expires = DateTime.Now.AddDays(3);
            Response.Cookies.Add(kk);
                Session["UserObj"] = User;
            //  Response.Redirect("myAccount.aspx");
                Response.Redirect("dashboard.aspx");
          // }
        // else
        //  {
               //lErrorActive.Visible = true;
               //TB_Password.Text = "";
        // }

        }
        else
        {
            TB_Password.Text = "";
            L_errorLogin.Visible = true;
        }
       
    }
    protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        Master.mailUserText = User.ToString();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //Response.Redirect("editProject.aspx");
    }
}
