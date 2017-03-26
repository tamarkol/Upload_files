<%@ Page Language="C#" MasterPageFile="~/innerMaster.master" AutoEventWireup="true" CodeFile="updateDetailswithverify.aspx.cs" Inherits="myAccount" %>
<%@ MasterType VirtualPath="~/innerMaster.master" %>

       
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   
   <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  

 

<script type="text/javascript">
    $(document).ready(function () {
        //alert("here");
        $("#frmverifyPhone").css("padding", "0px");
        $("#frmverifyPhone").dialog(
            {
                autoOpen: false,
                //title: "<table style='padding:0; width:850px'><tr><td valign='middle' align='center'><span style='padding:10px;'>הודעה קולית חדשה</span></td></tr></table>",
                title: "<span style='font: bold 18px Arial;'><%=Resources.Resource.validation_number%> </span>",
                //title: "<table><tr><td><img src='images/Logo.JPG' style='width:80px'/></td><td valign='middle' align='center'><span style='padding:10px;'>הודעה קולית חדשה</span></td></tr></table>",
                modal: true,
                resizable: false,
                /*width: 900,
                height:650,*/
                width: 350,
                height: 250,
                close: function (event, ui) { $('#frmverifyPhone').attr('src', "wait.htm") }
            });
       // alert("verifyDialog.aspx?phone=<%= TB_Phone.Text %>");
        $('#frmverifyPhone').attr('src', 'verifyDialog.aspx');

		$("#BtnVerifyPhone").click(function () {
            //alert("btnverify");
            openDialog();
        });



        $("p").hover(function () {
            $(this).css({ 'background-color': 'yellow', 'font-weight': 'bolder' });
        }, function () {
            var cssObj = {
                'background-color': '#ddd',
                'font-weight': '',
                'color': 'rgb(0,40,244)'
            }
            $(this).css(cssObj);
        });
    });
//function BtnVrerifyPhone_onclick() {
//   alert("btn");
//}

      
function openDialog() {
    $('#frmverifyPhone').attr('src', "verifyDialog.aspx");
    $("#frmverifyPhone").dialog("open");
}
	

</script>





 

    



    
  <table cellpadding="5" cellspacing="0" style="font-size:13px">
        <tr>
              <td align="<%=Resources.Resource.align%>" >
                <asp:Label ID="Label1" runat="server"  ></asp:Label>
                </td>
            <td align="center" style="width: 241px" >
                <asp:TextBox ID="TB_Fname" runat="server" CssClass="tbRegister"></asp:TextBox>
                </td>
                <td align="right" >
              
                </td>
          
        </tr>
        <tr>
            <td align="<%=Resources.Resource.align%>">
                <asp:Label ID="Label2" runat="server"  ></asp:Label>
            </td>
            <td align="center" style="width: 241px">
                <asp:TextBox ID="TB_Lname" runat="server" CssClass="tbRegister"></asp:TextBox>
            </td>
              <td align="right" >
              
                </td>
           
        </tr>
          <tr>  
           <td align="<%=Resources.Resource.align%>">
                <asp:Label ID="Label3" runat="server" ></asp:Label>
                </td>
            <td class="style8" align="center" style="width: 241px">
                <asp:TextBox ID="TB_Phone" runat="server"  
                    ontextchanged="TB_Phone_TextChanged" CssClass="tbRegister"></asp:TextBox>
                </td>
                <td align="right" >
                    <asp:Panel ID="Panel1"  runat="server" style="margin-top:6px">
						<table><tr><Td>
                       <div class="verify_signal" ><asp:Image id="iconVerify" runat="server" ImageUrl="images/check.png"></asp:image></div>
                       </td><td><input type= "button"  id="BtnVerifyPhone"  class="yellow-button" value="<%=Resources.Resource.validate_number%>" style="width: 130px" > </input>
					   </td></tr></table>
                    </asp:Panel>
                    
                </td>
           
       </tr>
            <tr>
            <td align="<%=Resources.Resource.align%>" >
                <asp:Label ID="Label4" runat="server"  ></asp:Label>
                </td>
            <td align="center" style="width: 241px">
                <asp:TextBox ID="TB_Address" runat="server" CssClass="tbRegister"></asp:TextBox>
                </td>
                  <td align="right" >
                
                </td>
            
        </tr>
            <tr>
             <td align="<%=Resources.Resource.align%>" >
                <asp:Label ID="Label5" runat="server" ></asp:Label>
                </td>
            <td align="center" style="width: 241px" >
                <asp:TextBox ID="TB_Email"  runat="server" CssClass="tbRegister"></asp:TextBox>
                </td>
                  <td align="right" >
               
                </td>
           
        </tr>
          <tr><td colspan="2" align="<%=Resources.Resource.align_opposite%>">
           <asp:Button ID="B_update" CssClass="yellow-button" runat="server"  onclick="Button2_Click" />
              
              
              </td></tr>
        </table>
   
        <div id="iframe" style="overflow:hidden;"  >
              <iframe id="frmverifyPhone" src=""  height="300px" style="width:400px !important;height:200px !important"  ></iframe>
        </div> 
        
   
</asp:Content>

