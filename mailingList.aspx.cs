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
////using VoiceMail;
using System.Data.OleDb;
using System.IO;
using Excel;
using System.Net;
using System.Text;
using System.Globalization;
using System.Collections.Generic;
public partial class mailingList : System.Web.UI.Page
{

    public int numAddressee;
    public string ToClose = "0";// "False";
    public int loop_count = 1;
    public string referencepage;
    public string file_edited = "";
    public TimeSpan fromhour_ep;
    public TimeSpan tohour_ep;
    public DateTime datesend_ep;
    public bool flag_EP;
    public int idProject_To_Edit;
    public string namep_Ep = "";
    public string nameRecordFile = "";
    public int categoryId = 0;
    public string idCatgory_toedit = "";
    public string image;
    public string lang;

    protected void Page_Load(object sender, EventArgs e)
    {
        // flag_EP=false;
        //*====== EditProject =======//
         Page.Title = Resources.Resource.contacts;
         lang= System.Threading.Thread.CurrentThread.CurrentCulture.Name;
         if (lang == "he-IL")
         {
             image = "./images/step/voice-bg1.jpg";
         }
         else
             image = "./images/step/voice-bg2.jpg";
         if (!IsPostBack)
         {
             TBaddPhone.Text = Resources.Resource.enter_number;
             fillDdlPageSize();
         }
        //tbnameProject.Style.Add("float", Resources.Resource.align);
        //TBrecordNumPhone.Text = Resources.Resource.enter_telephone_number;
        //lblCallRecoirdMsg.Text = Resources.Resource.recording_was_successfully;
        GridView1.Columns[1].HeaderText = Resources.Resource.number;
        GridView1.Columns[2].HeaderText = Resources.Resource.name;
        GridView1.Columns[3].HeaderText = Resources.Resource.edit;
        GridView1.Columns[4].HeaderText = Resources.Resource.delete;
        //GridView1.Columns[5].HeaderText = Resources.Resource.choose;
        CheckBox1.Text = Resources.Resource.choose_all;
        BdeleteItemListBox.Text = Resources.Resource.clear_those_marked;
         
         b_addPhone.Text = Resources.Resource.add;
         //BT_updateverify.Text = Resources.Resource.display_caller_ID;
        dbLayer db = new dbLayer();
        if (Request.UrlReferrer != null && Request.UrlReferrer.Segments != null)
        {
            referencepage = Request.Url.ToString();
            if (referencepage.IndexOf("step.aspx?id") > 0)
            {
                flag_EP = true;
                string mailing_change = DDLmailingList.SelectedValue;
                //idProject_To_Edit = Convert.ToInt32(referencepage.Substring(referencepage.IndexOf("=") + 1, (referencepage.Length) - (referencepage.IndexOf("=") + 1)));
                Request.Url.ToString();
                idProject_To_Edit = Convert.ToInt32(Request.Url.ToString().Substring(Request.Url.ToString().IndexOf("=") + 1, (Request.Url.ToString().Length) - (Request.Url.ToString().IndexOf("=") + 1)));
                loadcategoriesMailingList();
                cProjectVoiceMail vm = new cProjectVoiceMail(idProject_To_Edit);
                vm.loadProject();
                //time_EP load
                datesend_ep = vm.DateSend;
                fromhour_ep = vm.FromHour;
                tohour_ep = vm.ToHour;
                //string change_file = listMyFiles.SelectedValue;
                //file_edited = "";
                //namep_Ep = tbnameProject.Text;
                //tbnameProject.Text = vm.ProjectName;//project name
                //if (namep_Ep != tbnameProject.Text && namep_Ep != "")
                //    tbnameProject.Text = namep_Ep;
                file_edited = db.getFile_ProjectId(idProject_To_Edit);
                //if (file_edited != change_file && change_file != "")
                //    file_edited = change_file;
                nameRecordFile = file_edited;
                //listMyFiles.SelectedValue = file_edited.ToString();
                idCatgory_toedit = vm.IdCategoryMailingList.ToString();
                if (mailing_change != idCatgory_toedit && mailing_change != "")
                    DDLmailingList.SelectedValue = mailing_change;
                else DDLmailingList.SelectedValue = idCatgory_toedit.ToString();

            }
        }
        //====== EditProject =======*//

        //HtmlControl control = FindControl("timepickerfrom") as HtmlControl;
        //control.Attributes["class"] = "hidden";
        //ddltohour.Visible = false;
        //ddltomin.Visible = false;
        //ddlfromhour.Visible = false;
        //ddlfrommin.Visible = false;
        TBaddPhone.Attributes.Add("onkeydown", "return numbersOnly(event);");
        phonePerson.Attributes.Add("onkeydown", "return numbersOnly(event);");
        //TBrecordNumPhone.Attributes.Add("onkeydown", "return numbersOnly(event);");
        //TBrecordNumPhone.Attributes.Add("onFocus", "clearText1(this)");
        TBaddPhone.Attributes.Add("onFocus", "clearText1(this)");
        TBaddPhone.Attributes.Add("onkeypress", "pressAddPhone(event)");
        if (!IsPostBack)
        {
            //tbnameProject.Focus();
            loadUser();
            cUserDetail user = new cUserDetail();
            user = (cUserDetail)Session["UserObj"];
            if (user.verifyPhone == true)
            {
                //Panel2.Visible = false;
                //CB_RecNum.Text += user.phone;
                //CB_RecNum.Checked = true;
            }
            else
            {
                //CB_RecNum.Visible = false;
                //CB_RecNum.Checked = false;

            }

            int credit = user.getCreditUser();
            hfUserCredit.Value = credit.ToString();

            cMyFiles myfiles = new cMyFiles(user.IdUser);

            //listMyFiles.Items.Add("file1");
            //listMyFiles.Items.Add("file2");
            //listMyFiles.DataSource = myfiles;
            //listMyFiles.DataTextField = "ClientFileName";
            //listMyFiles.DataValueField = "FileName";
            //listMyFiles.DataBind();


            fillDdlSendHour();
            loadcategoriesMailingList();

            // DDLmailingList.Items.Insert(0, new ListItem("בחר רשימת תפוצה", String.Empty));



            loadExampleProject();
            //tbnameProject.Focus() ;
            //loadExistingProjects();
            //  DDLexistingProjects.Visible = false;

            if (!flag_EP)//!EP
            {
                DDLmailingList.SelectedIndex = 0;
            }
            if (DDLmailingList.Items.Count > 0)
            {
                if (!flag_EP)//!EP
                {
                    DDLmailingList.Items[0].Selected = true;
                }
                if (DDLmailingList.SelectedValue != "")
                {
                    int catId = Convert.ToInt32(DDLmailingList.SelectedValue);
                    MailingList ml = new MailingList();
                    DataSet ds = ml.mailingListForCategory(catId);
                    Session["dsGridViewStep"] = ds;
                    HCountMailinglist.Value = ds.Tables[0].Rows.Count.ToString();
                    CountMailingList.Text = ds.Tables[0].Rows.Count.ToString();
                  //  if ((ds.Tables[0].Rows.Count) < 500)
                    {
                        GridView1.DataSource = (DataSet)Session["dsGridViewStep"];
                        GridView1.DataBind();
                        if (GridView1.HeaderRow != null)
                            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
                    }


                }
            }

        }


    }
    public string VersionCssUrl(string url)
    {
        // Get physical path.
        var path = HttpContext.Current.Server.MapPath(url);

        return String.Format("{0}?{1}",
            ResolveUrl(url),
            File.GetLastWriteTime(path).ToString("MMddyy"));
    }
    public void fillDdlSendHour()
    {

        //for (int i = 0; i < 24; i++)
        //{
        //    if (i < 10)
        //    {
        //        //ddlfromhour.Items.Insert(i, "0" + i.ToString());
        //        //ddltohour.Items.Insert(i, "0" + i.ToString());
        //        if (i < 6)
        //        {
        //            if (i == 0)
        //            {
        //                //ddltomin.Items.Insert(i, "0" + (i * 10).ToString());
        //                //ddlfrommin.Items.Insert(i, "0" + (i * 10).ToString());
        //            }
        //            else
        //            {
        //                //ddltomin.Items.Insert(i, (i * 10).ToString());
        //                //ddlfrommin.Items.Insert(i, (i * 10).ToString());
        //            }
        //        }
        //    }
        //    else
        //    {
        //        //ddlfromhour.Items.Insert(i, i.ToString());
        //        //ddltohour.Items.Insert(i, i.ToString());
        //    }
        //}
        //ddlSendHour.Items.Insert(0, new ListItem("שליחה מיידית", "0"));
        //ddlSendHour.Items.Insert(1, new ListItem("בחר זמנים לשליחה", "1"));
        //ddlSendHour.SelectedIndex = 0;
    }
    private string recordFile(string sendPhone)
    {

        string idrecord = PasswordGenerator(7);
        idrecord = idrecord.ToLowerInvariant();
        //string sendPhone = TBrecordNumPhone.Text;
        //lblCallRecoirdMsg.Visible = true;
        string now = DateTime.Now.ToLongTimeString();

        string nameForFile = now;

        HttpCookie myCookie = new HttpCookie("test");
        myCookie.Value = idrecord.ToString();
        Session["idrecord"] = idrecord;
        ///////////////
        ASCIIEncoding encoding = new ASCIIEncoding();
        string postData = "number=" + sendPhone + "&idrecord=" + idrecord;
        byte[] data = encoding.GetBytes(postData);
        // Prepare web request...
        HttpWebRequest myRequest = (HttpWebRequest)WebRequest.Create("http://176.31.62.173:92/voicemessage/recordfile.php");
        myRequest.Method = "POST";
        myRequest.ContentType = "application/x-www-form-urlencoded";
        myRequest.ContentLength = data.Length;
        Stream newStream = myRequest.GetRequestStream();
        // Send the data.
        newStream.Write(data, 0, data.Length);
        newStream.Close();
        return idrecord;
    }
    public void loadExistingProjects()
    {
        //if (Session["UserObj"] != null)
        //{
        loadUser();
        cUserDetail user = new cUserDetail();
        user = (cUserDetail)Session["UserObj"];
        cProjectVoiceMail vm = new cProjectVoiceMail();
        int id = user.IdUser;
        DataSet ds = vm.loadNameProject(id);
        //foreach (DataRow dr in ds.Tables[0].Rows)
        //{
        //    categoryName = dr["categoryName"].ToString();
        //    DDLmailingList.Items.Add(categoryName);
        //    DDLmailingList.v.Items.
        //}

        //DDLexistingProjects.DataSource = ds.Tables[0];
        //DDLexistingProjects.DataTextField = "projectName";
        //DDLexistingProjects.DataValueField = "idProject";
        //DDLexistingProjects.DataBind();
        //}
    }
    /*protected void Upload_Click(object sender, EventArgs e)
    {
        if (FileUploadAuodio.HasFile)
        {
            FileUploadAuodio.SaveAs(MapPath("~/Image/" + FileUploadAuodio.FileName));
            System.Drawing.Image img1 = System.Drawing.Image.FromFile(MapPath("~/image/") + FileUploadAuodio.FileName);
            //FileUploadAuodio.ImageUrl = "~/Image/" + FileUploadAuodio.FileName;
        }
    }*/


    public string PasswordGenerator(int passwordLength)
    {
        Random random = new Random();
        int seed = random.Next(1, int.MaxValue);
        //const string allowedChars = "ABCDEFGHJKLMNOPQRSTUVWXYZ0123456789";
        const string allowedChars = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789";
        //const string specialCharacters = @"!#$%&'()*+,-./:;<=>?@[\]_";

        var chars = new char[passwordLength];
        var rd = new Random(seed);

        for (var i = 0; i < passwordLength; i++)
        {
            chars[i] = allowedChars[rd.Next(0, allowedChars.Length)];
        }

        return new string(chars);
    }
    protected void sendCallrecord_Click(object sender, EventArgs e)
    {
        //string idrecord = PasswordGenerator(7);
        //idrecord = idrecord.ToLowerInvariant();
        ////string sendPhone = TBrecordNumPhone.Text;
        ////lblCallRecoirdMsg.Visible = true;
        //string now = DateTime.Now.ToLongTimeString();

        //string nameForFile = now;

        //HttpCookie myCookie = new HttpCookie("test");
        //myCookie.Value = idrecord.ToString();
        //Session["idrecord"] = idrecord;
        /////////////////
        //ASCIIEncoding encoding = new ASCIIEncoding();
        //string postData = "number=" + sendPhone + "&idrecord=" + idrecord;
        //byte[] data = encoding.GetBytes(postData);
        //// Prepare web request...
        //HttpWebRequest myRequest = (HttpWebRequest)WebRequest.Create("http://176.31.62.173:92/voicemessage/recordfile.php");
        //myRequest.Method = "POST";
        //myRequest.ContentType = "application/x-www-form-urlencoded";
        //myRequest.ContentLength = data.Length;
        //Stream newStream = myRequest.GetRequestStream();
        //// Send the data.
        //newStream.Write(data, 0, data.Length);
        //newStream.Close();



    }
    protected void b_addPhone_Click(object sender, EventArgs e)
    {
        int count;
        if (TBaddPhone.Text != "")
        {
            string item = TBaddPhone.Text;
            LBaddPhone.Items.Add(item);
            TBaddPhone.Text = "";
            count = Convert.ToInt32(countAdd.Text);
            count++;
            countAdd.Text = count.ToString();
            if (hfNumAddressee.Value != "")
            {
                if (int.TryParse(hfNumAddressee.Value.Trim(), out numAddressee))
                {
                    numAddressee++;
                    //l_numAddress.Text = numAddressee.ToString();
                    hfNumAddressee.Value = numAddressee.ToString();
                }
            }
            else
                hfNumAddressee.Value = "1";
        }
        //TBaddPhone.Focus();

    }
    //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    CheckBox1.Checked = true; 
    //    CheckBoxList1.Items.Clear();
    //    cUserDetail user = new cUserDetail();
    //    user =(cUserDetail) Session["UserObj"];
    //    int  catId = Convert.ToInt32 (DDLmailingList .SelectedValue );
    //    string catname = DDLmailingList.SelectedItem.Text.ToString();
    //    string catname1 = DDLmailingList.SelectedItem.Selected.ToString();
    //    string catname2 = DDLmailingList.SelectedItem.Value;
    //    MailingList MailingList = new MailingList();
    //    DataSet ds= MailingList.loadMailingList(user.IdUser);
    //    int cId;
    //    string  CategoryName;
    //    string phone;
    //    string name;
    //    string pn;
    //    string  id;
    //    foreach (DataRow dr in ds.Tables[0].Rows)
    //    {
    //        CategoryName = dr["CategoryName"].ToString();
    //        cId =Convert.ToInt32( dr["categoryID"]);
    //        //if (cId == catId)
    //        if (CategoryName == catname)
    //        {

    //            id = dr["id"].ToString();
    //            phone = dr["phone"].ToString();
    //            name = dr["name"].ToString();
    //            ListItem item = new ListItem();
    //            item.Value = id;
    //            item.Text = phone + " " + name;

    //            //CheckBoxList1.Items.Add(item); 
    //        }
    //    }

    //    //LB_mailingList.DataBind();
    //}
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLmailingList.SelectedValue != "")
        {
            uploadMailingList.Visible = false;

            //string change_mailinglist = DDLmailingList.SelectedValue; //TODO
            //if (change_mailinglist != idCatgory_toedit && idCatgory_toedit!="")//if change
            //    DDLmailingList.SelectedValue = change_mailinglist;
            //else DDLmailingList.SelectedValue = idCatgory.ToString();

            categoryId = Convert.ToInt32(DDLmailingList.SelectedValue);
            // int catId = Convert.ToInt32(DDLmailingList.SelectedValue);
            MailingList ml = new MailingList();
            DataSet ds = ml.mailingListForCategory(categoryId);
            HCountMailinglist.Value = (ds.Tables[0].Rows.Count).ToString();
            CountMailingList.Text = (ds.Tables[0].Rows.Count).ToString();
           // if ((ds.Tables[0].Rows.Count) < 500)
            {
                GridView1.DataSource = ds;
                if (GridView1.HeaderRow != null)
                    GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }

            GridView1.DataBind();
            Session["dsGridViewStep"] = ds;
        }
    }
    public void loadcategoriesMailingList()
    {
        //string categoryName;
        //if (Session["UserObj"] != null)
        //{
        loadUser();
        cUserDetail user = new cUserDetail();
        user = (cUserDetail)Session["UserObj"];
        MailingList MailingList = new MailingList();
        categoriesMailingList categoriesMailingList = new categoriesMailingList();
        int id = user.IdUser;
        DataSet ds = categoriesMailingList.loadcategoriesMailingList(id);
        DDLmailingList.DataSource = ds.Tables[0];
        DDLmailingList.DataTextField = "CategoryName";
        DDLmailingList.DataValueField = "categoryID";
        DDLmailingList.DataBind();
        //}
    }
    public void loadExampleProject()
    {

        colProjectExample colprojectExample1 = new colProjectExample();
        //DataSet dsProjectExample 
        colprojectExample1.load();
        //DDLtypeProject.DataSource = colprojectExample1;
        //DDLtypeProject.DataTextField = "name";
        //DDLtypeProject.DataValueField = "projectId";
        //DDLtypeProject.DataBind();
    }
    protected void B_save_Click(object sender, EventArgs e)
    {
        saveProjectDetails(2);
        ToClose = "2";
        //Response.Redirect("selectProject.aspx.aspx?save=1");

    }
    public string GetWebPageAsStringShort(string strURI)
    {
        Uri objURI = new Uri(strURI);
        WebRequest objWebRequest = WebRequest.Create(objURI);
        WebResponse objWebResponse = objWebRequest.GetResponse();
        Stream objStream = objWebResponse.GetResponseStream();
        StreamReader objStreamReader = new StreamReader(objStream);
        string strHTML = objStreamReader.ReadToEnd();
        objStreamReader.Close();
        objWebResponse.Close();
        return strHTML;
        //GetWebPageAsStringShort = strHTML;
    }



    /*
public int saveProjectDetails(int saveOrSend)
    {
        if (Session["UserObj"] != null)
        {
		
            int idSendHour = Convert.ToInt32(ddlSendHour.SelectedValue);
          
            cUserDetail user = new cUserDetail();
            user = (cUserDetail)Session["UserObj"];
           int num = LBaddPhone.Items.Count; 
           int credit = user.getCreditUser();
           if (num > credit)
           {
               return -5;
           }
			
			
            string typeProject;
            typeProject = DDLtypeProject.SelectedItem.ToString();
            //save file 
            //save excel MailingList
			
			
            TimeSpan fromHour;
            TimeSpan toHour;
			
            if (idSendHour != 0)
            {
                int from = 7;
                int to = 10;
                from = from + ((idSendHour - 1) * 3);
                to = to + ((idSendHour - 1) * 3);
                string from_s = Convert.ToString(from);
                fromHour = TimeSpan.Parse(from_s + ":00:00");
                string to_s = Convert.ToString(to);
                toHour = TimeSpan.Parse(to_s + ":00:00");
            }
            else
            {
                fromHour = TimeSpan.Parse( "00:00:00");
                toHour = TimeSpan.Parse( "00:00:00");
            }
			
            //save project name
            string projectName = tbnameProject.Text;
            cProjectVoiceMail ProjectVoiceMail1 = new cProjectVoiceMail(projectName, user.IdUser, DateTime.Now, 0,0, fromHour, toHour);
            //Session["cProjectVoiceMail"] = ProjectVoiceMail1;
            //int idProjectExample=Convert.ToInt32 (DDLtypeProject.SelectedValue);
            string nameFile = "";
            //FileUploadAuodio.
            int idProjectExample = 0;

            if (HfProjectExample.Value == "3")
                idProjectExample = 3;
            if (HfProjectExample.Value == "4")
                idProjectExample = 4;
            if (HfProjectExample.Value == "5")
                idProjectExample = 8;
            if (HfProjectExample.Value == "6") // tamar
                 idProjectExample = 6;


            ProjectVoiceMail1.createNewProjectWithSendTime(idProjectExample);//לבטל טעינת קבצים עם כל המשתמע מכך
            if (CB_RecNum.Checked)
            {
                ProjectVoiceMail1.PrivateCallerid = true;
                ProjectVoiceMail1.UpdatePrivaetCallerid();
            }
		   
            if (saveOrSend == 0)
            {
                ProjectVoiceMail1.Status = 1;
                ProjectVoiceMail1.ProjectSend = DateTime.Now;
            }
            string nameRecordFile="";
            bool fileExists = true;
            if(HFrecordOrUploadDiv.Value=="myFile")
            {				
                nameRecordFile=listMyFiles.SelectedValue;
            }
            else if (Session["idrecord"] != null)
            {
                nameRecordFile = Session["idrecord"].ToString();
                
            }
             string ifExists = GetWebPageAsStringShort("http://176.31.62.173:92/voicemessage/fileexists.php?filename=" + nameRecordFile);
                //string tttt = GetWebPageAsStringShort("http://176.31.62.173:92/voicemessage/fileexists.php?filename=az4siv7");
                fileExists = true;// Convert.ToBoolean(ifExists);
                if (fileExists)
                {
                    cCallAction[] collection = ProjectVoiceMail1.CallProperties.getCollection();
                    foreach (cCallAction c in collection)
                    {
                        if (c.IsStart && c is cOutputEvent)
                        {
                            cOutputEvent outputEventRecord = (cOutputEvent)c;
                            //string nameRecordFile = Session["idrecord"].ToString();
                            outputEventRecord.saveRecordFile(nameRecordFile);

                        }
						
                                                //tamark
                        if (c is cTransferAgent)
                        {
                            cTransferAgent cTransferAgent = (cTransferAgent)c;
                            cTransferAgent.Phone = hidden_return_phone.Value;
                            cTransferAgent.NumAgents = Convert.ToInt32(hidden_num_agents.Value);
                            //string nameRecordFile = Session["idrecord"].ToString();
                            cTransferAgent.update();

                        }
						
						
                    }
                }

            

            string time = String.Format("{0:yyyy-MM-dd hh:mm}", DateTime.Now);
            time.Replace("/", "-");
            string MailingListName = ProjectVoiceMail1.ProjectName;

            MailingList MailingList;
            statusVoiceMailsSend statusVoiceMailsSend1;
            if (HfInsertOrChoose.Value == "1")
            {
                if (LBaddPhone.Items.Count > 0)
                {
                    //hfNumAddressee.Value = "0";
                    categoriesMailingList categoriesMailingList = new categoriesMailingList(MailingListName, user.IdUser);
                    int idNewCategoriesMailingList = Convert.ToInt32(DDLmailingList.Items[0].Value);
                    ProjectVoiceMail1.IdCategoryMailingList = idNewCategoriesMailingList;
                    ProjectVoiceMail1.updateProject();
                    foreach (object s in LBaddPhone.Items)
                    {
                        numAddressee = Convert.ToInt32(hfNumAddressee.Value);
                        numAddressee++;
                        hfNumAddressee.Value = numAddressee.ToString();
                        MailingList = new MailingList("", s.ToString(), idNewCategoriesMailingList);
                        int idNewMailingList = MailingList.add();
                        //save=2,send=0
                        statusVoiceMailsSend1 = new statusVoiceMailsSend(idNewMailingList, ProjectVoiceMail1.IdProject, saveOrSend,idSendHour);
                        statusVoiceMailsSend1.add();
                    }
                }
            }
            ArrayList dp = null;
            if (HfInsertOrChoose.Value == "2")
                if (GridView1.Rows.Count > 0)
                {
                    if (Session["deletePersonList"] != null)
                        dp = (ArrayList)Session["deletePersonList"];
                    int idPerson;
                    int categoryId;
                    if (HFcategoryexcel.Value != null & HFcategoryexcel.Value != "")
                    {
                        string c = HFcategoryexcel.Value;
                        categoryId = Convert.ToInt32(c);
                    }
                    else
                        categoryId = Convert.ToInt32(DDLmailingList.SelectedValue);
                    //statusVoiceMailsSend statusVoiceMailsSend1;
                    ProjectVoiceMail1.IdCategoryMailingList = categoryId;
                    ProjectVoiceMail1.updateProject();
                    MailingList ml = new MailingList();
                    DataSet ds = ml.mailingListForCategory(categoryId);
                    //foreach (DataRow row in ds.Tables[0].Rows)
                    //{

                    //    idPerson = (int)row["id"];
                    //    if (dp == null)
                    //    {
                    //        statusVoiceMailsSend1 = new statusVoiceMailsSend(idPerson, ProjectVoiceMail1.IdProject, saveOrSend);
                    //        statusVoiceMailsSend1.add();

                    //    }
                    //    else
                    //        if (!dp.Contains(idPerson))
                    //        {
                    //            statusVoiceMailsSend1 = new statusVoiceMailsSend(idPerson, ProjectVoiceMail1.IdProject, saveOrSend);
                    //            statusVoiceMailsSend1.add();
                    //        }
                    //}
                    foreach (GridViewRow di in GridView1.Rows)
                    {
                        CheckBox chkBx = (CheckBox)di.FindControl("ShowAddress");

                        if (chkBx != null && chkBx.Checked)
                        {
                            /// put your code here
                        }
                    }
                    foreach (GridViewRow row in GridView1.Rows)
                    {
                       
                            CheckBox chkItem = (CheckBox)row.FindControl("chkSel");
                            if (chkItem != null && chkItem.Checked)
                            {
                                numAddressee++;
                                idPerson = Convert.ToInt32(row.Cells[0].Text);
                                if (dp == null)
                                {
                                    statusVoiceMailsSend1 = new statusVoiceMailsSend(idPerson, ProjectVoiceMail1.IdProject, saveOrSend,idSendHour );
                                    statusVoiceMailsSend1.add();

                                }
                                else
                                    if (!dp.Contains(idPerson))
                                    {
                                        statusVoiceMailsSend1 = new statusVoiceMailsSend(idPerson, ProjectVoiceMail1.IdProject, saveOrSend,idSendHour );
                                        statusVoiceMailsSend1.add();
                                    }
                            }

                        
                    }

                }
            //ToClose = "True";
            Session["project"] = ProjectVoiceMail1;
            return ProjectVoiceMail1.IdProject;
        }
        return 0;
    }
    */
    public int saveProjectDetails(int saveOrSend)
    {
        cUserDetail user = new cUserDetail();
        user = (cUserDetail)Session["UserObj"];

        //  1233;
        loadUser();
        // if (Session["UserObj"] != null)
        //{

        string projectName = "";
        DateTime DateSend = DateTime.Now;
        TimeSpan fromHour = new TimeSpan(0, 0, 0);
        TimeSpan toHour = new TimeSpan(23, 59, 59);
        if (Request["ddlSendHour"] == "2" || flag_EP)
        {
            DateSend = DateTime.ParseExact(Request["datepicker"].ToString(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
            string Selecttime = Request["timepickerfrom"];
            string[] TotalTime = Selecttime.Split(':');
            fromHour = new TimeSpan(Convert.ToInt32(TotalTime[0]), Convert.ToInt32(TotalTime[1]), 0);
            Selecttime = Request["timepickerto"];
            TotalTime = Selecttime.Split(':');
            toHour = new TimeSpan(Convert.ToInt32(TotalTime[0]), Convert.ToInt32(TotalTime[1]), 0);
        }
        if (fromHour > toHour)
            return -9;
        else
        {
            int idSendHour = 0;


            List<statusVoiceMailsSend> voiceMailToSend = new List<statusVoiceMailsSend>();
            // int num =0;
            // if (HfInsertOrChoose.Value == "1")
            //     num = LBaddPhone.Items.Count;//Check balance....
            //else if (HfInsertOrChoose.Value == "2")
            //     num = GridView1.Rows.Count;//Check balance....
            //int credit = user.getCreditUser();
            //if (num > credit)
            //{
            //    return -5;
            //}
            string typeProject;
            //typeProject = DDLtypeProject.SelectedItem.ToString();
            //save file 
            //save excel MailingList

            loop_count = Convert.ToInt32(Request["select_count_loop"]);
            //save project name
            //projectName = tbnameProject.Text;
            //cProjectVoiceMail ProjectVoiceMail1 = new cProjectVoiceMail(projectName, user.IdUser, DateTime.Now, 0, 0, fromHour, toHour);
            cProjectVoiceMail ProjectVoiceMail1;

            //if(!flag_EP)
            ProjectVoiceMail1 = new cProjectVoiceMail(projectName, user.IdUser, DateTime.Now, 0, 0, fromHour, toHour, DateSend, loop_count);

            if (flag_EP)
            {
                ProjectVoiceMail1.IdProject = idProject_To_Edit;
                if (saveOrSend == 0)
                    datesend_ep = DateSend;
            }



            //Session["cProjectVoiceMail"] = ProjectVoiceMail1;
            //int idProjectExample=Convert.ToInt32 (DDLtypeProject.SelectedValue);
            string nameFile = "";
            //FileUploadAuodio.
            int idProjectExample = 0;

            //if (HfProjectExample.Value == "3")
            //    idProjectExample = 3;
            //if (HfProjectExample.Value == "4")
            //    idProjectExample = 4;
            //if (HfProjectExample.Value == "5")
            //    idProjectExample = 8;
            //if (HfProjectExample.Value == "6") // tamar		
            //    idProjectExample = 6;
            dbLayer db = new dbLayer();
            bool i;


            string MailingListName = ProjectVoiceMail1.ProjectName;

            MailingList MailingList;
            if (HFcategoryexcel.Value != null & HFcategoryexcel.Value != "")
            {
                string c = HFcategoryexcel.Value;
                categoryId = Convert.ToInt32(c);
            }
            else
                categoryId = Convert.ToInt32(DDLmailingList.SelectedValue);

            if (flag_EP) //Edit Project
            {
                ProjectVoiceMail1.UpdateNewProjectWithSendTime(idProjectExample, idProject_To_Edit, namep_Ep, user.IdUser, DateTime.Now, categoryId, fromHour, toHour, datesend_ep, loop_count);
            }
            else ProjectVoiceMail1.createNewProjectWithSendTime(idProjectExample);//לבטל טעינת קבצים עם כל המשתמע מכך
            //if (CB_RecNum.Checked)
            //{
            //    ProjectVoiceMail1.PrivateCallerid = true;
            //    ProjectVoiceMail1.UpdatePrivaetCallerid();
            //}

            if (saveOrSend == 0)
            {
                ProjectVoiceMail1.Status = 1;
                ProjectVoiceMail1.ProjectSend = DateTime.Now;
            }

            bool fileExists = true;
            //if (HFrecordOrUploadDiv.Value == "myFile")
            //{
            //    nameRecordFile = listMyFiles.SelectedValue;
            //}
            //else if (Session["idrecord"] != null)
            //{
            //    nameRecordFile = Session["idrecord"].ToString();

            //}


            string time = String.Format("{0:yyyy-MM-dd hh:mm}", DateTime.Now);
            time.Replace("/", "-");



            //if(flag_EP)
            //    db.UpdateNewProjectVoiceMailWithSendTime(idProject_To_Edit,namep_Ep, user.IdUser, DateTime.Now, categoryId, fromHour, toHour, datesend_ep, loop_count);


            string ifExists = GetWebPageAsStringShort("http://176.31.62.173:92/voicemessage/fileexists.php?filename=" + nameRecordFile);
            //string tttt = GetWebPageAsStringShort("http://176.31.62.173:92/voicemessage/fileexists.php?filename=az4siv7");
            fileExists = true;// Convert.ToBoolean(ifExists);
            if (fileExists)
            {

                cCallAction[] collection = ProjectVoiceMail1.CallProperties.getCollection();
                foreach (cCallAction c in collection)
                {
                    if (c.IsStart && c is cOutputEvent)
                    {
                        cOutputEvent outputEventRecord = (cOutputEvent)c;
                        //string nameRecordFile = Session["idrecord"].ToString();
                        outputEventRecord.saveRecordFile(nameRecordFile);

                    }               //tamark		
                    if (c is cTransferAgent)
                    {
                        cTransferAgent cTransferAgent = (cTransferAgent)c;
                        cTransferAgent.Phone = hidden_return_phone.Value;
                        cTransferAgent.NumAgents = Convert.ToInt32(hidden_num_agents.Value);
                        //string nameRecordFile = Session["idrecord"].ToString();		
                        cTransferAgent.update();

                    }


                }
            }


            if (HfInsertOrChoose.Value == "1")
                voiceMailToSend = GetMailListFromPersonalList(ProjectVoiceMail1, saveOrSend, idSendHour);
            else if (HfInsertOrChoose.Value == "2" && GridView1.Rows.Count > 0)
                voiceMailToSend = GetMailListFromSmalllList(ProjectVoiceMail1, saveOrSend, idSendHour, categoryId);
            else if (HfInsertOrChoose.Value == "2")
                voiceMailToSend = GetMailListFromLargelList(ProjectVoiceMail1, saveOrSend, idSendHour, categoryId);
            if (voiceMailToSend.Count <= user.getUseCreditUser())
            {
                foreach (statusVoiceMailsSend s in voiceMailToSend)
                {
                    if (saveOrSend == 0)
                        s.add();
                }
                Session["project"] = ProjectVoiceMail1;
                return ProjectVoiceMail1.IdProject;
            }
            else
                return -5;
        }

        //ToClose = "True";

        //}



        return 0;
    }

    protected void GridViewProjects_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        int catId=0;
        if (DDLmailingList.SelectedValue != "")
            catId = Convert.ToInt32(DDLmailingList.SelectedValue);
        MailingList ml = new MailingList();
        DataSet ds = ml.mailingListForCategory(catId);
        GridView1.DataSource = Session["dsGridViewStep"];
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }

    protected void hidden_addperson_Click(object sender, EventArgs e)
    {
        if (DDLmailingList.SelectedValue != "")
        {
            uploadMailingList.Visible = false;
            int catId = Convert.ToInt32(DDLmailingList.SelectedValue);
            MailingList ml = new MailingList();
            DataSet ds = ml.mailingListForCategory(catId);
            HCountMailinglist.Value = ds.Tables[0].Rows.Count.ToString();
            CountMailingList.Text = ds.Tables[0].Rows.Count.ToString();
            if ((ds.Tables[0].Rows.Count) < 500)
            {
                GridView1.DataSource = ds;
                if (GridView1.HeaderRow != null)
                    GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }

            GridView1.DataBind();
            Session["dsGridViewStep"] = ds;
        }
    }
    private List<statusVoiceMailsSend> GetMailListFromSmalllList(cProjectVoiceMail ProjectVoiceMail1, int saveOrSend, int idSendHour, int categoryId)
    {
        List<statusVoiceMailsSend> voiceMailToSend = new List<statusVoiceMailsSend>();
        statusVoiceMailsSend statusVoiceMailsSend1;
        ArrayList dp = null;

        int idPerson = 0;
        if (Session["deletePersonList"] != null)
            dp = (ArrayList)Session["deletePersonList"];
        ProjectVoiceMail1.IdCategoryMailingList = categoryId;
        ProjectVoiceMail1.updateProject();

        foreach (GridViewRow row in GridView1.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                string thisIdPerson = row.Cells[0].Text;
                if (Request.Form["ch_" + thisIdPerson] != null)
                {
                    idPerson = Convert.ToInt32(thisIdPerson);
                    if (dp == null)
                    {
                        numAddressee++;
                        statusVoiceMailsSend1 = new statusVoiceMailsSend(idPerson, ProjectVoiceMail1.IdProject, saveOrSend, idSendHour);
                        voiceMailToSend.Add(statusVoiceMailsSend1);
                    }
                    else
                        if (!dp.Contains(idPerson))
                        {
                            statusVoiceMailsSend1 = new statusVoiceMailsSend(idPerson, ProjectVoiceMail1.IdProject, saveOrSend, idSendHour);
                            voiceMailToSend.Add(statusVoiceMailsSend1);

                        }
                    numAddressee++;
                }
            }
        }
        return voiceMailToSend;
    }
    private List<statusVoiceMailsSend> GetMailListFromLargelList(cProjectVoiceMail ProjectVoiceMail1, int saveOrSend, int idSendHour, int categoryId)
    {
        int idPerson = 0;
        List<statusVoiceMailsSend> voiceMailToSend = new List<statusVoiceMailsSend>();
        statusVoiceMailsSend statusVoiceMailsSend1;
        ProjectVoiceMail1.IdCategoryMailingList = categoryId;
        ProjectVoiceMail1.updateProject();
        MailingList ml = new MailingList();
        DataSet ds = ml.mailingListForCategory(categoryId);
        foreach (DataRow row in ds.Tables[0].Rows)
        {

            idPerson = (int)row["id"];
            statusVoiceMailsSend1 = new statusVoiceMailsSend(idPerson, ProjectVoiceMail1.IdProject, saveOrSend, idSendHour);
            voiceMailToSend.Add(statusVoiceMailsSend1);
        }
        return voiceMailToSend;
    }
    private List<statusVoiceMailsSend> GetMailListFromPersonalList(cProjectVoiceMail ProjectVoiceMail, int saveOrSend, int idSendHour)
    {
        List<statusVoiceMailsSend> voiceMailToSend = new List<statusVoiceMailsSend>();

        statusVoiceMailsSend statusVoiceMailsSend1;
        if (LBaddPhone.Items.Count > 0)
        {
            //categoriesMailingList categoriesMailingList = new categoriesMailingList(MailingListName, user.IdUser);
            int idNewCategoriesMailingList = Convert.ToInt32(DDLmailingList.Items[0].Value);
            ProjectVoiceMail.IdCategoryMailingList = idNewCategoriesMailingList;
            ProjectVoiceMail.updateProject();
            foreach (object s in LBaddPhone.Items)
            {
                numAddressee = Convert.ToInt32(hfNumAddressee.Value);
                numAddressee++;
                hfNumAddressee.Value = numAddressee.ToString();
                MailingList ml = new MailingList("", s.ToString(), idNewCategoriesMailingList);
                int idNewMailingList = ml.add();
                //save=2,send=0
                statusVoiceMailsSend1 = new statusVoiceMailsSend(idNewMailingList, ProjectVoiceMail.IdProject, saveOrSend, idSendHour);
                voiceMailToSend.Add(statusVoiceMailsSend1);
                // statusVoiceMailsSend1.add();
            }
        }
        return voiceMailToSend;
    }
    protected void B_send_Click(object sender, EventArgs e)
    {
        //int projectid;
        //if (Session["UserObj"] != null)
        //{
        //    cUserDetail user = new cUserDetail();
        //    user = (cUserDetail)Session["UserObj"];
        //    int countNum = Convert.ToInt32(countNumbers.Text);
        //    if (user.getCreditUser()>= countNum)
        int projectid = saveProjectDetails(0);
        ToClose = "1";
        if (projectid == -9)
        {
            ToClose = "9";
        }
        if (projectid == -5)
        {
            ToClose = "5";
        }
        //else
        //    projectid = saveProjectDetails(2);

        /*ASCIIEncoding encoding = new ASCIIEncoding();
        string postData = "projectId=" +projectid;
        byte[] data = encoding.GetBytes(postData);
        // Prepare web request...
        HttpWebRequest myRequest = (HttpWebRequest)WebRequest.Create("http://176.31.62.173:92/voicemessage/runcalls.php");
        myRequest.Method = "POST";
        myRequest.ContentType = "application/x-www-form-urlencoded";
        myRequest.ContentLength = data.Length;
        Stream newStream = myRequest.GetRequestStream();
        // Send the data.
        newStream.Write(data, 0, data.Length);
        newStream.Close();
        Response.Redirect("postMsg.aspx");*/
        //http://176.31.62.173:92/voicemessage/sendcall.php?projectId=4&number=0527675693
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked)
        {

            //foreach (ListItem cb in CheckBoxList1.Items)
            //{
            //    cb.Selected = true;
            //    numAddressee++;
            //}
        }
        else
        {
            //numAddressee = 0;
            //foreach (ListItem cb in CheckBoxList1.Items)
            //{
            //    cb.Selected = false;
            //}
        }
    }
    //protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    hfNumAddressee.Value = "0";
    //    foreach (ListItem cb in CheckBoxList1.Items)
    //    { 
    //        if (cb.Selected)
    //        {
    //                if (int.TryParse(hfNumAddressee.Value.Trim(), out numAddressee))
    //                {
    //                    numAddressee++;
    //                    hfNumAddressee.Value = numAddressee.ToString();
    //                }
    //        }
    //    }
    //    l_numAddress.Text = hfNumAddressee.Value;
    //}

    protected void BdeleteItemListBox_Click(object sender, EventArgs e)
    {

        int count;
        count = Convert.ToInt32(countAdd.Text);


        //   LBaddPhone.Items.Remove(LBaddPhone.SelectedItem);
        // var items = new System.Collections.ArrayList(LBaddPhone .Items); 
        for (int i = 0; i < LBaddPhone.Items.Count; i++)
        {
            if (LBaddPhone.Items[i].Selected)
            {
                LBaddPhone.Items.Remove(LBaddPhone.Items[i]);
                i--;
                count--;

            }
        }
        countAdd.Text = count.ToString();
    }
    protected void Bstop_Click(object sender, EventArgs e)
    {

    }
    /* protected void Button1_Click(object sender, EventArgs e)
     {
         int idProject= saveProjectDetails();
        
         ASCIIEncoding encoding = new ASCIIEncoding();
         string postData = "number=" + TBtest.Text + "&projectId=" + idProject;
         byte[] data = encoding.GetBytes(postData);
         // Prepare web request...
         HttpWebRequest myRequest = (HttpWebRequest)WebRequest.Create("http://176.31.62.173:92/voicemessage/sendcall.php");
         myRequest.Method = "POST";
         myRequest.ContentType = "application/x-www-form-urlencoded";
         myRequest.ContentLength = data.Length;
         Stream newStream = myRequest.GetRequestStream();
         // Send the data.
         newStream.Write(data, 0, data.Length);
         newStream.Close();
         
     }*/
    //protected void chooseExistingProject_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (chooseExistingProject.Checked)
    //        DDLexistingProjects.Visible = true;
    //    else
    //        DDLexistingProjects.Visible = false;
    //}
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        char x = '"';
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            CheckBox chkItem = (CheckBox)e.Row.FindControl("chkSel");
            //chkItem.Checked
            //e.Row.Cells[3].Text = "<input type='button' value='ערוך' onclick='openDialogEditMailList('" + e.Row.Cells[0].Text + "','" + e.Row.Cells[1].Text + "','" + e.Row.Cells[2].Text + "')';/>";
            e.Row.Cells[3].Text = "<input type='button' class='editbtn'  onclick=" + x + "openDialogEditMailList('" + e.Row.Cells[0].Text + "','" + e.Row.Cells[1].Text + "','" + e.Row.Cells[2].Text + "')" + x + ">";
            e.Row.Cells[4].Text = "<input type='button' class='delbtn'  onclick=" + x + "opendivDeletePerson('" + e.Row.Cells[0].Text + "')" + x + ">";
            //e.Row.Cells[5].Text = "<input type='checkbox' class='checkPerson' id='chkSel' name='ch_" + e.Row.Cells[0].Text + "'  onclick=" + x + "checkPerson(this.name)" + x + " checked>";
            //e.Row.Cells[0].Attributes.Add("id", "id_" + e.Row.Cells[0].Text);
            e.Row.Cells[0].Attributes.Add("id", "id_" + e.Row.Cells[0].Text + x + "style=" + x + "color: transparent");
            e.Row.Cells[2].Attributes.Add("id", "name_" + e.Row.Cells[0].Text);
            e.Row.Cells[1].Attributes.Add("id", "phone_" + e.Row.Cells[0].Text);
            e.Row.Attributes.Add("id", "rowid_" + e.Row.Cells[0].Text);
        }
        e.Row.Attributes.Add("onload", "this.style.display='none'");
        //e.Row.Cells[0].Visible = false;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string name = namePerson.Text;
        string phone = phonePerson.Text;
        int catId = Convert.ToInt32(DDLmailingList.SelectedValue);
        int id = Convert.ToInt32(HFidPerson.Value);
        MailingList ml = new MailingList(name, phone, catId);
        ml.update();
        DataSet ds = ml.mailingListForCategory(catId);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
    }

    protected void okExcel_Click(object sender, EventArgs e)
    {
        uploadMailingList.Visible = true;
        int castCategory;
        string categoryId = HFcategoryexcel.Value;
        //int castCategory=Convert.ToInt32(categoryId);
        bool parsed = Int32.TryParse(categoryId, out castCategory);
        if (parsed)
        {
            loadcategoriesMailingList();
            DDLmailingList.Items.FindByValue(categoryId).Selected = true;
            MailingList ml = new MailingList();
            DataSet ds = ml.mailingListForCategory(castCategory);
            HCountMailinglist.Value = (ds.Tables[0].Rows.Count).ToString();
            CountMailingList.Text = (ds.Tables[0].Rows.Count).ToString();
            if ((ds.Tables[0].Rows.Count) < 500)
            {
                GridView1.DataSource = ds;
                if (GridView1.Rows.Count > 0)
                    GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
           
            }
            GridView1.DataBind();
            //    {
            //        cUserDetail user = new cUserDetail();
            //        user = (cUserDetail)Session["UserObj"];
            //       if (FileUploadExcel.HasFile)
            //        //if(FileUploadExcel.PostedFile != null )
            //        {
            //            string categoryNameExcel = TbCategoryNameExcel.Text;
            //            categoriesMailingList categoryExcel = new categoriesMailingList(categoryNameExcel, user.IdUser);
            //            int idNewCategoryExcel = categoryExcel.add();
            //            MailingList mailingListExcel = new MailingList();
            //            string filePath = FileUploadExcel.PostedFile.FileName;
            //            DataSet dsExcel = mailingListExcel.addMailingListFromExcel(user.IdUser, filePath, categoryNameExcel);
            //            GridView1.DataSource = dsExcel;
            //            GridView1.DataBind();
            //        }
            //    }
        }
    }
    protected void refreshDdl_click(object sender, EventArgs e)
    {
        // if (Session["UserObj"] != null)
        //{
        loadUser();
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
        Session["dsGridViewStep"] = ds2;
        //}

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
        GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
    }
    protected void BT_updateverify_Click(object sender, EventArgs e)
    {
        cUserDetail user = new cUserDetail();
        user = (cUserDetail)Session["UserObj"];
        if (user.verifyPhone)
        {
            //CB_RecNum.Checked = true;
            //CB_RecNum.Text += user.phone;
            //Panel2.Visible = false;
            //CB_RecNum.Visible = true;
        }
    }
    protected void ddlSendHour_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (ddlSendHour.SelectedIndex == 1)
        //{
        //    Lbl_Between.Visible = true;
        //    Lbl_To.Visible = true;
        //    //ddlfromhour.Visible = true;
        //    //ddlfrommin.Visible = true;
        //    //ddltomin.Visible = true;
        //    //ddltohour.Visible = true;

        //}
    }

    protected void OnDataBound(object sender, EventArgs e)
    {
        //GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
        //for (int i = 0; i < GridView1.Columns.Count; i++)
        //{
        //    TableHeaderCell cell = new TableHeaderCell();
        //    TextBox txtSearch = new TextBox();
        //    txtSearch.Attributes["placeholder"] = GridView1.Columns[i].HeaderText;
        //    txtSearch.CssClass = "search_textbox";
        //    cell.Controls.Add(txtSearch);
        //    row.Controls.Add(cell);
        //}
        //GridView1.HeaderRow.Parent.Controls.AddAt(1, row);
    }


    public bool loadUser()
    {
        cUserDetail user;
        bool loadOk = true;
        if (Session["UserObj"] == null)
        {
            loadOk = false;
            if (Request.Cookies["username"] != null && Request.Cookies["pass"] != null)
            {
                user = new cUserDetail(Request.Cookies["username"].Value, Request.Cookies["pass"].Value);
                if (user.Login())
                {
                    Session["UserObj"] = user;
                    loadOk = true;
                }
            }
        }
        if (loadOk)
        {
            user = (cUserDetail)Session["UserObj"];
            useractive = user.active;
        }
        else
            Response.Redirect("login.aspx");
        return true;
    }
    public bool useractive { get; set; }

    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        int catId = 0;
        if (DDLmailingList.SelectedValue != "")
            catId = Convert.ToInt32(DDLmailingList.SelectedValue);
        MailingList ml = new MailingList();
        DataSet ds = ml.mailingListForCategory(catId);
        GridView1.DataSource = Session["dsGridViewStep"];
        GridView1.PageSize = Convert.ToInt16(ddlPageSize.SelectedValue);
        GridView1.DataBind();
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



}





