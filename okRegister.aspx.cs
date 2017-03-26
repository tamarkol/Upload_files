using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using VoiceMail;

public partial class okRegister : System.Web.UI.Page
{
  
    public string IfNameUser;
    public string IfMailUser;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = Resources.Resource.your_registration_received;
       // if (Session["UserObj"] != null)
       // {
        loadUser();
            cUserDetail user = (cUserDetail)Session["UserObj"];
          
            IfNameUser = (user.IdUser).ToString();
            IfMailUser = user.email;
            Session["UserObj"] = null;
        //}
    }
    public bool loadUser()
    {
        cUserDetail user;
        bool loadOk = true;
        if (Session["UserObj"] == null)
        {
            loadOk = false;
            if (Request.Cookies["username"] != null && Request.Cookies["pass"] != null)
            {
                user = new cUserDetail(Request.Cookies["username"].Value, Request.Cookies["pass"].Value);
                if (user.Login())
                {
                    Session["UserObj"] = user;
                    loadOk = true;
                }
            }
        }
        if (loadOk)
        {
            user = (cUserDetail)Session["UserObj"];
        }
        else
            Response.Redirect("login.aspx");
        return true;
    }
}