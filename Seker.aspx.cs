using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Text;
//using VoiceMail;
using System.Data;
using System.Net;
public partial class Seker : System.Web.UI.Page
{

   public bool ok = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.loadUser();
        //if (Session["UserObj"] == null)
        //{
        //    Response.Redirect("login.aspx");
        //}
        if (Request["id"] != null)
        {
            string file="";
            int projectId = Convert.ToInt32(Request["id"]);
            cProjectVoiceMail project = new cProjectVoiceMail(projectId);
            if (project.loadProject())
            {
                LnameProject.Text = project.ProjectName;
                LdataProject.Text = project.ProjectDate.ToShortDateString();
                cCallAction[] collection=project.CallProperties.getCollection();
                foreach (cCallAction c in collection)
                {
                    if (c is cOutputEvent && c.IsStart)
                    {
                        cOutputEvent output = (cOutputEvent)c;
                        file = output.PlaybackSource;
                    }
                }
                //AudioPlayer.embed('audioplayer_N',{soundFile: 'streamFile.aspx?streamFile='"+ file +" });
               // Label lPlay = new Label();
                lPlay.Text = "<script type='text/javascript'>AudioPlayer.embed('audioplayer_N', { soundFile: 'streamFile.aspx?streamFile=" + file + "' });</script>";
               
    
                dinamicTable(project.IdProject);
            }
        }
        if (Request["parm"] == "t")
        {
            BoundField dateField = new BoundField();
            dateField.HeaderText = "Ok";
            GridView2.Columns.Add(dateField);
        }
       
        // cUserDetail User = (cUserDetail)Session["UserObj"];
        //        int IdUser = Convert.ToInt32(User.IdUser);
               
        //        cProjectVoiceMail p = new cProjectVoiceMail();
               
        // p.lastProject(IdUser);
        //        int idLastProject=p.IdProject;
        //cProjectVoiceMail project1 = new cProjectVoiceMail(idLastProject);
		
        //GridView2.DataSource = project1.statusReport();
        //GridView2.DataBind();

        //string[] aa = new string[] { "11111", "11111", "11111", "11111", "11111", "11111" };
        //GridView2.DataSource = aa;
        //GridView2.DataBind();
    }
    private void dinamicTable(int idProject)
    {
        cProjectVoiceMail project1 = new cProjectVoiceMail(idProject);
        
        DataTable tb = project1.statusMailingListForProject().Tables[0];
        DataTable tq = project1.statusReport().Tables[0];
        
        int numAnswer = 0;
        int numNoAnswer = 0;
        int NumPhone=0;
        string inv = "";
        int idCustomer = 555;
        //inv = "<table width='95%' dir='rtl'>";
        //inv += "<tr style='font-weight:bold;text-decoration: underline'><td>ערך</td><td>שם</td><td>מספר</td><td>סכום</td><td>הצג מסמך</td><td>שמור קובץ</td></tr>";
        string scriptFotter="";
        int co = 0;
        int type;
        string parameter;
        foreach (DataRow r in tb.Rows)
        {
            co++;
			string outer="";
            outer += "<div><table width='330px' cellpadding='3' style='font-size:10pt;' ><tr style='padding-top:1px;padding-bottom:1px;'>";
            outer += "<td width='33%' align='right'>" + convertStatus(r["status"]) + "</td>";
			outer += "<td width='33%'   align='right'>" + r["phone"].ToString() + "</td>";            
			outer += "<td width='33%' style='' align='right'>" + r["name"].ToString() + "</td>";
            NumPhone++;
			outer += "</tr></table></div>";
       
            inv += "<div id='expander" + co + "'><div>" + outer + "</div>";
            if (r["status"].ToString() == "1")
            {
                numAnswer++;
                inv += "<table border='0' dir='rtl' width='300px' cellpadding='3' style='font-size:10pt;' ><tr>";
                inv += " <td width='50%' style='font-weight:bold'>" + " שלב שיחה" + "</td>" + "<td style='font-weight:bold' width='50%' >" + "תשובה לערך" + "</td></tr>";

                DataRow[] rows = tq.Select("idPersonOfList=" + r["idPersonOfList"].ToString());
                foreach (DataRow ro in rows)
                {
                    int idPlayer =(int) ro["idPersonOfList"];
                    parameter = ro["Parameter"].ToString();
                    type = (int)ro["actionType"];
                    if (type == 1)
                        if (parameter == "1")
                            parameter = "נשמעה";
                        else
                            parameter = "לא נשמעה";
                    if (type == 4)
                    {
                        Label lPlay = new Label();
                        parameter = "<p id='audioplayer_N" + idPlayer + "'>Alternative content</p><script type='text/javascript'>AudioPlayer.embed('audioplayer_N" + idPlayer + "', { soundFile: 'streamFile.aspx?streamFile=" + idPlayer + "' });</script>";
                    }
                    inv += "<tr><td>" + ro["actionName"] + "</td><td >" + parameter + "</td></tr>";

                }
                inv += "</table>";
            }
            else
            {
                numNoAnswer++;
                inv += "<div>לא היה מענה</div>";
            }
            inv += "</div>";
            scriptFotter += "$('#expander" + co + "').wijexpander ({expanded: false ,expandDirection: 'bottom'});";
             }
        
        string scriptMain = "<script id='scriptInit' type='text/javascript'>";
        scriptMain+=scriptFotter+"</script>";

        LnumNoAnswer.Text = numNoAnswer.ToString();
        LnumAnswer.Text = numAnswer.ToString();
        LNumPhone.Text = NumPhone.ToString();
        lbl_table.Text = inv + scriptMain;
        if (numNoAnswer > 0)
            PanelSendAgain.Visible = true;
    }
	private string convertStatus(object status)
	{
		if(status.ToString()=="1")
			return "נענתה";
		return "----";
	}
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        BoundField dateField = new BoundField();
        dateField.HeaderText = "Ok";       
        GridView2.Columns.Add(dateField);

        string[] aa = new string[] { "11111", "11111", "11111", "11111", "11111", "11111" };
        GridView2.DataSource = aa;
        GridView2.DataBind();
    }
    public override void VerifyRenderingInServerForm(Control control)
    { }//חייב עבור הורדה לאקסל
    protected void bt_export_Click(object sender, EventArgs e)
    {

        HtmlForm form = new HtmlForm();
        string attachment = "attachment; filename=Employee.xls";
        Response.ClearContent();
        Response.AddHeader("content-disposition", attachment);
        HttpContext.Current.Response.ContentEncoding = Encoding.GetEncoding("windows-1255");
        HttpContext.Current.Response.Charset = "windows-1255";
        Response.ContentType = "application/ms-excel";
        StringWriter stw = new StringWriter();
        HtmlTextWriter htextw = new HtmlTextWriter(stw);
        form.Controls.Add(GridView2);
        this.Controls.Add(form);
        form.RenderControl(htextw);
        Response.Write(stw.ToString());
        Response.End();
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {


            Panel p = new Panel();
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#FFFFFF'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=''");
            e.Row.Attributes.Add("style", "cursor:pointer;");
            e.Row.Attributes.Add("onclick", "CreatePanel(this)");

            //e.Row.Attributes.Add("onclick", "location='patron_detail.aspx?id=" + e.Row.Cells[0].Text + "'")

        }



        }


    protected void GridView2_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
   protected void rowClicked(int counter){
    
}

   protected void Button7_Click(object sender, EventArgs e)
   {
       /*ASCIIEncoding encoding = new ASCIIEncoding();
       string postData = "projectId=" + Convert.ToInt32(Request["id"]);
       byte[] data = encoding.GetBytes(postData);
       // Prepare web request...
       HttpWebRequest myRequest = (HttpWebRequest)WebRequest.Create("http://176.31.62.173:92/voicemessage/runcalls.php");
       myRequest.Method = "POST";
       myRequest.ContentType = "application/x-www-form-urlencoded";
       myRequest.ContentLength = data.Length;
       Stream newStream = myRequest.GetRequestStream();
       // Send the data.
       newStream.Write(data, 0, data.Length);
       newStream.Close();*/
       int idProject= Convert.ToInt32(Request["id"]);
       statusVoiceMailsSend s = new statusVoiceMailsSend();
       s.changeStatusCallToSend(idProject, 9);
   }
}
