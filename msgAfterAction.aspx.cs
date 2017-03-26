using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using VoiceMail;
public partial class msgAfterAction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        cProjectVoiceMail project1;
        project1 = (cProjectVoiceMail)Session["project"];

		if(project1!=null)
		{
			btnSeeMore.PostBackUrl += "?id=" + project1.IdProject;
			btnEditProject.PostBackUrl += "?id=" + project1.IdProject;
        }
		int saveOrSend=0;
        if(Request["saveOrSend"]!=null)
            saveOrSend=Convert.ToInt32(Request["saveOrSend"]);
        string form= "stepty.aspx";
        if (Request.UrlReferrer != null && Request.UrlReferrer.Segments != null)
		{
            //form= Request.UrlReferrer.Segments[2];
            //Response.Write(Request.UrlReferrer);
            //Response.Write(Request.UrlReferrer.ToString().IndexOf("gateway.pelecard.biz"));
		   if( Request.UrlReferrer.ToString().IndexOf("stepty.aspx")>0)
				form="stepty.aspx";
			if (Request.UrlReferrer.ToString().IndexOf("editProject.aspx") > 0)
				form = "editProject.aspx";
			if (Request.UrlReferrer.ToString()  .IndexOf("updateDetailswithverify.aspx") > 0)
				form = "updateDetailswithverify.aspx";
			if (Request.UrlReferrer.ToString().IndexOf("contact.aspx") > 0)
				form = "contact.aspx";
			if(Request.UrlReferrer.ToString().IndexOf("gateway.pelecard.biz")>5&&Request.UrlReferrer.ToString().IndexOf("gateway.pelecard.biz")<10)
				form="payment.aspx";
			}
		//pGetPayment.Visible=true;
        switch (form)       
        {
            case "stepty.aspx":
                if (saveOrSend == 2)
                {
                    this.Title = "אישור שמירת הודעה";
                    pSaveMsg.Visible = true;
                    Master.pageTitle = "אישור שמירת הודעה";
                }
				  else if (saveOrSend == 5)
                {
                    this.Title = "אין ביתרתך מספיק הודעות";
                    P_aker.Visible = true;
                    Master.pageTitle = "לא תצליח";
                }
                else if (saveOrSend == 9)
                {
                    this.Title = "שגיאה באחד הנתונים";
                    PErrorSend.Visible = true;
                    Master.pageTitle = "שגיאה באחד הנתונים";
                }
                else
                {
                    this.Title = "אישור שליחת הודעה";
                    pPostMsg.Visible = true;
                    Master.pageTitle = "אישור שליחת הודעה";
                }
                break;
            case "payment.aspx":
                this.Title= "אישור תשלום";
                Master.pageTitle = "אישור תשלום";
                pGetPayment.Visible=true;
                break;
            case "editProject.aspx":
                this.Title = "אישור שליחת הודעה";
                    Master.pageTitle = "אישור שליחת הודעה";
                    pPostMsg.Visible = true;
                
                break;
            case "updateDetailswithverify.aspx":
                this.Title = "אישור עדכון פרטים";
                Master.pageTitle = "אישור עדכון פרטים";
                  pUpdate.Visible = true;
                break;
        }
            
    }
}