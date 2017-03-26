<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/step.aspx.cs" Inherits="stepty" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head id="Head1" runat="server">
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="Content-Type" content="text/html; charset=Windows-1255" />
		<meta http-equiv="Pragma" content="no-cache"/>
		<meta http-equiv="Expires" content="-1"/>

		<title>jQuery Stepy - A Wizard Plugin</title>

		<link type="text/css" rel="stylesheet" href="css/jquery.step.css" />
        <link rel="stylesheet" href="js/jquery-ui.css" />
  <script src="js/jquery-1.9.1.js"></script>
  <script src="js/jquery-ui.js"></script>
		  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/jquery.timeentry.css"/> 
<script type="text/javascript" src="js/jquery.timeentry.js"></script>
		<!-- Optionaly -->
		<script type="text/javascript" src="fileUpload.js"></script>

		<script type="text/javascript" src="js/jquery.validate.min.js"></script>
		<script type="text/javascript" src="js/jquery.stepy.min.js"></script>
  <link href="js/themes/base/jquery.ui.dialog.css" rel="stylesheet" type="text/css" />
    <link href="js/themes/base/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
    <link href="js/themes/base/jquery.ui.button.css" rel="stylesheet" type="text/css" />
    <link href="js/themes/base/jquery.ui.core.css" rel="stylesheet" type="text/css" />
   	
			
         
		  <link href="<%= VersionCssUrl("css/css.css") %>" rel="stylesheet" type="text/css" />
	     <link href="<%= VersionCssUrl("design.css") %>" rel="stylesheet" type="text/css" />
   
		<style type="text/css">
			/* This CSS does not belong to the plugin. */
			body { /*background: url('img/background.gif');*/ font: normal 11px verdana; }
			
			a { color: #2C8CBD; text-decoration: none; }
			/*a:hover { color: #48A5D4; }*/
			
			a#coffee {
				background: url('img/coffee.png') 6px 2px no-repeat #DC5; border: 1px solid #D9C640; color: #FFF; display: block; float: right; font-size: 10px; font-weight: bold; letter-spacing: .9px; margin-right: 9px; padding: 4px 5px 4px 26px; text-decoration: none;
				-khtml-border-radius: 4px; -moz-border-radius: 4px; -opera-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;
			}
			a#coffee:hover { text-decoration: underline; }
			
			span.comment { color: #999; font: 12px monospace; letter-spacing: .1px; margin-bottom: 7px; margin-top: 5px; }
			
			div#content  
			{
				/* outer shadows  (note the rgba is red, green, blue, alpha) */
-webkit-box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.4); 
-moz-box-shadow: 0px 1px 6px rgba(23, 69, 88, .5);

/* rounded corners */
-webkit-border-radius: 12px;
-moz-border-radius: 7px; 
border-radius: 7px;

/* gradients */
background: -webkit-gradient(linear, left top, left bottom, 
color-stop(0%, white), color-stop(15%, white), color-stop(100%, #D7E9F5)); 
background: -moz-linear-gradient(top, white 0%, white 55%, #D5E4F3 130%); 
				background-color: #FFF; border: 0px solid #DEDEDE; box-shadow: 0 1px 3px rgba(100, 100, 100, 0.4); margin: 0 auto; padding: 15px; width: 1100px; min-height: 510px; }
			
			div.description { color: #555; letter-spacing: .1px; margin-bottom: 15px; margin-top: 10px; text-align: left; }
			
			div.description-code { color: #555; letter-spacing: .1px; margin-bottom: 10px; text-indent: 7px; }

			div#menu-feature { color: #AAA; float: left; margin-bottom: 20px; }
			div#menu-feature a { float: left; width: 120px }
			div#menu-feature a.disabled { color: #999; cursor: default; }
			div#menu-feature a.selected { color: #2C8CBD; cursor: default; font-weight: bold; }

			div#footer { clear: both; height: 25px; margin-top: 5px; width: 100%; }
			div#footer div#copy { margin: 0 auto; text-align: center; width: 1100px; }
			
			div#header { margin: 0 auto; padding-left: 20px; width: 1130px; }
			
			div#menu { color: #AB9927; font: bold 14px 'Lucida Grande', 'Helvetica', 'Times New Roman', serif; text-shadow: 1px 1px 1px #FFF; text-transform: uppercase; }
			div#menu a { color: #EA9C00; font: bold 10px verdana; letter-spacing: .9px; text-decoration: none; }
			div#menu a:hover { color: #DC5; font-weight: bold; letter-spacing: .9px; text-decoration: underline; }
			
			div.session { clear: both;  font: bold 13px verdana; border-bottom: 1px solid #EFEFEF; color: #444; letter-spacing: .7px; margin-bottom: 18px; margin-top: 24px; text-align: left; }
			div.session-first { clear: both; font: bold 13px verdana; border-bottom: 1px solid #EFEFEF; color: #444; letter-spacing: .7px; margin-bottom: 18px; text-align: left; }
			div.session-mini { font: bold 10px verdana; color: #444; letter-spacing: .7px; margin-top: 17px; }
			
			div.source { background: #F8F8FF; border: 1px solid #EFEFEF; border-left: 3px solid #CCC; clear: both; color: #444; font: 12px monospace; border-radius: 2px; letter-spacing: .1px; margin-bottom: 7px; margin-top: 15px; padding: 7px; width: 1081px; -khtml-border-radius: 2px; -moz-border-radius: 2px; -opera-border-radius: 2px; -webkit-border-radius: 2px; }
			div.source div.comment { color: #777; font: 9px verdana; letter-spacing: 0.4px; margin-bottom: 9px; text-align: left; }
			
			div#title { font: bold 17px verdana; color: #269; letter-spacing: .7px; margin-bottom: 10px; text-align: left; }
			div#title span { color: #777; font: 10px verdana; }
			
			span#version { color: #777; font: 10px verdana; }

			/* Custom */
			form#target fieldset img { margin-top: 10px; }

			div#title-target { height: 25px;  margin-left: 215px; margin-top: 2px; }
			div#title-target ul.stepy-titles li { font-size: 12px; padding: 4px; }
			div#title-target ul.stepy-titles li:hover { color: #BBB; }
			div#title-target ul.stepy-titles li.current-step {color: #369; }

			/* Example of dynamic class name */
			p.default-buttons { margin-top: 10px; }
			#DDLexistingProjects{display:none;}
			.stepy-titles li {float:<%=Resources.Resource.align%>;}
			.ui-dialog .ui-dialog-title {float:right !important;}
              .stepy-titles{
              background-image:url('<%=image %>');
              }
		</style>
 <script type="text/javascript">
     function SelectAllCheckboxes(chk) {
      var Countlist=0;
             $('#<%=GridView1.ClientID %> >tbody >tr >td >input:checkbox').attr('checked', chk.checked);
      if ($(chk).is(':checked'))
      {
        $("#<%=GridView1.ClientID%> input[id*='chkSel']:checkbox").each(function (index) {
                ++Countlist;
        });
      
      }
      else
      {
         Countlist=0;
        }
          $("#CountMailingList").text(Countlist);
     }
     function clearText1(obj) {
         if (obj.value == "<%=Resources.Resource.pass%>" || obj.value == "<%=Resources.Resource.validate_pass%>")
             obj.type = "password";
         if (obj.value == "<%=Resources.Resource.email%>" || obj.value == "<%=Resources.Resource.password%>" || obj.value =="<%=Resources.Resource.validate_password%>" || obj.value == "<%=Resources.Resource.enter_telephone_number%>" || obj.value == "<%=Resources.Resource.enter_number%>")
             obj.value = "";
     }
     function openDialog() {
         $('#frmverifyPhonestep').attr('src', "verifyDialog.aspx?stepProject=t");
         $("#iframe2").dialog("open");
     }
     function closeDialog(ok) {
        
         //$('#frmverifyPhonestep').attr('src', "verifyDialog.aspx?stepProject=t");
	     $("#iframe2").dialog("close");	    
		 if(ok)
		{
		    //call to ajax to save number and display in this page without refresh.	    
           
            
		}
    }
    function addCount()
    {
      var Countlist= parseInt($("#CountMailingList").text(), 10);
    ++Countlist;
    $("#CountMailingList").text(Countlist);
    }
     function subCount()
    {
     var Countlist= parseInt($("#CountMailingList").text(), 10);
    --Countlist;
    $("#CountMailingList").text(Countlist);
    }
    function checkPerson(e)
    {
     if ($("input[name="+e+"]").is(':checked')) 
   addCount();
 else 
  subCount();
    }
     var toclose = '<%=ToClose %>';
     $(document).ready(function () {


        $("#btn_deleterecord").click(function () {
		    
              record_todelete=record_todelete.slice(0,-1);
                if(record_todelete=="")
                  {
                   alert("אנא בחר הקלטה למחיקה");
                   return;		        
                  }
                  var retStatus = false;

		        		        $.ajax({ type: "GET", url: "streamFile.aspx?deleterecord=" + 1 + "&recordtodelete=" + record_todelete, crossDomain: true, success: function (result) {
 
                                     if (result == "true" || result == "True") {
		        		                retStatus = true;    
                                        $("#listMyFiles option[value='"+record_todelete+"']").remove();
                                         alert("ההקלטה "+ recordtext_todelete +" נמחקה בהצלחה");
                                       }

		        		         }
		        		        });
                
		    });



//      $("#upfilemsg").click(function () {
//           $('#FileUploadMsg').trigger('click');
//        });
//        $("#upfile1").click(function () {
//        $("#FileUploadExcel").trigger('click');
//    });

     if('<%=lang %>'!="he-IL")
     {
      $(".call-button").css("-border-radius", "10px 0 0 10px");
      $(".call-button-txt").css("-border-radius", "0 10px 10px 0");
}

   $("#linkEditList").click(function(e){
     var ddllist = window.document.getElementById("DDLmailingList");
                  var idCategory = ddllist.options[ddllist.selectedIndex].value;
            parent.window.location = "mailingList.aspx?idCategory="+idCategory;
             $("#B_save").click(function () {
                 parent.$("#frm", window.parent.document).dialog('close');
             });
          });
        var EditProject=0;
        var previouspage="";
        var str="";
        previouspage='<%=referencepage %>';
        var fromhour_ep='<%=fromhour_ep %>';
        var tohour_ep='<%=tohour_ep %>';
        var datesend_ep='<%=datesend_ep %>';
        var timepickerfrom
        //===============EditProject==================//
        if(previouspage.indexOf("step.aspx?") > 0)
           {
            $('#radio4').attr('checked','checked');//EP==ההקלטות שלי checked
            $("#createp").css("display", "none");
            $("#editp").css("display", "inline");
           
            chooseUpFile(3);
            str='<%=file_edited %>';           
            if (str != "") {
                // alert(str)
                 setTimeout(function(){
                 AudioPlayer.embed('audioplayer_N3', {
                     soundFile: 'streamFile.aspx?streamFile=' + str
                 });
                 },2000);
                 document.getElementById("HidNameFile").value = 1;
             }
             // Time Ep
          //  if ($("#ddlSendHour").val() == "2")
                 {
                     $("#Div_DatePicker").show();
                     $("#datepicker").datepicker({ dateFormat: 'dd/mm/yy' }).datepicker("setDate", new Date());
                     $("#timepickerfrom").timeEntry({ show24Hours: true });
                     $("#timepickerfrom").val(fromhour_ep);
                     $("#timepickerto").timeEntry({ show24Hours: true });
                     $("#timepickerto").val(tohour_ep);
                 }
          //   else 
                 {
                //  $("#Div_DatePicker").hide();
                 }

          }
        //===============EditProject==================//

     //  $("#DivCountMailinglist").hide();
       $("#uploadMailingList").hide();
             //$("#DivCountMailinglist").css({"display":"none"});
         $("#ddlSendHour").change(function () {
             if ($("#ddlSendHour").val() == "2") {
                 $("#Div_DatePicker").show();
                 
             }
             else {
                 $("#Div_DatePicker").hide();
             }
         });


//           $(".checkPerson").click( function() {
//           alert("hhhhhhhhhhhhhhhhhh");
//          if ($(this).is(':checked')) {
//   subCount();
//} else {
//   addCount();
//} 
//});   
         var record_todelete="";
         var recordtext_todelete="";
         $.support.cors = true;
         $("#divMyfiles").change(function () {
             var str = "";
             $("#divMyfiles option:selected").each(function () {
                 str += $(this).val() + " ";
                 record_todelete=str;
                 recordtext_todelete=$(this).text();
             });
             if (str != "") {
                 AudioPlayer.embed('audioplayer_N3', {
                     soundFile: 'streamFile.aspx?streamFile=' + str
                 });
                 document.getElementById("HidNameFile").value = 1;
             }
          // alert(str);//321321
         });
         //.trigger('change');
         $('#dialogNew').dialog({
             autoOpen: false,
             modal: true,
             resizable: false,
             closeOnEscape: true,
             sticky: true,
             buttons: {
                 "<%=Resources.Resource.create_list%>": function () {
                     if (document.getElementById("txtNewList").value != "") {
                         $(this).dialog("close");
                         createNewListPersons();
                         return true;
                     }
                 },
                 
                 "<%=Resources.Resource.cancel%>": function () {
                     $(this).dialog("close");
                     return false;
                 }
             }
         });
         $("#dialog-confirm" ).dialog({
        autoOpen: false,
             modal: true,
             resizable: false,
             closeOnEscape: true,
             sticky: true,
             width: "300px",
             title: "<%=Resources.Resource.error%>"
    });
         $('#editMailList').dialog({
             autoOpen: false,
             modal: true,
             resizable: false,
             closeOnEscape: true,
             sticky: true,
             width: "300px",
             title: "<%=Resources.Resource.edit_contact_details%>",
             buttons: {
                 "<%=Resources.Resource.update%>": function () {
                     if (checkPhoneNumber()) {
                         $(this).dialog("close");
                         updatePerson();
                         return true;
                     }
                 },

                  "<%=Resources.Resource.save%>": function () {
                     if (checkPhoneNumber()) {
                         $(this).dialog("close");
                         addPerson();
                         return true;
                     }
                 },
                 
                 "<%=Resources.Resource.close%>": function () {
                     $(this).dialog("close");
                     return false;
                 }
             }
         });

           $('#AddPersonToBigList').dialog({
             autoOpen: false,
             modal: true,
             resizable: false,
             closeOnEscape: true,
             sticky: true,
             width: "300px",
             title: "<%=Resources.Resource.add_contact%>"
         });



         //                tamar
         $('#return_phone').dialog({
             autoOpen: false,
             modal: true,
             resizable: false,
             closeOnEscape: true,
             sticky: true,
             width: "300px",
             
             title: "<%=Resources.Resource.phone_update%>",
             buttons: {
                 "<%=Resources.Resource.update%>": function () {
                     if (checkPhoneNumber2()) {
                         $(this).dialog("close");
                         add_return_phone();
                         return true;
                     }
                 },
                 "<%=Resources.Resource.close%>": function () {
                     $(this).dialog("close");
                     return false;
                 }
             }
         });



         $('#divDeletePerson').dialog({
             autoOpen: false,
             modal: true,
             resizable: false,
             closeOnEscape: true,
             sticky: true,
             width: "200px",
             title: "<%=Resources.Resource.erase_contact%>",
             buttons: {
                "<%=Resources.Resource.erase_forever%>": function () {
                     $(this).dialog("close");
                     deletePerson(true);
                     return true;
                 },
                 
                 "<%=Resources.Resource.remove_from_message%>": function () {
                     $(this).dialog("close");
                     deletePerson(false);
                     return false;
                 }
             }
         });

         $('#callNow').dialog({
             autoOpen: false,
             modal: true,
             resizable: false,
             closeOnEscape: false,
             sticky: true,
             width: "450px",
             title:  "<%=Resources.Resource.now_recording_over_telephone%>",
             beforeclose: function () {
                 var ret = true;
                 if (!autoClose)
                     ret = confirm('<%=Resources.Resource.recording_not_completed%>');
                 if (ret)
                     clearInterval(startInterval);
                 return ret;
             },
             onClose: function (dialog) {
                 // if (confirm('������ ��� ���� �� ����� ������. ��� ��� ���� ������� ����?')) {

                 clearInterval(startInterval);
                // alert(startInterval);
                 $.modal.close();
                 //   }
             },

             buttons: {}

         });
         $('#UploadExcelLoading').dialog({
             autoOpen: false,
             modal: true,
             resizable: false,
             closeOnEscape: false,
             sticky: true,
             width: "350px",
            height: "350",
             title: "<%=Resources.Resource.add_contacts_please_wait%>",
             beforeclose: function () {
               
             },
             onClose: function (dialog) {
           
             },
         });
         $('#DivImportFromExcel').dialog({
             autoOpen: false,
             modal: true,
             resizable: false,
             closeOnEscape: true,
             sticky: true,
             width: "500px",
             height: 420,
             title: "<%=Resources.Resource.import_contacts_list%>",
             buttons: {
                 //		                "�����": function () {
                 //		                    $(this).dialog("close");
                 //		                    // document.getElementById("okExcel").focus();
                 //		                    //document.getElementById("okExcel").click();
                 //		                    //uploadExcel();
                 //		                    return true;
                 //		                },
                 
                 "<%=Resources.Resource.cancel%>": function () {
                     $(this).dialog("close");
                     return false;
                 }
             }
         });
        
        if(previouspage.indexOf("editProjectV2.aspx") < 0)
         {
         $("#datepicker").datepicker({ dateFormat: 'dd/mm/yy' }).datepicker("setDate", new Date());
         $("#timepickerfrom").timeEntry({ show24Hours: true });
         $("#timepickerfrom").val("08:00");
         $("#timepickerto").timeEntry({ show24Hours: true });
         $("#timepickerto").val("09:00");
         }
         AudioPlayer.setup("player.swf", { width: 390 });

         $("#iframe2").css("padding", "0px");
         $("#iframe2").dialog(
            {
                autoOpen: false,
                //title: "<table style='padding:0; width:850px'><tr><td valign='middle' align='center'><span style='padding:10px;'>הודעה קולית חדשה</span></td></tr></table>",
                title: "<span style='font: bold 18px Arial;padding:75px;'><%=Resources.Resource.validation_number%></span>",
                //title: "<table><tr><td><img src='images/Logo.JPG' style='width:80px'/></td><td valign='middle' align='center'><span style='padding:10px;'>הודעה קולית חדשה</span></td></tr></table>",
                modal: true,
                resizable: false,
                /*width: 900,
                height:650,*/
                width: 350,
                height: 250,
                close: function (event, ui) {
                    $("#openVerifyDialog_link").css("display", "none");
                    $(".btn_verify").click();
                }
            });

         $('#iframe2').attr('src', 'verifyDialog.aspx');

         //         $(".btn_verify").click(function () {
         //             alert("herenew");
         //         });

         $("#openVerifyDialog_link").click(function () {
             //alert("btnverify");
             openDialog();
         });
        

         $('#fileUploadMsg').ajaxfileupload({
             'action': '/req.aspx',
             'onStart': function () {
                 document.getElementById("response").innerHTML = "Uploading . . .";
             },
             'onComplete': function (response) {
             console.log(response);
                 //alert(response);
                 var position = response.indexOf("/");
                 // var size = parseFloat(response.substr(0, position));
                 var size = response.substr(0, position);
                 //alert(size);
                 var position_hours = size.indexOf(":");
                 var hours = parseInt(size.substr(0, position_hours));
                 //alert(hours);
                 var minutes = parseInt(size.substr(position_hours + 1, 2));
                 //alert(minutes);
                 var seconds = parseInt(size.substr(position_hours + 4, size.length));
                 //alert(seconds);
				  console.log(minutes+''+seconds);
                fail_upload="false";
                 if (hours >= 1 || (minutes >= 1 && seconds>=1) )
				     {
					 fail_upload="true";
                     alert("<%=Resources.Resource.file_is_too_long%>");
                     }
                 var responsekodem = response.substr(position + 1, response.length);
				 
				 if(fail_upload=="false")
                    document.getElementById("response").innerHTML = "<%=Resources.Resource.file_successfully_saved%>";
                 else document.getElementById("response").innerHTML = "העלאת הקובץ נכשלה";
				AudioPlayer.embed('audioplayer_N2', {
                     soundFile: 'streamFile.aspx?streamFile=' + responsekodem
                 });
                 document.getElementById("HidNameFile").value = 1;
                 document.getElementById("HFupload").value = 1;
                 //alert((response));
             }
         });

         //222
         $('#FileUploadExcel').ajaxfileupload({
             'action': 'excel.aspx',
             'valid_extensions': ['xls', 'xlsx', 'csv'],

             'params': { 'nameCategory': 'excel' },
             'onStart': function () {
                 $("#UploadExcelLoading").dialog('open');
                 //var nameCategory=document.getElementById("TbCategoryNameExcel").value;
                 // document.getElementById("response").innerHTML = "Uploading . . .";
             },
             'onComplete': function (response) {
                 // alert("complete");
                 if(response=="error")
                    {
                     $("#DivCountMailinglist").css({"display":"none"});
                     alert("<%=Resources.Resource.uploading_Excel_failed%>");
                     $('#DivImportFromExcel').dialog("close");
                     $("#UploadExcelLoading").dialog('close');
                     }
                else
                {   $('#DivImportFromExcel').dialog("close");
                    $("#UploadExcelLoading").dialog('close');
                    $("#uploadMailingList").css({"display":"block"});
//                  if(  $("#HCountMailinglist").val()>500)
//                  {
//                   $("#DivCountMailinglist").css({"display":"block"});
//                  }
                    document.getElementById("HFcategoryexcel").value = response;
                    //    document.getElementById("response").innerHTML = "����� ���� ������";
                    setTimeout("clickUpdateExcel()", 1000);
                    //alert((response));
                } 
             }
         });



         try {


             //    if(toclose=="True"||toclose=="true")
             //    {
             if (toclose == "1") {
                 //alert(toclose);
                 parent.window.location = 'msgAfterAction.aspx?saveOrSend=1';
             }
             if (toclose == "2") {
                 //alert(toclose);
                 parent.window.location = 'msgAfterAction.aspx?saveOrSend=2';
             }

             if (toclose == "5") {
                 //alert(toclose);
                 parent.window.location = 'msgAfterAction.aspx?saveOrSend=5';
             }
              if (toclose == "9") {
                 //alert(toclose);
                 parent.window.location = 'msgAfterAction.aspx?saveOrSend=9';
             }
            
             $("#B_save").click(function () {
    var strFromDate = $('#timepickerfrom').val();
              var strToDate = $('#timepickerto').val();
                var arrFromDate = strFromDate.split(':'); 
                var arrToDate = strToDate.split(':'); 
                var DateFrom=new Date('0','0','0',arrFromDate[0],arrFromDate[1]);
                var DateTo=new Date('0','0','0',arrToDate[0],arrToDate[1]);
                if(DateTo<DateFrom)
                {
                 $("#dialog-confirm").dialog('open');
              return false;
              }
              else
              parent.$("#frm", window.parent.document).dialog('close');
             });
             $("#B_send").click(function () {
            var strFromDate = $('#timepickerfrom').val();
              var strToDate = $('#timepickerto').val();
                var arrFromDate = strFromDate.split(':'); 
                var arrToDate = strToDate.split(':'); 
                var DateFrom=new Date('0','0','0',arrFromDate[0],arrFromDate[1]);
                var DateTo=new Date('0','0','0',arrToDate[0],arrToDate[1]);
                if(DateTo<DateFrom)
                {
                 $("#dialog-confirm").dialog('open');
              return false;
              }
              else
              parent.$("#frm", window.parent.document).dialog('close');
             });

             //$(function () {
             //alert("aa:"+document.readyState); 
             $('#default').stepy({
                 description: true,
                 legend: false,
                 backLabel: '', //'< הקודם',
                 block: true,
                 errorImage: true,
                 finishButton: false,
                 nextLabel: '', // 'הבא >',
                 titleClick: true,
                 validate: true,

                 back: function (index) {
                     switch (index) {
                         case 2:
                             return chooseListMailing(2);

                             break;

                     }
                 },
                 next: function (index) {
                     //return true;
                     switch (index) {

                         case 2:
                             return validateStep1();
                             break;
                         case 3:
                             return validateStep2();
                             break;
                         case 4:
                             return validateStep3();
                             break;
                         case 5:
                             return validateStep4();
                             break;

                     }
                 }
             });


             //});
         }
         catch (e) { alert(e) }
     });
 </script>


		<script type="text/javascript">
		    function clickUpdateDdl() {
		        document.getElementById("refreshDdl").focus();
		        document.getElementById("refreshDdl").click();
		    }
		    function clickUpdateExcel() {
		        document.getElementById("okExcel").focus();
		        document.getElementById("okExcel").click();
		    }
		    function uploadFileMsg() {


		        //var i = 0, len = input.files.length, img, reader, file;


		        //if (formdata)
		        //{


		        $.ajax({
		            url: "req.aspx",
		            type: "POST",
		            enctype: 'multipart/form-data',
		            data: {
		                file: input.value
		            },
		            processData: false,
		            contentType: false,
		            success: function (res) {
		                //alert(res);

		                document.getElementById("response").innerHTML = "<%=Resources.Resource.file_successfully_saved%>";
		                AudioPlayer.embed('audioplayer_N2', {
		                    soundFile: 'streamFile.aspx?streamFile=' + res
		                });
		                document.getElementById("HidNameFile").value = 1;
		                document.getElementById("HFupload").value = 1;

		            }
				, error: function (xhr, ajaxOptions, thrownError) {
				    alert("Error ajax: " + thrownError);
				}
		        });
		        //}
		    }
		    function validateStep1() {
		        //		        if (document.getElementById("chooseExistingProject").checked) {
		        //		            var ddllist = window.document.getElementById("DDLexistingProjects");
		        //		            var idCategory = ddllist.options[ddllist.selectedIndex].value;
		        //		            //window.location = 'editProject.aspx?id=' + idCategory;
		        //		            parent.$("#frm", window.parent.document).dialog('close');
		        //		            parent.window.location = 'editProject.aspx?duplicate=1&id=' + idCategory;

		        //		        }
		        //		        else {
		        var nameProject = document.getElementById('tbnameProject').value;
		        if (nameProject == "") {
		            alert("<%=Resources.Resource.enter_message_name%>");
		            return false;
		        }
		        if (nameProject.length > 20) {
		            alert("<%=Resources.Resource.message_subject_limited_characters%>");
		            return false;
		        }
		        else
		            return true;
		        // }
		    }
			var fail_upload="false";
		    function validateStep2() {
		        //alert(2);
		        var typeUpload = document.getElementsByName("group1");
		        if (typeUpload[0].checked) {
		            //alert("by calls checked");
		        }
		        if (document.getElementById("HidNameFile").value == 0) {
		           alert("<%=Resources.Resource.upload_or_record_message%>");
		            return false;
		        }
				if(fail_upload=="true"){
				   alert("<%=Resources.Resource.file_is_too_long%>");
				   return false;
				}
		        else
                 return true;
		    }
		    function validateStep3() {
		        var list = document.getElementById("LBaddPhone");
		        var len = list.options.length;
		        var totalRows = 0;
		        var insertOrChoose = document.getElementById("HfInsertOrChoose").value;
		        if (insertOrChoose == 2) {
		            totalRows = $("#<%=GridView1.ClientID %> tr").length;
		            totalRows--;
		            len = 0;
		        }
		        //22222222222222
		        if (totalRows > 0)
		            document.getElementById("HFcountRows").value = totalRows;
		        if (len == 0 && insertOrChoose == 1) {
		            alert("<%=Resources.Resource.enter_telephone_numbers_distribution_list%>");
		            return false;
		        }

		        if (len > 0 || totalRows > 0 || ((document.getElementById("HCountMailinglist").value > 0)))
		            return true;
		        else {
		            alert("<%=Resources.Resource.enter_telephone_numbers_distribution_list%>");
		            return false;
		        }
		    }
		    function validateStep4() {
		        //name Category     
		        var insertOrChoose = document.getElementById("HfInsertOrChoose").value;
		        if (insertOrChoose == 2) {
		            var ddllist = window.document.getElementById("DDLmailingList");
		            var name = ddllist.options[ddllist.selectedIndex].text;
		            document.getElementById("nameCategoryPost").innerHTML = "<%=Resources.Resource.distribution_list%>" +" "+ name;
		        }
		        //num of numbers phone
		        var count;

		        var list = document.getElementById("LBaddPhone");
		        var len = list.options.length;
		        var totalRows = $("#<%=GridView1.ClientID %> tr").length;
		        var rowsChecked = 0;
		        var rowsChecked = $("#<%=GridView1.ClientID%> input[id*='chkSel']:checkbox:checked").size();
		        //totalRows--;
		        if (len > 0) {
		            count = len;
		            document.getElementById("nameCategoryPost").innerHTML = "";
		        }
		        if (rowsChecked > 0)
		            count = rowsChecked;

		        if (len > 0 && rowsChecked > 0) {
		            var insertOrChoose = document.getElementById("HfInsertOrChoose").value;
		            if (insertOrChoose == 2)
		                count = document.getElementById("HFcountRows").value;
		            if (insertOrChoose == 1)
		                count = document.getElementById("countAdd").innerHTML;
		        }
		        else
		            count = document.getElementById("CountMailingList").innerHTML;
		        document.getElementById("countNumbers").innerHTML = count;

		        //check the credit
		        var credit = document.getElementById("hfUserCredit").value;
		        if (parseInt(credit) < parseInt(count)) {
		            document.getElementById("B_send").style.display = "none";
		            document.getElementById("txtsendnow").style.display = "none";
		            document.getElementById("lErrorCredit").style.display = "inline";
		        }
		        else {
		            document.getElementById("B_send").style.display = "inline";
		            document.getElementById("lErrorCredit").style.display = "none";

		        }
		        //display end credit
		        // document.getElementById("sumMinusMsg").innerHTML = count;
		        var credidAfterSend = credit - count;
		        document.getElementById("sumMsgCredit").innerHTML = credidAfterSend;




		        //Source of message: record or upload
		        var record = document.getElementById("HFrecord").value;
		        var upload = document.getElementById("HFupload").value;
		        var div = document.getElementById("HFrecordOrUploadDiv").value;
		        if (record == "1")
		            document.getElementById("msgSource").innerHTML = "<%=Resources.Resource.record%>";
		        if (upload == "1")
		            document.getElementById("msgSource").innerHTML = "<%=Resources.Resource.the_audio_file%>";
		        if (record == "1" && upload == "1") {
		            if (div == "record");
		            document.getElementById("msgSource").innerHTML = "<%=Resources.Resource.record%>";
		            if (div == "upload")
		                document.getElementById("msgSource").innerHTML = "<%=Resources.Resource.the_audio_file%>";
		        }
		        //name msg
		        var name = document.getElementById("tbnameProject").value;
		        document.getElementById("nameMsg").innerHTML = name;
		        return true;
		    }
		    var iffound = false;
		    var startInterval;
		    var temp;
		    var numTemp = 1;

		    var autoClose = false;
		    function callByPhone() {
		        var x = document.getElementById("TBrecordNumPhone").value;
		        // if (x==null || x=="");     
		        if ((isNaN(x)) || (x.indexOf(" ") != -1) || (x.length > 10) || (x.length < 9)) {
		            alert("<%=Resources.Resource.wrong_number%>");
		        }
		        else {
		            numTemp++;
		            var phoneNumber = document.getElementById("TBrecordNumPhone");
		            $("#callNow").dialog('open');
		            autoClose = false;
		            //Ajax
		            // alert("phoneNumber: "+phoneNumber.value);
		            var urlPage = "streamFile.aspx?record=1&number=" + phoneNumber.value + "&temp=" + numTemp;
		            $.ajax({ type: "GET", url: urlPage, crossDomain: true, success: function (result) {
		                temp = result;
		                startInterval = setInterval("ifFileExist(temp)", 3000);
		            }, error: function (xhr, ajaxOptions, thrownError) {
		                alert("thrownError: " + thrownError);
		            }
		            });



		        }
		    }
		    var filename;
		    function ifFileExist(temp) {
		        //var nameFile=document.getElementById("HidNameFile");
		        numTemp++;
		        //alert(temp);
		        $.ajax({ type: "GET",
		            url: "streamFile.aspx?check=1&nameFile=" + temp + "&numTemp=" + numTemp,
		            crossDomain: true,
		            success: function (result) {
		                //alert(result);
		                try { console.log("REC: " + result + " (" + numTemp + ")"); } catch (e1) { };
		                if (result == "true" || result == "True") {
		                    filename = result;
		                    try { console.log("result: " + result + ". file: " + temp); } catch (e2) { };
		                    // alert("Record file OK");
		                    //alert("file: "+temp);
		                    try { console.log("clear interval"); } catch (e3) { };
		                    clearInterval(startInterval);
		                    try { console.log("AudioPlayer.embed"); } catch (e4) { };
		                    AudioPlayer.embed('audioplayer_N', {
		                        soundFile: 'streamFile.aspx?streamFile=' + temp
		                    });
		                    try { console.log("AudioPlayer.embed - finish"); } catch (e5) { };
		                    document.getElementById("HidNameFile").value = 1;
		                    document.getElementById("HFrecord").value = 1;
		                    clearInterval(startInterval);
		                    document.getElementById("bgCallNow").innerHTML = "<%=Resources.Resource.recording_is_complete%>";
		                    document.getElementById("bgCallNow").style.background = "none";
		                    document.getElementById("bgCallNow").style.fontSize = "30pt";
		                    autoClose = true;
		                    $('#Button1').attr('disabled', 'disabled');
		                    setTimeout("$('#callNow').dialog('close');", 3000);
		                    try { console.log("close dialog"); } catch (e1) { };
		                }
		            }, error: function (xhr, ajaxOptions, thrownError) {
		                alert(thrownError);
		            }
		        });


		    }
		    function checkDuplicate(x) {


		        var list = document.getElementById("LBaddPhone");
		        var len = list.options.length;
		        for (var i = 0; i < len; i++) {
		            if (list.options[i].value == x) {
		                return false;
		            }
		        }
		        return true
		    }
		    function checkPhoneNumber() {
		        var x = document.getElementById("phonePerson").value;
		        if (x == null || x == "")
		            return false;
		        if (isNaN(x) || x.indexOf(" ") != -1 || x.length > 10 || x.length < 9) {
		            alert("<%=Resources.Resource.wrong_number%>");
		            return false;
		        }
		        else
		            return true;

		    }
		    function checkPhoneNumber2() {
		        var x = document.getElementById("phone_return").value;
		        if (x == null || x == "")
		            return false;
		        if (isNaN(x) || x.indexOf(" ") != -1 || x.length > 10 || x.length < 9) {
		            alert("<%=Resources.Resource.wrong_number%>");
		            return false;
		        }
		        else
		            return true;

		    }

		    function ValidatePhoneNumber() {

		        var x = document.getElementById("TBaddPhone").value;


		        //            if (x==null || x=="")
		        // 		        return false;     
		        if (isNaN(x) || x.indexOf(" ") != -1 || x.length > 10 || x.length < 9) {
		            alert("<%=Resources.Resource.wrong_number%>");
		            document.getElementById("TBaddPhone").focus();
		            return false;
		        }
		        else {
		            if (checkDuplicate(x))
		                return true;
		            else {
		                alert("<%=Resources.Resource.existing_telephone_number%>");
		                document.getElementById("TBaddPhone").focus();
		                return false;
		            }
		        }


		    }
		    function pressAddPhone(e) {
		        if (window.event) keycode = window.event.keyCode;
		        else if (e) keycode = e.which;

		        if (keycode == 13) {
		            document.getElementById("b_addPhone").focus();
		            document.getElementById("b_addPhone").click();
		            return false;
		        }
		        return true;
		    }
		    function chooseUpFile(type) {
		        var divUpload = document.getElementById("divRecordByPhone");
		        var divRecord = document.getElementById("divUpload");
		        var divMyfiles = document.getElementById("divMyfiles");

		        if (type == 1) {
		            divUpload.style.display = "none";
		            divRecord.style.display = "inline";
		            divMyfiles.style.display = "none";
		            document.getElementById("HFrecordOrUploadDiv").value = 'recorde';
		        }
		        else if (type == 2) {
		            divUpload.style.display = "inline";
		            divRecord.style.display = "none";
		            divMyfiles.style.display = "none";
		            document.getElementById("HFrecordOrUploadDiv").value = 'upload';
		        }
		        else if (type == 3) {
		            divUpload.style.display = "none";
		            divRecord.style.display = "none";
		            divMyfiles.style.display = "inline";
		            document.getElementById("HFrecordOrUploadDiv").value = 'myFile';
		        }
		    }
		    function chooseListMailing(type) {
		        var divMain = document.getElementById("divMaillistDefualt");
		        var divSetList = document.getElementById("divMaillist");
		        if (type == 1) {
		            document.getElementById("HfInsertOrChoose").value = 2;
		            divMain.style.display = "none";
		            divSetList.style.display = "block";
		        }
		        else if (divMain.style.display == "none") {
		            document.getElementById("HfInsertOrChoose").value = 1;
		            divMain.style.display = "block";
		            divSetList.style.display = "none";
		            return false;
		        }
		        return true;
		    }

		    function selectMoreOptions() {
		        //                tamar

		        var projectexample;
		        var typeUpload = document.getElementsByName("groupMore");

		        if (typeUpload[0].checked) {
		            document.getElementById("lblMore").innerHTML = "<%=Resources.Resource.without_additional_services%>";
		            projectexample = 3;
		        }
		        else if (typeUpload[1].checked) {
		            document.getElementById("lblMore").innerHTML = "<%=Resources.Resource.additiona_receiving_message%>";
		            projectexample = 4;
		        }
		        else if (typeUpload[2].checked) {
		            document.getElementById("lblMore").innerHTML = "<%=Resources.Resource.additional_recipient_recording%>";
		            projectexample = 5;
		        }

		        else if (typeUpload[3].checked) {
		            $("#return_phone").dialog('open');
		            document.getElementById("lblMore").innerHTML = "<%=Resources.Resource.additional_back_to_representative%>";
		            projectexample = 6;
		        }
		        else if (typeUpload[4].checked) {
		            document.getElementById("lblMore").innerHTML = "בקשת אישור של הלקוח";
		            projectexample = 7;
		        }

		        document.getElementById("HfProjectExample").value = projectexample;
		        return true;
		    }


		    function deletePerson(deleteFromDB) {
		        subCount();
		        var idperson = document.getElementById("HFidPerson").value;
		        // var nameperson=document.getElementById("namePerson").value;
		        //var phonePerson=document.getElementById("phonePerson").value;
		        //var ddllist= window.document.getElementById("DDLmailingList");
		        //var idCategory= ddllist.options[ddllist.selectedIndex].value;
		        var retStatus = false;
		        var rowid = document.getElementById("rowid_" + idperson);
		        var delDB = 0;
		        if (deleteFromDB)
		            delDB = 1;

		        $.ajax({ type: "GET", url: "streamFile.aspx?deletePerson=" + delDB + "&idPerson=" + idperson, crossDomain: true, success: function (result) {
		            if (result == "true" || result == "True") {
		                retStatus = true;
		                // var rowid=document.getElementById("rowid_"+idperson);
		                //$("#rowid_"+rowid).remove();
		                $("#rowid_" + idperson).remove();
		            }

		        }
		        });
		        document.getElementById("hidden_addperson").focus(); //1509
		        document.getElementById("hidden_addperson").click();
		        /*else
		        {
		        retStatus  =true;
		        //var rowid=document.getElementById("rowid_"+idperson);
		        //$("#rowid_"+rowid).remove();
		        }
		        if(retStatus)
		        {
                
                    
		        //rowid.innerHTML="";
		        $("#rowid_"+idperson).remove();
		        }*/
		    }

		    function addPerson() {

		        addCount();
		        //1. read id+name+phone from div-dialog.
		        var idperson = document.getElementById("HFidPerson").value;
		        var nameperson = document.getElementById("namePerson").value;
		        var phonePerson = document.getElementById("phonePerson").value;
		        var ddllist = window.document.getElementById("DDLmailingList");
		        var idCategory = ddllist.options[ddllist.selectedIndex].value;
		        //alert(idCategory);
		        //4. ajax - upadte.
		        $.ajax({ type: "GET", url: "streamFile.aspx?addPerson=1&namePerson=" + encodeURIComponent(nameperson) + "&phonePerson=" + phonePerson + "&idCategory=" + idCategory, crossDomain: true, success: function (result) {
		            if (result != null) {
		                var idperson = result;
		                // alert("idPerson: " + result)
		                var x = "'";
		                var totalRows = $("#<%=GridView1.ClientID %> tr").length;
		                //  if (totalRows > 0)
		                //$("#GridView1").prepend("<tr id='rowid_" + idperson + "'  style=" + x + "height:25px;" + x + "><td id='id_" + idperson + " '" + x + " style='color: transparent';" + x + ">" + idperson + "</td><td id='phone_" + idperson + "'>" + phonePerson + "</td><td id='name_" + idperson + "'>" + nameperson + "</td><td><input type='button' class='editbtn'  onclick=" + x + "openDialogEditMailList('" + idperson + "','" + phonePerson + "','" + nameperson + "')" + x + "</td><td><input type='button' class='delbtn'  onclick=" + x + "opendivDeletePerson('" + idperson + "')" + x + "></td></tr></tr>  ");
		                //  $("#GridView1 tr").eq(0).after("<tr id='rowid_" + idperson + "'  style=" + x + "height:25px;" + x + "><td id='id_" + idperson + " '" + x + " style='color: transparent';" + x + ">" + idperson + "</td><td id='phone_" + idperson + "'>" + phonePerson + "</td><td id='name_" + idperson + "'>" + nameperson + "</td><td><input type='button' class='editbtn'  onclick=" + x + "openDialogEditMailList('" + idperson + "','" + phonePerson + "','" + nameperson + "')" + x + "</td><td><input type='button' class='delbtn'  onclick=" + x + "opendivDeletePerson('" + idperson + "')" + x + "></td><td><input type='checkbox' id='chkSel' class='checkPerson' name='ch_" + idperson + "'  onclick=" + x + "checkPerson(this.name)" + x + "   checked></td> </tr></tr>  ");
		                // $("#GridView1").prepend("<tr id='rowid_" + idperson + "'  style=" + x + "height:25px;" + x + "><td id='id_" + idperson + " '" + x + " style='color: transparent';" + x + ">" + idperson + "</td><td id='phone_" + idperson + "'>" + phonePerson + "</td><td id='name_" + idperson + "'>" + nameperson + "</td><td><input type='button' class='editbtn'  onclick=" + x + "openDialogEditMailList('" + idperson + "','" + phonePerson + "','" + nameperson + "')" + x + "</td><td><input type='button' class='delbtn'  onclick=" + x + "opendivDeletePerson('" + idperson + "')" + x + "></td><td><input type='checkbox' id='chkSel'></td> </tr></tr>  ");
		                //else

		                // $("#GridView1").append("<tr id='rowid_" + idperson + "'  style=" + x + "height:25px;" + x + "><td id='id_" + idperson + " '" + x + " style='color: transparent';" + x + ">" + idperson + "</td><td id='phone_" + idperson + "'>" + phonePerson + "</td><td id='name_" + idperson + "'>" + nameperson + "</td><td><input type='button' class='editbtn'  onclick=" + x + "openDialogEditMailList('" + idperson + "','" + phonePerson + "','" + nameperson + "')" + x + "</td><td><input type='button' class='delbtn'  onclick=" + x + "opendivDeletePerson('" + idperson + "')" + x + "></td><td><input type='checkbox' id='chkSel'></td> </tr></tr>  ");
		                //   $('#GridView1 tbody tr:first').after('<tr><td>new activity</td></tr>');
		                //  $("#<%=GridView1.ClientID %> tr").append("<tr id='rowid_" + idperson + "'  style=" + x + "height:25px;" + x + "><td id='id_" + idperson + " '" + x + " style='color: transparent';" + x + ">" + idperson + "</td><td id='phone_" + idperson + "'>" + phonePerson + "</td><td id='name_" + idperson + "'>" + nameperson + "</td><td><input type='button' class='editbtn'  onclick=" + x + "openDialogEditMailList('" + idperson + "','" + phonePerson + "','" + nameperson + "')" + x + "</td><td><input type='button' class='delbtn'  onclick=" + x + "opendivDeletePerson('" + idperson + "')" + x + "></td><td><input type='checkbox' id='chkSel'  class='checkPerson' name='ch_" + idperson + "'  onclick=" + x + "checkPerson(this.name)" + x + "  checked></td> </tr></tr>  ");
		                //   $("input[id*=GridView1] tr").after('<tr><td>column1 value</td><td>column2 value</td></tr>');
		                //clear the input
		                document.getElementById("hidden_addperson").focus(); //1509
		                document.getElementById("hidden_addperson").click();
		                document.getElementById("namePerson").value = "";
		                document.getElementById("phonePerson").value = "";
		                //Del
		                // $("#rowid_"+idCategory).remove();

		            }
		        }, error: function (xhr, ajaxOptions, thrownError) {
		            alert("thrownError: " + thrownError);
		        }

		        });
		        //if(return true

		        //2. find by id - gridview
		        //3. innerHtml
		        document.getElementById("hidden_addperson").focus(); //1509
		        document.getElementById("hidden_addperson").click();
		    }

		    //            tamar
		    function add_return_phone() {

		        document.getElementById("hidden_return_phone").value = document.getElementById("phone_return").value;
		        document.getElementById("hidden_num_agents").value = document.getElementById("num_agents").value;

		    }


		    function updatePerson() {
		        //1. read id+name+phone from div-dialog.
		        var idperson = document.getElementById("HFidPerson").value;
		        var nameperson = document.getElementById("namePerson").value;
		        var phonePerson = document.getElementById("phonePerson").value;
		        var ddllist = window.document.getElementById("DDLmailingList");
		        var idCategory = ddllist.options[ddllist.selectedIndex].value;
		        //alert(idCategory);
		        //4. ajax - upadte.
		        $.ajax({ type: "GET", url: "streamFile.aspx?updatePerson=1&idPerson=" + idperson + "&namePerson=" + encodeURIComponent(nameperson) + "&phonePerson=" + phonePerson + "&idCategory=" + idCategory, contentType: "application/x-www-form-urlencoded;charset=Windows-1255", crossDomain: true, success: function (result) {

		            if (result == "true" || result == "True") {
		                //var idperson=document.getElementById("HFidPerson").value;

		                var nameP = document.getElementById("name_" + idperson);
		                var phoneP = document.getElementById("phone_" + idperson);
		                nameP.innerHTML = nameperson;
		                phoneP.innerHTML = phonePerson;


		            }
		        }, error: function (xhr, ajaxOptions, thrownError) {
		            alert("thrownError: " + thrownError);
		        }

		        });
		        //if(return true

		        //2. find by id - gridview
		        //3. innerHtml

		    }


		    function openDialogNewList() {
		        $("#dialogNew").dialog('open');
		    }
		    function opendivDeletePerson(idperson) {
		        $("#divDeletePerson").dialog('open');
		        document.getElementById("HFidPerson").value = idperson;
		        $(".ui-dialog-buttonpane button:contains('<%=Resources.Resource.erase_forever%>')").css({ "width": "150px", "fontWeight": "Bold", "float": "right" });
		        $(".ui-dialog-buttonpane button:contains('<%=Resources.Resource.remove_from_message%>')").css({ "width": "150px", "fontWeight": "Bold", "float": "right" });
		    }
		    function openDialogEditMailList(idperson, phone, nameperson) {
		        if (parseInt($("#CountMailingList").text(), 10) > 500)
		            $("#AddPersonToBigList").dialog('open');
		        else
		            $("#editMailList").dialog('open');
		        //alert("koko");
		        if (idperson == null) {
		            //   $(".ui-dialog-buttonpane button:contains('����')").button("disable");
		            $(".ui-dialog-buttonpane button:contains('<%=Resources.Resource.update%>')").hide();
		            $(".ui-dialog-buttonpane button:contains('<%=Resources.Resource.save%>')").show();
		            document.getElementById("namePerson").value = "";
		            document.getElementById("phonePerson").value = "";
		        }
		        else {
		            $(".ui-dialog-buttonpane button:contains('<%=Resources.Resource.save%>')").hide();
		            $(".ui-dialog-buttonpane button:contains('<%=Resources.Resource.update%>')").show();
		            if (nameperson != null)
		                document.getElementById("namePerson").value = nameperson;
		            if (phone != null)
		                document.getElementById("phonePerson").value = phone;
		        }
		        $(".ui-dialog-buttonpane button:contains('<%=Resources.Resource.save%>')").css({ "width": "65px", "float": "right" });
		        $(".ui-dialog-buttonpane button:contains('<%=Resources.Resource.update%>')").css({ "width": "65px", "float": "right" });
		        $(".ui-dialog-buttonpane button:contains('<%=Resources.Resource.close%>')").css({ "width": "50px", "float": "left" });
		        // $(".ui-dialog-buttonpane button:contains('����')").addClass("button-next");

		        document.getElementById("HFidPerson").value = idperson;


		    }
		    function openDialogImportList() {
		        $("#DivImportFromExcel").dialog('open');
		    }
		    function createNewListPersons() {
		        var nameNewList = document.getElementById("txtNewList").value;
		        $.ajax({ type: "GET", url: "streamFile.aspx?addNewList=1&nameList=" + nameNewList, crossDomain: true, success: function (result) {
		            if (result != null) {
		                setTimeout("clickUpdateDdl()", 1000);
		                /*var idList = result;
		                //alert(idList);
		                var newList = document.createElement("option");
		                document.getElementById("DDLmailingList").options.add(newList);
		                var ddl = document.getElementById("DDLmailingList");
		                newList.text = nameNewList;
		                newList.value = idList;
		                var elOptOld = ddl.options[ddl.selectedIndex];
		                try {
		                ddl.add(newList, elOptOld); // standards compliant; doesn't work in IE
		                }

		                catch (ex) {
		                ddl.add(newList, ddl.selectedIndex); // IE only
		                }
		                //Del
		                //$("#rowid_"+idCategory).remove();*/
		            }
		        }, error: function (xhr, ajaxOptions, thrownError) {
		            alert("thrownError: " + thrownError);
		        }

		        });
		    }
		    function displayDDLproject() {
		        var ch = document.getElementById("chooseExistingProject").checked;

		        if (ch)
		            document.getElementById("DDLexistingProjects").style.display = "block";
		        else
		            document.getElementById("DDLexistingProjects").style.display = "none";

		    }
		    function numbersOnly(e) {
		        var evt = (e) ? e : window.event;
		        var key = (evt.keyCode) ? evt.keyCode : evt.which;


		        if (key != null) {
		            key = parseInt(key, 10);


		            if ((key < 48 || key > 57) && (key < 96 || key > 105)) {
		                if (!isUserFriendlyChar(key))
		                    return false;
		            }
		            else {
		                if (evt.shiftKey)
		                    return false;
		            }
		        }


		        return true;
		    }
		    function isUserFriendlyChar(val) {
		        // Backspace, Tab, Enter, Insert, and Delete
		        //alert(val);
		        if (val == 8 || val == 9 || val == 13 || val == 45 || val == 46)
		            return true;


		        // Ctrl, Alt, CapsLock, Home, End, and Arrows
		        if ((val > 16 && val < 21) || (val > 34 && val < 41))
		            return true;


		        // The rest
		        return false;
		    }
	
</script> 
		
	</head>
	<body >
	<form runat="server" ID="formst">
	<asp:ScriptManager ID="ScriptManager1" runat="server" />
	
<div id="callNow" title="<%=Resources.Resource.recording_now_by_telephone%>">
        <div id="bgCallNow" style="background-image: url( 'Images/loading2.gif' );width:402px; height:402px;">&nbsp;</div>
                               
    </div>
	<div id="UploadExcelLoading" title="<%=Resources.Resource.upload_records%>">
        <div id="bgUploadExcelLoading" style="background-image: url( 'Images/loading2.gif' );width:330px; height:290px;">&nbsp;</div>
                               
    </div>
<div id="dialogNew" title="<%=Resources.Resource.creat_list_of_contacts%>">

        <table>
            <tr>
                <td><%=Resources.Resource.enter_name_of_contacts_list%></td>
            </tr>
            <tr>
                <td><input  class="tbRegister" id="txtNewList" /></td>
            </tr>
        </table>
    </div>

		<%--<div id="big"  class="div-background-step" >--%>
			<!--<div id="checkbox-default-demo" class="session-first">With default options using checkbox:</div>-->
		<%--<div id="projectDetails"  >--%>
			<div id="default" style="width:720px;" >
				<fieldset title="<%=Resources.Resource.stage_1%>">
                <legend><%=Resources.Resource.open_a_message%></legend>
                				<table width="100%">
                        <tr>
                            <td valign="top" width="85%"><legend><%=Resources.Resource.open_a_message%></legend></td>
                            <td valign="top"> <div style="position:absolute">  
                                <img src="images/step/spix-logo-voicestep.png" /> </div></td>
                        </tr>
                    </table>
                    <div class="divstep" style="direction:<%=Resources.Resource.dir%>" style="text-align:<%=Resources.Resource.align%>" >
					<table border="0" cellpadding="5" cellspacing="5" class="widthTableStep"  style="display: inline;">
                                     <tr>
                                        <td  align="<%=Resources.Resource.align%>">
                                       
                                            <span class="txt" id="createp" >
                                    
                                    <%=Resources.Resource.welcome_to_the_wizard_create%>
                                                 </span>
                                             <span class="txt" id="editp" style="display:none">
                                               
                                                <%=Resources.Resource.welcome_to_the_wizard_edit%>
                                                 </span>
                                        </td>                                        
                                    </tr>
									<tr>
										<td  align="<%=Resources.Resource.align%>" class="txt txt-bold"><label ><%=Resources.Resource.message_name%></label></td>
									</tr>
                                    <tr>
                                       
                                        <td  >
                                            <asp:TextBox ID="tbnameProject" CssClass="tb" runat="server" ></asp:TextBox>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <%-- <tr>
                                       
                                        <td  >
                                          <div style="font-weight:bold; color:Red; font-size:16pt">לתשומת לבכם! עקב עומסים לקראת הבחירות. נא לתאם מועד שליחה עם המשרד. 0524224224</div>
                                        </td>
                                    </tr>--%>
                                    <tr style="display:none">
                                        <td align="<%=Resources.Resource.align%>">
                                            <label>
                                                <%=Resources.Resource.type_of_project%></label>
                                        </td>
                                        <td align="right">
                                            <asp:DropDownList ID="DDLtypeProject"  CssClass="textbox" runat="server" 
                                                Width="184px" >
                                            </asp:DropDownList>
                                        </td>
                                       
                                    </tr>
                           <%--      <tr>
                                    <td >
                                    
                                            <asp:CheckBox ID="chooseExistingProject" runat="server" CssClass="txt txt-bold" Text="בחרית פרויקט קיים" 
                                             onclick="displayDDLproject();"   />
                                               <asp:DropDownList ID="DDLexistingProjects"  runat="server" Width="160px">
                                            </asp:DropDownList>
                                             </td>
                                  
                                      
                                    </tr>--%>
                                    <tr>
                                        <td>
                                            <div class="step-line" style="width:330px"></div>
                                        </td>
                                    </tr>
                                   <%-- <tr>
                                        <td colspan="2" >
                                           <label class="txt"> צור פרוייקט בו תוכל להקליט הודעתך ולשלוח לרשימת חברים</label>
                                        </td>
                                    </tr>--%>
                                </table>
                                </div>
				</fieldset>
				
				<fieldset title="<%=Resources.Resource.stage_2%>">
                  <legend><%=Resources.Resource.record_message%></legend>
                  	<table  width="100%">
                        <tr>
                            <td valign="top" width="85%"><legend><%=Resources.Resource.record_message%></legend></td>
                            <td valign="top"> <div style="position:absolute">  
                                <img src="images/step/spix-logo-voicestep.png" /> </div></td>
                        </tr>
                    </table>
					 <div id="recorde" class="divstep" style="direction:<%=Resources.Resource.dir%>;text-align:<%=Resources.Resource.align%>">
                        <table cellpadding="5" cellspacing="5">
                            <tr>
                                        <td colspan="2" style="float:<%=Resources.Resource.align%>">
                                            <span class="txt">
                                               <%=Resources.Resource.choose_from_one_options%></span>
                                        </td>
                                    </tr>
							<tr align="<%=Resources.Resource.align%>">
								<td >
									<input checked="checked" id="radio2" onclick="chooseUpFile(2);" type="radio" name="group1" value="1" /> <label class="txt-bold"><%=Resources.Resource.record_by_telephone%></label>
							
									<input id="radio3" onclick="chooseUpFile(1);" type="radio" name="group1" value="1" /><label class="txt-bold"><%=Resources.Resource.upload_voice_file_computer%></label>
									<input id="radio4" onclick="chooseUpFile(3);" type="radio" name="group1" value="1" /><label class="txt-bold"><%=Resources.Resource.my_recordings%></label>
								</td>
							</tr>
                            <tr>
                                <td><div class="step-line"></div></td>
                            </tr>
							<tr>
								<td colspan="2">
									<div id="divRecordByPhone" >
										<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <table cellpadding="5" cellspacing="5">
                                   
                                    
                                    <tr>
                                        <td>
                                             <%=Resources.Resource.enter_your_telephone_Spix_call%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="<%=Resources.Resource.align%>">
                                            
                                            <asp:TextBox ID="TBrecordNumPhone" CssClass="call-button" runat="server"></asp:TextBox>
                                             <input id="Button1" type="button"  class="call-button-txt"  value="<%=Resources.Resource.dial%>"   onclick="callByPhone();"/>
                                   
                                            <asp:HiddenField ID="HidNameFile" runat="server" />
                                            <asp:HiddenField ID="HFrecordOrUploadDiv" runat="server" />
                                            <asp:HiddenField ID="HFrecord" runat="server" Value="0" />
                                            <asp:HiddenField ID="HFupload" runat="server" Value="0" />
                                            <asp:HiddenField ID="HFauodioOrExcel" runat="server" Value="0" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                       
                                        <script src="player/audio-player.js" type="text/javascript"></script>
                                         

											<p id='audioplayer_N'></p>

											<%--<script type='text/javascript'>
											 AudioPlayer.embed('audioplayer_N', { 
											 soundFile: 'streamFile.aspx?streamFile=go'});
											 </script>--%>
                                            
                                            <asp:Label runat="server" ID="lblCallRecoirdMsg"  Visible="False" />
                                            
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
									</div>
									<script>
									    //321321
									</script>
									<div id="divMyfiles" style="display:none">
										<div style="float: <%=Resources.Resource.align%>"><B> <%=Resources.Resource.my_recordings%><B></div>
										<table width="100%" dir="<%=Resources.Resource.dir%>">
										<tr>
										<td>
										<asp:ListBox style="text-align: right" ID="listMyFiles"  runat="server" Font-Size="13px" Height="100px"  Width="250px">
										
										</asp:ListBox>
										    </td>
                           
								<td>
									<center><p id='audioplayer_N3'> <%=Resources.Resource.choose_file_for_listening%></p></center>
        
								</td>
							</tr>
                        </table>
                        <div><input type="button"  id='btn_deleterecord'  value="<%=Resources.Resource.delete_record%>"  class="step-buttton" />  </div>
                                          
									</div>
									<div id="divUpload" style="display:none">
										
										<table cellpadding="5" cellspacing="1">
                           
                            
                            <tr>
                                <td>
                                  <%=Resources.Resource.please_upload_MP3_WAV%>
                                   <%-- אנא טען את הקובץ הרצוי (בפורמט mp3)--%>
                                </td>
                            </tr>
                            <tr>
                            
                                <td align="center">
                                <%--<input type="button" id="uploadFile" value="Upload File" onclick="return uploadFile_onclick()" />--%>&nbsp;
                                      <div id="Div1" >
		                                    
		                                    <input class="fileUpload" type="file" name="fileUploadMsg" id="fileUploadMsg"  />
                                        <%-- <input type="text" id="fileNameMsg" readonly="readonly" style="border:0px;font: 13px Arial" value="<%=Resources.Resource.no_file_selected%>" />
                                            <input type="button" id="upfilemsg" style="cursor:pointer;float:<%=Resources.Resource.align%>;font: 13px Arial" value="<%=Resources.Resource.select_file%>"  />
                                            <input type="file" id="FileUploadMsg"  name="FileUploadMsg" style="display:none" onchange="document.getElementById('fileNameMsg').value = (this.value).replace(/^.*[\\\/]/, '')" />--%>
    		                              <!--  <button type="submit" id="btn">Upload Files!</button>-->
    	                                
                                  	<div id="response"></div>
		                                <ul id="image-list">
                                 
		                                </ul>
	                                </div>
                                   <%-- <asp:FileUpload ID="FileUploadAuodio" class="uploadfile" runat="server" />--%>
         
		
                                </td>
                            </tr>
							<tr>
								<td>
									<center><p id='audioplayer_N2'> <%=Resources.Resource.please_upload_the_file%></p></center>
        
								</td>
							</tr>
                        </table>
									</div>
								</td>
							</tr>
                          </table>
							<table style="display:none" class="widthTableStep">
                            <tr>
                                <td>
                                    <label id="nameP1"></label>
                                    <%--<span name="txtProjectName">�� ������</span>--%>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:RadioButtonList TextAlign="Right" ID="CBrecrdType" runat="server" Width="406px"
                                        Height="167px">
                                        <asp:ListItem Enabled="false" Text="<span class='radio' >���� ������� ��������</span>" Value="3" />
                                        <asp:ListItem Text="<span class='radio'>���� ������� ���� �����</span>" Value="4" />
                                        <asp:ListItem Text="<span class='radio'>��� ���� ���</span>" Value="5" />
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                        </table>
                    </div>
				</fieldset>
				
				
				<fieldset title="<%=Resources.Resource.stage_3%>">
                  <legend><%=Resources.Resource.choose_recipients%></legend>
                  		<table  width="100%">
                        <tr>
                            <td valign="top" width="85%"><legend>	<%=Resources.Resource.choose_recipients%></span><%=Resources.Resource.when_uploading_file%>  <span></legend></td>
							  
                            <td valign="top"> <div style="position:absolute">  
                                <img src="images/step/spix-logo-voicestep.png" /> </div></td>
                        </tr>
                    </table>
				<div class="divstep" style="text-align:<%=Resources.Resource.align%>">
					
					<div  id="insertPhoneNumber" class="divstep" style="text-align:<%=Resources.Resource.align%>">
					<div id="divMaillist" class="divstep" style="display:none;text-align:<%=Resources.Resource.align%>">
					
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
						
                        <ContentTemplate>

                        <asp:Button ID="hidden_addperson" runat="server" Text="hidden_addperson" AutoPostBack="True" 
                                onclick="hidden_addperson_Click"  style="display:none;" /><%--1509--%>
								<table class="widthTableStep" style="direction:<%=Resources.Resource.dir%>" >
                                    <tr style="background-image:url(images/step/table-top.jpg);height:60px">
                                        <td colspan="2" style="padding-right: 10px;"><%--
                                            <label  class="divstep-title">בחר רשימת תפוצה</label>
											&nbsp;--%>
											<asp:DropDownList ID="DDLmailingList" runat="server"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                                                AutoPostBack="True" Width="150px">
                                            </asp:DropDownList>
											&nbsp;&nbsp;
                                           
											<input type="button" class="step-buttton"  value="<%=Resources.Resource.create_new_list%>" onclick="openDialogNewList()"/>
                                            <input type="button" class="step-buttton" value="<%=Resources.Resource.add_a_contact%>" onclick="openDialogEditMailList()"/>
                                            	<input type="button" class="btexcel" value="<%=Resources.Resource.upload_Excel_file%>" onclick="openDialogImportList()" />
                                                 <input id="chkSelectAll" checked="checked" type="checkbox" onclick="SelectAllCheckboxes(this);" /><span style="font: bold 14px Arial;
color: #6e6e6e;"><%=Resources.Resource.choose_all%></span>
                                        </td>
                                    </tr>
								 <tr>
                                       <td>
                                        <div id="DivCountMailinglist"  style="float:<%=Resources.Resource.align%>" >
                                       <asp:Label id="uploadMailingList" runat="server" ><%=Resources.Resource.contact_list_uploaded_successfully%></asp:Label>
                                        <br/>
                                        <label><%=Resources.Resource.total_records%> </label>
                                        <asp:HiddenField  id="HCountMailinglist" runat="server"/>
                                         <asp:Label id="CountMailingList" runat="server"></asp:Label>
                          
                                        </div>
                                        </td>
                                     </tr>
									<tr>
									
										<td width="40%" colspan="2" align="center" >
											<div align="center"  style="overflow:auto;height:190px" >
                                             <asp:GridView      Width="100%" ID="GridView1" runat="server" Font-Italic="False"   
                                                    AutoGenerateColumns="False"  CssClass="gridview"   
                                                CellPadding="4"  GridLines="Horizontal" OnRowDataBound="GridView1_RowDataBound" >
                                                         <Columns>
                                                                <asp:BoundField  DataField ="id" HeaderText="id" HeaderStyle-ForeColor="Transparent"  ItemStyle-Width="5%"/>
                                                                  <asp:BoundField  DataField ="phone" ItemStyle-Width="25%"/>
                                                                  <asp:BoundField  DataField ="name"  ItemStyle-Width="25%"/>
                                                                  <asp:BoundField   ItemStyle-Width="15%"/>
                                                                  <asp:BoundField   ItemStyle-Width="15%"/>
																   <asp:TemplateField   ItemStyle-Width="15%">
																 <ItemTemplate >
																	<asp:CheckBox ID="chkSel" Checked="true" runat="server"  />
																</ItemTemplate>
															</asp:TemplateField>
                                                         </Columns>
														                  <HeaderStyle CssClass="gridviewLine-header"/>
                                        <PagerStyle CssClass="pagging-gv"/>
                                                 <RowStyle CssClass="gridviewLine" Height="25px"/>
                                                         <AlternatingRowStyle Height="25px"   CssClass="gridviewLine-alternative"/>
                                                 </asp:GridView>
                                                 </div>
										</td>
									</tr>
                                    
                                    <tr>
										<td colspan="2" align="center">
										<asp:Button style=" background-color:Transparent;outline:none;" ID="refreshDdl" Text="" runat="server" OnClick="refreshDdl_click" BorderStyle="None" />
											 <asp:Button style=" background-color:Transparent;outline:none;" ID="okExcel" Text="" runat="server" OnClick="okExcel_Click" BorderStyle="None" />
											 <asp:HiddenField ID="HFcategoryexcel" runat="server" />
											<%-- <input type="button" class="plus" onclick="openDialogEditMailList()"/>
                                            --%>
                                            <asp:HiddenField ID="HFcountRows" Value="0" runat="server" />
										</td>
									</tr>
								
										
  
                                    <tr style="display:none">
                                        <td valign="top" style="border:thin solid black">
                                            <label id="Label1" runat="server" ><%=Resources.Resource.choose_a_distribution_list%></label>
                                            <br />
                                            
                                            <br />
                                            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" 
                                                OnCheckedChanged="CheckBox1_CheckedChanged" />
                                             <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                                
                                             </asp:Panel>
                                           
                                        </td>
                                        <td style="border:thin solid black" valign="top">
											
                                            <label id="Label2" runat="server" ><%=Resources.Resource.add_distribution_list%></label>
                                            <br />
                                            
                                        </td>
                                    </tr>
                                   
                                 
                                </table>
								
                              
                                </ContentTemplate>
                                </asp:UpdatePanel>
                    </div> 
                     <div id="DivImportFromExcel" style="height:500px" dir="<%=Resources.Resource.dir%>">
                                <table>
									<tr>
                                                <td>
                                                    <a href="phonebook.xls" target="_blank" style="outline:none; border:none"><img src="images/demoExcel.png" style="width:170px" /></a>
                                                   
                                                  
                                                </td>
													<td colspan="1" align="center">
                                                       <div class="txt-dialog-ml">
                                                           <label class="txt-dialog-ml">    <%=Resources.Resource.identify_name_and_telephone%></label>
                                                           <ul style="text-align:<%=Resources.Resource.align%>;font-size:11pt">
                                                             <li><b> <%=Resources.Resource.first_column%></b>  <%=Resources.Resource.names_of_contacts%></li>
                                                             <li><b> <%=Resources.Resource.second_column%></b> <%=Resources.Resource.telephone_numbers%> </li>
                                                          </ul>
                                                      </div>
                                                      <div class="txt-dialog-ml">  <%=Resources.Resource.can_upload_Excel%></div>
													
                                                    
                                                    
                                                   
                                                    <div style="font-weight:bold" class="txt-dialog-ml"> <%=Resources.Resource.to_view_demo_file%> <a href="phonebook.xls" target="_blank"><%=Resources.Resource.press_here%></a></div>
												</td>
                                                </tr>
                                                <tr>
                                                 <td><label class="txt-dialog-ml">
                                                 <%=Resources.Resource.enter_contacts_group_name%>
                                                 </label></td>
                                                <td colspan="1"><asp:TextBox ID="TbCategoryNameExcel" style="width:200px" runat="server" CssClass="tbRegister"></asp:TextBox>
                                                &nbsp;<img src="images/Excel-icon.png" /></td>
                                           
                                            </tr>
                                            <tr>
                                            <td colspan="2">
                                            <br />
                                            <input style="width:400px;"  type="file" name="FileUploadExcel" id="FileUploadExcel"  />
                                       <%--  <input type="text" id="fileName" readonly="readonly" style="border:0px;font: 13px Arial" value="<%=Resources.Resource.no_file_selected%>" />
                                            <input type="button" id="upfile1" style="cursor:pointer;float:<%=Resources.Resource.align%>;font: 13px Arial" value="<%=Resources.Resource.select_file%>"  />
                                            <input type="file" id="FileUploadExcel"  name="FileUploadExcel" style="display:none" onchange="document.getElementById('fileName').value = (this.value).replace(/^.*[\\\/]/, '')" />--%>
                                            <%--<asp:FileUpload ID="FileUploadExcel" runat="server" Width="217px" 
                                                        style="margin-top: 0px" />--%>
                                                    
                                           <%-- <asp:Button style=" background-color:Transparent;" ID="okExcel" Text="אישור" runat="server" OnClick="okExcel_Click" BorderStyle="None" />--%>
                                            </td>
                                                                       
												</tr>
                                               
								</table>
                                </div>
								<script type="text/javascript">
								    //$(document).ready(function() {


								    //});
								</script>  
                     <div id="divMaillistDefualt" class="divstep" style="text-align:<%=Resources.Resource.align%>" >       
                         <asp:UpdatePanel ID="UpdatePanel2" runat="server" >
                            <ContentTemplate>
                                <table dir="ltr" class="widthTableStep" style="direction:<%=Resources.Resource.dir%>;float:<%=Resources.Resource.align%>">
                                    
                                    <tr>
                                        <td colspan="2">
                                        <label id="nameP5"></label>
                                            <%--<span  name="txtProjectName">�� ������</span>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                         
                                             <%=Resources.Resource.enter_or_choose_telephone_numbers%> 
                                            
                                            <span   onclick="chooseListMailing(1)"><%--onclick ="checkOkPass()"--%>
                                                <label style="color: Blue; cursor:pointer">
                                                    <%=Resources.Resource.from_distribution_list%> </label></span>
                                        </td>
                                    </tr>
                                 <%--     
                                    <tr>
                                    <td colspan="2"> <label>הזן מספר טלפון והוסף לרשימה</label></td>
                                    </tr>--%>
                                    
                                     <tr>
                                        <td valign="top">
										
                                            
                                          
                                                <br />
												<div style="padding-top:10px;">
												<label><%=Resources.Resource.total%> </label>
												<asp:Label id="countAdd"  runat="server">0</asp:Label>
											<label><%=Resources.Resource.recipients%> </label>
											</div>
                                                <asp:HiddenField ID="HfInsertOrChoose" runat="server" Value="1" />
                                            <asp:HiddenField ID="hfNumAddressee" runat="server" />
                                            <asp:HiddenField ID="hfUserCredit" runat="server" />
                                            <br />
                                              <asp:Button ID="BdeleteItemListBox" runat="server" CssClass="step-buttton"   
                                                onclick="BdeleteItemListBox_Click"  Width="125px"  />
                                            
                                        </td>

                                        <td  valign ="top"  align="center">
                                            
                                            <asp:TextBox ID="TBaddPhone"  runat="server" CssClass="call-button"></asp:TextBox>
                                       
                                            <asp:Button ID="b_addPhone" runat="server" CssClass="call-button-txt" Width="50px" 
                                                OnClick="b_addPhone_Click"  onClientClick="return ValidatePhoneNumber()" />
                                                 <br />
                                            <asp:ListBox ID="LBaddPhone" runat="server" Font-Size="13px" Height="180px" Width="220px" SelectionMode="Multiple"></asp:ListBox>
                                           
                                        </td>
                                    </tr>
 
                                   <%-- <tr>
                                        <td>
                                            <asp:TextBox ID="TBaddPhone" CssClass="textbox" runat="server"></asp:TextBox>
                                        </td>
                                        <td rowspan="2" valign ="top">
                                            <asp:ListBox ID="LBaddPhone" runat="server" Height="106px"  ></asp:ListBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:Button ID="b_addPhone" CssClass="Cbutton" runat="server" Text="����" OnClick="b_addPhone_Click" />
                                        </td>
                                    </tr>--%>
     
                                </table>
								</ContentTemplate>
                        </asp:UpdatePanel>
                       </div>
								<div  id="editMailList">
                                <table width="100%" cellspacing="10" dir="<%=Resources.Resource.dir%>">
										
												<tr>
													<td><label class="txt-dialog-ml"><%=Resources.Resource.name_%></label> </td>
                                                    <td>     <asp:TextBox ID="namePerson"  Text=""  style="width:200px" runat="server" class="tbRegister" ></asp:TextBox>
												
													</td>
												</tr>
												<tr>
													
													
                                                    <td><label class="txt-dialog-ml"><%=Resources.Resource.phone_%></label>	</td>
                                                    <td>
                                                        <asp:TextBox ID="phonePerson" Text="" runat="server"  style="width:200px" class="tbRegister"></asp:TextBox><asp:HiddenField ID="HFidPerson" runat="server" />
                                                    </td>
												</tr>
											
											</table>
										</div>
								<div  id="AddPersonToBigList">
                                <table width="100%" cellspacing="10">
										
												<tr>
													<td><label class="txt-dialog-ml"><%=Resources.Resource.too_large_distribution_list%></label> </td>
												</tr>
                                                <tr>
											 <td><label class="txt-dialog-ml"><%=Resources.Resource.to_edit_or_add_contact%></label> <a id='linkEditList'  href="mailingList.aspx" style="color:Blue;text-decoration:underline"> לחץ כאן </a></td>
                                             </tr>
										
											</table>
										</div>
								              <%-- tamar--%>
                                <div  id="return_phone">
                                              <table width="100%" cellspacing="10">
										
												<tr>
													<td colspan="2"><label class="txt-dialog-ml"><%=Resources.Resource.enter_number_of_representatives%></label> </td>

												</tr>
												<tr>
                                                    <td><label class="txt-dialog-ml"><%=Resources.Resource.phone%></label>	</td>
                                                    <td>
                                                        <asp:TextBox ID="phone_return" runat="server"  style="width:200px" class="tbRegister"></asp:TextBox>
                                                    </td>
												</tr>

                                                <tr>
                                                    <td><label class="txt-dialog-ml"><%=Resources.Resource.number_of_representatives%></label>	</td>
                                                    <td>
                                                        <asp:TextBox ID="num_agents" runat="server"  style="width:35px;" class="tbRegister"></asp:TextBox>
                                                    </td>
												</tr>

											
											</table>
								</div>		

                             <asp:HiddenField ID="hidden_return_phone" runat="server" />
                             <asp:HiddenField ID="hidden_num_agents" runat="server" />
								
										
										<div id="divDeletePerson" style="text-align:center">
                            <label class="txt-dialog-ml"><%=Resources.Resource.choose_the_desired_option%></label>
                        </div>
                            
                   
				      </div>
                     
				      </div>
				</fieldset>
				<fieldset title="<%=Resources.Resource.stage_4%>">
                  <legend><%=Resources.Resource.advanced_additional_services%></legend>
						<table dir="rtl" width="100%" >
                        <tr>
                            <td valign="top" width="85%"><legend><%=Resources.Resource.advanced_additional_services%></legend></td>
                            <td valign="top"> <div style="position:absolute">  
                                <img src="images/step/spix-logo-voicestep.png" /> </div></td>
                        </tr>
                    </table>
					 <div  id="postVoiceMail" class="divstep" style="text-align:<%=Resources.Resource.align%>">
                        <table width="90%" cellpadding="5" cellspacing="5" class="widthTableStep" dir="<%=Resources.Resource.dir%>" style="float:<%=Resources.Resource.align%>" >
                      
                       
                            <tr>
                                <td colspan="2">
                                    <label  >
 <%=Resources.Resource.can_choose_one_option%>                                        </label>
                                </td>
                            </tr>
                           <tr>
                                <td width="40%">
                                    <input id="radio0" onchange="selectMoreOptions()" type="radio" name="groupMore" value="0" checked="checked"/><label class="txt txt-bold"> <%=Resources.Resource.regular_message%></label>
                                </td>
                                <td width="60%">
                                    <span class="txt"> <%=Resources.Resource.message_immediately_sent%></span>
                                </td>
                            </tr>
                            <tr> <td colspan="2"><div class="step-line" style="width:375px"></div></td></tr>
                            <tr>
                                <td width="40%">
                                    <input type="radio"  onchange="selectMoreOptions()"   name="groupMore" value="1" /><label class="txt txt-bold"> <%=Resources.Resource.Request_approval%></label>
                                </td>
                                <td width="60%">
                                       <span class="txt">
                                        <%=Resources.Resource.at_the_end%></span>
                                </td>
                            </tr>
                            <tr style="display:none"> <td colspan="2"><div class="step-line" style="width:375px"></div></td></tr>
                            <tr style="display:none">
                                <td width="40%">
                                    <input type="radio"  onchange="selectMoreOptions()" disabled="disabled" name="groupMore" value="2" /><label class="txt txt-bold"><%=Resources.Resource.record_reply_message%></label>
                                </td>
                                <td width="60%">
                                      <span class="txt">
                                       <%=Resources.Resource.after_hearing_the_message%></span>
                                        <asp:HiddenField ID="HfProjectExample" runat="server" Value="3" />
                                </td>
                            </tr>

							<textbox></textbox>
							                           <%-- tamark--%>
                            <tr> <td colspan="2"><div class="step-line" style="width:375px"></div></td></tr>
                            <tr style="display:none">
                                <td width="40%">
                                    <input id="radio1" onchange="selectMoreOptions()" type="radio" name="groupMore" value="3" /><label class="txt txt-bold"><%=Resources.Resource.return_to_representative%> </label>
                                </td>
                                <td width="60%">
                                    <span class="txt"><%=Resources.Resource.end_of_hearing_the_message%> </span>
                                </td>
                            </tr>


                             <%--  ללא אישור--%>
                             <tr>
                                <td width="40%">
                                    <input type="radio" onchange="selectMoreOptions()"  name="groupMore" value="4" /><label class="txt txt-bold">בקשת אישור על קבלת המסר - ללא</label>
                                </td>
                                <td width="60%">
                                      <span class="txt">בתום השמעת ההודעה יתבקש הנמען ללחוץ על מקש כדי לאשר את קבלת המסר.</span>
                                      <span style="font-weight: bold;">ללא הודעת מערכת ספיקס על בקשת האישור</span> 
                                </td>
                            </tr>

                            </table>
                    </div>
				</fieldset>
				<fieldset title="<%=Resources.Resource.stage_5%>">
                  <legend><%=Resources.Resource.send_message%></legend>
						<table dir="rtl" width="100%">
                        <tr>
                            <td valign="top" width="85%"><legend><%=Resources.Resource.send_message%></legend></td>
                            <td valign="top"> <div style="position:absolute">  
                                <img src="images/step/spix-logo-voicestep.png" /> </div></td>
                        </tr>
                    </table>
					 <div >
                        <table  class="divstep" width="60%" style="text-align:<%=Resources.Resource.align%>;direction:<%=Resources.Resource.dir%>">
                       
                          <%--  <tr>
                                <td colspan="2">
                                    <label  class="txt txt-bold">סיכום:</label>
                                </td>
                            </tr>--%>
                           <tr><td><label class="txt"><%=Resources.Resource.before_sending%></label></td></tr>
                            <tr>
                                <td colspan="2">
                                    <label class="txt"><%=Resources.Resource.the_message%>                         <label id="nameMsg" class="txt"></label>
                                    <label class="txt"><%=Resources.Resource.send_to%> </label>
                                    <asp:Label runat="server" id="countNumbers" Text="0" class="txt" ></asp:Label>
                                     <asp:Label class="txt" ID="l_numAddress" runat="server" Text=""></asp:Label>
                                   <%--<label id="countNumbers" >0</label>--%>
                                    <label class="txt"> <%=Resources.Resource.recipients%></label>
                                     <label class="txt" id="nameCategoryPost"></label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <label class="txt"><%=Resources.Resource.the_message_source%></label>
                                    <label class="txt" id="msgSource"></label>
                                    <asp:Label class="txt" ID="l_nameFile" runat="server" Text=""></asp:Label> 
                                          
                                                                        
                                  
                                </td>
                            </tr>
                            <tr><td colspan="2"> <label class="txt" id="lblMore">  <%=Resources.Resource.additional_none%></label></td></tr>
						
							<tr>
								<td>
									<span class="txt"> <%=Resources.Resource.approximate_balance%>   </span>
									<span class="txt" id="sumMsgCredit"></span>
									<%--<span class="txt">הודעות</span>--%>
								</td>
                                </tr>
                               <%-- <tr>
								<td>
								    <span class="txt">פרטי חיוב משוער: חשבונך יחוייב ב</span>
									<span class="txt" id="sumMinusMsg"></span>
									<span class="txt">הודעות - עבור הודעות שיתקבלו</span>
								</td>
							
							</tr>--%>
                            <tr><td><span class="txt"> <%=Resources.Resource.account_actually_charged%>  </span></td></tr>
                    <%--        <tr><td><span class="txt">עכשיו זה פשוט לדבר לכולם!</span></td></tr--%>
                            <tr><td><div class="step-line" style="width:370px"></div></td></tr>
						<tr>
                            <td>
                                <table align="center" cellpadding="8" >
                                    <tr>
                                        <td align="center"> 
                                         <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                          <ContentTemplate>
                  <%--<asp:DropDownList id="ddlSendHour" runat="server" 
                                                onselectedindexchanged="ddlSendHour_SelectedIndexChanged" 
                                                AutoPostBack="True"></asp:DropDownList>--%>


                                                </ContentTemplate>
                                        </asp:UpdatePanel>
                                            <select id="ddlSendHour" name="ddlSendHour" class="tb">
                           
                                                <option value="1" > <%=Resources.Resource.immediate_sending%>  </option>
                                                <option value="2"> <%=Resources.Resource.select_time_to_send%>  </option>
                                            </select></td>
                                        <td align="center">  <asp:Button ID="B_send" CssClass="sendbtn"   runat="server"  OnClick="B_send_Click" /><br /><span id="txtsendnow" class="txt txt-bold" > <%=Resources.Resource.sent_when_I_made%></span></td>
                                        <td align="center">    <asp:Button ID="B_save" CssClass="savebtn"  runat="server" OnClick="B_save_Click"  /><br /><span class="txt txt-bold" > <%=Resources.Resource.save_and_edit_later%></span></td>
                                        <td align="center"  style="vertical-align: top;">   <span ID="lErrorCredit" runat="server" style="color:Red;font-size:14px;"> <%=Resources.Resource.balance_not_contain_enough%></span></td>
                                    </tr>
                                    <tr>
                                   <td style="vertical-align: top;margin-top: -30px;display: block;">
                                       <div id="Div_DatePicker" style="display:none;">
                                        <label id="Lbl_Date" > <%=Resources.Resource.date%></label> 
                                        <input type="text" id="datepicker" class="tb" style="width:150px;text-align:center" name="datepicker"/>
                                        <br />
                                        <label id="Lbl_Between" style="margin-right: 20px" > <%=Resources.Resource.between%></label> 
                                                <input id="timepickerfrom" name="timepickerfrom"  class="tb" style="width:60px;text-align:center;margin-top:10px"/>
                                    
                                             <label id="Lbl_To" style="margin-right:13px"> <%=Resources.Resource.to%></label>
                                            <input id="timepickerto" name="timepickerto"  class="tb" style="width:60px;text-align:center;margin-top:10px"/>
                                          </div>   
                                    </td>
                                   <%--  <td align="center" style="vertical-align: top;"><span id="txtsendnow" class="txt txt-bold"  style="margin-top: -15px;display: block;">שלח כעת</span></td>
                                        <td align="center"  style="vertical-align: top;"><span class="txt txt-bold" style="margin-top: -15px;display: block;">שמור</span></td>
                                        <td align="center"  style="vertical-align: top;">   <span ID="lErrorCredit" runat="server" style="color:Red;font-size:14px;">אין ביתרתך מספיק הודעות כדי לשלוח כעת!!</span></td>--%>
 
                                    
                                        <td align="center"> 
                                            <asp:Panel ID="Panel2" runat="server">
                                                    <button id="openVerifyDialog_link" title="לחץ כאן כדי להגדיר את מספר הטלפון שיוצג בעת קבלת השיחה"  style="cursor:pointer;margin-top: 6px;" class="linkverify1"><%=Resources.Resource.define_caller_ID%></button> 
                                            </asp:Panel>  
                                          <asp:UpdatePanel ID="UpdatePanel4" runat="server">                                                                                  
                                              <ContentTemplate>    
                                                                                                                                            
                                                 <asp:Button ID="BT_updateverify" CssClass="btn_verify" runat="server" Text="Button"  onclick="BT_updateverify_Click"  />                  
                                                 <asp:CheckBox ID="CB_RecNum" runat="server"  />                                                
                                              </ContentTemplate>
                                           </asp:UpdatePanel>
                                                                                            
                                        </td>
                                        <td align="center">
                                                  <img src="images/icon-menu/Refresh-2-icon.png" style="margin-bottom: -5px;" />
                                                  <span><%=Resources.Resource.try_again%></span>                                                 
                                                     <select id="select_count_loop" name="select_count_loop" style="width:45px;height:26px">
                                                        <option value="1">0</option>
                                                        <option value="2">1</option>
                                                        <option value="3" selected="selected">2</option>
                                                      <!--  <option value="4" >3</option>
                                                        <option value="5">4</option>
                                                        <option value="6">5</option> -->
                                                    </select>
                                        </td>
                                      
                                       
                                       
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        </table>
                    </div>
				</fieldset>
			
	</div>
	

		 </form>             
      <div id="iframe2" style="overflow:hidden;"  >
          <iframe id="frmverifyPhonestep" src=""  height="500px" width="730px !important" style="width:730px !important" ></iframe>
      </div>
<div id="dialog-confirm" >
  <p><label class="txt-dialog-ml" ><%=Resources.Resource.end_time_cannot_greater%>
  </label>
  </p>
</div>
	</body>
</html>


