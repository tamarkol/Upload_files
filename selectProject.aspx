<%@ Page Language="C#" MasterPageFile="~/innerMaster.master" AutoEventWireup="true" CodeFile="selectProject.aspx.cs" Inherits="selectProject"  %>
<%@ MasterType VirtualPath="~/innerMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    
    <%--   <script type="text/javascript">
    $(document).ready(function() {
    $("#divProject").toggle(function () {
    $("#divProjectDetails").show();
    } , function () {
    $("#divProjectDetails").hide();
    });
     });
    </script>--%>

<%--<script type="text/javascript">
$(document).ready(function() {
$("#divProject").click(function(){
      $("#divProjectDetails").toggle();
    });
 });
</script>--%>

    <script type="text/javascript">
        var display=0;
        function displayDiv(idProject)
        {
            var divName="divProjectDetails_"+idProject;
            if(display)
            {
                display=0;
                document.getElementById(divName).style.display="none";
                }
            else
            {
                display =1;
                document.getElementById(divName).style.display="inline";
                }


        }
        function openDialog(idProject) {
            "BaddProject"
            $('#frmStepty').attr('src', "step.aspx?id="+idProject);
            $("#frm").dialog("open");
            $("#frm").dialog('option', 'title', "<span style='margin-left: 220px;font-size: 20px;'><%=Resources.Resource.edit_voice_message%></span>");
       
        }

    </script>


 


          <div class="tableDashboard">   
<table width="100%">
    <tr align="center" class="table-top">
        <td> <span> <%=Resources.Resource.message_status_report%>  </span></td>
    </tr>
   
   <tr>
   <td>
   <div>
 <!--<asp:Panel CssClass="gradientBoxes"  runat="server" ID="panelShow" ScrollBars="Auto" Visible="true" Width="400px" Height="400px">-->
        

       <asp:GridView   Width="100%" ID="GridViewProjects" runat="server" 
               AllowPaging="true"  Font-Italic="False"  
        Font-Size="10pt"  AutoGenerateColumns="False"  CssClass="gridview"
         CellPadding="5" 
        GridLines="Horizontal" 
               onrowdatabound="GridViewProjects_RowDataBound" 
               EnableModelValidation="True" 
               onpageindexchanging="GridViewProjects_PageIndexChanging" 
               onselectedindexchanging="GridViewProjects_SelectedIndexChanging" 
           PageSize="20"   onrowcommand="GridViewProjects_RowCommand"  >
        

  <Columns>  
                                             
                                    <asp:BoundField ItemStyle-HorizontalAlign="Center"   ItemStyle-Width="30%">                
                                          <ItemStyle HorizontalAlign="Center" Width="30%"></ItemStyle>
                                     </asp:BoundField>
                                    <asp:BoundField  DataField ="projectDate"  ItemStyle-Width="25%">    
                                         <ItemStyle Width="25%"></ItemStyle>
                                     </asp:BoundField>
                                    <asp:BoundField  DataField ="projectName"
                                         ItemStyle-Width="25%">
                                         <ItemStyle Width="25%"></ItemStyle>
                                     </asp:BoundField>
                                    <asp:BoundField  DataField ="status"  ItemStyle-Width="20%">          
                                       <ItemStyle Width="20%"></ItemStyle>
                                    </asp:BoundField>
                                  
                                    


                                    <asp:BoundField  DataField ="idProject" ControlStyle-ForeColor="White" >
                                       <ControlStyle ForeColor="White" Width="5px"></ControlStyle>
                                       <ItemStyle ForeColor="Transparent"  Width="5px"  />
                                         
                                      
                                    </asp:BoundField>  
                                   
                                
                                
                                      <asp:ButtonField ButtonType="Image" ImageUrl="images/stop.png" >
                                      <ControlStyle Height="20px" Width="20px" />
                                         <ItemStyle Height="20px" Width="20px" />
                                     </asp:ButtonField> 
                             



  
                   
                  
            </Columns>
            <HeaderStyle CssClass="gridviewLine-header"/>
            <PagerStyle CssClass="pagging-gv"/>
                     <RowStyle CssClass="gridviewLine" />
                                                         <AlternatingRowStyle CssClass="gridviewLine-alternative"/>
			</asp:GridView>
            <br />
            <asp:DropDownList runat="server" ID="ddlPageSize" AutoPostBack="True" 
           onselectedindexchanged="ddlPageSize_SelectedIndexChanged"></asp:DropDownList>


    <asp:DataList width="100%" ID="DLprojectsSend" runat="server"  Visible="false" RepeatLayout="Table"
        EmptyDataText="לא קיימים פרויקטים" 
        BorderStyle="Groove" BorderColor="Green"  Font-Names="Arial" 
        Font-Size="14pt" 
        onselectedindexchanged="DLprojects_SelectedIndexChanged" CellSpacing="10" Height="20px">
	
        <HeaderTemplate>
                 </HeaderTemplate>
                 <ItemTemplate>
                 <table style="text-align:center ">                 
                    <tr>
                      <%--  <td><asp:Label ID="lbl22" runat="server" Text='<%#showReport(Eval("status"),Eval("idProject"))%>' /></td>--%>
                 
                       <td width="30%"><asp:LinkButton ID="HyperLink1" CssClass="bt small" runat="server" PostBackUrl='<%#urlEdit(Eval("status"),Eval("idProject")) %>' ><%#textButton(Eval("status"))%></asp:LinkButton></td> 
         
                        <%--  <td><asp:Label ID="Label3" runat="server" Text='<%# Eval("status") %>'></asp:Label></td>
                                                  --%>
                        <td width="30%" ><asp:Label ID="Label2" runat="server" Text='<%# Eval("projectDate", "{0:dd/MM/yyyy}")%>'></asp:Label> </td> 
                    
                         <td width="40%" ><asp:Label ID="Label5" runat="server" Text='<%# Eval("projectName") %>'></asp:Label></td>
						<td><%#showIcon(Eval("status"))%></td>
					</tr>
                    </table>
                 </ItemTemplate>
                 <FooterTemplate>
      </FooterTemplate>
    </asp:DataList>
	</div>
    </td></tr>

	</table>
    </div>  
	<!--
    </asp:Panel>
	
    <br />
    <table width="400px" style="text-align:center; font-family:Arial; font-size:17pt;">
    <tr>
        <td colspan="3"><label style="font-weight: bold">הודעות שלא נשלחו</label></td>
    </tr>
  <tr>
                    <td width="30%"></td>
                    <td width="30%"><label>תאריך</label></td>
                    <td width="40%"><label>שם הודעה</label></td>
                </tr>
                </table>
    <asp:Panel CssClass="gradientBoxes"  runat="server" ID="panel1" ScrollBars="Auto" Visible="true" Width="400px" Height="400px">
           
    <asp:DataList width="100%"  ID="DLprojectsNoSend" runat="server"  Visible="true" RepeatLayout="Table"
                                EmptyDataText="לא קיימים פרויקטים" 
        BorderStyle="Groove" BorderColor="Green"  Font-Names="Arial" 
        Font-Size="14pt" 
        onselectedindexchanged="DLprojects_SelectedIndexChanged" CellSpacing="10" Height="20px">
	<%--	  <ItemStyle BorderColor="White" BorderStyle="Solid" />
        <EditItemStyle BackColor="#CCCCCC" BorderColor="#CC0000" BorderStyle="Solid" />--%>
        <HeaderTemplate>
                 </HeaderTemplate>
                 <ItemTemplate>
                 <table style="text-align:center">                 
                    <tr>
                      <%--  <td><asp:Label ID="lbl22" runat="server" Text='<%#showReport(Eval("status"),Eval("idProject"))%>' /></td>--%>
                 
                     <%--  <td><asp:LinkButton ID="HyperLink1" runat="server" PostBackUrl='<%#urlEdit(Eval("idProject")) %>' >הצג פרטים</asp:LinkButton></td> --%>
   <td width="30%"><asp:LinkButton ID="LinkButton1" runat="server" CssClass="bt small" PostBackUrl='<%#urlEdit(Eval("status"),Eval("idProject")) %>'>עריכה </asp:LinkButton></td>
       
                         <%-- <td><asp:Label ID="Label3" runat="server" Text='<%# Eval("status") %>'></asp:Label></td>--%>
                                                  
                        <td width="30%" ><asp:Label ID="Label2" runat="server" Text='<%# Eval("projectDate", "{0:dd/MM/yyyy}")%>'></asp:Label> </td> 
                    
                         <td width="30%" ><asp:Label ID="Label5" runat="server" Text='<%# Eval("projectName") %>'></asp:Label></td>
                    </tr>
                    </table>
                 </ItemTemplate>
                 <FooterTemplate>
      </FooterTemplate>
    </asp:DataList>
     
</asp:Panel>
-->
    
  
    </asp:Content>
   