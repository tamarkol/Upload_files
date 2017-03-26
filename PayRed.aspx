<%@ Page Language="C#" ValidateRequest="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
</head>
<body>
   <div style="width:100%"><center><img src="https://gateWay.pelecard.biz/Content/images/loading.gif" width="400" height="400" alt=""/></center></div>
 <div style="visibility:hidden" >
<form id="form4" name="form4" action="https://gateWay.pelecard.biz/PayProcess" method="post">
<%
    string userName="youcallme";
    string password = "";
    string termNo = "";
	
	/*
	userName="PeleTest";
    password = "Pelecard@Test";
    termNo = "0962210";
	*/
	
	/*userName="raditechsite";
    password = "c8x2}QqS";
    termNo = "5784641";
	*/
    userName = "redetech";
    password = "h&sWMZKA";
    termNo = "5780925";

    password=password.Replace("+", "`9`");
    password=password.Replace("&", "`8`");
    password=password.Replace("%", "`7`");

    string goodUrl = Server.UrlEncode(Request["goodUrl"]);
    string errorUrl = Server.UrlEncode(Request["errorUrl"]);
    string total = Request["total"];
    string currency = Request["currency"];
    string maxPayments = Request["maxPayments"];
    string minPaymentsNo = Request["minPaymentsNo"];
	string creditTypeFrom = Request["creditTypeFrom"];
    string Logo = Request["Logo"];
    string smallLogo = Request["smallLogo"];
    string hidePciDssLogo = Request["hidePciDssLogo"];
    string hidePelecardLogo = Request["hidePelecardLogo"];
    string theme = Request["theme"];
    string background = Request["background"];
    string backgroundImage = Request["backgroundImage"];
    string topMargin = Request["topMargin"];
    string supportedCardTypes = Request["supportedCardTypes"];
    string Parmx = Server.UrlEncode(Request["Parmx"]);
    string hideParmx = Request["hideParmx"];
    string Text1 = Server.UrlEncode(Request["Text1"]);
    string Text2 = Server.UrlEncode(Request["Text2"]);
    string Text3 = Server.UrlEncode(Request["Text3"]);
    string Text4 = Server.UrlEncode(Request["Text4"]);
    string Text5 = Server.UrlEncode(Request["Text5"]);
    string cancelUrl = Server.UrlEncode(Request["cancelUrl"]);
    string MustConfirm = Request["MustConfirm"];
    string ConfirmationText = Request["ConfirmationText"];
    string SupportPhone = Request["supportPhone"];
    string errorText = Request["errorText"];
    string id = Request["id"];
    string cvv2 = Request["cvv2"];
    string authNum = Request["authNum"];
    string shopNo=Request["shopNo"];
    string frmAction = Request["frmAction"];
    string TokenForTerminal = Request["TokenForTerminal"];
    string J5 = Request["J5"];
    string keepSSL = Request["keepSSL"];

    string sessionIdNumber = Request["sessionIdNumber"];
    string showTotalOnRight = Request["showTotalOnRight"];

	string postData = "userName=" + userName + "&password=" + password + "&termNo=" + termNo + "&pageName=ajaxPage" +
	"&goodUrl=" + goodUrl + "&errorUrl=" + errorUrl + "&total=" + total + "&currency=" + currency +
	"&maxPayments=" + maxPayments + "&minPaymentsNo=" + minPaymentsNo + "&creditTypeFrom=" + creditTypeFrom +
	"&Logo=" + Logo + "&smallLogo=" + smallLogo + "&hidePciDssLogo=" + hidePciDssLogo + "&hidePelecardLogo=" + hidePelecardLogo +
	"&theme=" + theme + "&background=" + background + "&backgroundImage=" + backgroundImage + "&topMargin=" + topMargin +
	"&supportedCardTypes=" + supportedCardTypes + "&Parmx=" + Parmx + "&hideParmx=" + hideParmx +
	"&Text1=" + Server.UrlEncode(Text1) + "&Text2=" + Server.UrlEncode(Text2) + "&Text3=" + Server.UrlEncode(Text3) + "&Text4=" + Server.UrlEncode(Text4) + "&Text5=" + Server.UrlEncode(Text5) +
	"&cancelUrl=" + cancelUrl + "&MustConfirm=" + MustConfirm + "&ConfirmationText=" + ConfirmationText + "&SupportPhone=" + SupportPhone + "&errorText=" + errorText +
	"&id=" + id + "&cvv2=" + cvv2 + "&authNum=" + authNum + "&shopNo=" + shopNo +
	"&frmAction=" + frmAction + "&TokenForTerminal=" + TokenForTerminal + "&J5=" + J5 + "&keepSSL=" + keepSSL +
	"&sessionIdNumber=" + sessionIdNumber + "&showTotalOnRight=" + showTotalOnRight + "";


    // Create a request using a URL that can receive a post. 
    System.Net.WebRequest request = System.Net.WebRequest.Create("https://gateway.pelecard.biz/PayProcess");
    // Set the Method property of the request to POST.
    request.Method = "POST";
    // Create POST data and convert it to a byte array.
    byte[] byteArray = Encoding.UTF8.GetBytes(postData);
    // Set the ContentType property of the WebRequest.
    request.ContentType = "application/x-www-form-urlencoded";
    // Set the ContentLength property of the WebRequest.
    request.ContentLength = byteArray.Length;
    // Get the request stream.
    System.IO.Stream dataStream = request.GetRequestStream();
    // Write the data to the request stream.
    dataStream.Write(byteArray, 0, byteArray.Length);
    // Close the Stream object.
    dataStream.Close();
    // Get the response.
    System.Net.WebResponse response = request.GetResponse();
    // Display the status.
    Response.Write(((System.Net.HttpWebResponse)response).StatusDescription);
    // Get the stream containing content returned by the server.
    dataStream = response.GetResponseStream();
    // Open the stream using a StreamReader for easy access.
    System.IO.StreamReader reader = new System.IO.StreamReader(dataStream);
    // Read the content.
    string responseFromServer = reader.ReadToEnd();
    // Display the content.
    Response.Write(responseFromServer);
    // Clean up the streams.
    reader.Close();
    dataStream.Close();
    response.Close();
        
 %>
 <input type="hidden" name="noCheck" value="true" id="noCheck" />
</form> 

<%
    Response.Write("<script type='text/javascript'>");
    Response.Write("function submitForm()");
    Response.Write("{");
    Response.Write("document.form4.submit();");
    Response.Write("}");
    Response.Write("submitForm();");
    Response.Write("</script>");
 %>
 </div>
</body>
</html>