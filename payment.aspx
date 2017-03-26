<%@ Page Language="C#" MasterPageFile="~/innerMaster.master" AutoEventWireup="true" CodeFile="payment.aspx.cs" Inherits="payment" Title="רכישת הודעות" %>
<%@ MasterType VirtualPath="~/innerMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

<script type="text/javascript" >
    var master = "ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder2_";
    function validatepay() {
            var TB_Fname = $("#" + master + "TB_Fname").val();
            var TB_Lname = $("#" + master + "TB_Lname").val();
            var TB_Address = $("#" + master + "TB_Address").val();
			var ret=true;
			if (TB_Fname == "") {
			    $("#DivErrorFname").slideDown();
			    $("#DivErrorFname").html("<%=Resources.Resource.please_enter_your_name%>");
			    ret = false;
			}
            else $("#DivErrorFname").slideUp();
		
        	if (TB_Lname == "")
                {
			    $("#DivErrorLname").slideDown();
			    $("#DivErrorLname").html("<%=Resources.Resource.please_enter_last_name%>");
			    ret = false;
			}
			else $("#DivErrorLname").slideUp();
           
            if (TB_Address == "")
            {
			    $("#DivErrorAddress").slideDown();
			    $("#DivErrorAddress").html("<%=Resources.Resource.please_enter_Address%>");
			    ret = false;
			}
			else $("#DivErrorAddress").slideUp();
				return ret;

    }


</script>

    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    

       

  <table>
   <tr>
    <td> 
  
       <table width="100%" align="center"  class="package-div" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="center" style="height:65px"">
                         <asp:Label id="lTypPackage" Font-Bold="true" CssClass="title-package" runat="server"></asp:Label>
                            
                        </td>
                    </tr>
                    <tr>
                        <td><div class="line-package"></div></td>
                    </tr>
                    <tr style="background-image:url('images/design/top-content.png');height:28px">
                        <td align="center">
                        <asp:Label id="lNimMsg" CssClass="numMsg" runat="server"></asp:Label>
                           <label  class="numMsg"><%=Resources.Resource.voice_messages%></label> 
                         </td>
                    </tr>
                     <tr>
                        <td><div class="line-package"></div></td>
                    </tr>
                    <tr style="height:150px">
                        <td align="center">
                        <asp:Label ID="lPrice" CssClass="textPrice" runat="server"></asp:Label>
                            <label class="textPrice" style="font-weight:normal;font-size:28px">₪</label>
                        </td>
                    </tr>
                    <tr><td><div class="shadow-box"></div></td></tr>
					<tr style="background-color:#ffffff;height:80px">
						<td align="center">

                         <asp:Button ID="Button1" runat="server" Text="לחץ לתשלום"  OnClientClick="return validatepay()"
                    onclick="btnPayByPeleCard_Click" class="buy-package" />
						</td>
					</tr>
                       <tr>
            <td colspan="2">
                <asp:Label ID="LabelMsgPelecard" runat="server" Text=""></asp:Label>
            </td>
        </tr>
   </table>

    </td>
    <td>
     <table>
     <tr><td> <span class="numMsg"  style="margin-right: 60px;color: red;"><%=Resources.Resource.please_fill_the_invoice_details%></span></td></tr>
     <tr><td></td></tr>
     <tr><td></td></tr>
     <tr><td>
     
        <table cellpadding="5" cellspacing="0" style="font-size:13px;margin-right: 60px" >
           <tr>
              <td align="right" >
                <asp:Label ID="Label2" runat="server" Text="שם פרטי" ></asp:Label>
              </td>
              <td align="center" style="width: 241px" >
                <asp:TextBox ID="TB_Fname" runat="server" CssClass="tbRegister"></asp:TextBox>
                <div class="tberror" id="DivErrorFname" style ="display:none;"></div>
              </td>

        </tr>

           <tr>
            <td align="right" >
                <asp:Label ID="Label5" runat="server" Text="כתובת" ></asp:Label>
                </td>
            <td align="center" style="width: 241px">
                <asp:TextBox ID="TB_Address" runat="server" CssClass="tbRegister"></asp:TextBox>
                <div class="tberror" id="DivErrorAddress" style ="display:none;"></div>
                </td>
           
        </tr>
           <tr>
                  <td align="right" >
               
                </td>
           
        </tr>

         </table>

      
     
     
     </td></tr>
     </table>

   
  


   </td>
   </tr>
   </table>

             
</asp:Content>

