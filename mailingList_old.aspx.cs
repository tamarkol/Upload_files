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

public partial class mailingList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = Resources.Resource.contacts;
        DDLmailingList.Attributes.Add("placeholder", Resources.Resource.choose_a_distribution_list_);
        Btn_delete.Text = Resources.Resource.erase_list;
        GridView1.Columns[1].HeaderText = Resources.Resource.number;
        GridView1.Columns[2].HeaderText = Resources.Resource.name;
        GridView1.Columns[3].HeaderText = Resources.Resource.edit;
        GridView1.Columns[4].HeaderText = Resources.Resource.delete;
        //if (Session["UserObj"] == null)
        //{
        //    Response.Redirect("login.aspx");
        //}
        Master.loadUser();
        phonePerson.Attributes.Add("onkeydown", "return numbersOnly(event);");
        string idCategory="-1";
        
        if (!IsPostBack)
        {

            Master.pageTitle = Resources.Resource.contacts;
            Master.iconHeader = "tdMailingList";
            //Master.iconHeader = "tdMailingList";
            loadcategoriesMailingList();
            if (Request["idCategory"] != null)
            {
                idCategory = Request["idCategory"].ToString();
                DDLmailingList.ClearSelection();
                DDLmailingList.Items.FindByValue(idCategory).Selected = true;
            }
            else idCategory = DDLmailingList.SelectedValue;
            if(DDLmailingList.Items.Count>0)
            {
               /* DDLmailingList.Items[0].Selected = true;
                idCategory = DDLmailingList.Items[0].Value;*/
            }
           // <asp:ListItem Selected="True" [B]Enabled="false"[/B] Value=""> Select </asp:ListItem>
             /*   ListItem li=new ListItem ("בחר רשימת תפוצה","-1");
            li.Enabled=false;


            DDLmailingList.Items.Add(li);
            DDLmailingList.Items.FindByValue("-1").Selected = true;*/
            if (idCategory != "")
            {
                MailingList ml = new MailingList();
                int idCast = Convert.ToInt32(idCategory);
                DataSet ds = ml.mailingListForCategory(idCast);
                Session["dsGridView"] = ds;
                fillDdlPageSize();

            }
        }
        if (idCategory != "")
        {
            GridView1.DataSource = (DataSet)Session["dsGridView"];
            GridView1.DataBind();
            if (GridView1.HeaderRow != null)
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

        }
    }
    public void fillDdlPageSize()
    {
        ListItem a = new ListItem(Resources.Resource.display_20_lines, "20");
        ListItem b = new ListItem(Resources.Resource.display_50_lines, "50");
        ListItem c = new ListItem(Resources.Resource.display_100_lines, "100");
        //ListItem.int[] PageSize = new int[] { 20, 50, 100 };
        ddlPageSize.Items.Add(a);
        ddlPageSize.Items.Add(b);
        ddlPageSize.Items.Add(c);
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
 

        char x = '"';
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //e.Row.Cells[3].Text = "<input type='button' value='ערוך' onclick='openDialogEditMailList('" + e.Row.Cells[0].Text + "','" + e.Row.Cells[1].Text + "','" + e.Row.Cells[2].Text + "')';/>";
            e.Row.Cells[3].Text = "<input type='button' class='editbtn'  onclick=" + x + "openDialogEditMailList('" + e.Row.Cells[0].Text + "','" + e.Row.Cells[1].Text + "','" + e.Row.Cells[2].Text + "')" + x + ">";
            e.Row.Cells[4].Text = "<input type='button' class='delbtn'  onclick=" + x + "opendivDeletePerson('" + e.Row.Cells[0].Text + "')" + x + ">";
           // e.Row.Cells[0].Attributes.Add("id", "id_" + e.Row.Cells[0].Text+ x+"style= color: transparent;");
            e.Row.Cells[0].Attributes.Add("id", "id_" + e.Row.Cells[0].Text +x+"style="+x+ "color: transparent");
            e.Row.Cells[2].Attributes.Add("id", "name_" + e.Row.Cells[0].Text);
            e.Row.Cells[1].Attributes.Add("id", "phone_" + e.Row.Cells[0].Text);
            e.Row.Attributes.Add("id", "rowid_" + e.Row.Cells[0].Text);
        }
        e.Row.Attributes.Add("onload", "this.style.display='none'");
        //e.Row.Cells[0].Visible = false;
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLmailingList.SelectedValue!="")
        {
            int catId = Convert.ToInt32(DDLmailingList.SelectedValue);
            categoriesMailingList categoriesMailingList = new categoriesMailingList(catId);
            categoriesMailingList.Load();
            bool IsPrivate = categoriesMailingList.CategoryPrivate;
            if (IsPrivate)
            {
                GridView1.Visible = false;
            }


            MailingList ml = new MailingList();
            DataSet ds = ml.mailingListForCategory(catId);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            Session["dsGridView"] = ds;
        }
    }
    protected void okExcel_Click(object sender, EventArgs e)
    {
        int castCategory;
        string categoryId = HFcategoryexcel.Value;
        bool parsed = Int32.TryParse(categoryId, out castCategory);
        if (parsed)
        {
            loadcategoriesMailingList();
			DDLmailingList.ClearSelection();
            DDLmailingList.Items.FindByValue(categoryId).Selected = true;
            MailingList ml = new MailingList();
            DataSet ds = ml.mailingListForCategory(castCategory);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
       
        

    }
    protected void refreshDdl_click(object sender, EventArgs e)
    {
       // if (Session["UserObj"] != null)
        //{
        Master.loadUser();
            cUserDetail user = new cUserDetail();
            user = (cUserDetail)Session["UserObj"];
            MailingList MailingList = new MailingList();
            categoriesMailingList categoriesMailingList = new categoriesMailingList();
            int id = user.IdUser;
            DataSet ds = categoriesMailingList.loadcategoriesMailingList(id);
            string last = ds.Tables[0].Rows[ds.Tables[0].Rows.Count - 1]["categoryID"].ToString();
            DDLmailingList.DataSource = ds.Tables[0];
            DDLmailingList.DataTextField = "CategoryName";
            DDLmailingList.DataValueField = "categoryID";
            DDLmailingList.DataBind();
            DDLmailingList.Items.FindByValue(last).Selected = true;

            int catId = Convert.ToInt32(DDLmailingList.SelectedValue);
            MailingList ml = new MailingList();
            DataSet ds2 = ml.mailingListForCategory(catId);
            GridView1.DataSource = ds2;
            GridView1.DataBind();
            if (GridView1.HeaderRow != null)
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            Session["dsGridView"] = ds2;
        //}

    }
    public void loadcategoriesMailingList()
    {
        //string categoryName;
       // if (Session["UserObj"] != null)
       // {
        Master.loadUser();
            cUserDetail user = new cUserDetail();
            user = (cUserDetail)Session["UserObj"];
            MailingList MailingList = new MailingList();
            categoriesMailingList categoriesMailingList = new categoriesMailingList();


            int id = user.IdUser;
            DataSet ds = categoriesMailingList.loadcategoriesMailingList(id);
            //foreach (DataRow dr in ds.Tables[0].Rows)
            //{
            //    categoryName = dr["categoryName"].ToString();
            //    DDLmailingList.Items.Add(categoryName);
            //    DDLmailingList.v.Items.
            //}
            DDLmailingList.DataSource = ds.Tables[0];
            
            DDLmailingList.DataTextField = "CategoryName";
            DDLmailingList.DataValueField = "categoryID";

            ListItem li = new ListItem(Resources.Resource.choose_a_distribution_list_, "-1");
           li.Enabled=false;
   

            DDLmailingList.DataBind();
            //DDLmailingList.Items.Insert(0, new ListItem("בחר רשימת תפוצה", String.Empty));
            DDLmailingList.SelectedIndex = 0;
            //DDLmailingList.Items[0].Attributes.Add("title", "בחר רשימת תפוצה");
            //DDLmailingList.DataBind();
       // }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
        GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
    }
    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.PageSize =Convert.ToInt32( ddlPageSize.SelectedValue);
        GridView1.DataBind();
        GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

    }
	 protected void Btn_delete_Click(object sender, EventArgs e)
    {
        int catId = Convert.ToInt32(DDLmailingList.SelectedValue);
        categoriesMailingList category = new categoriesMailingList(catId);
		string catname = DDLmailingList.SelectedItem.ToString();
		if(catname!="הרשימה שלי")
           category.delete();
        cUserDetail user = (cUserDetail)Session["UserObj"];
        MailingList MailingList = new MailingList();
        categoriesMailingList categoriesMailingList = new categoriesMailingList();
        int id = user.IdUser;
        DataSet ds = categoriesMailingList.loadcategoriesMailingList(id);
        DDLmailingList.DataSource = ds.Tables[0];

        DDLmailingList.DataTextField = "CategoryName";
        DDLmailingList.DataValueField = "categoryID";

        
        DDLmailingList.DataBind();
       
        DDLmailingList.SelectedIndex = 0;
        catId = Convert.ToInt32(DDLmailingList.SelectedValue);
        MailingList ml = new MailingList();
        ds = ml.mailingListForCategory(catId);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
        Session["dsGridView"] = ds;
       
    
    }
}
