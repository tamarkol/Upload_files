using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using VoiceMail;
using System.Net.Mail;
using System.Data;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using MySql.Data.MySqlClient;
using MySql.Data;
using System.IO;
using Alvas.Audio;

public partial class about : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string user="";
        user= Request.QueryString["user"] ?? " ";
        string pass="";
        pass= Request.QueryString["pass"] ?? "";

        if (user == "tzvi" && pass=="0523129999")
        {
            Master.titleheader = "מעקב";
            Master.picHeader = "about";
            //string sql="
            //GridView1.DataSource = myfiles;
            //  GridView1.DataBind();
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
                command.CommandText = "select `tbl_users`.`IdUser` AS `IdUseras`,`tbl_users`.`Email` AS `Email`,`tbl_users`.`date` AS `date`,`tbl_users`.`Active` AS `Active`,sum(`tblmovements`.`amount`) AS `balance`,`tbl_users`.`LastVisit` AS `LastVisit`,(select `tblmovements`.`amount` AS `amount` from (`tbl_users` left join `tblmovements` on((`tbl_users`.`IdUser` = `tblmovements`.`idUser`))) where ((`tblmovements`.`minusOrPlus` = 1) and (`tblmovements`.`idUser` = `IdUseras` )) order by `tblmovements`.`date` desc limit 1) AS `LastPackage` from (`tbl_users` left join `tblmovements` on((`tbl_users`.`IdUser` = `tblmovements`.`idUser`))) group by `tbl_users`.`IdUser` order by date desc";
                MySqlDataReader reader = command.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                //while (reader.Read())
                //   {
                //       //reader.GetString(0)
                //       //reader["column_name"].ToString()
                //   }
                reader.Close();
                //WhatIsAcmDriver();
				//WhatIsCompressedAudioFormat();
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
        }

    }
	
	
	public override void VerifyRenderingInServerForm(Control control)
    { }//חייב עבור הורדה לאקסל
    protected void bt_export_Click(object sender, EventArgs e)
    {
        HtmlForm form = new HtmlForm();
        string attachment = "attachment; filename=track.xls";
        Response.ClearContent();
        Response.AddHeader("content-disposition", attachment);
        HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1255");
        HttpContext.Current.Response.Charset = "windows-1255";
        Response.ContentType = "application/ms-excel";
        StringWriter stw = new System.IO.StringWriter();
        HtmlTextWriter htextw = new HtmlTextWriter(stw);
        form.Controls.Add(GridView1);
        this.Controls.Add(form);
        form.RenderControl(htextw);
        GridView1.AllowPaging = true;
        //GridView1.AllowPaging = true;
        DataBind();
        Response.Write(stw.ToString());
        Response.End();
    }
	
	    protected void WhatIsAcmDriver()
        {
		   
			  /*
            foreach (DriverDetails dd in AudioCompressionManager.GetDriverList())
            {
			    Response.Write("# # #"); 
              
				Response.Write("Driver: {0}", dd.LongName); 
              
                foreach (FormatTagDetails ftd in AudioCompressionManager.GetFormatTagList(dd.Driver))
                {
				    Response.Write("FormatTag: {0}", ftd.FormatTagName); 
                   
                    foreach (FormatDetails fd in AudioCompressionManager.GetFormatList(ftd.FormatTag, dd.Driver))
                    {
					    Response.Write("Format: {0}", fd.FormatName); 
                       
                    }
                }
				
				
            }
			*/
			
        }
         protected void WhatIsCompressedAudioFormat()
        {
		     Response.Write("# # #"); 
            foreach (FormatDetails fd in AudioCompressionManager.GetFormatList(AudioCompressionManager.Gsm610FormatTag, true))
            {
			    
                WaveFormat wf = AudioCompressionManager.GetWaveFormat(fd.FormatHandle);
                string format = "Format: [{0}], FormatTag: {1}, Channels: {2}, SamplesPerSec: {3}, BitsPerSample: {4}, BlockAlign: {5}, AvgBytesPerSec: {6}";
                //Response.Write(format, fd, wf.wFormatTag, wf.nChannels, wf.nSamplesPerSec, wf.wBitsPerSample, wf.nBlockAlign, wf.nAvgBytesPerSec);
				Response.Write(wf.wBitsPerSample);
            }
        }  


	
	
    
}