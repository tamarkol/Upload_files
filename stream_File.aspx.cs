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
public partial class stream_File : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.AppendHeader("Access-Control-Allow-Origin", "*");
        Response.HeaderEncoding = Encoding.UTF8;
        Response.HeaderEncoding = Encoding.GetEncoding("windows-1255");

        if (Request["email"] != null && Request["password"] != null)
        {
            string email = Request["email"].ToString();
            // string password= "";
            string password = Request["password"].ToString();
            cUserDetail user = new cUserDetail();
            if (email != "" && password != "")
            {
              DataSet UserDeatails = new DataSet();
              dbLayer db = new dbLayer();
              UserDeatails =db.CheckUser_Pass(email,password);
              if (UserDeatails == null || UserDeatails.Tables[0].Rows.Count <= 0)
              {
                  Response.Write("Username or password incorrect"); Response.End();
              }

            }
            else { Response.Write("Username or password incorrect"); Response.End(); }



            if (Request["streamFile"] != null)
            {
                string fileName = Request["streamFile"].ToString();
                if (fileName.IndexOf("?") > 0)
                    fileName = fileName.Substring(0, fileName.IndexOf("?"));
                streamFileLoc(@"https://spix.co.il/auodioFile/" + fileName + ".mp3", Request["streamFile"].ToString() + ".mp3");
            }
        }
 
    }

    private void streamFileLoc(string url, string fileName)
    {
      
        string[] strArray = fileName.Split('?');
        string namefile = strArray[0];
     
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


