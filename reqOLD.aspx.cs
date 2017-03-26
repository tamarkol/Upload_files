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
//using VoiceMail;
using NAudio.Wave;//change

public partial class req : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        Response.AppendHeader("Access-Control-Allow-Origin", "*");
        int count = Request.Files.Count;
        count--;
        //string fileNme = Request["filename"].ToString();
        string fileNme = PasswordGenerator(7).ToLowerInvariant();
        Session["idrecord"] = fileNme;
        //Response.Write(count);
        Request.Files[count].SaveAs(@"\\176.31.62.173\sound\" + fileNme + Request.Files[count].FileName.Substring(Request.Files[count].FileName.LastIndexOf('.')));

        //int len = fileName.Length;
        //  string nameFile = fileName.Remove(len - 4);
        bool wavFile = File.Exists(@"\\176.31.62.173\Sound\" + fileNme + ".wav");
        bool mp3File = File.Exists(@"\\176.31.62.173\Sound\" + fileNme + ".mp3");  //change false
        if (wavFile)
        {
            mp3File = File.Exists(@"\\176.31.62.173\Sound\" + fileNme + ".mp3");
            if (!mp3File)
            {
                mciConvertWavMP3(fileNme);
                mp3File = File.Exists(@"\\176.31.62.173\Sound\" + fileNme + ".mp3");
                Request.Files[count].SaveAs(Server.MapPath(@"auodioFile\") + fileNme + ".wav");
                mciConvertWavToWav(fileNme);

            }

            //bool b=File.Exists("http://176.31.62.173:92/sounds/" + nameFile);
            //string url="http://176.31.62.173:92/sounds/" + nameFile;
            //File.Exists("http://176.31.62.173:92/sendmessages/sounds/" + nameFile);
        }
        else if (mp3File)
        {
            wavFile = File.Exists(@"\\176.31.62.173\Sound\" + fileNme + ".wav");

            if (!wavFile)
            {
                Request.Files[count].SaveAs(Server.MapPath(@"auodioFile\") + fileNme + ".mp3");
                //Mp3ToWav(fileNme);
                Mp3ToWav16Bit(fileNme);
                wavFile = File.Exists(@"\\176.31.62.173\Sound\" + fileNme + ".wav");
                //Mp3ToWav(@"\\176.31.62.173\Sound\" + fileNme + ".mp3", Server.MapPath(@"auodioFile\") + fileNme + ".wav");
            }

        }
        /*
        TimeSpan duration = new TimeSpan(0, 0, 30);//GetWavFileDuration(Server.MapPath(@"auodioFile\") + fileNme + ".wav");
        string fileNametodelete = Server.MapPath(@"auodioFile\") + fileNme + ".wav";

        if (fileNametodelete != null || fileNametodelete != string.Empty)
        {

            try
            {
                if ((System.IO.File.Exists(fileNametodelete)))
                {
                    System.IO.File.Delete(fileNametodelete);
                }
            }
            catch (Exception e3)
            {

            }
        }
         * */
        TimeSpan duration = new TimeSpan(0, 0, 30);
        int totalSeconds =  (int)(duration).TotalSeconds;
        Response.Write(duration + "/");
        cMyFile myfile = new cMyFile();
        cUserDetail User = (cUserDetail)Session["UserObj"];
        string truenamefile = Request.Files[count].FileName.ToString();
        if (totalSeconds <= 60)
        {
            myfile.updateFile(User.IdUser, fileNme, truenamefile);
        }
        else Response.Write("abc");
        Response.Write(fileNme);
    }
	
    public void mciConvertWavMP3(string fileName)
    {

        System.Diagnostics.Process proc = new System.Diagnostics.Process();
        proc.EnableRaisingEvents = false;
        //proc.StartInfo.FileName = "cmd";
        proc.StartInfo.FileName = @"c:\lame\lame.exe";
        //proc.StartInfo.Arguments = @"c:\lame\lame.exe -h \\176.31.62.173\sound\"+fileName+@".wav \\176.31.62.173\sound\"+fileName+".mp3";
        proc.StartInfo.Arguments = @" -h \\176.31.62.173\sound\" + fileName + @".wav \\176.31.62.173\sound\" + fileName + ".mp3";
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
     public static void Mp3ToWav(string fileName)
    {
        //using (Mp3FileReader reader = new Mp3FileReader(mp3File))
        //{
        //    WaveFileWriter.CreateWaveFile(outputFile, reader);
        //    reader.Close();
        //}

        System.Diagnostics.Process proc = new System.Diagnostics.Process();
        proc.EnableRaisingEvents = false;
        //proc.StartInfo.FileName = "cmd";
        proc.StartInfo.FileName = @"c:\sox\sox.exe";
        //proc.StartInfo.Arguments = @"c:\lame\lame.exe -h \\176.31.62.173\sound\"+fileName+@".wav \\176.31.62.173\sound\"+fileName+".mp3";
        proc.StartInfo.Arguments = @" \\176.31.62.173\sound\" + fileName + @".mp3  -c1 -r 8000 \\176.31.62.173\sound\" + fileName + ".wav";
//-b 16 -m m  \\176.31.62.173\sound\" + fileName + @".mp3 \\176.31.62.173\sound\" + fileName + ".wav";
        proc.Start();

    }
     public static void Mp3ToWav16Bit(string fileName)
     {
         WaveFormat target = new WaveFormat(8000, 16, 1);
        // WaveStream stream = new WaveFileReader(@"\\176.31.62.173\Sound\" + fileName + ".mp3");
        // Mp3FileReader stream = new Mp3FileReader(@"c:/sites/spix...." + fileName + ".mp3");
         Mp3FileReader stream = new Mp3FileReader(@"\\176.31.62.173\Sound\" + fileName + ".mp3");
         WaveFormatConversionStream str = new WaveFormatConversionStream(target, stream);
         WaveFileWriter.CreateWaveFile(@"\\176.31.62.173\Sound\" + fileName + ".wav", str);

     }

    public void mciConvertWavToWav(string fileName)
    {

        System.Diagnostics.Process proc = new System.Diagnostics.Process();
        proc.EnableRaisingEvents = false;
        //proc.StartInfo.FileName = "cmd";
        proc.StartInfo.FileName = @"c:\lame\lame.exe";
        proc.StartInfo.Arguments = @" -h " + Server.MapPath(@"auodioFile\") + fileName + @".wav \\176.31.62.173\sound\" + fileName + ".wav";
       // proc.StartInfo.Arguments = @" -h " + Server.MapPath(@"auodioFile\") + fileName + @".wav c:\\toconvert\" + fileName + ".wav";//work local
        proc.Start();


    }

	
}
