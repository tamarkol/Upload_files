<%@ Page Language="C#" MasterPageFile="~/innerMaster.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Seker"  %>
<%@ MasterType VirtualPath="~/innerMaster.master" %>

<asp:Content ID="Content33" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
  
    <script src="js/audio-player.js" type="text/javascript"></script>
       <script src="player/audio-player.js" type="text/javascript"></script>

  <script src="js/jquery-1.9.1.js"></script>
  <script src="js/jquery-ui.js"></script>
		  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.timeentry.js"></script>
  <link rel="stylesheet" type="text/css" href="css/jquery.timeentry.css"/>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="js/jquery-ui.css" rel="stylesheet" type="text/css" />
		<!-- Optionaly -->
  <style type="text/css">
  #ui-datepicker-div { font-size: 12px; }
   .btnNoTxt
   {
  
             background-image:url('<%=image %>');
              -pie-background:url('<%=image %>');
              }
               .btnNoTxt:hover
   {
              background-image:url('<%=image_hover %>');
   }
  </style>
   	
    <script type="text/javascript">
        var numTemp = 1;

        function stop(obj) {
            $('#divring').html("");
            $(obj).removeClass('stopmsg').addClass('playmsg');
        }
        function ifFileExist(temp) {
            //var nameFile=document.getElementById("HidNameFile");
            numTemp++;
            //alert(temp);
            $.ajax({ type: "GET",
                url: "streamFile.aspx?check=1&nameFile=" + temp + "&numTemp=" + numTemp,
                crossDomain: true,
                success: function (result) {
                    //alert("temp:" + temp);
                    if (result == "true" || result == "True") {
                        //filename = result;
                        // alert("Record file OK");
                        //alert("ok ");
                        // clearInterval(startInterval);
                        playMessage(temp);
                    }
                }, error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError);
                }
            });

        }
        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
            var regexS = "[\\?&]" + name + "=([^&#]*)";
            var regex = new RegExp(regexS);
            var results = regex.exec(window.location.href);
            if (results == null)
                return "";
            else
                return decodeURIComponent(results[1].replace(/\+/g, " "));
        }
        function callupd() {

            var projid = getParameterByName("id");


            $.ajax({ type: "GET",
                url: "streamFile.aspx?online=1&idProject=" + projid,
                crossDomain: true,
                success: function (result) {

                    var str = result;
                    var n = str.split(":");
                    $('#ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder2_LnumAnswer').html(n[0]);
                    $('#ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder2_LnumPlay').html(n[1]);
                    if (n[2] == "true") {
                        setTimeout('callupd()', 1000);

                    }
                }, error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError);
                }
            });

        }
        var nameMaster = "ContentPlaceHolder1_ContentPlaceHolder2_";
        $(document).ready(function () {

            var date_send_terem = '<%= date_send %>';
            var fromhour_terem = '<%= fromhour %>';
            var tohour_terem = '<%= tohour %>';
            var date_send_bind = '<%= date_send_bind %>';

            if ($("#" + nameMaster + "hid_projectId").val() == null)
                nameMaster = "ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder2_";
            if ($("#" + nameMaster + "hid_isrun").val() == "True") {
                $('#BtnsendAgain').hide();
                $('#span_sendagain').hide();
            }

            $("#datepicker").datepicker({ dateFormat: 'dd/mm/yy' }).datepicker("setDate", new Date());
            $("#timepickerfrom").timeEntry({ show24Hours: true });
            $("#timepickerfrom").val("08:00");
            $("#timepickerto").timeEntry({ show24Hours: true });
            $("#timepickerto").val("09:00");
            //Terem
            $("#datepicker_terem").datepicker({ dateFormat: 'dd/mm/yy' }).datepicker("setDate", date_send_bind);
            $("#timepickerfrom_terem").timeEntry({ show24Hours: true });
            $("#timepickerfrom_terem").val(fromhour_terem);
            $("#timepickerto_terem").timeEntry({ show24Hours: true });
            $("#timepickerto_terem").val(tohour_terem);

            $("#BtnsendAgain").click(function () {

                $('#SelectDate').val("");
                $('#SelectFromTime').val("");
                $('#SelectToTime').val("");
                $("#Div_DatePicker").hide();
                $('#Div_AfterSendTime').hide();
                $('#Div_AfterSend').hide();
                $("#divSendAgain").show();
                $("#MainDivSend").dialog("open");
            });

            $("#change_time").click(function () {

                //                $('#SelectDateTimeafter').val("");
                //                $('#SelectFromTimeafter').val("");
                //                $('#SelectToTimeafter').val("");

                $("#Div_change_time").dialog("open");


            });

            $("#update_time").click(function () {

                var datepicker_terem = $('#datepicker_terem').val();
                var timepickerfrom_terem = $('#timepickerfrom_terem').val();
                var timepickerto_terem = $('#timepickerto_terem').val();

                $.ajax({
                    url: "Report.aspx",
                    type: "GET",
                    data: {
                        updatetime: 5, id_pro: $("#" + nameMaster + "hid_projectId").val(), datepicker_terem: datepicker_terem, timepickerfrom_terem: timepickerfrom_terem, timepickerto_terem: timepickerto_terem
                    },
                    success: function () {
                    }
                });
                $("#Div_change_time").dialog("close");
                $('#SelectDateTimeafter').text($('#datepicker_terem').val());
                $('#SelectFromTimeafter').text($('#timepickerfrom_terem').val());
                $('#SelectToTimeafter').text($('#timepickerto_terem').val());
                alert(" " + "<%=Resources.Resource.message_will_be_sent_on%>" + " " + $("#SelectDateTimeafter").text() + "\n " + "<%=Resources.Resource.Between_the_hours_of%>" + "  " + $('#SelectFromTimeafter').text() + " <%=Resources.Resource.to%>- " + $('#SelectToTimeafter').text());
            });

            $("#SelectTime").click(function () {

                $("#Div_DatePicker").show();
                $("#divSendAgain").hide();
            });


            $("#cancel_project").click(function () {

                $.ajax({
                    url: "Report.aspx",
                    type: "GET",
                    data: {
                        cancel_project: 8, id_pro: $("#" + nameMaster + "hid_projectId").val()
                    },
                    success: function () {
                    }
                });
                alert("<%=Resources.Resource.project_has_been_canceled%>");
                window.open('selectProject.aspx');

            });
            //   var hidden_not_now_try_server;
            $('#sendProject, #sendAgain').click(function () {


                var Send_Date = new Date();
                var Timefrom;
                var Timeto;
                var id = $(this).attr('id');
                if (id == "sendProject") {
                    $('#SelectDate').text($('#datepicker').val());
                    $('#SelectFromTime').text($('#timepickerfrom').val());
                    $('#SelectToTime').text($('#timepickerto').val());
                    Send_Date = $('#datepicker').val();
                    Timefrom = $('#timepickerfrom').val();
                    TimeTo = $('#timepickerto').val();

                    $('#Div_AfterSendTime').show();
                    $("#Div_DatePicker").hide();
                }
                else {
                    var prev_month = (Send_Date.getMonth() + 1);
                    if (prev_month.toString().length == 1)
                        prev_month = "0" + prev_month;
                    Send_Date = (Send_Date.getDate() + '/' + (prev_month) + '/' + Send_Date.getFullYear());
                    if (Send_Date.length == 9)
                        Send_Date = "0" + Send_Date;
                    Timefrom = "00:00";
                    TimeTo = "23:59";
                    $("#divSendAgain").hide();
                    $('#Div_AfterSend').show();

                }

                $.ajax({
                    url: "Report.aspx",
                    type: "GET",
                    data: {

                        SendAgain: 2, id_pro: $("#" + nameMaster + "hid_projectId").val(), Send_Date: Send_Date, Timefrom: Timefrom, TimeTo: TimeTo
                    },
                    success: function (response) {
                        if (response == "99")
                            alert("הפרויקט כעת בריצה . המערכת אינה יכולה לנסות שנית ,אנא נסה במועד מאוחר יותר");
                    }

                });

            });
            $('#MainDivSend').dialog({
                autoOpen: false,
                modal: true,
                resizable: false,
                closeOnEscape: true,
                sticky: true,
                width: 400,
                height: 270,
                title: "<%=Resources.Resource.select_time_to_send%>",
                buttons: {
                    "<%=Resources.Resource.close%>": function () {
                        $(this).dialog("close");
                        return false;
                    }
                }
            });

            $('#Div_change_time').dialog({
                autoOpen: false,
                modal: true,
                resizable: false,
                closeOnEscape: true,
                sticky: true,
                width: 400,
                height: 270,
                title: "<%=Resources.Resource.edit_time_to_send%>",
                buttons: {
                    "<%=Resources.Resource.close%>": function () {
                        $(this).dialog("close");
                        return false;
                    }
                }
            });



            //            if (active == "true") {
            //                callupd();
            //            }

            var countClick = 0;
            $(".stopmsg").click(function () {

                $('#divring').html("");
                $(this).removeClass('stopmsg').addClass('playmsg');
            });

            $(".ui-expander-header").css("height", "50px");
            var HH = $(".ui-expander-header");

            $(".playmsg").click(function () {
                countClick++;
                //alert(countClick);
                //e.stopPropagation();
                //if (countClick % 2 == 0) {
                $(this).bind('click', function (e) {
                    if (countClick % 2 == 0) {
                        // alert("stop");
                        // e.preventDefault();

                        stop(this);
                    }
                    else {
                        //alert("cancelstop");
                        e.cancelBubble = true;
                    }
                });



                var fileName = $(this).attr('id');
                var x = "'";
                var divRing = " <embed src='autop.swf' flashvars='filename=streamFile.aspx?streamFile=" + fileName + "'";
                divRing += " width='1' height='1' align='middle' type='application/x-shockwave-flash' ";
                divRing += "pluginspage='http://www.macromedia.com/go/getflashplayer' /></embed>";
                $('#divring').html(divRing);
                var oldId = fileName;
                //                $('#' + fileName).id = "stop";
                //                $('#' + fileName).val = oldId;

                var object = document.getElementById(fileName);
                //$('#' + fileName).removeClass('playmsg').addClass('stopmsg');
                $(this).removeClass('playmsg').addClass('stopmsg');

            });

        });
        function exportExcel() {
            window.open("fullExcelReport.aspx", "target=_blank,  width=100");
        }
        function printpage() {
            window.open("fullReport.aspx", "print", "target=_blank,  width=100");
            /*
            var prtContent = document.getElementById('ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder2_GridViewProjects');
            prtContent.border = 0; //set no border here
            var WinPrint = window.open('', '', 'left=100,top=100,width=500,height=1000,toolbar=0,scrollbars=1,status=0,resizable=1');
            WinPrint.document.write(prtContent.outerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();*/
        }

        AudioPlayer.setup("player.swf", {
            width: 330
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
      
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
<%--    <Triggers>
            <asp:PostBackTrigger ControlID="sendAgain" />
        </Triggers>--%>
    <ContentTemplate>
    <div>

    <div class="tableDashboard" align="center">

    <table width="100%" style=" font: bold 14px arial;color: #818181;">
    <tr class="table-top" align="center">
    <td colspan="3">
     <asp:Label ID="Label7" runat="server"   ></asp:Label>
                <asp:Label ID="LnameProject" runat="server"></asp:Label>
                      
         </td></tr>
        <tr style="padding-right:30px" >
           <td >
             <img src="images/design/icons/date.png" />
                </td >   
                <td colspan="2"> 
                 <label class="Subtitle"><%=Resources.Resource.date_the_message_was_sent%></label>
                 <asp:Label ID="LdataProject"  runat="server" Text="Label" style="font-weight:normal;"></asp:Label>                
                     
                      </td>
    </tr>
        <tr style="padding-right:30px">
            <td >
               
                  <img src="images/design/icons/play.png" />    </td>  
                   <td >   <label class="Subtitle"><%=Resources.Resource.message_content%></label>    </td>  
                       
                   <td >   <asp:Label ID="lPlay" runat="server"></asp:Label>    
                    <p id='audioplayer_N'></p>    </td>  
              
        </tr>
  
         <tr style="padding-right:30px">
        
               <td>
                 <img src="images/design/icons/answer.png" />  </td>
               
                  <td colspan="2">   <asp:Label ID="Label1"  runat="server"  CssClass="Subtitle"></asp:Label> 
                     <asp:Label ID="LnumAnswer" runat="server" style="font-weight:normal" Text="Label"  CssClass="Subtitle"></asp:Label> 
                     <span class="Subtitle" style="font-weight:normal"><%=Resources.Resource.of%></span> 
                     <asp:Label ID="LNumPhone" runat="server" Text="Label" style="font-weight:normal"  CssClass="Subtitle"></asp:Label>  </td>
            </tr>

              <tr style="padding-right:30px">
        
               <td>
                   
                 <img src="images/design/icons/noanswer.png" />  </td>
               
                  <td colspan="2">   <asp:Label ID="Label2"  runat="server"  CssClass="Subtitle"></asp:Label> 
                     <asp:Label ID="LNoAnswer" runat="server" style="font-weight:normal" Text="Label"  CssClass="Subtitle"></asp:Label> 
                    </td>
            </tr>

             <tr style="padding-right:30px">
        
                   <td>
                    <img src="images/design/Time-disabled-icon.png" /> </td>
               
                   <td colspan="2">   <asp:Label ID="Label5"  runat="server"  CssClass="Subtitle"></asp:Label> 
                    
                    </td>
            </tr>


      
          <tr style="padding-right:30px" >
         
                 <td>
                   <img src="images/design/icons/yes-play.png" /></td>
               <td colspan="2">     <asp:Panel ID="panelsumPlay" runat="server" Visible="false">
                         <asp:Label ID="Label3" runat="server"   CssClass="Subtitle"></asp:Label>
                             <asp:Label ID="LnumPlay" runat="server" Text="" style="font-weight:normal"  CssClass="Subtitle"></asp:Label>
                             <span class="Subtitle" style="font-weight:normal"><%=Resources.Resource.recipients%></span> 
                     </asp:Panel>
                     </td>
         
         </tr>
               <tr style="padding-right:30px" >

        
         <td> <img  src="images/design/icons/yes-play.png" /></td>
             <td colspan="2">
            <asp:Panel ID="panelsumAccept" runat="server" Visible="false">
           
         <asp:Label ID="Label4" runat="server"   CssClass="Subtitle"></asp:Label>
             <asp:Label ID="LSumAccept" runat="server" Text=""  CssClass="Subtitle"></asp:Label>
             <span class="Subtitle"><%=Resources.Resource.recipients%></span> 
             </asp:Panel>
             </td>
         
         </tr>
         <tr style="padding-right:30px">
         <td colspan="3">
          <asp:Panel ID="panelRunNow" runat="server" Visible="true"  >
           <span style="color:#ff2929;font-weight:normal" id="span1">
                  <%=Resources.Resource.project_running_now%> 
                    </span>
          </asp:Panel>
          <asp:Panel ID="panel_not_yet_sent" runat="server" Visible="false"  >
             <span style="margin-right: 43px;color: #ff2929;font-weight:normal" id="span2"> <%=Resources.Resource.project_contributed_sent%></span>
             <input type="button" id="change_time"  style="width: 95px;height: 30px;background-color: #FEDE27;color: black;border-radius: 10px;" value="<%=Resources.Resource.edit%>" />

                 <input type="button"  id="cancel_project"
                      style="width: 160px;height: 30px;background-color: #FEDE27;color: black;border-radius: 10px;" value="<%=Resources.Resource.cancel_project_and_enable_project%>"  />
         
                   <div id="Div_change_time"  dir="rtl"  >
	                   <table>
			                <tr>
				                <td valign="middle">
					                 <label id="Label6" ><%=Resources.Resource.date%></label>
				                </td>
				                <td colspan="2">
				                 <input type="text" id="datepicker_terem" class="tb" style="width:150px;text-align:center" tabindex=-1 name="datepicker_terem"/>  
				                </td>
			                </tr>
			                <tr>
				                <td valign="middle">   <label id="Label8" style="margin-right: 20px" ><%=Resources.Resource.from_hour%></label> </td>
				                <td> <input id="timepickerfrom_terem" name="timepickerfrom_terem"   class="tb" style="width:60px;text-align:center;margin-top:10px"/> </td>
				                <td rowspan="2"><button type="button" id="update_time" class="btn btn-warning send" type="button">עדכן</button></td>
			                </tr>
			                <tr>
				                <td valign="middle">   <label id="Label9" style="margin-right:13px"><%=Resources.Resource.to_hour%></label></td>
				                <td> <input id="timepickerto_terem" name="timepickerto_terem"  class="tb" style="width:60px;text-align:center;margin-top:10px"/>											   </td>
			                </tr>
	                   </table>
	                </div> 

                        <div id="Divafterupdatetime" style="display:none;margin-top: 50px;" dir="rtl">
                                            <span><%=Resources.Resource.message_will_be_sent_on%> </span>
                                            <span id="SelectDateTimeafter"></span>
                                                <br>                                   
                                            <br>
                                            <br>
                                            <br></br>
                                            <span><%=Resources.Resource.Between_the_hours_of%></span> <span ID="SelectFromTimeafter"></span><span>ל</span>
                                            <span ID="SelectToTimeafter"></span>
                                            <br>
                                            <br></br>
                                            <br></br>
                                            <br></br>
                                            </br>
                                            </br>
                                            </br>
                                            </br>
                      </div>
			

          </asp:Panel>
              <asp:Panel ID="PanelSendAgain" runat="server" Visible="false"  >
            <table width="100%" align="center"  cellpadding="5">
         
           <tr><td>
                    
                    <span style="color:#ff2929;font-weight:normal" id="span_sendagain">
                    <% if (Convert.ToInt32(LnumAnswer.Text) < Convert.ToInt32(LNumPhone.Text))
                       { %>
                            <%=Resources.Resource.message_did_not_reach%>
                            <%=Resources.Resource.option_of_resending%>     
                    <% } %>
                    <% else { %><%= Resources.Resource.this_project_was_completed %><%} %>
                    </span></td>
                    <td>
                    <input type="button" id="BtnsendAgain" class="btnNoTxt" style="float:left;width: 95px;" value="<%=Resources.Resource.try_again%>" />
                    </td>
                    
                            </tr>
            </table>
			 <div id="MainDivSend" >
                   
                    <div id="divSendAgain" style="padding-left:80px; padding-top:15px;">
                    <p>
                    <button id="sendAgain"  class="btn btn-warning send" style="width:180px" type="button"><%=Resources.Resource.send_now%></button></p>
                     <p>
                     <button type="button" id="SelectTime" class="btn btn-warning" style="width:180px"><%=Resources.Resource.select_time_to_send%></button>
                     </p>
                     </div>
                    
                  
                    <div id="Div_DatePicker" style="display:none" dir="rtl" class="" >
                   <table>
                    <tr>
                        <td valign="middle">
                             <label id="Lbl_Date" ><%=Resources.Resource.date%></label>
                        </td>
                        <td colspan="2">
                         <input type="text" id="datepicker" class="tb" style="width:150px;text-align:center" tabindex=-1 name="datepicker"/>
                                      
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle">   <label id="Lbl_Between" style="margin-right: 20px" ><%=Resources.Resource.from_hour%></label> </td>
                        <td> <input id="timepickerfrom" name="timepickerfrom"  class="tb" style="width:60px;text-align:center;margin-top:10px"/> </td>
                        <td rowspan="2">
                            <button type="button" id="sendProject" class="btn btn-warning send" type="button">שלח</button>
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle">   <label id="Lbl_To" style="margin-right:13px"><%=Resources.Resource.to_hour%><</label></td>
                        <td> <input id="timepickerto" name="timepickerto"  class="tb" style="width:60px;text-align:center;margin-top:10px"/>
                                           </td>
                    </tr>
                   
                   </table>
                                         
                      
                                            
                       </div>
                                            <div id="Div_AfterSendTime" style="display:none;margin-top: 50px;" dir="rtl">
                                            <span><%=Resources.Resource.message_will_be_sent_on%> </span>
                                            <span id="SelectDate"></span>
                                                <br>                                   
                                            </br>
                                             <span><%=Resources.Resource.Between_the_hours_of%> </span>
                                            <span id="SelectFromTime"></span>
                                            <span><%=Resources.Resource.to%></span>
                                            <span id="SelectToTime"></span>
                                            </div>
                                             <div id="Div_AfterSend" style="display:none;margin-top: 50px;" dir="rtl">
                                            <span><%=Resources.Resource.message_successfully_sent%> </span>
                                           
                                            </div>
                                   
    
               </div> 
             
        </asp:Panel>
        </td>
         </tr>
          </table>
      </div>
      <div class="tableDashboard">
        
       <table  width="100%">
       <tr class="table-top" align="center"><td>
         
           <span><%=Resources.Resource.contacts_report%> </span></td></tr>
       <tr>
       <td>

      
       
         <asp:Timer ID="Timer2" runat="server" ontick="Timer2_Tick" Enabled="False" 
               Interval="10000" />
       
         <asp:HiddenField ID="hid_projectId" runat="server" />
          <asp:HiddenField ID="hid_isrun" runat="server" />
                 <asp:GridView AutoPostBack="True"   Width="100%" ID="GridViewProjects" runat="server"  AllowPaging="true"  Font-Italic="False"  
                AutoGenerateColumns="False"  CssClass="gridview" CellPadding="4"  GridLines="Horizontal" 
                       onrowdatabound="GridViewProjects_RowDataBound" 
                       EnableModelValidation="True" 
                       onpageindexchanging="GridViewProjects_PageIndexChanging" 
                       onselectedindexchanging="GridViewProjects_SelectedIndexChanging" PageSize="17" >
                    <Columns>                 
                     <asp:BoundField  DataField ="idPersonOfList" ControlStyle-ForeColor="White" >
                       
        <ControlStyle ForeColor="White"></ControlStyle>
                        <ItemStyle ForeColor="Transparent" />
                        </asp:BoundField>
              
                        <asp:BoundField  DataField ="status" />
                           <asp:BoundField  DataField ="name" /> 
                           <asp:BoundField  DataField ="phone" /> 
                             <asp:BoundField  DataField ="play"   Visible="false"/>
                     <asp:BoundField  DataField ="accept" Visible="false" />
                    <asp:BoundField  DataField="record" Visible="false" ControlStyle-ForeColor="Black"/>
                    <asp:BoundField  DataField ="callDuration" /> 
             
              
                    </Columns>
                               <HeaderStyle CssClass="gridviewLine-header"/>
                    <PagerStyle CssClass="pagging-gv"/>
                             <RowStyle CssClass="gridviewLine" />
                                                                 <AlternatingRowStyle CssClass="gridviewLine-alternative"/>

                  </asp:GridView>
       
     
       </td>
       </tr>
      
        
        <tr>
        <td colspan="2">
            &nbsp;
            <asp:DropDownList ID="ddlPageSize_report" runat="server"  AutoPostBack="True" 
                onselectedindexchanged="ddlPageSize_report_SelectedIndexChanged">
            </asp:DropDownList>
            </td>
        </tr>
        
        <tr align="left" valign="middle">
        <td colspan="2" valign="middle">
         <input type="button"  onclick="printpage()" class="btnNoTxt" value="<%=Resources.Resource.print%>" style="float:right"/>  
            <asp:Button ID="bt_export" runat="server" style="padding-right:10px"  
                onclick="bt_export_Click" CssClass="export-excel"  OnClientClick="exportExcel(); return false"/>
               
         </td>  
        </tr>
               </table>
               </div>
    </div>
      </ContentTemplate>
     </asp:UpdatePanel>
    <div  id="divring"></div>
   
</asp:Content>

