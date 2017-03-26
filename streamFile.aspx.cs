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
using System.IO;
using System.Net;
using System.Text;

////using VoiceMail;
public partial class streamFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.AppendHeader("Access-Control-Allow-Origin", "*");
        Response.HeaderEncoding = Encoding.UTF8;
        Response.HeaderEncoding = Encoding.GetEncoding("windows-1255");
        Impersonation.ImpersonateUser(@"\\176.31.62.175\sound", "itizik", "0543976047");
        //https://176.31.62.173:10000/
        //get idAction file
        //load from database get file name
        string idRecord = "";
        string nameFile = "";
        string idRecord_todelete = "";
        if (Request["deleterecord"] == "1")
        {
            idRecord_todelete = Request["recordtodelete"];
            dbLayer db = new dbLayer();
            if (db.deleteOutputEvent(idRecord_todelete))
                Response.Write(true);
            else
                Response.Write(false);
        }
        if (Request["deleteCategory"] == "1")
        {
            int idCategory = Convert.ToInt32(Request["idCategory"]);
            dbLayer db=new dbLayer();
            if ( db.DeleteCategoriesMailingList(idCategory))
                Response.Write(true);
            else
                Response.Write(false);
        }

        if (Request["deletePerson"] == "1")
        {
            int id = Convert.ToInt32(Request["idPerson"]);
            //add id person to session

            MailingList ml = new MailingList(id);
            if (ml.delete())
                Response.Write(true);
            else
                Response.Write(false);
        }
        if (Request["deletePerson"] == "0")
        {
            int id = Convert.ToInt32(Request["idPerson"]);
            ArrayList dp = new ArrayList();
            if (Session["deletePersonList"] != null)
            {
                dp = (ArrayList)Session["deletePersonList"];
            }
            dp.Add(id);
            Session["deletePersonList"] = dp;
            Response.Write(true);

        }
        if (Request["updatePerson"] != null)
        {
            string name = Request["namePerson"];
            string phone = Request["phonePerson"];

            //int catId = Convert.ToInt32(DDLmailingList.SelectedValue);
            int id = Convert.ToInt32(Request["idPerson"]);
            int idCategory = Convert.ToInt32(Request["idCategory"]);
            MailingList ml = new MailingList(id, name, phone, idCategory);
            if (ml.update())
                Response.Write(true);
            else
                Response.Write(name);
            //DataSet ds = ml.mailingListForCategory(catId);

            //GridView1.DataSource = ds;
            //GridView1.DataBind();


            //Request["id.."
        }
        if (Request["addPerson"] != null)
        {
            string name = Request["namePerson"];
            string phone = Request["phonePerson"];

            //int catId = Convert.ToInt32(DDLmailingList.SelectedValue);

            int idCategory = Convert.ToInt32(Request["idCategory"]);
            string nameEnc = String.Format("{0}", HttpUtility.UrlEncode(name));
            MailingList ml = new MailingList(name, phone, idCategory);


            int idPerson = ml.add();
            if (idPerson != null)
                Response.Write(idPerson);

            else
                Response.Write(false);
        }
        if (Request["addNewList"] != null)
        {
            if (Session["UserObj"] != null)
            {
                cUserDetail user = (cUserDetail)Session["UserObj"];
                string nameCategory = Request["nameList"];
                categoriesMailingList cml = new categoriesMailingList(nameCategory, user.IdUser);
                int idNewCtegory = cml.add();
                if (idNewCtegory != null)
                    Response.Write(idNewCtegory);
                else
                    Response.Write(false);
            }
        }
        if (Request["record"] != null)
        {
            //Response.Write(recordFile(Request["number"].ToString()));
            string numberPhone = Request["number"].ToString();
            idRecord = recordFile(numberPhone);

            Response.Write(idRecord.ToString());
        }
        //string nameFile = Request.QueryString["nameFile"].ToString();
        if (Request["progressuploadExcel"] != null)
        {
            int categoryId = Convert.ToInt32(Request["progressuploadExcel"]);
            int max = Convert.ToInt32(Session["all" + categoryId]);
            int stat = Convert.ToInt32(Session["s" + categoryId]);
            /*
            int max=500;
            int stat=40;
            */
            Response.Write((100 / (max / stat)).ToString());
        }
        if (Request["check"] != null)
        {
            try
            {
                //string nameFile = idRecord; 
                nameFile = Request["nameFile"].ToString();
                string urlWav = Server.MapPath(@"auodioFile\") + nameFile + ".wav";//@"\\176.31.62.173\Sound\" + nameFile + ".wav";
                //Response.Write( File.Exists("http://176.31.62.175:92//sendmessages/sounds/" + nameFile));
                bool wavFile = File.Exists(urlWav);
                bool mp3File = false;
                string fullPath = Server.MapPath(@"auodioFile\") + nameFile + ".mp3";
                if (wavFile)
                {
                    string mp3Path = Server.MapPath(@"auodioFile\") + nameFile + ".mp3";
                    mp3File = File.Exists(mp3Path);
                    if (!mp3File)
                    {
                        ConvertWavToMP3(urlWav, nameFile);
                        System.Threading.Thread.Sleep(2000);
                        mp3File = File.Exists(mp3Path);
                        //File.Delete(@"\\176.31.62.173\Sound\" + nameFile + ".wav");
                        try
                        {
                            File.Delete(Server.MapPath(@"auodioFile\") + nameFile + ".wav");
                        }
                        catch (Exception ex2)
                        {
                            Response.Write(ex2.Message);
                        }
                    }

                }
                Response.Write(mp3File);
            }
            catch (Exception ex)
            { Response.Write(ex.Message); }

        }
        if (Request["streamFile"] != null)
        {
            string fileName = Request["streamFile"].ToString();
            if (fileName.IndexOf("?") > 0)
                fileName = fileName.Substring(0, fileName.IndexOf("?"));
            //streamFileLoc(@"http://176.31.62.175:92/sounds/" + fileName + ".mp3", Request["streamFile"].ToString() + ".mp3");
            streamFileLoc(@"http://spix.co.il/auodioFile/" + fileName + ".mp3", Request["streamFile"].ToString() + ".mp3");
        }
        /*else
        {
            //streamFileLoc("//176.31.62.173/" + nameFile,"");
            string url = "";// Request.QueryString["url"].ToString();
            //streamFileLoc(url, "mailMessage");
            streamFileLoc("http://bhol.org/2012/10/kard.mp3", "mailMessage.mp3");
        }*/
    }

    public void ConvertWavToMP3(string urlWav, string fileName)
    {

        System.Diagnostics.Process proc = new System.Diagnostics.Process();
        proc.EnableRaisingEvents = false;
        proc.StartInfo.FileName = @"c:\lame\lame.exe";
        string locFile = Server.MapPath(@"auodioFile\") + fileName;
        proc.StartInfo.Arguments = @" -h " + urlWav + " " + locFile + ".mp3 ";
        proc.Start();

    }


    public void mciConvertWavMP3(string fileName)
    {

        System.Diagnostics.Process proc = new System.Diagnostics.Process();
        proc.EnableRaisingEvents = false;
        //proc.StartInfo.FileName = "cmd";
        proc.StartInfo.FileName = @"c:\lame\lame.exe";
        //proc.StartInfo.Arguments = @"c:\lame\lame.exe -h \\176.31.62.173\sound\"+fileName+@".wav \\176.31.62.173\sound\"+fileName+".mp3";
        proc.StartInfo.Arguments = @" -h \\176.31.62.175\sound\" + fileName + @".wav \\176.31.62.175\sound\" + fileName + ".mp3";
        proc.Start();


    }
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
        cUserDetail user = (cUserDetail)Session["UserObj"];
        ASCIIEncoding encoding = new ASCIIEncoding();
        string postData = "number=" + sendPhone + "&idrecord=" + idrecord + "&iduser=" + user.IdUser;


        byte[] data = encoding.GetBytes(postData);
        // Prepare web request...
        HttpWebRequest myRequest = (HttpWebRequest)WebRequest.Create("http://176.31.212.241:92/voicemessage/recordfile.php");
        myRequest.Method = "POST";
        myRequest.ContentType = "application/x-www-form-urlencoded";
        myRequest.ContentLength = data.Length;
        Stream newStream = myRequest.GetRequestStream();
        // Send the data.
        newStream.Write(data, 0, data.Length);
        newStream.Close();
        return idrecord;
    }
    private void streamFileLoc(string url, string fileName)
    {
        //bool wavFile = File.Exists(@"\\176.31.62.173\Sound\" + fileName);
        //if (!File.Exists(@"\\176.31.62.173\Sound\" + fileName))
        //{
        //    url = url.Replace(".mp3", ".wav");
        //    fileName = fileName.Replace(".mp3", ".wav");
        //    if (File.Exists(@"\\176.31.62.173\Sound\" + fileName))
        //    {
        //        mciConvertWavMP3(fileName);
        //        url = url.Replace(".wav", ".mp3");

        //    }
        //    wavFile = File.Exists(@"\\176.31.62.173\Sound\513.wav");
        //}




        //int len = fileName.Length;
        //string nameFile = fileName.Remove(len-4);
        //bool wavFile = File.Exists(@"\\176.31.62.173\Sound\" + nameFile + ".wav");
        //bool mp3File = false;
        //if (wavFile)
        //{
        //    mp3File = File.Exists(@"\\176.31.62.173\Sound\" + nameFile + ".mp3");
        //    if (!mp3File)
        //    {
        //        mciConvertWavMP3(nameFile);
        //        mp3File = File.Exists(@"\\176.31.62.173\Sound\" + nameFile + ".mp3");
        //    }
        //    //bool b=File.Exists("http://176.31.62.173:92/sounds/" + nameFile);
        //    //string url="http://176.31.62.173:92/sounds/" + nameFile;
        //    //File.Exists("http://176.31.62.173:92/sendmessages/sounds/" + nameFile);
        //}

        string[] strArray = fileName.Split('?');
        string namefile = strArray[0];
        /*bool  mp3File = File.Exists(@"\\176.31.62.173\Sound\" + namefile + ".mp3");
        if (!mp3File)
        {
            bool wavFile = File.Exists(@"\\176.31.62.173\Sound\" + namefile + ".wav");
            if (wavFile)
            {
                mciConvertWavMP3(namefile);
            }
        }*/

        //Create a stream for the file 
        Stream stream = null;
        //This controls how many bytes to read at a time and send to the client 
        int bytesToRead = 10000;
        // Buffer to read bytes in chunk size specified above  
        byte[] buffer = new Byte[bytesToRead];
        // The number of bytes read         
        try
        {
            //Create a WebRequest to get the file    
            HttpWebRequest fileReq = (HttpWebRequest)HttpWebRequest.Create(url);
            //Create a response for this request
            HttpWebResponse fileResp = (HttpWebResponse)fileReq.GetResponse();
            if (fileReq.ContentLength > 0)
                fileResp.ContentLength = fileReq.ContentLength;
            //Get the Stream returned from the response        
            stream = fileResp.GetResponseStream();
            // prepare the response to the client. resp is the client Response  
            var resp = HttpContext.Current.Response;
            //Indicate the type of data being sent          
            resp.ContentType = "application/octet-stream";
            //Name the file                
            resp.AddHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
            resp.AddHeader("Content-Length", fileResp.ContentLength.ToString());
            int length;
            do
            {
                // Verify that the client is connected.    
                if (resp.IsClientConnected)
                {
                    // Read data into the buffer. 
                    length = stream.Read(buffer, 0, bytesToRead);
                    // and write it out to the response's output stream  
                    resp.OutputStream.Write(buffer, 0, length);
                    // Flush the data      
                    resp.Flush();
                    //Clear the buffer     
                    buffer = new Byte[bytesToRead];
                }
                else
                {
                    // cancel the download if client has disconnected   
                    length = -1;
                }
            }
            while (length > 0);
            //Repeat until no data is read    
        }
        finally
        {
            if (stream != null)
            {
                //Close the input stream  
                stream.Close();
            }
        }
    }
}


