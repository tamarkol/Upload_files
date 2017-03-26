<%@ Page Title="Spix - About" Language="C#" MasterPageFile="~/MasterHeader.master" AutoEventWireup="true"  EnableEventValidation = "false"   CodeFile="track.aspx.cs" Inherits="about" %>
<%@ MasterType VirtualPath="~/MasterHeader.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#bt_openLogin").click(function () {
                $("#panel_login").toggle("slow");
            });
            $('#ctl00_ContentPlaceHolder1_TB_Email').bind("blur", function () {

                var value = $('#ctl00_ContentPlaceHolder1_TB_Email').val();
                //alert("FfgfD");
                executeAJAX(value);
            });
            $("#registerDiv").dialog({ opacity: 1, autoOpen: false, sticky: true, resizable: false, closeOnEscape: true, modal: true, width: "420px", heigth: "290px" });
            //        $(".about-icon").click(function () {
            //            $("#registerDiv").dialog("open");

            //            return false;
            //        });
            $(".about-icon").click(function () {
                window.location = 'Register.aspx';
            });
        });
    
</script>

<script type="text/javascript">
$(document).ready(function() {$("#registerDiv").animate({  width: "70%",  opacity: 0.4,  }, 1500 );}); 
    function clearText1(obj) {
        if (obj.value == "סיסמה" || obj.value == "אימות סיסמה")
            obj.type = "password";
        if (obj.value == "מייל:" || obj.value == "סיסמה:" || obj.value == "אימות סיסמה:" || obj.value == "הכנס מספר")
            obj.value = "";
    }
    var allowed = false;
    function executeAJAX(value) {

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
                    $("#DivErrorMail").html("מייל קיים");
                    allowed = false;
                }
            }
        });
    }
  
    
</script>

<div>

<asp:GridView    ID="GridView1" runat="server"  Font-Italic="False"   
                  AutoGenerateColumns="False"  CssClass="gridview"
                  CellPadding="4" 
                GridLines="Horizontal" PageSize="50"
                EmptyDataText="אין נמענים לפרויקט זה" 
                                     AllowPaging="True" 
        EnableSortingAndPagingCallbacks="True"  >
	
                                <Columns>                <%--   tamar--%>
                                        <asp:BoundField  DataField ="IdUseras" HeaderText="משתמש" ItemStyle-Width="15%"> </asp:BoundField>
                                        <asp:BoundField  DataField ="Email" HeaderText="אימיל" ItemStyle-Width="20%"> </asp:BoundField>
                                        <asp:BoundField  DataField ="Active" HeaderText="פעיל" ItemStyle-Width="10%">  </asp:BoundField>
                                        <asp:BoundField  DataField ="balance" HeaderText="יתרה" ItemStyle-Width="10%">  </asp:BoundField>
                                        <asp:BoundField  DataField ="date" HeaderText="תאריך" ItemStyle-Width="15%">  </asp:BoundField>
                                        <asp:BoundField  DataField ="LastVisit" HeaderText="ביקור אחרון" ItemStyle-Width="15%">  </asp:BoundField>
                                        <asp:BoundField  DataField ="LastPackage" HeaderText="חבילה אחרונה" ItemStyle-Width="35%">  </asp:BoundField>
                               </Columns>
                            <HeaderStyle CssClass="gridviewLine-header"/>
                             <PagerStyle CssClass="pagging-gv"/>
                             <RowStyle CssClass="gridviewLine" />
                              <AlternatingRowStyle CssClass="gridviewLine-alternative"/>
        </asp:GridView>
		
	 <asp:Button ID="Btn_excel" runat="server" onclick="bt_export_Click" 
        Text="יצוא לאקסל" Width="119px" Height="47px" style="margin-right: 0px" />
		
		
		
</div>

</asp:Content>