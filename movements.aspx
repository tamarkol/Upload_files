<%@ Page Language="C#" MasterPageFile="~/innerMaster.master"   AutoEventWireup="true" CodeFile="movements.aspx.cs" Inherits="movements"  %>
   <%@ MasterType VirtualPath="~/innerMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
 
   

    <table width="670px">
<tr>
    <td align="center" style="font: bold 18px Arial;color: #818181;">
         <label><%=Resources.Resource.your_account_balance_%></label>
        <asp:Label ID="lCountMsg" runat="server" ></asp:Label>
   <label><%=Resources.Resource.messages%> </label>
    </td>
</tr>

<tr>
    <td>
        <div id="divMinus" style="overflow:auto;" class="tableDashboard" align="center" >
        <div class="table-top">
                <span style="line-height:50px"><%=Resources.Resource.message_usage%>  </span>
                </div>
                <div >
            <asp:GridView   Width="100%" ID="GVminus" runat="server" Font-Italic="False"  
         AutoGenerateColumns="False"  CssClass="gridview" CellPadding="4"  GridLines="Horizontal" AllowPaging="true"
         onpageindexchanging="GVminus_PageIndexChanging" PageSize="20" 
                        onrowdatabound="GVminus_RowDataBound1" >
            <Columns>                   
                                <asp:BoundField DataField="date"   ItemStyle-Width="40%" />
                    <asp:BoundField DataField="amount" ItemStyle-Width="30%" />
                    <asp:BoundField DataField="projectName"   ItemStyle-Width="30%" />
                                  
                    

                   
                  
            </Columns>
                        <HeaderStyle CssClass="gridviewLine-header"/>
            <PagerStyle CssClass="pagging-gv"/>
                     <RowStyle CssClass="gridviewLine" />
                                                         <AlternatingRowStyle CssClass="gridviewLine-alternative"/>
			</asp:GridView>
           </div>
           <asp:DropDownList id="ddl_pageSize_minus" runat="server" 
                onselectedindexchanged="ddl_pageSize_minus_SelectedIndexChanged" 
                AutoPostBack="True" ></asp:DropDownList>
        </div> 
     </td>
</tr>
<tr>
    <td align="center" class="style1">

  </td>
</tr>
<tr>
    <td>
        <div id="divPlus" style="overflow:auto" class="tableDashboard"  align="center" >
        <div class="table-top" ><span style="line-height:50px">
            <%=Resources.Resource.purchase_message_packages%>  
            </span></div>
            <div>
          <asp:GridView   Width="100%" ID="GVplus" runat="server" Font-Italic="False"  
       AutoGenerateColumns="False"  CssClass="gridview"
        CellPadding="4" GridLines="Horizontal"  AllowPaging="true"
        onpageindexchanging="GVplus_PageIndexChanging" 
                    PageSize="20" >
         
                <Columns>
                    <asp:BoundField DataField="date"   ItemStyle-Width="40%"/>
                    <asp:BoundField DataField="amount"  ItemStyle-Width="30%"/>
                    <asp:BoundField DataField="namePackage"  ItemStyle-Width="30%"/>
                </Columns>
                             <HeaderStyle CssClass="gridviewLine-header"/>
            <PagerStyle CssClass="pagging-gv"/>
                     <RowStyle CssClass="gridviewLine" />
                                                         <AlternatingRowStyle CssClass="gridviewLine-alternative"/>
            </asp:GridView>
            </div>
            <div align="left">
            <asp:DropDownList runat="server" ID="ddl_pageSize_plus" AutoPostBack="True" 
                    onselectedindexchanged="ddl_pageSize_plus_SelectedIndexChanged" ></asp:DropDownList>
        
		 
		  <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/package.aspx"   CssClass="yellow-button more" Width="125" ><%=Resources.Resource.credit_purchase%> </asp:HyperLink>
         </div>

        </div>
  </td>
</tr>


    </table>
</asp:Content>

