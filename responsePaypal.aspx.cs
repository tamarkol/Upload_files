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

public partial class responsePaypal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserObj"] == null)
        {
            Response.Redirect("login.aspx");
        }
        try
        {
            string req = Request["status"].ToString();
            Response.Write(req);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}
