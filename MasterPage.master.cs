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
////using VoiceMail;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public string aaa;
    public bool logOut
    {
        get { return B_logOut.Visible; }
        set { B_logOut.Visible = value; }
    }
    //public bool login
    //{
    //    get { return B_login.Visible; }
    //    set { B_login.Visible = value; }
    //}
    public string userNameText
    {
        get { return L_UserName.Text; }
        set { L_UserName.Text = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        txt_name.Attributes.Add("onFocus", "clearText(this)");
        txt_pass.Attributes.Add("onFocus", "clearText(this)");
        if (!IsPostBack)
        {
            if (Session["UserObj"] == null)
            {
                   Pane_login.Visible = true;
                   Panel_out.Visible = false;
                //Response.Redirect("login.aspx");
            }
            else
            {
				 cUserDetail User;
				User=(cUserDetail)Session["UserObj"];
                Pane_login.Visible=false;
                Panel_out.Visible= true;
                L_UserName.Visible = true;
				L_UserName.Text=User.email;
                //Response.Redirect("login.aspx");
         
            }
        }
       
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["UserObj"] = null;
        Session.Clear();
        L_UserName.Visible=false;
        Response.Redirect("Login.aspx");
        
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
    }
    protected void B_login_Click(object sender, EventArgs e)
    {

    }
    
    protected void LinkButton2_Click(object sender, EventArgs e)
    {

    }
    protected void t_Click(object sender, EventArgs e)
    {
        cUserDetail user = new cUserDetail(txt_name.Text, txt_pass.Text);
        if (user.Login())
        {
            if (user.active)
            {
                Session["UserObj"] = user;
                //Response.Redirect("myAccount.aspx");
                Response.Redirect("dashboard.aspx");
               
            }
        }
      

    }
}
