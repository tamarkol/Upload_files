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
using System.Drawing;
public partial class selectProject : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["UserObj"] == null)
        //{
        //    Response.Redirect("login.aspx");
        //}

        Page.Title = Resources.Resource.project_management;
        GridViewProjects.EmptyDataText = Resources.Resource.no_previous_messages;
        GridViewProjects.Columns[0].HeaderText = Resources.Resource.report_edit;
        GridViewProjects.Columns[1].HeaderText = Resources.Resource.date;
        GridViewProjects.Columns[2].HeaderText = Resources.Resource.message_name_;
        GridViewProjects.Columns[3].HeaderText = Resources.Resource.status;
        GridViewProjects.Columns[4].HeaderText = Resources.Resource.sent;
        GridViewProjects.Columns[5].HeaderText = Resources.Resource.stop;
        //DLprojectsSend.EmptyDataText = Resources.Resource.no_projects_exist;
        Master.loadUser();
        cUserDetail user = new cUserDetail();
        user =(cUserDetail) Session["UserObj"];


        DataTable source;
        //GVproject.DataSource = user.loadProject();
       // GVproject.DataBind();
        if (!IsPostBack)
        {
            Master.pageTitle = Resources.Resource.project_management;
            Master.iconHeader = "tdProject";
            DataSet ds = user.loadProject();//to change
               source = ds.Tables[0];
               Session["source"] = source;
               fillDdlPageSize();
        }
        else
            source = (DataTable)Session["source"];
        //if (Session["source"] == null)
        //{
        //    DataSet ds = user.loadProject();
        //    source = ds.Tables[0];
        //    Session["source"] = source;
        //}
        //else
        //{
        //    source = (DataTable)Session["source"];

        //}
        //DataRow[] rows = ds.Tables[0].Select("status='1'");

        //DataView oDVForEdit = new DataView(ds.Tables[0], "status='0'", "idProject", DataViewRowState.CurrentRows);
        //DataView oDVForReport = new DataView(ds.Tables[0], "status='1'", "idProject", DataViewRowState.CurrentRows);
      
        GridViewProjects.DataSource = source ;
        GridViewProjects.DataBind();

        //DLprojectsNoSend.DataSource = oDVForEdit;//.Tables[0].Select("status='0'");
        //DLprojectsNoSend.DataBind();

        //DLprojectsSend.DataSource = ds.Tables[0];//oDVForReport;//.Tables[0].Select("status='0'");
        //DLprojectsSend.DataBind();
    

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
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
      }
    protected void GVproject_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //GVproject.Columns[0].Visible = false;

    }

    protected void Datep(DateTime d)
     {
         d.ToOADate();
       
     }
    protected void DLprojects_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    public string showReport(object status, object idProject)
    {
        if (status.ToString() == "0")
            return "<a class='bt' href='editProjectV2.aspx?id=" + idProject + "' >"+Resources.Resource.edit_mode+"</a>"; 
        else
            return "<a class='bt' href='Seker.aspx?id=" + idProject + "' >"+Resources.Resource.show_details+"</a>";    
    }
	public string showIcon(object status)
	{
		if (status.ToString() == "1")
            //return "<img src='images/design/icons/yes.png'/>";
            return Resources.Resource.sent_;
		return "";
    }
	public string showButton(object status)
	{
        if (status.ToString() == "1")
            // return "<img src='images/design/icons/yes.png'/>";
            return Resources.Resource.sent_;
		return "";
    }
	public string urlEdit(object status,object idProject)
    {
		if (status.ToString() == "1")
            return "Seker.aspx?id=" + idProject.ToString();
		return "editProjectV2.aspx?id=" + idProject.ToString();
    }
	public string textButton(object status)
	{
		if (status.ToString() == "1")
            return Resources.Resource.show_details;
        return Resources.Resource.edit_mode;
	}
    /*public string urlEdit2(object idProject)
    {
        return "editProject.aspx?id=" + idProject.ToString();
    }*/
    protected void GridViewProjects_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        char x = '"';
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[3].Text == "1")
            {
                //e.Row.Cells[3].Text = "<img src='images/design/icons/yes.png'/>";
                e.Row.Cells[3].Text = Resources.Resource.sent_;
                //e.Row.Cells[0].Text = "<a href='report.aspx?id=" + e.Row.Cells[4].Text + "'><img style='cursor:pointer' src='images/design/icons/icon-reports.png' title='הצג דוח' /></a>";
                e.Row.Cells[0].Text = "<a href='report.aspx?id=" + e.Row.Cells[4].Text + "'><div type='button' style='cursor:pointer' class='reportbtn' title='"+Resources.Resource.show_report+"' ></div></a>";
                //e.Row.Cells[0].Text = "<a href='report.aspx?id=" + e.Row.Cells[4].Text + "' align='center' ><div class='reportbtn'></div></a>";
                e.Row.Cells[5].ToolTip  = Resources.Resource.press_stop;
                
            }
            else
            {
                //e.Row.Cells[3].Text = "<img src='images/design/delet.png'/>";
                e.Row.Cells[3].Text = Resources.Resource.not_sent;
                System.Drawing.Color col = System.Drawing.ColorTranslator.FromHtml("#e8be00");
               // Color myColor = ColorTranslator.FromHtml(
               e.Row.Cells[3].ForeColor = col;
               //e.Row.Cells[0].Text = "<a href='editProjectV2.aspx?id=" + e.Row.Cells[4].Text + "'><div type='button' style='cursor:pointer' class='editbtn' title='ערוך ושלח' ></div></a>";
               //e.Row.Cells[0].Text = "<a href='editProjectV2.aspx?id=" + e.Row.Cells[4].Text + "'><div type='button' style='cursor:pointer' class='editbtn' title='ערוך ושלח' ></div></a>";
               e.Row.Cells[0].Text = "<input type='button' onclick='openDialog(" + e.Row.Cells[4].Text + ")' id='addpro' class='editbtn' />";
                // e.Row.Cells[0].Text = "<a href='editProject.aspx?id=" + e.Row.Cells[4].Text + "' class='editbtn'></a>";
            }
        }
    }
    protected void GridViewProjects_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
      
    }
    protected void GridViewProjects_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewProjects.PageIndex = e.NewPageIndex;
        GridViewProjects.DataBind();
    }
    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewProjects.PageSize = Convert.ToInt16(ddlPageSize.SelectedValue);
        GridViewProjects.DataBind();
    }
	protected void GridViewProjects_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
       // GridViewRow row = GridViewProjects.Rows[index];
        int idProject = Convert.ToInt32( GridViewProjects.Rows[index].Cells[4].Text);
        statusVoiceMailsSend st =new statusVoiceMailsSend();        
        bool ans = st.stopCallToSend(idProject);
  
    }

    public static int GetTotal(int p_id)
    {
        dbLayer db = new dbLayer();
        return db.count_run_project(p_id);
    }

}
