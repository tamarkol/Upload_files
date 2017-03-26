<%@ Page Title="הרשמתך נקלטה" Language="C#"  AutoEventWireup="true" CodeFile="NotActive.aspx.cs" Inherits="NotActive"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title></title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="design.css" rel="stylesheet" type="text/css" />
		
</head>
<body>
	<form id="form1" runat="server">


        <table align="center"  style="border:none;height:250px" width="80%">
      <tr>
			<td align="center">
				<h1><label style="color:#585858;font:bold 24px Arial">לצורך יצירת הודעה נא לחץ על הקישור שנשלח אליך לכתובת האימייל בו נרשמת כדי להפעיל את החשבון </label></h1>
				<h5><label style="color:#585858;font:bold 15px Arial">לחץ על הכפתור לשליחה נוספת לאימות כתובת המייל</label></h5>
			</td>
		</tr>
		<tr>
			<td align="center"><asp:Button ID="Button1" 
                        runat="server" Text="שלח קישור נוסף" class="yellow-button" align="left"
                        onclick="Button1_Click" /> </td>
		</tr>
		</table>
           
				       <asp:Label ID="lb_okregistersend" runat="server" Text="לצורך הפעלת החשבון נא לחץ על הקישור שנשלח אליך שוב לכתובת האימייל בו נרשמת" style="color:red;font:24px Arial;text-align:center;display:block;width: 550px;
padding-left: 85px"></asp:Label>
				
			
        </form>
        </body>
</html>

