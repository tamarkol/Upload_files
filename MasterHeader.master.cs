using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterHeader : System.Web.UI.MasterPage
{
    public string titleheader
    {
        get { return titlePage.Text; }
        set { titlePage.Text = value; }
    }
    public string picHeader
    {
        
        get { return picHeaderMaster.Style.Value; }
        set {
            string img="";
            switch (value)
            {
                case "about":

                    img="images/design/about-pic.png";
                    break;
                case "concat":
                    img="images/design/contact-pic.png";
                    break;
                   
            }
             picHeaderMaster.Style.Add("background-image",img);
                        
    }}

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
