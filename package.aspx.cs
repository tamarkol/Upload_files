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

public partial class package : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["UserObj"] == null)
        //{
        //    Response.Redirect("login.aspx");
        //}
        Master.loadUser();
        Master.pageTitle = Resources.Resource.purchase_credit;
        Master.iconHeader = "tdCredit";
        cPackages package = new cPackages();
        DataTable tbPack = package.getData().Tables[0];
        DataRow[] row = tbPack.Select("id=1");
        DataView dv = new DataView(tbPack);
        if (System.Threading.Thread.CurrentThread.CurrentCulture.Name == "en-US")
        {
            dv.RowFilter = "lang='en'";
        }
        else
            dv.RowFilter = "lang='he'";
        /*lNamePackage1.Text=row[0]["namePackage"].ToString();
        lAmount1.Text=row[0]["amount"].ToString();
        lPrice1.Text=row[0]["price"].ToString();
		
        row=tbPack.Select("id=2");
        lNamePackage2.Text=row[0]["namePackage"].ToString();
        lAmount2.Text=row[0]["amount"].ToString();
        lPrice2.Text=row[0]["price"].ToString();
		
        row=tbPack.Select("id=3");
        lNamePackage3.Text=row[0]["namePackage"].ToString();
        lAmount3.Text=row[0]["amount"].ToString();
        lPrice3.Text=row[0]["price"].ToString();
		
        row=tbPack.Select("id=4");
        lNamePackage4.Text=row[0]["namePackage"].ToString();
        lAmount4.Text=row[0]["amount"].ToString();
        lPrice4.Text=row[0]["price"].ToString();
        DataList1.DataSource= package.getData();
        DataList1.DataBind();*/
        //listPackage.DataSource = package.getData();
        //listPackage.DataTextField = "namePackage";
        //listPackage.DataValueField = "id";
      
        
        //listPackage.DataBind();
        //listPackage.

        DataList1.DataSource = dv;
        DataList1.DataBind();
    }
}
