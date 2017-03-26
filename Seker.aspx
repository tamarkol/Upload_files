<%@ Page Language="C#" MasterPageFile="~/myAccountMenu.master" AutoEventWireup="true" CodeFile="Seker.aspx.cs" Inherits="Seker" Title="סקר דוח" %>

<%@ MasterType VirtualPath="~/innerMaster.master" %>
<asp:Content ID="Content33" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <!--jQuery References-->
<script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.17/jquery-ui.min.js" type="text/javascript"></script>
<!--Wijmo Widgets JavaScript-->
<script src="http://cdn.wijmo.com/jquery.wijmo-open.all.2.2.1.min.js" type="text/javascript"></script>
<script src="http://cdn.wijmo.com/jquery.wijmo-complete.all.2.2.1.min.js" type="text/javascript"></script>
<!--Theme
<link href="http://cdn.wijmo.com/themes/rocket/jquery-wijmo.css" rel="stylesheet" type="text/css" title="rocket-jqueryui" />
-->
<link href="css/expanderjq.css" rel="stylesheet" type="text/css" />
<!--Wijmo Widgets CSS-->
<%--<link href="http://cdn.wijmo.com/jquery.wijmo-complete.all.2.2.1.min.css" rel="stylesheet" type="text/css" />--%>
    <link href="css/StyleSheetJQ.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function printpage() 
        {
            window.print()
        }
        $(document).ready(function(){
        
        $(".ui-expander-header").css("height","50px");
        var HH=$(".ui-expander-header");
        //HH.removeClass("ui-state-default");
        //HH.addClass("gradientBoxes");
        
        });

//        function CreatePanel(row) {
//            alert("lll");
//            try {
//                var dynDiv = document.createElement("div");
//                dynDiv.id = "divDyna";
//                dynDiv.innerHTML = "Created using JavaScript";
//                dynDiv.style.height = "20px";
//                dynDiv.style.width = "300px";
//                dynDiv.style.backgroundColor = 'gray';
//                document.body.appendChild(dynDiv);
//            }
//            catch (e)
//            {alert(e);}
//        }
    
         </script>
         <script src="player/audio-player.js" type="text/javascript"></script>
          <script type="text/javascript">
               AudioPlayer.setup("player.swf", {
                   width: 330
               });  
           </script>

    <div>
        <table width="100%" align="right" dir="ltr">
            <tr>
                <td align="center" colspan="1.5" rowspan="1.5">   </td>
            </tr>
  
       
        <tr>
        <td align="center" valign="top" style="padding-top:10px"> 
        <asp:Panel ID="PanelSendAgain" runat="server" Visible="false">
            <div  class="gradientBoxes">
                    <div>ההודעה לא הגיעה אל כל הנמענים</div>
                    <div>באפשרותך לנסות לשלוח אל הנמענים שלא ענו שנית</div>
                    <span><asp:Button ID="Button7" runat="server" CssClass="bt" Text="נסה שנית" 
                            onclick="Button7_Click" /></span>
            </div>
        </asp:Panel>
                </td>
            <td align="right" class="style1" width="50%">
                    <asp:Label ID="LnameProject" runat="server" Text="Label"  Font-Bold="True" Font-Size="Larger"></asp:Label>
                    <asp:Label ID="Label7" runat="server" Text=":שם הודעה קולית"  
                        Font-Bold="True" Font-Size="Larger"></asp:Label>
                    <br />
          
                     <asp:Label ID="LdataProject" Font-Bold="True" Font-Size="Larger" runat="server" Text="Label" ></asp:Label>                 
                      <asp:Label ID="Label5"  Font-Bold="True" Font-Size="Larger" runat="server" Text=":תאריך יצירת הודעה קולית" 
                     ></asp:Label>
            <br />
            <br />
                <div >
                <label style="font-weight: bold; font-size: large" >תוכן ההודעה</label>
                <br />
                <asp:Label ID="lPlay" runat="server"></asp:Label>
                    <p id='audioplayer_N'></p>
           </div>
           <br />
                <asp:Label ID="lbl_table" runat="server" Text="Label"></asp:Label>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" 
                    CellPadding="15" onrowcommand="GridView2_RowCommand" 
                    onrowdatabound="GridView2_RowDataBound" 
                    onselectedindexchanged="GridView2_SelectedIndexChanged1">  
                    <Columns>
                        <asp:BoundField HeaderText="שעת שיחה"  />
                        <asp:BoundField HeaderText="תאריך" />
                        <asp:BoundField HeaderText="סטאטוס מענה" />
                        <asp:BoundField HeaderText="מספר"  DataField="phone"/>
                        <asp:BoundField HeaderText="שם" DataField="name"/>
                        <asp:BoundField HeaderText="ערך" DataField="Parameter"/>
                    </Columns>
                </asp:GridView>
             
                </td>
          
         </tr>
         <tr>
         <td >
         </td>
       <td></td>
         </tr>



         <tr>
         
         <td colspan="2" align="center" class="style1">
             <asp:Label ID="Label1" runat="server" Text="סהכ נמענים"></asp:Label>
             <asp:Label ID="LNumPhone" runat="server" Text="Label"></asp:Label>
             </td>
         
         </tr>
         <tr>
         <td colspan="2" align="center" class="style1">
             <asp:Label ID="numAnswer" runat="server" Text="נענו"></asp:Label>
             <asp:Label ID="LnumAnswer" runat="server" Text="Label"></asp:Label>
             </td>
         
         </tr>

            <tr>
         <td colspan="2" align="center" class="style1" rowspan="1">
         <asp:Label ID="Label2" runat="server" Text="לא נענו"></asp:Label>
             <asp:Label ID="LnumNoAnswer" runat="server" Text=""></asp:Label>
             </td>
         
         </tr>
        
        <tr>
        <td colspan="2">
            &nbsp;
            </td>
        </tr>
        
        <tr>
        <td colspan="2">
            <asp:Button ID="bt_export" runat="server" Text="יצוא לאקסל" 
                onclick="bt_export_Click" CssClass="bt" />
             <input type="button" value="הדפסה" onclick="printpage()" class="bt"/>      
         </td>  
        </tr>
               </table>
    </div>
    
</asp:Content>
<asp:Content ID="Content34" runat="server" contentplaceholderid="head">

    <style type="text/css">
        .style1
        {
            height: 23px;
        }
    </style>

</asp:Content>
