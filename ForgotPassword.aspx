<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/MasterPage2.master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
     
    </style>
 <script type="text/javascript">

     function validateLogin() {
         //return true;
         var mail = document.getElementById("ctl00_ContentPlaceHolder1_TB_ForgotMail").value;

         if (mail == "<%=Resources.Resource.email%>" || mail == "") {

             $("#DivErrorMail").slideDown();
             $("#DivErrorMail").html("<%=Resources.Resource.enter_email%>");

             return false;

         }

         else
         {
          
             $("#DivErrorMail").hide();
             return true;
             }

     }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table dir="ltr" width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td style="background-color:#FEDE27;">&nbsp;</td>
			<td class="widthInner " height="100px" >
            <table height="100%" dir="ltr" width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
            <td style="background-color:#FEDE27;width:25px"> </td>
            <td  style="width:115px;" valign="top">
                <img src="images/design/megaphone-logo-account.png" style="margin-left:-24px" />
           </td>
           <td  style="background-image:url(images/design/shadow-page.png);width:810px">
          
                
			<%--<asp:Panel runat="server" id="iconTitle" >  </asp:Panel>--%>
			<asp:Label ID="titlePage" class="title-masterinner" runat="server" ><%=Resources.Resource.forgot_my_password%></asp:Label>
            </td>
            </tr>
            </table></td>
			<td >&nbsp;</td>
		</tr>
	</table>
    <div style="background-image: url('images/design/bg-content.png'); height:500px";>
<div  class="widthInner">
     <%--<div align="center" style="height:50px;background-image:url('images/design/shadow_login.png')"></div>--%>

<%--<asp:Panel DefaultButton="B_Login" ID="panelLogin" runat="server"  CssClass="tableDashboard" >--%>
<table align="center">
<%--<tr>
<td  align="center">
    <img src="images/design/megaphone-login.png" />
    </td>
</tr>--%>
<tr>
<td>    
<table style="padding:30px;">
<tr>
    <td align="center"><label style="font-size:14px;color:#696969"><%=Resources.Resource.please_enter_email_address%></label></td>
</tr>
<tr>
    <td>
    <table >
<%--	<tr>
		<td colspan="3" align="center">
            <asp:Label ID="Label1" runat="server" Text="הכנס מייל"></asp:Label>
        </td>
	</tr>--%>
    <tr>
        <td colspan="2"  align="center">
            <asp:TextBox ID="TB_ForgotMail" CssClass="tbRegister" runat="server" 
                ></asp:TextBox>
                 <div class="tberror" id="DivErrorMail" style ="display:none">
					                </div>
            </td>
        
        <td >
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ErrorMessage="*" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ControlToValidate="TB_ForgotMail"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td colspan="3"  align ="center" align="left">
            <asp:Button ID="B_SendMail" CssClass="yellow-button" runat="server" onclick="B_SendMail_Click"  OnClientClick="return validateLogin()"  />
            </td>
        
    </tr>
    
</table>
</td>
</tr>
   <tr>
        <td class="style4" align ="center" colspan="3">
            <asp:Label ID="L_msgMail" runat="server"  Visible="False"></asp:Label>
           </td>
        
    </tr>
</table>
 </td>
 
       </tr>
       <%-- <tr>
        <td  align="center">
            <img src="images/design/spix-logo.jpg" />
            </td>
        </tr>--%>
        </table>
  </div>
  </div>
</asp:Content>

