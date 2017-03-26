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

public partial class fullExcelReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable tb = (DataTable)Session["tblReport"];

        string nameProject ="Spix";// Session["nameProjectForExcel"].ToString();
       
    //string attachment = "attachment; filename=Report - VoiceMessage.xls";
        string attachment = "attachment; filename=spix - "+nameProject +".xls";
    Response.ClearContent();
    Response.AddHeader("content-disposition", attachment);
    Response.ContentType = "application/vnd.ms-excel";
    Response.ContentEncoding = System.Text.Encoding.UTF8;
    //Response.BinaryWrite(System.Text.Encoding.UTF8.GetPreamble());

    HttpContext.Current.Response.ContentEncoding = Encoding.GetEncoding("windows-1255");
    HttpContext.Current.Response.Charset = "windows-1255";
    string style = @"<style> .textmode { mso-text-format:\@; } </style>";
   // Response.Write(style);

    string tab = "";
    foreach (DataColumn dc in tb.Columns)
    {
        string cName="";
        if (dc.ColumnName != "idPersonOfList" && dc.ColumnName !="record")
        {
            switch (dc.ColumnName)
            {
                case "name":
                    cName = Resources.Resource.name;
                    break;
                case "phone":
                    cName = Resources.Resource.telephone;
                    break;
                case "accept":
                    cName = Resources.Resource.approve;
                    break;
                case "status":
                    cName = Resources.Resource.answer;
                    break;
                case "play":
                    cName = Resources.Resource.listen;
                    break;
                case "callDuration":
                    cName = Resources.Resource.call_duration;
                    break;
            }
            Response.Write(tab + cName);
            tab = "\t";
        }
    }
    Response.Write("\n");
    int i;
    int seconds=0;
    foreach (DataRow dr in tb.Rows)
    {
        tab = "";
        for (i = 1; i < tb.Columns.Count; i++)
        {
            //e.Row.Cells[2].Attributes.Add("style", "vnd.ms-excel.numberformat:@");
            if (dr[i].ToString() == "0"&& i==3 )
                Response.Write(tab + Resources.Resource.not_sent);

            else if (dr[i].ToString() == "1" && i == 3)
                Response.Write(tab + Resources.Resource.answered);
            else if (dr[i].ToString() == "1" && i == 4)
                Response.Write(tab + Resources.Resource.heard_everything);
            else if (dr[i].ToString() == "0" && i == 4)
                Response.Write(tab + "=======");
                //Response.Write(tab + "לא שמע");
            else if (dr[i].ToString() == "0" && i == 5)
                Response.Write(tab + Resources.Resource.cancel_);
            else if (dr[i].ToString() == "1" && i == 5)
                Response.Write(tab + Resources.Resource.approve_);
            else if ((dr[i].ToString() == "9" || dr[i].ToString() == "2") && i==3)
                Response.Write(tab +  Resources.Resource.not_answered);
            else if (dr[i].ToString() == "3" && i == 3)
                Response.Write(tab + Resources.Resource.cancelled);
            else if (dr[i].ToString() == "4" && i == 3)
                Response.Write(tab + Resources.Resource.rejected);
            else if (dr[i].ToString() == "5" && i == 3)
                Response.Write(tab + Resources.Resource.busy);
            else if (dr[i].ToString() == "6")
                Response.Write(tab + Resources.Resource.wrong);
            else if (i == 7)
                    {
                        if (dr[i].ToString() != "&nbsp;" && dr[i].ToString() != ""&& dr[i].ToString() != null)
                       {
                        seconds = Convert.ToInt32(dr[i].ToString());
                        string minSec = string.Format("{0}:{1:00}", seconds / 60,
                                        (Math.Abs(seconds)) % 60);
                        Response.Write(tab + minSec + " " + Resources.Resource.seconds);
                       } 
                    else  Response.Write(tab+"========");
                    }
                	

            else if (dr[i].ToString() == "0" && i!=6)
                Response.Write(tab + Resources.Resource.no);
            else if (i != 6)
               Response.Write(tab + dr[i].ToString());
               tab = "\t";
        }
        Response.Write("\n");
    }
    Response.End();
        
    }
}

