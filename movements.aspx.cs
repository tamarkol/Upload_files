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


public partial class movements : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = Resources.Resource.title_movements;
        GVminus.EmptyDataText = Resources.Resource.no_data;
        GVminus.Columns[0].HeaderText = Resources.Resource.date_sent_;
        GVminus.Columns[1].HeaderText = Resources.Resource.amount_of_messages;
        GVminus.Columns[2].HeaderText = Resources.Resource.message_name_;
        GVplus.EmptyDataText = Resources.Resource.no_data;
        GVplus.Columns[0].HeaderText = Resources.Resource.date_purchased;
        GVplus.Columns[1].HeaderText = Resources.Resource.amount_of_messages;
        GVplus.Columns[2].HeaderText = Resources.Resource.type_of_package;

        ddl_pageSize_minus.Style.Add("float", Resources.Resource.align);
        ddl_pageSize_plus.Style.Add("float", Resources.Resource.align);
        HyperLink1.Style.Add("float", Resources.Resource.align_opposite);
        //if (Session["UserObj"] == null)
        //{
        //    Response.Redirect("login.aspx");
        //}
        Master.loadUser();
        if (!IsPostBack)
        {
            Master.iconHeader = "tdCredit";
            Master.pageTitle = Resources.Resource.account_status;
            //if (Session["UserObj"] != null)
            //{
            Master.loadUser();
                cUserDetail user = new cUserDetail();
                user = (cUserDetail)Session["UserObj"];
                DataSet dsMovements = user.getDataMovement();
                //                GVminus.Columns[1].FooterText = dsMovements.Tables["tbl_minus"].AsEnumerable().Select(x => x.Field<int>("amount")).Sum().ToString();
                Session["dsMovements"] = dsMovements;

                lCountMsg.Text = user.getCreditUser().ToString();
                fillDdlPageSize();
           // }
        }
        DataSet sessionMov = (DataSet)Session["dsMovements"];
        GVminus.DataSource = sessionMov.Tables["tbl_minus"];
        GVminus.DataBind();
        GVplus.DataSource = sessionMov.Tables["tbl_plus"];
        GVplus.DataBind();


    }
    protected void GVminus_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVminus.PageIndex = e.NewPageIndex;
        GVminus.DataBind();
    }
    protected void GVplus_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVplus.PageIndex = e.NewPageIndex;
        GVplus.DataBind();
    }
    protected void ddl_pageSize_minus_SelectedIndexChanged(object sender, EventArgs e)
    {
        GVminus.PageSize = Convert.ToInt32(ddl_pageSize_minus.SelectedValue);
        GVminus.DataBind();
    }
    public void fillDdlPageSize()
    {
        ListItem a = new ListItem(Resources.Resource.display_20_lines, "20");
        ListItem b = new ListItem(Resources.Resource.display_50_lines, "50");
        ListItem c = new ListItem(Resources.Resource.display_100_lines, "100");
        //ListItem.int[] PageSize = new int[] { 20, 50, 100 };
        ddl_pageSize_minus.Items.Add(a);
        ddl_pageSize_minus.Items.Add(b);
        ddl_pageSize_minus.Items.Add(c);
        ddl_pageSize_plus.Items.Add(a);
        ddl_pageSize_plus.Items.Add(b);
        ddl_pageSize_plus.Items.Add(c);

    }
    protected void ddl_pageSize_plus_SelectedIndexChanged(object sender, EventArgs e)
    {
        GVplus.PageSize = Convert.ToInt32(ddl_pageSize_plus.SelectedValue);
        // GVplus.DataSource=((DataSet)Session["dsMovements"]).Tables["tbl_plus"];

        GVplus.DataBind();
    }
   
    protected void GVminus_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        int len;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            len = e.Row.Cells[1].Text.Length;
            e.Row.Cells[1].Text = e.Row.Cells[1].Text.Substring(1, len-1);
        
        }
    }
}
