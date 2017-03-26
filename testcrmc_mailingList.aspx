<%@ Page Language="C#" MasterPageFile="~/crmc_innerMaster.master"   AutoEventWireup="true" CodeFile="testcrmc_mailingList.aspx.cs" Inherits="testcrmc_mailingList"  %>
   <%@ MasterType VirtualPath="~/crmc_innerMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
 
   <iframe src="crmc_mail.aspx" style="width: 1000px;height: 800px;margin-right: -316px;" scrolling="no" frameBorder="0"></iframe>

    <table width="670px">
<tr>
    <td align="center" style="font: bold 18px Arial;color: #818181;">
      
        <asp:Label ID="lCountMsg" runat="server" style="display:none" ></asp:Label>
   
    </td>
</tr>

<tr>
    <td>
       <%-- <div id="divMinus" style="overflow:auto;" class="tableDashboard" align="center" >
        <div class="table-top">
                <span style="line-height:50px"><%=Resources.Resource.message_usage%>  </span>
                </div>
                <div >
            
           </div>
           
        </div> --%>
     </td>
</tr>
<tr>
    <td align="center" class="style1">

  </td>
</tr>
<tr>
    <td>
        <%--<div id="divPlus" style="overflow:auto" class="tableDashboard"  align="center" >
        <%--<div class="table-top" ><span style="line-height:50px">
            <%=Resources.Resource.purchase_message_packages%>  
            </span></div>--%>
            <div>
          
            </div>
            <div align="left">
            
        
		 
		<%--  <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/package.aspx"   CssClass="yellow-button more" Width="125" ><%=Resources.Resource.credit_purchase%> </asp:HyperLink>--%>
         </div>

        </div>
  </td>
</tr>


    </table>
</asp:Content>

