<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login"  %>


    

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="css/css.css" rel="stylesheet" type="text/css" />
    
<script type="text/javascript">
    var master = "ctl00_ContentPlaceHolder1_";
    $(document).ready(function () {
        // $('input, textarea').placeholder();
        if ($("#ctl00_ContentPlaceHolder1_TB_Email").val() == null)
            master = "ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder2_";
        if ($("#ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder2_TB_Email").val() == null && $("#ctl00_ContentPlaceHolder1_TB_Email").val() == null)
            master = "ContentPlaceHolder1_";
        $('#myButton2').click(function () {
            var value = $('#example2').val();
            executeAJAX2(value);
        });
    }); 
    function clearText1(obj) {

        if (obj.value == "" || obj.value == "<%=Resources.Resource.pass%>" || obj.value == "<%=Resources.Resource.validate_pass%>")
           obj.type = "password";
//        if (obj.value == "מייל:" || obj.value == "סיסמה:" || obj.value == "אימות סיסמה:" || obj.value == "הכנס מספר")
//            obj.value = "";
    }
    function validateLogin() {
        //return true;
        var mail = document.getElementById(master+"TB_Email").value;
        var password = document.getElementById(master + "TB_Password").value;
        if (mail == "<%=Resources.Resource.email%>" || mail == "") {

            $("#DivErrorMail").slideDown();
            $("#DivErrorMail").html("<%=Resources.Resource.enter_email%>");

            return false;

        }
       

                else
                    $("#DivErrorMail").hide();


                if (password == "<%=Resources.Resource.password%>" || password == "") {
            $("#divErrorPassword").slideDown();
            $("#divErrorPassword").html("<%=Resources.Resource.enter_password%>")
            return false;
        }
            else
                $("#divErrorPassword").hide();
                return true;
       
        }
    
        




    function validateEmail(str) {

        var at = "@"
        var dot = "."
        var lat = str.indexOf(at)
        var lstr = str.length
        var ldot = str.indexOf(dot)
        if (str.indexOf(at) == -1) {
            // alert("Invalid E-mail ID")
            return false
        }

        if (str.indexOf(at) == -1 || str.indexOf(at) == 0 || str.indexOf(at) == lstr) {
            //alert("Invalid E-mail ID")
            return false
        }

        if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) {
            // alert("Invalid E-mail ID")
            return false
        }

        if (str.indexOf(at, (lat + 1)) != -1) {
            // alert("Invalid E-mail ID")
            return false
        }

        if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
            // alert("Invalid E-mail ID")
            return false
        }

        if (str.indexOf(dot, (lat + 2)) == -1) {
            // alert("Invalid E-mail ID")
            return false
        }

        if (str.indexOf(" ") != -1) {
            //   alert("Invalid E-mail ID")
            return false
        }

        return true

    }
</script>


    

    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"   >
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
			<asp:Label ID="titlePage" class="title-masterinner" runat="server" ><%=Resources.Resource.sign_in%></asp:Label>
            </td>
            </tr>
            </table></td>
			<td >&nbsp;</td>
		</tr>
	</table>
    <div style="background-image: url('images/design/bg-content.png'); height:500px";>
<div  class="widthInner">
   <%--  <div align="center" style="height:50px;background-image:url('images/design/shadow_login.png')"></div>--%>
     <div align="left">
                        <img src="images/design/spix-logo-account.png" />
                    </div>
<%--<asp:Panel DefaultButton="B_Login" ID="panelLogin" runat="server"  CssClass="tableDashboard" >--%>
<table align="center">
<%--<tr>
<td  align="center">
    <img src="images/design/megaphone-login.png" />
    </td>
</tr>--%>
<tr>
<td>
    
        <div class="divRegister" style="float:none;margin:30px 150px">
        
           <asp:Panel DefaultButton="B_login" ID="panelLogin" runat="server">
           <table width="100%" border="0" cellspacing="5">
		<%--	<tr>
            <td align="center" colspan="2">
               <img src="images/design/titlelogin.png" />
            </td>
            </tr>--%>
            
            <tr>
                <td align ="center" colspan="2">
			                 <asp:TextBox ID="TB_Email" CssClass="tbRegister"  runat="server" ></asp:TextBox>
                                 <div class="tberror" id="DivErrorMail" style ="display:none">
					                </div>
                             </td>
              </tr>
      
         <tr>
            <td align ="center" colspan="2">
                <asp:TextBox ID="TB_Password" CssClass="tbRegister"  autocomplete="off"  runat="server"  ></asp:TextBox>
                    <div class="tberror" id="divErrorPassword"  style ="display:none">
                    <label id="Label1"></label>
			    </div>
            </td>
    </tr>
   
                    <tr width="255px">
                                        <td align="right">
                                  <asp:HyperLink ID="HLforgotPass" runat="server" 
                                                        NavigateUrl="~/ForgotPassword.aspx" 
                                          Font-Names="Guttman Kav-Light" style="color:#696969;" Font-Size="13px"><%=Resources.Resource.forgot_password%></asp:HyperLink>
                            </td>
                             <td align="left">
                      
                     
                                        <asp:Label ID="bb" runat="server" 
                                    
                                        style="color:#696969;" Font-Size="13px" ></asp:Label>
                                <asp:HyperLink ID="HyperLink2" runat="server"  NavigateUrl="~/Register.aspx" style="color:#696969;" Font-Size="13px"
                                        ><%=Resources.Resource.register_now%></asp:HyperLink>
                           </td> 
                                      
                    </tr>
                    <tr width="255px">
                    <td align="center" colspan="2">
                                    <asp:Label id="lErrorActive" style="color:#696969;" Font-Size="13px" runat="server" ></asp:Label>
                    </td>
                    </tr>
                    <tr width="255px">
                    <td align="center" colspan="2">
                    <asp:Label runat="server" ID="L_errorLogin" style="color:#696969;font-weight:bold" Font-Size="16px"><%=Resources.Resource.name_or_password_incorrect%></asp:Label>
                    </td>
                    </tr>
                        <tr>
                            <td  align ="<%=Resources.Resource.align_opposite%>" colspan="2" > 
                            <asp:Button ID="B_login" CssClass="yellow-button"     runat="server"   onclick="B_Login_Click" OnClientClick="return validateLogin()"
                                    />
                                    <%--OnClientClick="return validateReg()" --%>
                </td>
                        </tr>

  
	
            </table>
            
             </asp:Panel>
        
  
        </div>
     
       
       
<%--    </asp:Panel>--%>
  </td>
 
       </tr>
      <%--  <tr>
        <td  align="center">
            <img src="images/design/spix-logo.jpg" />
            </td>
        </tr>--%>
        </table>
  </div>
  </div>
</asp:Content>

