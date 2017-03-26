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

public partial class myAccountMenu : System.Web.UI.MasterPage
{
    //public bool show_login
    //{
    //    get { return Master.login; }
    //    set { Master.login = value; }
    //}
    //public bool show_logout
    //{
    //    get { return Master.logOut; }
    //    set { Master.logOut = value; }
    //}
  
    public string name
    {
        get { return Master.userNameText ; }
        set { Master.userNameText = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
       
            if (Session["UserObj"] == null)
            {
                Response.Redirect("login.aspx");
            }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("updateDetails.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
          Response.Redirect("mailingList.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
 Response.Redirect("selectProject.aspx");
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("movements.aspx");
    }
        
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("dashboard.aspx");
    }
}
