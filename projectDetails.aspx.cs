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
using System.Data.OleDb;
using System.IO;
using Excel;
using System.Net;
using System.Text;
public partial class projectDetails : System.Web.UI.Page
{
    public int numAddressee;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            loadcategoriesMailingList();
            loadExampleProject();
            //tbnameProject.Focus() ;
            loadExistingProjects();
        }
        
    }
    private string recordFile(string sendPhone)
    {

        string idrecord = PasswordGenerator(7);
        idrecord = idrecord.ToLowerInvariant();
        //string sendPhone = TBrecordNumPhone.Text;
        lblCallRecoirdMsg.Visible = true;
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
      //  if (Session["UserObj"] != null)
      //  {
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
            
            DDLexistingProjects.DataSource = ds.Tables[0];
            DDLexistingProjects.DataTextField = "projectName";
            DDLexistingProjects.DataValueField = "idProject";
            DDLexistingProjects.DataBind();
      //  }
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

 
   public  string PasswordGenerator(int passwordLength)
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
         string idrecord = PasswordGenerator(7);
         idrecord = idrecord.ToLowerInvariant();
        string sendPhone = TBrecordNumPhone.Text;
        lblCallRecoirdMsg.Visible = true;
        string  now = DateTime.Now.ToLongTimeString();
        
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
         
       
        
    }
    protected void b_addPhone_Click(object sender, EventArgs e)
    {
        if (TBaddPhone.Text != "")
        {
            string item = TBaddPhone.Text;
            LBaddPhone.Items.Add(item);
            TBaddPhone.Text = "";
            if (hfNumAddressee.Value != "")
            {
                if (int.TryParse(hfNumAddressee.Value.Trim(), out numAddressee))
                {
                    numAddressee++;
                    l_numAddress.Text = numAddressee.ToString();
                    hfNumAddressee.Value = numAddressee.ToString();
                }
            }
            else
                hfNumAddressee.Value = "1";
        }
        
        
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckBox1.Checked = true; 
        CheckBoxList1.Items.Clear();
        cUserDetail user = new cUserDetail();
        user =(cUserDetail) Session["UserObj"];
        int  catId = Convert.ToInt32 (DDLmailingList .SelectedValue );
        string catname = DDLmailingList.SelectedItem.Text.ToString();
        string catname1 = DDLmailingList.SelectedItem.Selected.ToString();
        string catname2 = DDLmailingList.SelectedItem.Value;
        MailingList MailingList = new MailingList();
        DataSet ds= MailingList.loadMailingList(user.IdUser);
        int cId;
        string  CategoryName;
        string phone;
        string name;
        string pn;
        string  id;
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            CategoryName = dr["CategoryName"].ToString();
            cId =Convert.ToInt32( dr["categoryID"]);
            //if (cId == catId)
            if (CategoryName == catname)
            {
               
                id = dr["id"].ToString();
                phone = dr["phone"].ToString();
                name = dr["name"].ToString();
                ListItem item = new ListItem();
                item.Value = id;
                item.Text = phone + " " + name;
                CheckBoxList1.Items.Add(item); 
            }
        }
        
        //LB_mailingList.DataBind();
    }
    public void loadcategoriesMailingList()
    {
        //string categoryName;
       // if (Session["UserObj"] != null)
       // {
        loadUser();
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
            DDLmailingList.DataBind();
       // }
    }
    public void loadExampleProject()
    {
      
        colProjectExample  colprojectExample1 =new colProjectExample   ();
        //DataSet dsProjectExample 
        colprojectExample1.load();
        DDLtypeProject.DataSource = colprojectExample1;
        DDLtypeProject.DataTextField = "name";
        DDLtypeProject.DataValueField = "projectId";
        DDLtypeProject.DataBind();
    }
    protected void B_save_Click(object sender, EventArgs e)
    {
        saveProjectDetails();
        Response.Redirect("selectProject.aspx.aspx?save=1");

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
    public int saveProjectDetails()
    {
        loadUser();
        //if (Session["UserObj"] != null)
        //{
            cUserDetail user = new cUserDetail();
            user = (cUserDetail)Session["UserObj"];
            string typeProject;
            typeProject = DDLtypeProject.SelectedItem.ToString();
            //save file 
            //save excel MailingList

            if (FileUploadExcel.HasFile)
            {
                string categoryNameExcel = TbCategoryNameExcel.Text;
                categoriesMailingList categoryExcel = new categoriesMailingList(categoryNameExcel, user.IdUser);
                int idNewCategoryExcel = categoryExcel.add();
                MailingList mailingListExcel = new MailingList();
                string filePath = FileUploadExcel.PostedFile.FileName;
                mailingListExcel.addMailingListFromExcel(user.IdUser, filePath, categoryNameExcel);
            }
            //save project name
            string projectName = tbnameProject.Text;
            cProjectVoiceMail ProjectVoiceMail1 = new cProjectVoiceMail(projectName ,user.IdUser ,DateTime .Now,0,0 );
            //Session["cProjectVoiceMail"] = ProjectVoiceMail1;
            int idProjectExample=Convert.ToInt32 (DDLtypeProject.SelectedValue);
            string nameFile="";
            //FileUploadAuodio.
            
            
            
            
            ProjectVoiceMail1.createNewProject(idProjectExample);//לבטל טעינת קבצים עם כל המשתמע מכך
            /*if (FileUploadAuodio.HasFile)
            {
                cCallAction []col= ProjectVoiceMail1.CallProperties.getCollection();
                
                //cCallAction c;
                foreach (cCallAction c in col)
                {
                    if (c.IsStart && c is cOutputEvent)
                    {
                        cOutputEvent outputEve = (cOutputEvent)c;
                        FileUploadAuodio .SaveAs("//176.31.62.173/sound/"+c.IdAction);
                        outputEve.addUploadFile(c.IdAction.ToString());
                        
                        //====================
                        cOutputEvent outputEve = (cOutputEvent)c;
                        string typeFile = FileUploadAuodio.FileName.Substring(FileUploadAuodio.FileName.IndexOf("."), 4);
                        // nameFile = String.Format("{0:yyyyMMddhhmm}", DateTime.Now);
                        FileUploadAuodio.SaveAs(Server.MapPath("~/upload/") + c.IdAction + typeFile);
                        outputEve.saveAndUploadFile(c.IdAction, typeFile);
                        l_nameFile.Text = FileUploadAuodio.FileName;
                        //================
                    }
                }
            }*/
            //record file
            string nameRecordFile;
            if (Session["idrecord"] != null)
            {
                nameRecordFile = Session["idrecord"].ToString();
                //string ifExists = GetWebPageAsStringShort("http://176.31.62.173:92/voicemessage/fileexists.php?filename=" + nameRecordFile);
                //string tttt = GetWebPageAsStringShort("http://176.31.62.173:92/voicemessage/fileexists.php?filename=az4siv7");
                //bool fileExists = Convert.ToBoolean(ifExists);
                //if (fileExists)
                //{
                    cCallAction[] collection = ProjectVoiceMail1.CallProperties.getCollection();
                    foreach (cCallAction c in collection)
                    {
                        if (c.IsStart && c is cOutputEvent)
                        {
                            cOutputEvent outputEventRecord = (cOutputEvent)c;
                            //string nameRecordFile = Session["idrecord"].ToString();
                            outputEventRecord.saveRecordFile(nameRecordFile);
                            
                        }
                    }
                //}
                
            }
           //save phone numbers
            
            string time = String.Format("{0:yyyy-MM-dd hh:mm}", DateTime.Now);
            time.Replace("/", "-");
            string MailingListName = "תפוצה" + projectName;
           
            MailingList MailingList;
            statusVoiceMailsSend statusVoiceMailsSend1;
            if(HfInsertOrChoose .Value=="1")
            //if (LBaddPhone.Items.Count >0)
            {
                //hfNumAddressee.Value = "0";
                categoriesMailingList categoriesMailingList = new categoriesMailingList(MailingListName, user.IdUser);
                int idNewCategoriesMailingList = categoriesMailingList.add();
                ProjectVoiceMail1.IdCategoryMailingList = idNewCategoriesMailingList;
                ProjectVoiceMail1.updateProject();
                foreach (object s in LBaddPhone.Items)
                {
                    numAddressee = Convert.ToInt32( hfNumAddressee.Value);
                    numAddressee++;
                    hfNumAddressee.Value = numAddressee.ToString();
                    MailingList = new MailingList("", s.ToString(), idNewCategoriesMailingList);
                    int idNewMailingList = MailingList.add();
                    statusVoiceMailsSend1=new statusVoiceMailsSend (idNewMailingList ,ProjectVoiceMail1.IdProject ,0,0);
                    statusVoiceMailsSend1.add();
                }
            }
            else
                if (CheckBoxList1.Items.Count > 0)
                {
                    
                    int cbId;
                    int  categoryId = Convert.ToInt32 (DDLmailingList .SelectedValue );
                    //statusVoiceMailsSend statusVoiceMailsSend1;
                    ProjectVoiceMail1.IdCategoryMailingList = categoryId;
                    ProjectVoiceMail1.updateProject();
                    foreach (ListItem cb in CheckBoxList1.Items)
                    {
                        if (cb.Selected)
                        {
                            numAddressee++;
                            cbId = Convert.ToInt32( cb.Value);
                            statusVoiceMailsSend1 = new statusVoiceMailsSend(cbId ,ProjectVoiceMail1.IdProject, 0, 0);
                            statusVoiceMailsSend1.add();
                        }
                    }

                }
            //l_numAddressee.Text = numAddressee.ToString();
           

              
        //delete nameFile..
        /*
         * 
         * 
         * */

          //save phoneList
            //statusVoiceMailsSend statusVoiceMailsSend1;
            //foreach (ListItem cb in CheckBoxList1.Items)
            //{
            //    if (cb.Selected)
            //    {
            //        statusVoiceMailsSend1 = new statusVoiceMailsSend((user.IdUser,idProjectExample ,0,0);
            //        statusVoiceMailsSend1.add();
            //    }
            //}
            return ProjectVoiceMail1.IdProject;
       // }
       // return 0;
    }
    protected void B_send_Click(object sender, EventArgs e)
    {
        int projectid= saveProjectDetails();
        ASCIIEncoding encoding = new ASCIIEncoding();
        string postData = "projectId=" +projectid ;
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
        //http://176.31.62.173:92/voicemessage/sendcall.php?projectId=4&number=0527675693
    }




   


    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked)
        {

            foreach (ListItem cb in CheckBoxList1.Items)
            {
                cb.Selected = true;
                numAddressee++;
            }
        }
        else
        {
            numAddressee = 0;
            foreach (ListItem cb in CheckBoxList1.Items)
            {
                cb.Selected = false;
            }
        }
    }
    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        hfNumAddressee.Value = "0";
        foreach (ListItem cb in CheckBoxList1.Items)
        { 
            if (cb.Selected)
            {
                    if (int.TryParse(hfNumAddressee.Value.Trim(), out numAddressee))
                    {
                        numAddressee++;
                        hfNumAddressee.Value = numAddressee.ToString();
                    }
            }
        }
        l_numAddress.Text = hfNumAddressee.Value;
    }
  
    protected void BdeleteItemListBox_Click(object sender, EventArgs e)
    {
        LBaddPhone.Items.Remove(LBaddPhone.SelectedItem);
        // var items = new System.Collections.ArrayList(LBaddPhone .Items); 
        //foreach (ListItem l in LBaddPhone. )
        //    if (l.Selected)
        //        LBaddPhone.Items.Remove(l);
        numAddressee--;
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
    protected void chooseExistingProject_CheckedChanged(object sender, EventArgs e)
    {

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
        }
        else
            Response.Redirect("login.aspx");
        return true;
    }
}





    