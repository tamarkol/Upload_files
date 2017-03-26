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
using MySql.Data.MySqlClient;
using System.Globalization;
public partial class Seker : System.Web.UI.Page
{
    static public bool is_run;
    static public string date_send_bind;
    static public DateTime date_send;
    static public TimeSpan fromhour;
    static public TimeSpan tohour;
    public bool ok = false;
    public bool active=false;
    static public DataTable tb1;
    static public DataTable tb2;
    object[] sessionRunning = new object[2];
    public string image;
    public string image_hover;
    public string lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = Resources.Resource.voice_message_report;
        lang = System.Threading.Thread.CurrentThread.CurrentCulture.Name;
        if (lang == "he-IL")
        {
            image = "./images/design/btnNoTxt1.png";
             image_hover = "./images/design/btnNoTxt-hover1.png";
        }
        else
        {
            image = "./images/design/btnNoTxt2.png";
            image_hover = "./images/design/btnNoTxt-hover2.png";
        }
        Label1.Text = Resources.Resource.total_answered;
        Label7.Text = Resources.Resource.name_of_voice_message;
        Label2.Text = Resources.Resource.total_no_answered;
        Label3.Text = Resources.Resource.listen_to_the_entire_message;
        Label4.Text = Resources.Resource.approved;
        Label5.Text = Resources.Resource.call_duration;
        GridViewProjects.EmptyDataText = Resources.Resource.no_recipients;
        GridViewProjects.Columns[1].HeaderText = Resources.Resource.answered_not_answered;
        GridViewProjects.Columns[2].HeaderText = Resources.Resource.name;
        GridViewProjects.Columns[3].HeaderText = Resources.Resource.telephone;
        GridViewProjects.Columns[4].HeaderText = Resources.Resource.listen;
        GridViewProjects.Columns[5].HeaderText = Resources.Resource.approve;
        GridViewProjects.Columns[6].HeaderText = Resources.Resource.record;
        GridViewProjects.Columns[7].HeaderText = Resources.Resource.call_duration;
        bt_export.Text = Resources.Resource.export_to_Excel;
        dbLayer db = new dbLayer();
        DataTable project_detail = new DataTable();
        //if (Session["UserObj"] == null)
        //{
        //    Response.Redirect("login.aspx");
        //}
        if (Request["id"] != null)
        {
            hid_projectId.Value = Request["id"];
        }
       
        if ( Convert.ToInt32(Request["SendAgain"]) == 2)
        {
            sendAgainWithTime();
        }

        if (Convert.ToInt32(Request["updatetime"]) == 5)
        {
            Update_Time();
        }
        if (Convert.ToInt32(Request["cancel_project"]) == 8)
        {
            int idProject = Convert.ToInt32(Request["id_pro"]);
            cancel_project_Click(idProject);
        }


        

        Master.loadUser(); 
        //DataTable tb1;
        //DataTable tb2;

        List<int> id_project_list = new List<int>();
       
        if (!IsPostBack)
        {
            fillDdlPageSize();
            MySqlConnection mySqlConnection = new MySqlConnection();
            mySqlConnection.ConnectionString = "Data Source=database.spix.co.il;Database= voicemessage;User ID=tzvi;Password=0523129999";
            try
            {
                mySqlConnection.Open();
                switch (mySqlConnection.State)
                {
                    case System.Data.ConnectionState.Open:
                        // Connection has been made
                        break;

                    case System.Data.ConnectionState.Closed:
                        // Connection could not be made, throw an error
                        throw new Exception("The database connection state is Closed");
                        break;
                    default:
                        // Connection is actively doing something else
                        break;
                }
                // Place Your Code Here to Process Data //
                MySql.Data.MySqlClient.MySqlCommand command = mySqlConnection.CreateCommand();
                if (Request["id"] != null)
                {
                    command.CommandText = "select count(*) from view_service_callback where  campaign='" + Request["id"] + "'";
                    is_run = Convert.ToBoolean(command.ExecuteScalar());
                    hid_isrun.Value = is_run.ToString();
                    
                    panelRunNow.Visible = is_run;
                    if (!is_run)// not run
                    {
                        string sql = "select * from tbl_projectvoicemail where tbl_projectvoicemail.idProject='" + Request["id"] + "'";
                        project_detail = db.selectSql_DataTable(sql);
                        foreach (DataRow dr in project_detail.Rows)
                        {
                            date_send = Convert.ToDateTime(dr["dateSend"]);
                            date_send_bind = String.Format("{0:dd/MM/yyyy}", date_send);
                            fromhour = (TimeSpan)dr["fromHour"];
                            tohour = (TimeSpan)dr["toHour"];
                        }
                        if (DateTime.Now < date_send || ((DateTime.Now.Date == date_send.Date) && (DateTime.Now.TimeOfDay < fromhour) && (tohour.ToString() != "23:59:59"))) // Not yet sent
                            panel_not_yet_sent.Visible = true;
                        else PanelSendAgain.Visible = !is_run; // End to Run
                    }
                }
                else 
                {    
                    is_run = false;
                    hid_isrun.Value="False";

                }
              
            }

            catch (MySql.Data.MySqlClient.MySqlException mySqlException)
            {

                // Use the mySqlException object to handle specific MySql errors

            }

            catch (Exception exception)
            {

                // Use the exception object to handle all other non-MySql specific errors

            }

            finally
            {
                // Make sure to only close connections that are not in a closed state
                if (mySqlConnection.State != System.Data.ConnectionState.Closed)
                {
                    // Close the connection as a good Garbage Collecting practice
                    mySqlConnection.Close();
                }
            }





            Master.pageTitle = Resources.Resource.voice_message_report; 
            Master.iconHeader = "tdProject";
            if (Request["id"] != null)
            {
                hid_projectId.Value = Request["id"];
                if (is_run)
                {
                  Timer2.Enabled = true;
                } loadProjectToGrid(Convert.ToInt32(Request["id"]),true);
            }
        }
        else
        {
            DataTable tb = (DataTable)Session["tblReport"];


            GridViewProjects.DataSource = tb;
            GridViewProjects.DataBind();
        }
       /* tb1 = (DataTable)Session["tb1"];
        tb2 = (DataTable)Session["tb2"];
        dinamicTable(tb1, tb2);*/
        if (Request["parm"] == "t")
        {
            BoundField dateField = new BoundField();
            dateField.HeaderText = "Ok";
            GridViewProjects.Columns.Add(dateField);
        }
       
       // Timer2.Enabled = true;
    }

   
    public DataTable Create_tblReport()
    {
        DataTable tb = new DataTable("reprtVoiveMail");
        //•	קוד לקוח
        DataColumn col = new DataColumn("idPersonOfList", System.Type.GetType("System.Int32"));
        tb.Columns.Add(col);
        //•	קוד נציג
        col = new DataColumn("name", System.Type.GetType("System.String"));
        col.DefaultValue = "";
        tb.Columns.Add(col);
        //•	קוד מחלקה
        col = new DataColumn("phone", System.Type.GetType("System.String"));
        col.DefaultValue = "";
        tb.Columns.Add(col);
        //•	קוד שיחה
        col = new DataColumn("status", System.Type.GetType("System.String"));
        col.DefaultValue = "";
        tb.Columns.Add(col);
        col = new DataColumn("play", System.Type.GetType("System.String"));
        col.DefaultValue = "";
        tb.Columns.Add(col);
        col = new DataColumn("accept", System.Type.GetType("System.String"));
        col.DefaultValue = "no";
        tb.Columns.Add(col);
        col = new DataColumn("record", System.Type.GetType("System.String"));
        col.DefaultValue = "";
        tb.Columns.Add(col);
        col = new DataColumn("callDuration", System.Type.GetType("System.String"));
        col.DefaultValue = "";
        tb.Columns.Add(col);

        return tb;

    }
    private void dinamicTable(DataTable tbList, DataTable status)
    {

        int numAnswer = 0; 
        int NoAnswer = 0;
        int numNoAnswer = 0;
        int NumPhone = 0;
        int numPlay = 0;
        int numAccept = 0;
        DataTable tblReport = Create_tblReport();

        foreach (DataRow r in tbList.Rows)
        {
            NumPhone++;
            DataRow newRow = tblReport.NewRow();
            newRow["idPersonOfList"] = r["idPersonOfList"];
            newRow["name"] = r["name"];
            newRow["phone"] = r["phone"];
            newRow["status"] = r["status"];
            newRow["callDuration"] = r["callDuration"];

            newRow["play"] = "0";
            newRow["accept"] = "0";
            newRow["record"] = "0";
            DataRow[] rows = status.Select("idPersonOfList=" + r["idPersonOfList"].ToString());
            if (Convert.ToInt32(r["status"])==1)
                numAnswer++;
            if ((Convert.ToInt32(r["status"]) !=0)&&(Convert.ToInt32(r["status"]) !=1))
                NoAnswer++;
            if (r["phone"].ToString() == "0526157729")
            { }
            foreach (DataRow ro in rows)
            {
                int idPlayer = (int)ro["idPersonOfList"];
               string  parameter = ro["Parameter"].ToString();
               string actionName = ro["actionName"].ToString();
                int type = (int)ro["actionType"];
                if (type == 1)
                {
                    newRow["play"] = parameter;
                    if (parameter == "1" && actionName == Resources.Resource.message)
                        numPlay++;
                    GridViewProjects.Columns[4].Visible = true;
                    panelsumPlay.Visible = true;
                }
                else
                {
                    if (type == 2)
                    {
                        newRow["accept"] = parameter;
                        if (parameter == "1")
                            numAccept++;
                        GridViewProjects.Columns[5].Visible = true;
                        panelsumAccept.Visible = true;
                    }
                //http://localhost:56650/WebLogin/bbb.mp3
                    else if (type == 4)
                    {
                        newRow["record"] = parameter;
                        GridViewProjects.Columns[6].Visible = true;
                        /*GridViewProjects.Columns[3]= "<embed src='autop.swf' flashvars='filename=bbb.mp3' width='1' height='1' align='middle' type='application/x-shockwave-flash' ";
                divRing += "pluginspage='http://www.macromedia.com/go/getflashplayer' /></embed>";*/
                //         var divRing =
                //$('#divring').html(divRing);
				
                //$('#divring').html();
				
                //$('#divring').html();
                    }
                }
                
            }
            tblReport.Rows.Add(newRow);
        }



        Session["tblReport"] = tblReport;

        GridViewProjects.DataSource = tblReport;
        GridViewProjects.DataBind();
       // LnumNoAnswer.Text = numNoAnswer.ToString();
        LnumAnswer.Text = numAnswer.ToString();
        LNumPhone.Text = NumPhone.ToString();
        LnumPlay.Text = numPlay.ToString();
        LSumAccept.Text = numAccept.ToString();
        LNoAnswer.Text = NoAnswer.ToString();
        numNoAnswer = NumPhone - numAnswer;
        //lbl_table.Text = inv + scriptMain;
	    Session["NoAnswer"] = numNoAnswer;
       // if (numNoAnswer > 0)
         //   PanelSendAgain.Visible = true;
        chheckSessionRunning(numAnswer);
       
    }

    private void chheckSessionRunning(int numAnswer)
    {
        if (Session["sessionRunning"] != null)
        {
            sessionRunning =(object[]) Session["sessionRunning"];
            DateTime time = Convert.ToDateTime(sessionRunning[0]);
            if (time < DateTime.Now.AddSeconds(-20))
            {
                int numAnswerOld = Convert.ToInt32(sessionRunning[1]);
                if (numAnswerOld < numAnswer)
                { //run
                    sessionRunning[0] = DateTime.Now;
                    sessionRunning[1] = numAnswer;
                    PanelSendAgain.Visible = false;
                }
                else
                {
                    PanelSendAgain.Visible = true;
                    Timer2.Enabled = false;
                }

            }
        }
        else
        {
            sessionRunning[0] = DateTime.Now;
            sessionRunning[1] = numAnswer;
            Session["sessionRunning"] = sessionRunning;
        }
    }
	private string convertStatus(object status)
	{
        if (status.ToString() == "1")
            return Resources.Resource.answered;
		return "----";
	}
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    
    public override void VerifyRenderingInServerForm(Control control)
    { }//חייב עבור הורדה לאקסל
    protected void bt_export_Click(object sender, EventArgs e)
    {
        /*
        HtmlForm form = new HtmlForm();
        string attachment = "attachment; filename=Employee.xls";
        Response.ClearContent();
        Response.AddHeader("content-disposition", attachment);
        HttpContext.Current.Response.ContentEncoding = Encoding.GetEncoding("windows-1255");
        HttpContext.Current.Response.Charset = "windows-1255";
        Response.ContentType = "application/ms-excel";
        StringWriter stw = new StringWriter();
        HtmlTextWriter htextw = new HtmlTextWriter(stw);
        form.Controls.Add(GridViewProjects);
        this.Controls.Add(form);
        form.RenderControl(htextw);
        Response.Write(stw.ToString());
        Response.End();
         * */
    }
   


    protected void GridView2_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
   protected void rowClicked(int counter){
    
}

   //protected void sendAgain_Click(object sender, EventArgs e)
   //{
   //    return;
   //    /*ASCIIEncoding encoding = new ASCIIEncoding();
   //    string postData = "projectId=" + Convert.ToInt32(Request["id"]);
   //    byte[] data = encoding.GetBytes(postData);
   //     Prepare web request...   
   //    {
   //        Master.loadUser();
   //        cUserDetail user = new cUserDetail();
   //        user = (cUserDetail)Session["UserObj"];
   //        credit = user.getCreditUser();//change t
   //    }
   //    if (Session["NoAnswer"] != null)
   //    {
   //        NoAns = (int)Session["NoAnswer"];
   //    }
   //    if (NoAns <= credit)
   //    {
   //        int idProject = Convert.ToInt32(Request["id"]);
   //        statusVoiceMailsSend s = new statusVoiceMailsSend();
   //        s.changeStatusCallToSend(idProject, 9);
   //        s.changeStatusCallToSend(idProject, 4);
   //        s.changeStatusCallToSend(idProject, 5);
   //        s.changeStatusCallToSend(idProject, 3);
   //        s.changeStatusCallToSend(idProject, 6);
   //    }
   //    Timer2.Enabled = true;
   //}
   protected void GridViewProjects_PageIndexChanging(object sender, GridViewPageEventArgs e)
   {
       GridViewProjects.PageIndex = e.NewPageIndex;
       GridViewProjects.DataBind();
   }
   protected void GridViewProjects_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
   {

   }
   protected void GridViewProjects_RowDataBound(object sender, GridViewRowEventArgs e)
   {
       char x = '"';
       if (e.Row.RowType == DataControlRowType.DataRow)
       {
           if (e.Row.Cells[1].Text == "1")
           {
              e.Row.Cells[1].Text = "<img src='images/design/icons/answer.png'/>";
              
           }
           else if (e.Row.Cells[1].Text == "9" || e.Row.Cells[1].Text == "2")
           {
             e.Row.Cells[1].Text = "<img src='images/design/icons/noanswer.png'/>";
              
           }
             else if(e.Row.Cells[1].Text == "3")
            {
                e.Row.Cells[1].Text = Resources.Resource.cancelled;
            }

             else if(e.Row.Cells[1].Text == "4")
            {
                e.Row.Cells[1].Text = Resources.Resource.rejected; 
            }

             else if(e.Row.Cells[1].Text == "5")
            {
                e.Row.Cells[1].Text = Resources.Resource.busy; 
            }
              else if(e.Row.Cells[1].Text == "0")
            {
                e.Row.Cells[1].Text = Resources.Resource.not_sent; 
            }
           else if (e.Row.Cells[1].Text == "6")
           {
               e.Row.Cells[1].Text = Resources.Resource.wrong;
           }

             

           if (e.Row.Cells[4].Text == "1")
           {
               e.Row.Cells[4].Text = "<img src='images/design/icons/yes-play.png'/>";

           }
           else
           {
               e.Row.Cells[4].Text = "<img src='images/design/icons/no-play.png'/>";
           }
           if (e.Row.Cells[1].Text == "1")
           {
               // e.Row.Cells[1].Text = "<img src='images/check.png'/>";

           }
           else
           {
               //e.Row.Cells[1].Text = "<img src='images/X.png'/>";
           }
           //string file = e.Row.Cells[0].Text;
          // e.Row.Cells[0].Text = "<embed src='autop.swf' flashvars='filename=bbb.mp3' width='1' height='1' align='middle' type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer' /></embed>";
          /* "<embed src='autop.swf' flashvars='filename=bbb.mp3' width='1' height='1' align='middle' type='application/x-shockwave-flash' ";
           divRing += "pluginspage='http://www.macromedia.com/go/getflashplayer' /></embed>";*/
           //e.Row.Cells[6].Attributes.Add("onclick", "playMessage('" + e.Row.Cells[7] + "');");
           if(e.Row.Cells[6].Text!=null)

           e.Row.Cells[6].Text = "<input type='button' id='" + e.Row.Cells[6].Text +"' class='playmsg' />";
           int seconds=0;
           if (e.Row.Cells[7].Text != null && e.Row.Cells[7].Text != "&nbsp;")
           {
               seconds = Convert.ToInt32(e.Row.Cells[7].Text);
               string minSec = string.Format("{0}:{1:00}", seconds / 60,
                               (Math.Abs(seconds)) % 60);
               e.Row.Cells[7].Text = minSec + " "+Resources.Resource.seconds;
           }
           else e.Row.Cells[7].Text = "========";

          // e.Row.Cells[6].Text = "<input type='button' id='" + e.Row.Cells[6].Text + "' class='playmsg' onclick=\"ifFileExist('" + e.Row.Cells[6].Text + "');\"/>";
       
       }
   }

   public  void loadProjectToGrid(int projectId,bool loadGrid)
   {
       string file = "";
      
       cUserDetail User = (cUserDetail)Session["UserObj"];
       //if (btnFullReport.PostBackUrl.IndexOf("?id=" + projectId) == -1)
       //{
       //    btnFullReport.PostBackUrl += "?id=" + projectId;
       //}
       cProjectVoiceMail project = new cProjectVoiceMail(projectId);
       active = project.Active;
       if (project.loadProject())
       {
           if (project.IdClient == User.IdUser)
           {
               LnameProject.Text = project.ProjectName;
               LdataProject.Text = String.Format("{0:dd-MM-yyyy}", project.DateSend);
               categoriesMailingList cm=new categoriesMailingList(project.IdCategoryMailingList);
               cm.Load();
               bool IsPrivate=cm.CategoryPrivate;
               if (IsPrivate)
                  {
                    bt_export.Visible = false;
                    GridViewProjects.Visible=false;
                  }
               //AudioPlayer.embed('audioplayer_N',{soundFile: 'streamFile.aspx?streamFile='"+ file +" });
               // Label lPlay = new Label();
               

               if (loadGrid)
               {
                   cCallAction[] collection = project.CallProperties.getCollection();
                   foreach (cCallAction c in collection)
                   {
                       if (c is cOutputEvent && c.IsStart)
                       {
                           cOutputEvent output = (cOutputEvent)c;
                           file = output.PlaybackSource;
                       }
                   }
                   lPlay.Text = "<script type='text/javascript'>AudioPlayer.embed('audioplayer_N', { soundFile: 'streamFile.aspx?streamFile=" + file + "' });</script>";

                   dbLayer db = new dbLayer();
                   tb1 =  project.statusMailingListForProject().Tables[0];
                   tb2 = project.statusReport().Tables[0];

                   /* Session["tb1"]=tb1;
                    Session["tb2"] = tb2;*/
                   dinamicTable(tb1, tb2);
               }
           }
           else
           {
               Response.Redirect("selectProject.aspx");
           }
       }

       else
       {
           Response.Redirect("selectProject.aspx");
       }

   }
   protected void Timer2_Tick(object sender, EventArgs e)
   {
       //Timer2.Enabled = (!Timer2.Enabled);
       //if (Request["id"] != null)
       
          loadProjectToGrid(Convert.ToInt32(hid_projectId.Value),true);
          //Timer2.Enabled = true;
   }


   private void sendAgainWithTime()
   {
       if (!is_running())
       {
           DateTime DateSend = DateTime.Now;
           TimeSpan fromHour = new TimeSpan(0, 0, 0);
           TimeSpan toHour = new TimeSpan(23, 59, 59);
           DateSend = DateTime.ParseExact(Request["Send_Date"].ToString(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
           string Selecttime = Request["Timefrom"];
           string[] TotalTime = Selecttime.Split(':');
           fromHour = new TimeSpan(Convert.ToInt32(TotalTime[0]), Convert.ToInt32(TotalTime[1]), 0);
           Selecttime = Request["TimeTo"];
           TotalTime = Selecttime.Split(':');
           toHour = new TimeSpan(Convert.ToInt32(TotalTime[0]), Convert.ToInt32(TotalTime[1]), 0);
           if (fromHour > toHour)
           /////////////
           { }
           else
           {
               int credit = 0;
               int NoAns = 0;
               // if (Session["UserObj"] != null)
               //{
               Master.loadUser();
               cUserDetail user = new cUserDetail();
               user = (cUserDetail)Session["UserObj"];
               credit = user.getCreditUser();//change t
               //}
               if (Session["NoAnswer"] != null)
               {
                   NoAns = (int)Session["NoAnswer"];
               }
               if (NoAns <= credit)
               {
                   int idProject = Convert.ToInt32(Request["id_pro"]);
                   statusVoiceMailsSend s = new statusVoiceMailsSend();

                   s.changeStatusAndDateToSend(idProject, 9, DateSend, fromHour.ToString(), toHour.ToString());
                   s.changeStatusAndDateToSend(idProject, 4, DateSend, fromHour.ToString(), toHour.ToString());
                   s.changeStatusAndDateToSend(idProject, 5, DateSend, fromHour.ToString(), toHour.ToString());
                   s.changeStatusAndDateToSend(idProject, 3, DateSend, fromHour.ToString(), toHour.ToString());
                   s.changeStatusAndDateToSend(idProject, 6, DateSend, fromHour.ToString(), toHour.ToString());
               }
               Timer2.Enabled = true;
           }
       }
       else
       {
           Response.Write("99");
           Response.End();
       }
      
   }
   protected void ddlPageSize_report_SelectedIndexChanged(object sender, EventArgs e)
   {
       GridViewProjects.PageSize = Convert.ToInt16(ddlPageSize_report.SelectedValue);
       GridViewProjects.DataBind();
   }
   public void fillDdlPageSize()
   {
       ListItem a = new ListItem(Resources.Resource.display_20_lines, "20");
       ListItem b = new ListItem(Resources.Resource.display_100_lines, "100");
       ListItem c = new ListItem(Resources.Resource.display_1000_lines, "1000");
       //ListItem.int[] PageSize = new int[] { 20, 50, 100 };
       ddlPageSize_report.Items.Add(a);
       ddlPageSize_report.Items.Add(b);
       ddlPageSize_report.Items.Add(c);
   }

   private void Update_Time()
   {
       dbLayer db=new dbLayer();
       DateTime DateSend = DateTime.Now;
       TimeSpan fromHour = new TimeSpan(0, 0, 0);
       TimeSpan toHour = new TimeSpan(23, 59, 59);
       DateSend = DateTime.ParseExact(Request["datepicker_terem"].ToString(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
       string Selecttime = Request["timepickerfrom_terem"];
       string[] TotalTime = Selecttime.Split(':');
       fromHour = new TimeSpan(Convert.ToInt32(TotalTime[0]), Convert.ToInt32(TotalTime[1]), 0);
       Selecttime = Request["timepickerto_terem"];
       TotalTime = Selecttime.Split(':');
       toHour = new TimeSpan(Convert.ToInt32(TotalTime[0]), Convert.ToInt32(TotalTime[1]), 0);
       if (fromHour > toHour)
       /////////////
       { }
       else
       {
       int idProject = Convert.ToInt32(Request["id_pro"]);
       db.Update_Project_Time(idProject, DateSend, fromHour.ToString(), toHour.ToString());
       }
   }

   protected void cancel_project_Click(int idProject)
   {
       dbLayer db=new dbLayer ();
       // Update Status
       db.Update_Status_Project(idProject);
       // Delete Statusvoicemailsend
       db.Cancel_Statusvoicemailssend_Project(idProject);    
   }

   public bool is_running()
   {
       bool is_runnning_try_again = false;
       MySqlConnection mySqlConnection = new MySqlConnection();
       mySqlConnection.ConnectionString = "Data Source=176.31.62.172;Database= voicemessage;User ID=tzvi;Password=0523129999";
       try
       {
           mySqlConnection.Open();
           switch (mySqlConnection.State)
           {
               case System.Data.ConnectionState.Open:
                   // Connection has been made
                   break;

               case System.Data.ConnectionState.Closed:
                   // Connection could not be made, throw an error
                   throw new Exception("The database connection state is Closed");
                   break;
               default:
                   // Connection is actively doing something else
                   break;
           }
           // Place Your Code Here to Process Data //
           MySql.Data.MySqlClient.MySqlCommand command = mySqlConnection.CreateCommand();
           if (Request["id"] != null)
           {
               command.CommandText = "select count(*) from view_service_callback where  campaign='" + Request["id"] + "'";
               is_runnning_try_again = Convert.ToBoolean(command.ExecuteScalar());
           }


       }

       catch (MySql.Data.MySqlClient.MySqlException mySqlException)
       {

           // Use the mySqlException object to handle specific MySql errors

       }

       catch (Exception exception)
       {

           // Use the exception object to handle all other non-MySql specific errors

       }

       finally
       {
           // Make sure to only close connections that are not in a closed state
           if (mySqlConnection.State != System.Data.ConnectionState.Closed)
           {
               // Close the connection as a good Garbage Collecting practice
               mySqlConnection.Close();
           }
       }
       return is_runnning_try_again;
   }


}
