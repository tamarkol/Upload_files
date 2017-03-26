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


public partial class ServiceAjax : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string userCheck = Request.QueryString["myName"].ToString();
        cUserDetail user = new cUserDetail(userCheck);
        if (user.UsernameAvailability())
        {
            Response.Write("true");
        }
        else
        {
            Response.Write("false");
        }
    }
}
