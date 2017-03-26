﻿using System;
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

public partial class mailingListForProject : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int idProject=Convert.ToInt32( Request.QueryString["id"]);

        statusVoiceMailsSend sml= new statusVoiceMailsSend (idProject );
        GVmailingList.DataSource = sml.MailinglistDetailsForProject();
        GVmailingList.DataBind();
    }
}
