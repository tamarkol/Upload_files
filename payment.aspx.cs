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
using System.Net.Mail;
using System.Net;

public partial class payment : System.Web.UI.Page
{
    cUserDetail user;
	cPackages package;
    public string BG = "";//Package-Blue-Folder-icon.png";
    public string last_card="";
    public string price_woop = "";
   // public string lastCard = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Label2.Text = Resources.Resource.first_name;
        //Label3.Text = Resources.Resource.last_name;
        Label5.Text = Resources.Resource.adress_;
        Button1.Text = Resources.Resource.purchase_now;
		afterPayment();
        //if (Session["UserObj"] == null)
        //{           
			
        //        Response.Redirect("login.aspx");
        //}
        Master.loadUser();
           
        
        int idPackage;
        if (!IsPostBack)
        {
            user = (cUserDetail)Session["UserObj"];
			user.Login();
            //TB_Lname.Text = user.lname;
            TB_Fname.Text = user.Fname;
            TB_Address.Text = user.address;

            if(Request ["id"]!=null)
            {
                idPackage = Convert.ToInt32(Request["id"]);
                 package = new cPackages(idPackage);
                package.load();
                Session["package"] = package;
                lPrice.Text = package.Price.ToString();
                lNimMsg.Text = package.Amount.ToString();
                lTypPackage.Text = package.NamePackage;
                //imgPackage.ImageUrl=imgUrlPackage(package.Id);//"images/packages/Package-Blue-Folder-iconsmall.png";
                Master.iconHeader = "tdCredit";
                Master.pageTitle = Resources.Resource.payment;
            }
			else if(Session["package"] !=null)
			{
				 package =(cPackages)Session["package"];
				lPrice.Text = package.Price.ToString();
                lNimMsg.Text = package.Amount.ToString();
                lTypPackage.Text = package.NamePackage;				
				//imgPackage.ImageUrl=imgUrlPackage(package.Id);//"images/packages/Package-Blue-Folder-iconsmall.png";
                //BG = "Package-Blue-Folder-iconOP.png";
			}
            //if(retPelecard)
            //    imgPackage.ImageUrl="images/packages/coins-icon.png";
        }

    }
	private string imgUrlPackage(int idPackage)
	{
		switch(idPackage)
		{
			case 1:
				return "images/packages/Package-Black-Folder-iconsmall.png";
			case 2:
				return "images/packages/Package-Metal-Folder-iconsmall.png";
			case 3:
				return "images/packages/Package-Folder-iconsmall.png";
			case 4:
				return "images/packages/Package-Blue-Folder-iconsmall.png";
			default:
				return "";
		}
	}
    //protected void BokPayment_Click(object sender, EventArgs e)
    //{
    //    if (Session["UserObj"] != null)
    //    {
    //        cUserDetail user = (cUserDetail)Session["UserObj"];
            
    //        cPackages pack=(cPackages)Session["package"] ;
    //        string numcard = tbNumCard.Text;
    //        string lastDigits = tbLastDigits.Text;
    //        string tz=tbTz.Text;
    //        //cPayment payment = new cPayment(user.IdUser, DateTime.Now, lastDigits);
    //        ////if ok:
    //        //cInvoice invoice = new cInvoice(DateTime.Now, pack.Price, 1, user.IdUser,false, false,true ,0);
            
    //        //int idBill=invoice.add();
    //        //string  okNimber="123456";
    //        //payment.OkNumber = okNimber;
    //        //payment.IdBill = idBill;
    //        //payment.add();
    //        //cMovement movement = new cMovement(user.IdUser, pack.Amount, DateTime.Now, pack.Id, true);
    //        //movement.add();

    //    }
    //    else
    //    {
    //        Response.Redirect("login.aspx");
    //    }
    //}
    protected void btnPayByPeleCard_Click(object sender, EventArgs e)
    {
        cUserDetail User = (cUserDetail)Session["UserObj"];
        dbLayer db = new dbLayer();
        db.UpdateUser_bill(User.IdUser, TB_Fname.Text, TB_Address.Text);
        prePayment();
    }
    private void prePayment()
    {
          //<div  class="package-div"    align="center"   
               
          //      onclick="window.location='payment.aspx?id=<%# Eval("id") %>'">
          //      <table width="100%" align="center">
          //          <tr>
          //              <td align="center" style="height:65px"">
          //                  <asp:Label Font-Bold="true" CssClass="title-package" ID="lNamePackage" runat="server" Text='<%# Eval("namePackage") %>'></asp:Label>
          //              </td>
          //          </tr>
          //          <tr>
          //              <td><div class="line-package"></div></td>
          //          </tr>
          //          <tr>
          //              <td align="center">
          //                 <asp:Label ID="lAmount" CssClass="numMsg"  runat="server" Text='<%# Eval("amount") %>'></asp:Label>
          //                 <label  class="numMsg">הודעות קוליות</label> 
          //               </td>
          //          </tr>
          //           <tr>
          //              <td><div class="line-package"></div></td>
          //          </tr>
          //          <tr>
          //              <td align="center">
          //                  <asp:Label ID="lPrice" CssClass="textPrice" runat="server" Text='<%# Eval("price") %>'></asp:Label>
          //                  <label class="textPrice" style="font-weight:normal;font-size:28px">שח</label>
          //              </td>
          //          </tr>
                   
          //      </table>
          //       </div>




        cPackages pack = (cPackages)Session["package"];

        user = (cUserDetail)Session["UserObj"];
        string goodUrl = @"http://spix.co.il/payment.aspx?id=" + pack.Id;

        //string goodUrl = @"http://localhost:4661/spix_site/payment.aspx?id=" + pack.Id; // localhost
        //goodUrl =  @"https://online.pelecard.biz/good.asp ";
        string errorUrl = goodUrl;//@"https://online.pelecard.biz/error.asp ";
        
        //string Logo = @"http://mailvoice.koli.co.il/images/Logosmall.JPG";
        string Logo = @"http://spix.co.il/images/design/logo-pelecard.png";
        string a = System.Drawing.Color.FromName("#f2f2f2").ToString();
        string smallLogo = @"https://gateway.pelecard.biz/Content/images/Pelecard.png";
        string Parmx = String.Format("{0:000000} {1:000}{2}",user.IdUser,pack.Id, user.email);//idCustomer.ToString();
        string text1 = "סוג חבילה: "+pack.NamePackage.ToString();
        string text2 ="כמות הודעות: "+pack.Amount.ToString();
       // string text3 = "<b style='color:Red'>שים לב שהנך רואה את פרטי הלקוח והתשלום </br><u> וקוד לקוח מוצג- בפרטים נוספים</u></b>";
       string text3 = "";//<div style= 'height:340px; width:258px;background-color:gray' > <table width='100%' align='center'><tr> <td align='cente' style='height:65px'><span style='font-size:28px;font-weight:bold;' >" + pack.NamePackage.ToString() + "</span></td></tr><tr><td style='font-size:16px;'><span>" + pack.Amount + "</span><span>הודעות קוליות</span></td></tr><tr><td><span style='font-size:112px;color:#cbcbcb;font-weight: bold;'>" + pack.Price + "</span><span style='font-size:28px;color:#cbcbcb;'>שח</span></td></tr></table></div>";
       // string text3 = "<div style= 'height:340px; width:258px;' > <table width='100%' align='center'><tr> <td align='cente' style='height:65px'><span style='font-size:28px;color:#a6a6a6;font-weight:bold;'>" + pack.NamePackage.ToString() + "</span></td></tr><tr><td style='font-size:16px;color:#656565;'><span>" + pack.Amount + "</span><span>הודעות קוליות</span></td></tr><tr><td><span style='font-size:112px;color:#cbcbcb;font-weight: bold;'>" + pack.Price + "</span><span style='font-size:28px;color:#cbcbcb;'>שח</span></td></tr></table></div>";
       
        //double total_int = Double.Parse("10") * 100;
        double total_int = Double.Parse(pack.Price.ToString()) * 100;

        price_woop = pack.Price.ToString();
        
        string total = String.Format("{0:0}", total_int);

        string currency = "1";
        string supportedCardTypes = "True,True,True,True,True ";

        //cMoneyBoxCredit Mbox = new cMoneyBoxCredit(0, idCustomer, double.Parse(txtAmountTotal.Text), 0, "0", 1, DateTime.Now);
       // cInvoiceDetailsCollection details = getDetailsInvoice();
        //Cache["mbox" + user.IdUser] = Mbox;
        //Cache["details" + user.IdUser] = details;
        // Response.Redirect("createDoc.aspx?result=0000000000000000000987600000000000000000000000000000000000000065465435478740000000000000000000000000000000000000&parmx=" + idCustomer);
        Response.Redirect("PayRed.aspx?goodUrl=" + goodUrl + "&errorUrl=" + errorUrl + "&Logo=" + Logo + "&smallLogo=" + smallLogo + "&Parmx=" + Parmx + "&text1=" + text1 + "&text2=" + text2 + "&text3=" + text3 + "&total=" + total + "&currency=" + currency + "&supportedCardTypes=" + supportedCardTypes);
    }
    public string PaymentProblem(string result)
    {
        switch (result)
        {
            case "004":
                return "סירוב";
            case "033":
                return "כרטיס לא תקין";
            case "036":
                return "פג תוקף";
            case "039":
                return "ספרת בקורת לא תקינה";
            case "308":
                return "עסקה כפולה";
        }
        return "תקלה";
      
    }
      public string Solek(string num)
    {
        switch (num)
        {
            case "1":
                return "ישראכרט";
            case "2":
                return "ויזה";
            case "3":
                return "דיינרס";
            case "4":
                return "אמקס";
            case "6":
                return "לאומי קארד";
        }
        return "לא ידוע";
      
    }

	private bool retPelecard=false;
    private void afterPayment()
    {
	     //Response.Write("aaaa");
		// Response.Write(Request.Form ["result"] );
		 
	    //esponse.Write(Request.Form["result"].Substring(0, 3) );
        //Response.Write(Request.UrlReferrer.ToString());
       // if (true||Request.UrlReferrer!=null &&Request.UrlReferrer.ToString().IndexOf("http://gateway.pelecard.biz/EndOfProcess/index")!=-1)
       // {
        string solek = "";
        string tokef = "";
            if (Request.Form ["result"] != null)
            {
               /* if (Request.UrlReferrer.ToString().IndexOf("gateway.pelecard.biz") == -1)
                {
                    Response.Redirect("login.aspx");
                }*/

                int idCustomer;
                if (Session["UserObj"] == null)
                {
                    idCustomer = int.Parse(Request["parmx"].Substring(0, 6));
                    user = new cUserDetail(idCustomer);
                    user.Login();
                    Session["UserObj"] = user;
                }
                else
                    user = (cUserDetail)Session["UserObj"];

                if (Request.Form["result"].Substring(0, 3) == "000")
                {
                  solek = Request["result"].Substring(59, 1);
                  tokef = Request.Form["result"].Substring(29, 4);
                }
				  try
                {
                    sendMailLid(Request.Form["result"].Substring(0, 3),user,Request["result"].Substring(19, 4),solek,tokef);
                }
                catch (Exception e)
                {
                    SendMail("error spix sendMailLid",e.ToString(),"tamar@red-e.co.il");
                    
                }

				
                //sendMailLid(Request.Form["result"].Substring(0, 3),user,Request["result"].Substring(19, 4),solek,tokef);
                retPelecard = true;
                idCustomer = int.Parse(Request["parmx"].Substring(0, 6));
                string lastCard = Request["result"].Substring(19, 4);
                last_card = lastCard;
                cPayment payment = new cPayment(user.IdUser, DateTime.Now, lastCard, Request.Form["result"].Substring(0, 3));
                // int idCustomer = Convert.ToInt32(Request["parmx"]);
                
				if (Request.Form["result"].Substring(0, 3) == "000")
                {
				   // Response.Write("new package");
                    package = (cPackages)Session["package"];
                    if (package == null)
                    {
                       // package = new cPackages(int.Parse(Request["parmx"].Substring(6, 3)));
					    package = new cPackages(int.Parse(Request["id"]));
                        package.load();
                    }
                    //string lastCard = Request["result"].Substring(19, 4);
                   
                    string OkNumber = Request["result"].Substring(71, 7);
                    /*  cMoneyBoxCredit Mbox = (cMoneyBoxCredit)Cache["mbox" + idCustomer];
                      //checkAndSetTax(Mbox.DatePay);
                      cInvoiceDetailsCollection details = (cInvoiceDetailsCollection)Cache["details" + idCustomer];
                      Mbox.Authorization = int.Parse(OkNumber);
                      Mbox.Card = lastCard;
                      clientCallme client = new clientCallme(idCustomer);
                      // saveAndCreateInvoice(DOCUMENT_TYPE.InvoiceReceipt, Mbox, client);
                      cInvoiceSimple newInvoice = new cInvoiceSimple(DOCUMENT_TYPE.InvoiceReceipt, Mbox.DatePay, Mbox.Amount / FullTAX, Mbox.Amount - (Mbox.Amount / FullTAX), idCustomer);
                      newInvoice.Payments = new cPayment(Mbox.Card, Mbox.Authorization, Mbox.DatePay);
                      newInvoice.Payments.PayCredit = new cMoneyBoxCredit(0, newInvoice.InvoiceNumber, newInvoice.Price, Mbox.Authorization, lastCard, 1, Mbox.DatePay);
                      newInvoice.PaymentsType = PAYMENTS_METHODS.credit;
                      invoiceData inDat = new invoiceData();
                      if (newInvoice.createInvoice())
                      {
                          CreateInvoicePdf(details, client, newInvoice, false);
                          CreateInvoicePdf(details, client, newInvoice, true);
                          txtInvoiceNumber.Text = newInvoice.InvoiceNumber.ToString();
                          enabledTextBoxes();
                          Response.Redirect("searchDocument.aspx?docid=" + newInvoice.IdClient + "/" + newInvoice.InvoiceNumber);
                      }
                     * */

                   // cPayment payment = new cPayment(user.IdUser, DateTime.Now, lastCard);
                    //if ok:
                    cInvoice invoice = new cInvoice(DateTime.Now, package.Price, 1, user.IdUser, false, false, true, 0);
                     
                    int idBill = invoice.add();
                    payment.OkNumber = OkNumber;
                    payment.IdBill = idBill;
                    int idPayment=payment.add();
                    cMovement movement = new cMovement(user.IdUser, package.Amount, DateTime.Now, package.Id, true,idPayment);
                    //Response.Write("yafi  "+user.IdUser +package.Amount +DateTime.Now +package.Id+"true"+idPayment);
					int a=movement.addmovementpayment();
					//Response.Write("yafi  "+a);
                    LabelMsgPelecard.Text = "התשלום התקבל";
                    LabelMsgPelecard.Text += " אישור " + OkNumber;
                    LabelMsgPelecard.Text += " כרטיס " + lastCard;
					payment.addDocument();
                    //Response.Redirect("msgAfterAction.aspx");
                    //Response.Write(Request.UrlReferrer);
                }
                else
                {
                    string error = PaymentProblem(Request["result"].Substring(0, 3));
                    LabelMsgPelecard.Text = "שגיאה בקבלת תשלום<br/>";
                    LabelMsgPelecard.Text += error;
					payment.addDocument();
                    //BG = "coins-icon.png";
                   // imgPackage.ImageUrl = "images/packages/coins-icon.png";
                }
				 
            }
       // }
    }
 private void sendMailLid(string error,cUserDetail user,string last_card,string solek,string tokef)
    {
	    cPackages pack = (cPackages)Session["package"];
	    if (pack == null)
        {
            //package = new cPackages(int.Parse(Request["id"].Substring(6, 3)));
            pack = new cPackages(int.Parse(Request["id"]));
            pack.load();
        }
      // user = (cUserDetail)Session["UserObj"];
   //     Response.Write(user.IdUser + " " + user.email);
        string subject = "";
        string msg = "<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.0 Transitional//EN'>" + Environment.NewLine;
        msg += "<html>" + Environment.NewLine;
        msg += "<head>" + Environment.NewLine;
        subject = "spix תשלום-red-e-tech";
        msg += " <title>spix תשלום</title>" + Environment.NewLine;
		//string style="height: 200px;color: #333;padding: 20px;background-color: #D7E9F5;-webkit-box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.4);-moz-box-shadow: 0px 1px 6px rgba(23, 69, 88, .5);-webkit-border-radius: 12px;-moz-border-radius: 7px;border-radius: 7px;background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, white), color-stop(15%, white), color-stop(100%, #D7E9F5));background: -moz-linear-gradient(top, white 0%, white 55%, #D5E4F3 130%);";
        msg += "</head>";
        msg += " <table align='right'  style='width:500px;' dir='rtl'>";
        msg += "<tr><td align='left'><br/></td></tr>";
        msg += "<tr>";
        msg += "<td style='font-family:Arial;font-size: 12px;font-weight: bold;'><br/>";
        //msg += "חשבונך נפתח בהצלחה";
        if (error == "000")
        {
            msg += "<p>משתמש " + user.IdUser + "אימייל " + user.email + "הרכישה בוצעה בהצלחה ";
            msg += "<p>פרטי החשבונית : " + user.Fname + " " + user.lname + " כתובת " + user.address;
            msg += "<p>כמות ההודעות שנרכשו " + pack.Amount + ", סוג החבילה" + pack.NamePackage + ",סך הכל ₪" + pack.Price + " כרטיס " + last_card;
            msg += "<p>חברה סולקת " + Solek(solek) + " , תוקף " + tokef;
        }
        else
        {
            msg += "<p>משתמש " + user.IdUser + " אימייל" + user.email + " שגיאה " + error + " " + PaymentProblem(error);
            msg += "<p>  כמות ההודעות שנסה לרכוש " + pack.Amount + ", סוג החבילה שנסה לרכוש " + pack.NamePackage + ",סך הכל ₪" + pack.Price;
        }
        // msg += "מאת -<b> " + name + " </b><br/>";
        //msg += "אימייל -<b> " + email + " </b><br/>";
      
        msg += "</td></tr></table>";
        msg += "</body>";
        msg += "</html>";
        SendMail(subject, msg, "shuki@red-e.co.il");
        //SendMail(subject, msg, "eitzikgr@gmail.com");
        SendMail(subject, msg, "tzvi@red-e.co.il");
        SendMail(subject, msg, "tamar@red-e.co.il");
        SendMail(subject, msg, "sales@red-e.co.il");
    }
	
	
	/*
	 public string PaymentProblemPayPal(string result)
    {
        switch (result)
        {
            case "Canceled":
                return " You canceled your payment, and the money was credited back to your account";
            case "Failed":
                return "Your payment didn't go through. We recommend that you try your payment again";
            case "Held":
                return "We're reviewing the transaction and your payment might be reversed. You should check the Resolution Center for more information.";
            case "Partially refunded":
                return "Your payment was partially refunded";
            case "Refunded":
                return "The recipient returned your payment. If you used a credit card to make your payment, the money will be returned to your credit card. It can take up to 30 days for the refund to appear on your statement";
            case "Refused":
                return  "The recipient didn't receive your payment. If you still want to make your payment, we recommend that you try again";
            case"Reversed":
                return "Either you canceled the transaction or we did";
        }
        return "תקלה";

    }
	
	 private void afterPaymentPayPal()
    {
        //Response.Write(Request.UrlReferrer.ToString());
        if (Request.UrlReferrer != null && Request.UrlReferrer.ToString().IndexOf("https://www.paypal.com") != -1)
        {
            if (Request.Form["result"] != null)
            {
                if (Request.UrlReferrer.ToString().IndexOf("https://www.paypal.com") == -1)
                {
                    Response.Redirect("login.aspx");
                }

                //int idCustomer;
                if (Session["UserObj"] == null)
                {
                    //idCustomer = int.Parse(Request["parmx"].Substring(0, 6));
                    //user = new cUserDetail(idCustomer);
                    //user.LoadNewUser();
                    //Session["UserObj"] = user;
                }
                else
                    user = (cUserDetail)Session["UserObj"];
                //retPelecard = true;
                //idCustomer = int.Parse(Request["parmx"].Substring(0, 6));

                // int idCustomer = Convert.ToInt32(Request["parmx"]);
                if (Request["st"] == "Completed")
                {
                    package = (cPackages)Session["package"];
                    if (package == null)
                    {
                        package = new cPackages(int.Parse(Request["item_number"]));
                        package.load();
                    }
                    //string lastCard = Request["result"].Substring(19, 4);
                    string OkNumber = Request["tx"].ToString();

                    cPayment payment = new cPayment(user.IdUser, DateTime.Now, "paypal");
                    //if ok:
                    cInvoice invoice = new cInvoice(DateTime.Now, package.Price, 1, user.IdUser, false, false, true, 0);

                    int idBill = invoice.add();
                    payment.OkNumber = Request["tx"].ToString();
                    payment.IdBill = idBill;
                    payment.add();
                    cMovement movement = new cMovement(user.IdUser, package.Amount, DateTime.Now, package.Id, true);
                    movement.add();
                    LabelMsgPelecard.Text = "התשלום התקבל";
                    LabelMsgPelecard.Text += " אישור " + OkNumber;
                    LabelMsgPelecard.Text += " PayPal כרטיס ";
                    Response.Redirect("msgAfterAction.aspx");
                    //Response.Write(Request.UrlReferrer);
                }
                else
                {
                    string error = PaymentProblemPayPal(Request["st"]);
                    LabelMsgPelecard.Text = "שגיאה בקבלת תשלום<br/>";
                    LabelMsgPelecard.Text += error;
                    //BG = "coins-icon.png";
                    // imgPackage.ImageUrl = "images/packages/coins-icon.png";
                }
            }
        }
		}
		*/
    private void  SendMail(string subject, string message,string mailstr)
    {
       
        try
        {
            MailAddress from = new MailAddress("info@spix.co.il", "Spix");
            MailAddress to = new MailAddress(mailstr, mailstr);
            MailMessage mail = new MailMessage(from, to);
            mail.BodyEncoding = System.Text.Encoding.GetEncoding("utf-8");
            mail.Subject = subject;
            string Body = message;
            mail.Body = message;
            mail.IsBodyHtml = true;
            NetworkCredential objNC = new NetworkCredential("sales@red-e.co.il", "sara0524");
            SmtpClient objsmtp = new SmtpClient("smtp.gmail.com");
            objsmtp.Port = 587;
            objsmtp.Credentials = objNC;
            objsmtp.EnableSsl = true;
            objsmtp.Send(mail);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }


    }
 
}
