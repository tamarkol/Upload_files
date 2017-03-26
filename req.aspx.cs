using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;
using System.Net;
using System.Text;
////using VoiceMail;
using NAudio.Wave;//change

public partial class req : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Response.AppendHeader("Access-Control-Allow-Origin", "*");
        int count = Request.Files.Count;
        count--;
        if (count < 0)
        {
            Response.Write("Empty files");
            Response.End();
            return;
        }
        string fileName = PasswordGenerator(7).ToLowerInvariant();
        Session["idrecord"] = fileName;

        string typeFile = Request.Files[count].FileName.Substring(Request.Files[count].FileName.LastIndexOf('.') + 1);
        string fullPath = Server.MapPath(@"auodioFile\") + fileName + "." + typeFile.ToLower();
        Request.Files[count].SaveAs(fullPath);
        if (typeFile.ToLower() == "wav")
        {
            ConvertWavToMP3(fileName);
            System.Threading.Thread.Sleep(2000);
            File.Delete(fullPath);
        }








        //TimeSpan duration = new TimeSpan(0, 0, 30); 
		TimeSpan duration = GetMp3Duration(Server.MapPath(@"auodioFile\") + fileName + ".mp3");    
        int totalSeconds = (int)(duration).TotalSeconds;
        Response.Write(duration + "/");
        cMyFile myfile = new cMyFile();
        cUserDetail User = (cUserDetail)Session["UserObj"];
        string truenamefile = Request.Files[count].FileName.ToString();
        //if (totalSeconds <= 60)
        //{
        myfile.updateFile(User.IdUser, fileName, truenamefile);
        //}
        //else
         //   Response.Write("abc"); 
        Response.Write(fileName);
    }





    public void ConvertWavToMP3(string fileName)
    {

        System.Diagnostics.Process proc = new System.Diagnostics.Process();
        proc.EnableRaisingEvents = false;
        proc.StartInfo.FileName = @"c:\lame\lame.exe";
        string locFile = Server.MapPath(@"auodioFile\") + fileName;
        proc.StartInfo.Arguments = @" -h " + locFile + ".wav " + locFile + ".mp3 ";
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

    public static TimeSpan GetWavFileDuration(string fileName)
    {
        WaveFileReader wf = new WaveFileReader(fileName);
        wf.Close();
        return wf.TotalTime;
    }
	
	public static TimeSpan GetMp3Duration(string fileName)
    {
        string p = fileName;
        string fileExt = Path.GetExtension(p); 
        //Use NAudio to get the duration of the File as a TimeSpan object
        TimeSpan duration = new Mp3FileReader(fileName).TotalTime;
        return duration;    
    } 
	
}
