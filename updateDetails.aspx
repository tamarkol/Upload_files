<%@ Page Language="C#" MasterPageFile="~/innerMaster.master" AutoEventWireup="true" CodeFile="updateDetails.aspx.cs" Inherits="myAccount"  %>
<%@ MasterType VirtualPath="~/innerMaster.master" %>

       
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    

 

<script type="text/javascript">
    $(document).ready(function() {
  
       
     $("p").hover(function () { 
    $(this).css({'background-color' : 'yellow', 'font-weight' : 'bolder'}); 
  }, function () { 
    var cssObj = { 
      'background-color' : '#ddd', 
      'font-weight' : '', 
      'color' : 'rgb(0,40,244)' 
    } 
    $(this).css(cssObj); 
  });

function BaddProject_onclick() {

}

</script>





 

    



    
  <table cellpadding="5" cellspacing="0" style="font-size:13px">
        <tr>
              <td align="right" >
                <asp:Label ID="Label1" runat="server" Text="שם פרטי" ></asp:Label>
                </td>
            <td align="center" >
                <asp:TextBox ID="TB_Fname" runat="server" CssClass="tbRegister"></asp:TextBox>
                </td>
          
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label2" runat="server" Text="שם משפחה" ></asp:Label>
            </td>
            <td align="center">
                <asp:TextBox ID="TB_Lname" runat="server" CssClass="tbRegister"></asp:TextBox>
            </td>
           
        </tr>
          <tr>  
           <td align="right">
                <asp:Label ID="Label3" runat="server" Text="טלפון"></asp:Label>
                </td>
            <td class="style8" align="center">
                <asp:TextBox ID="TB_Phone" runat="server"  
                    ontextchanged="TB_Phone_TextChanged" CssClass="tbRegister"></asp:TextBox>
                </td>
           
       </tr>
            <tr>
            <td align="right" >
                <asp:Label ID="Label4" runat="server" Text="כתובת" ></asp:Label>
                </td>
            <td align="center">
                <asp:TextBox ID="TB_Address" runat="server" CssClass="tbRegister"></asp:TextBox>
                </td>
            
        </tr>
            <tr>
             <td align="right" >
                <asp:Label ID="Label5" runat="server" Text="מייל"></asp:Label>
                </td>
            <td align="center" >
                <asp:TextBox ID="TB_Email"  runat="server" CssClass="tbRegister"></asp:TextBox>
                </td>
           
        </tr>
          <tr><td colspan="2" align="left"> <asp:Button ID="B_update" CssClass="yellow-button" runat="server" Text="עדכן" onclick="Button2_Click" /></td></tr>
        </table>
   
   

   
</asp:Content>

