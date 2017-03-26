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

public partial class myAccount : System.Web.UI.Page
{
    public string pphone;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = Resources.Resource.update_details;
        Label1.Text = Resources.Resource.first_name;
        Label2.Text = Resources.Resource.family_name;
        Label3.Text = Resources.Resource.telephone;
        Label4.Text = Resources.Resource.adress_;
        Label5.Text = Resources.Resource.mail;
        B_update.Text = Resources.Resource.update;
        if (!IsPostBack)
        {
            Master.pageTitle = Resources.Resource.update_details;
            Master.iconHeader = "tdUpdate";
            Master.loadUser();
            //if (Session["UserObj"] != null)
            //{
                cUserDetail User = (cUserDetail)Session["UserObj"];
                int IdUser = Convert.ToInt32(User.IdUser);
				User.Login();
                TB_Phone.Text = User.phone;
                TB_Lname.Text = User.lname;
                TB_Fname.Text = User.Fname;
                TB_Email.Text = User.email;
                TB_Address.Text = User.address;
                //Master.userNameText = User.UserName + "    שלום";
                if (User.verifyPhone == true)
				{
                    //Panel2.Visible = false;
					iconVerify.ImageUrl="images/check.png";
                    iconVerify.ToolTip = Resources.Resource.telephone_number_has_been_validated;
					TB_Phone.ReadOnly=true;
                }
				else
                 {
				 iconVerify.ImageUrl="images/x.png";
                 iconVerify.ToolTip = Resources.Resource.telephone_number_has_not_been_validated;
					
				 }   //Panel1.Visible = false;

                           
     
                


            //}
            //else
            //    Response.Redirect("login.aspx");
        }
      
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        cUserDetail User = (cUserDetail)Session["UserObj"];
        User.lname=TB_Lname.Text;
        User.Fname=TB_Fname.Text;
        User.address=TB_Address.Text;
        User.email=TB_Email.Text;
        User.phone=TB_Phone.Text;
        User.UpdateUser();
       // bool i = User.UpdateUser(TB_Fname.Text, TB_Lname.Text, TB_Address.Text, TB_Email.Text, TB_Phone.Text);
        Response.Redirect("msgAfterAction.aspx");
    }
    protected void TB_Phone_TextChanged(object sender, EventArgs e)
    {

    }
    protected void BaddProject_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("selectProject.aspx");
    }
    protected void TB_Lname_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {

    }
    protected void BtnVerifyPhone_Click(object sender, EventArgs e)
    {

    }
}
