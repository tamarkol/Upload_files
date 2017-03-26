using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

////using VoiceMail;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    public string aaa;
    //public bool logOut
    //{
    //    get { return B_logOut.Visible; }
    //    set { B_logOut.Visible = value; }
    //}
  
    //public string userNameText
    //{
    //    get { return L_UserName.Text; }
    //    set { L_UserName.Text = value; }
    //}
    public Boolean is_login =false;
    public string email_woop ="";
    public string pass_woop ="";
    public int id_woop =0;
    public string mailUserText
    {
        get { return l_mailUser.Text; }
        set { l_mailUser.Text = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        txt_name.Attributes.Add("onFocus", "clearText(this)");
        txt_pass.Attributes.Add("onFocus", "clearText(this)");
        t.Text = Resources.Resource.logon;
        btnLogout.Text = Resources.Resource.logout;
        txt_name.Text = Resources.Resource.user_name;
        txt_pass.Text = Resources.Resource.password;
        Label1.Text = Resources.Resource.logout;
        if (!IsPostBack)
        {
            if (Session["UserObj"] == null)
            {
                is_login = false;
                panelLoginUserMaster.Visible = true;
                panelMailUser.Visible = false;
               
            }
            else
            {
                is_login = true;
                cUserDetail User;
                User = (cUserDetail)Session["UserObj"];
                try
                {
                email_woop = User.email;
                pass_woop = User.Password;
                id_woop = User.IdUser;
                }
                catch (Exception)
                {
                }
                panelLoginUserMaster.Visible = false;
                panelMailUser.Visible = true;
               /* Pane_login.Visible = false;
                Panel_out.Visible = true;
                L_UserName.Visible = true;
                L_UserName.Text = User.email;*/

                l_mailUser.Text = User.email;

            }
        }

    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Session["UserObj"] = null;
        Session.Clear();
        HttpCookie currentUserNameCookie = HttpContext.Current.Request.Cookies["username"];
        HttpContext.Current.Response.Cookies.Remove("username");
        currentUserNameCookie.Expires = DateTime.Now.AddDays(-10);
        currentUserNameCookie.Value = null;
        HttpContext.Current.Response.SetCookie(currentUserNameCookie);

        HttpCookie currentUserPassCookie = HttpContext.Current.Request.Cookies["pass"];
        HttpContext.Current.Response.Cookies.Remove("username");
        currentUserPassCookie.Expires = DateTime.Now.AddDays(-10);
        currentUserPassCookie.Value = null;
        HttpContext.Current.Response.SetCookie(currentUserPassCookie);


       // L_UserName.Visible = false;

        Response.Redirect("home.aspx");

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
