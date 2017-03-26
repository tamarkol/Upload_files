<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register"  %>
<%@ MasterType VirtualPath="~/MasterPage2.master"%>

<script runat="server">

   
   
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/css.css" rel="stylesheet" type="text/css" />
        <link href="design.css" rel="stylesheet" type="text/css" />


<script type="text/javascript">
    var master = "ctl00_ContentPlaceHolder1_";
            $(document).ready(function () {
                if ($("#ctl00_ContentPlaceHolder1_TB_Email").val() == null)
                    master = "ContentPlaceHolder1_";
        $("#bt_openLogin").click(function () {
            $("#panel_login").toggle("slow");
        });
		//$('#ctl00_ContentPlaceHolder1_TB_Email').bind("blur", function () {
        $("#"+master+"TB_Email").bind("blur", function () {

            var value = $("#" + master + "TB_Email").val();
            //alert("FfgfD");
			// alert("before ajax");
            executeAJAX(value);
        });
    });
</script>
<script type="text/javascript">
    function clearText1(obj) {
        //if (obj.value == "סיסמה" || obj.value == "אימות סיסמה")
            obj.type = "password";
//        if (obj.value == "מייל:" || obj.value == "סיסמה:" || obj.value == "אימות סיסמה:" || obj.value == "הכנס מספר")
//            obj.value = "";
    }
    var allowed = false;
    function executeAJAX(value) {
         //alert("start ajax");
        $.ajax({
            type: "GET",
            url: "ServiceAjax.aspx",
            data: "myName=" + value,
            async: true,
            success: function (msg) {
                //alert ("gh")
                //$('#ctl00_ContentPlaceHolder1_L_UserName').append(msg);
                if (msg == "true") {
                    $("#DivErrorMail").hide();
                    allowed = true;
                }
                else {
                    $("#DivErrorMail").show();
                    if ($("#" + master + "TB_Email").val() == "")
                        $("#DivErrorMail").html("<%=Resources.Resource.enter_email%>");  
                    else
                        $("#DivErrorMail").html("<%=Resources.Resource.email_already_exists%>");
                    $("#" + master + "TB_Email").val(" ");
                    allowed = false;
                }
            }
        });
    }
    //    function validateReg() {
    //        try {
    //            if (document.getElementById("ctl00_ContentPlaceHolder1_TB_Password").value.length > 5)
    //                return true; //allowed;
    //            else {
    //                alert("סיסמה חייבת להכיל לפחות 6 תוים");
    //                return false;
    //            }
    //        }
    //        catch (e) {
    //            alert(e);
    //        }
    //    }

    function validateLogin() {
        var mail = $("#" + master + "TB_Email").val();
        var password = $("#" + master + "TB_Password").val();
        var passwordAgain = $("#" + master + "TB_PasswordConfirmation").val();
        if (mail == "<%=Resources.Resource.email%>" || mail == "") {
            $("#DivErrorMail").slideDown();
            $("#DivErrorMail").html("<%=Resources.Resource.enter_email%>");

            return false;

        }
        else
            if (validateEmail(mail) == false) {
                $("#DivErrorMail").slideDown();
                if ($("#" + master + "TB_Email").val() == "")
                    $("#DivErrorMail").html("<%=Resources.Resource.enter_email%>");
                else
                    $("#DivErrorMail").html("<%=Resources.Resource.email_is_not_in_order%>");
                return false;
            }
            else
                if (allowed == false) {
                    $("#DivErrorMail").slideDown();
                    if ($("#" + master + "TB_Email").val() == "")
                        $("#DivErrorMail").html("<%=Resources.Resource.enter_email%>");
                    else
                        $("#DivErrorMail").html("<%=Resources.Resource.email_already_exists%>");
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
            if (password.length < 6) {
                $("#divErrorPassword").slideDown();
                $("#divErrorPassword").html("<%=Resources.Resource.password_must_contain%>")
                return false;
            }
            else
                $("#divErrorPassword").hide();

            if (passwordAgain == "<%=Resources.Resource.validate_password%>" || passwordAgain == "") {
            $("#divErrorPasswordAgain").slideDown();
            $("#divErrorPasswordAgain").html("<%=Resources.Resource.enter_password_validation%>");
            return false;
        }
        else
            if (passwordAgain != password) {
                $("#divErrorPasswordAgain").slideDown();
                $("#divErrorPasswordAgain").html("<%=Resources.Resource.password_validation_unsuccessful%>");
                return false;
            }
            else
                $("#divErrorPasswordAgain").hide();
        return true;



    }
    function validateEmail(str) {


        var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
        return pattern.test(str);


//        var at = "@"
//        var dot = "."
//        var lat = str.indexOf(at)
//        var lstr = str.length
//        var ldot = str.indexOf(dot)
//        if (str.indexOf(at) == -1) {
//            // alert("Invalid E-mail ID")
//            return false
//        }

//        if (str.indexOf(at) == -1 || str.indexOf(at) == 0 || str.indexOf(at) == lstr) {
//            //alert("Invalid E-mail ID")
//            return false
//        }

//        if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) {
//            // alert("Invalid E-mail ID")
//            return false
//        }

//        if (str.indexOf(at, (lat + 1)) != -1) {
//            // alert("Invalid E-mail ID")
//            return false
//        }

//        if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
//            // alert("Invalid E-mail ID")
//            return false
//        }

//        if (str.indexOf(dot, (lat + 2)) == -1) {
//            // alert("Invalid E-mail ID")
//            return false
//        }

//        if (str.indexOf(" ") != -1) {
//            //   alert("Invalid E-mail ID")
//            return false
//        }

//        return true

    }
</script>
    <%--<script type="text/javascript">

$('#myButton7').click(function () {
var value = $('#example7').val();
$.get("http://localhost:2331/WebLogin/ServiceAjax.aspx","myName="value,function(msg){ $('#result7').append(msg)} );
});

</script>--%>

    <style type="text/css">
        
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
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
			<asp:Label ID="titlePage" class="title-masterinner" runat="server" > <%=Resources.Resource.register%></asp:Label>
            </td>
            </tr>
            </table></td>
			<td >&nbsp;</td>
		</tr>
	</table>
    <div style="background-image: url('images/design/bg-content.png'); height:500px";>
<div  class="widthInner">
<%--     <div align="center" style="height:50px;background-image:url('images/design/shadow_login.png')"></div>--%>
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
   <div class="divRegister">
        <table width="100%" border="0">
			<%--<tr><td align="center" style="padding-right:7px">
                <img src="images/design/account_text.png" />
            </td></tr>--%>
            
            <tr >        
                <td align="left">
                    <asp:Panel DefaultButton="B_Register" ID="panelLogin" runat="server">
                    <table   style="border:none" width="100%" cellspacing="5">
                    <tr>
                         <td class="divs-home-title" align ="center">
                           <%=Resources.Resource.register_and_receive_message%> 
                        </td>
                    </tr>
                      <tr>
                            <td align ="center">
			                 <asp:TextBox ID="TB_Email" CssClass="tbRegister"  runat="server" ></asp:TextBox>
                                 <div class="tberror" id="DivErrorMail" style ="display:none">
					                </div>
                             </td>
                        </tr>
      
        <tr>
			
            <td align ="center">
                <asp:TextBox ID="TB_Password" CssClass="tbRegister" runat="server"  ></asp:TextBox>
                 <div class="tberror" id="divErrorPassword"  style ="display:none">
                 <label id="Label1"></label>
				</div>
            </td>
        
        </tr>
      
        <tr>
		
            <td  align ="center">
                <asp:TextBox ID="TB_PasswordConfirmation"  CssClass="tbRegister" runat="server"  
                   ></asp:TextBox>
                   	 <div class="tberror"  style ="display:none" id="divErrorPasswordAgain">
                 <label id="Label2"></label>

				</div>
            </td>
           
            
        </tr>
      
     

     
     
        <tr>
            <td align="<%=Resources.Resource.align_opposite%>" colspan="2" > 
            <asp:Button ID="B_Register" CssClass="yellow-button" style="margin-left:5px;margin-top:7px" runat="server"   onclick="B_Register_Click" OnClientClick="return validateLogin()"
                    />
                    <%--OnClientClick="return validateReg()" --%>
</td>
        </tr>

    </table>
	 </asp:Panel>
                </td>
            </tr>
        </table>
        </div>
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
  <%--  <div style="background-color:White; height:1px"></div>
<div class="grayPart" style="height:30px;"></div>

   <div  style="background-image:url('images/design/dash.png');height:5px">			</div>
    <div class="content" style="height:120px"></div>--%>
</asp:Content>


