<%@ Page Language="C#" MasterPageFile="~/innerMaster.master"     AutoEventWireup="true" CodeFile="mailingList_old.aspx.cs" Inherits="mailingList" Title="אנשי קשר" %>
<%@ MasterType VirtualPath="~/innerMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta http-equiv="Pragma" content="no-cache"/>
		<meta http-equiv="Expires" content="-1"/>
		
        
		<%--  <script type="text/javascript" src="http://ajax.
        googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>--%>
  
		<!-- Optionaly -->
		<script type="text/javascript" src="js/jquery.validate.min.js"></script>
        <script type="text/javascript" src="fileUpload.js"></script>
		<script type="text/javascript" src="js/jquery.progressbar.min.js"></script>
<%--  <link href="js/themes/base/jquery.ui.dialog.css" rel="stylesheet" type="text/css" />
    <link href="js/themes/base/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
    <link href="js/themes/base/jquery.ui.button.css" rel="stylesheet" type="text/css" />
    <link href="js/themes/base/jquery.ui.core.css" rel="stylesheet" type="text/css" />--%>
   	
		
			<style type="text/css">
			/* This CSS does not belong to the plugin. */
			
			/* This CSS does not belong to the plugin. */
			//body { background: url('img/background.gif');
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
			div#title-target ul.stepy-titles li.current-step { color: #369; }

			/* Example of dynamic class name */
			p.default-buttons { margin-top: 30px; }
			#DDLexistingProjects{display:none;}
		</style>

<script type="text/javascript">
var iffound=false;
        var startInterval;
        var temp;
        var numTemp=1;
        //var nameMaster = "ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder2_";
        
        function clickUpdateDdl() {
           // document.getElementById("ContentPlaceHolder1_ContentPlaceHolder2_refreshDdl").focus();
            //document.getElementById("ContentPlaceHolder1_ContentPlaceHolder2_refreshDdl").click();
            document.getElementById("refreshDdl").focus();
            document.getElementById("refreshDdl").click();
        }
        function clickUpdateExcel() {
            //document.getElementById("ContentPlaceHolder1_ContentPlaceHolder2_okExcel").focus();
           // document.getElementById("ContentPlaceHolder1_ContentPlaceHolder2_okExcel").click();
            document.getElementById("okExcel").focus();
            document.getElementById("okExcel").click();

           
        }
 function checkPhoneNumber()
{
    var x = document.getElementById(nameMaster+"phonePerson").value;
   if (x==null || x=="")
        return false;     
    if(isNaN(x)|| x.indexOf(" ")!=-1||x.length > 10||x.length<9)
    {
        alert("<%=Resources.Resource.wrong_number%>");
	    return false;
    }
    else
        return true;

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
function openDialogNewList() {
    $("#dialogNew").dialog('open');
}
function opendivDeletePerson(idperson) {
    $("#divDeletePerson").dialog('open');
    document.getElementById("ContentPlaceHolder1_ContentPlaceHolder2_HFidPerson").value = idperson;
    $(".ui-dialog-buttonpane button:contains('<%=Resources.Resource.erase_forever%>')").css({ "width": "150px", "fontWeight": "Bold", "float": "right" });
    $(".ui-dialog-buttonpane button:contains('<%=Resources.Resource.remove_from_message%>')").css({ "width": "150px", "fontWeight": "Bold", "float": "right" });
}
function openDialogEditMailList(idperson, phone, nameperson) {
    $("#editMailList").dialog('open');
    //alert("koko");
    if (idperson == null) {
        //   $(".ui-dialog-buttonpane button:contains('עדכן')").button("disable");
        $(".ui-dialog-buttonpane button:contains('<%=Resources.Resource.update%>')").hide();
        $(".ui-dialog-buttonpane button:contains('<%=Resources.Resource.save%>')").show();
        document.getElementById(nameMaster+"namePerson").value = "";
        document.getElementById(nameMaster+"phonePerson").value = "";
    }
    else {
        $(".ui-dialog-buttonpane button:contains('<%=Resources.Resource.save%>')").hide();
        $(".ui-dialog-buttonpane button:contains('<%=Resources.Resource.update%>')").show();
        if (nameperson != null)
            document.getElementById(nameMaster + "namePerson").value = nameperson;
        if (phone != null)
            document.getElementById(nameMaster + "phonePerson").value = phone;
    }
    $(".ui-dialog-buttonpane button:contains('<%=Resources.Resource.save%>')").css({ "width": "65px", "float": "right" });
    $(".ui-dialog-buttonpane button:contains('<%=Resources.Resource.update%>')").css({ "width": "65px", "float": "right" });
    $(".ui-dialog-buttonpane button:contains('<%=Resources.Resource.close%>')").css({ "width": "50px", "float": "left" });
    // $(".ui-dialog-buttonpane button:contains('שמור')").addClass("button-next");

    document.getElementById(nameMaster+"HFidPerson").value = idperson;


}
function openDialogImportList() {
    $("#DivImportFromExcel").dialog('open');
}

//var nameMaster = "ctl00_ContentPlaceHolder1_";
//            $(document).ready(function () {
//                if ($("#ctl00_ContentPlaceHolder1_namePerson").val() == null)
//                    master = "ContentPlaceHolder1_";
var nameMaster = "ContentPlaceHolder1_ContentPlaceHolder2_";

$(document).ready(function () {
//    $("#upfile1").click(function () {
//        $("#FileUploadExcel").trigger('click');
//    });
        if($("#"+nameMaster+"HFcategoryexcel").val()==null)
        nameMaster = "ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder2_";
    $.support.cors = true;
	$('#spaceused1').hide();
	$("#spaceused1").progressBar({ showText: true});
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
    $('#editMailList').dialog({
        autoOpen: false,
        modal: true,
        resizable: false,
        closeOnEscape: true,
        sticky: true,
        width: "320px",
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
                    //$(this).dialog("close");
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


    $('#divDeletePerson').dialog({
        autoOpen: false,
        modal: true,
        resizable: false,
        closeOnEscape: true,
        sticky: true,
        width: "200px",
        title: "<%=Resources.Resource.want_to_erase_this_contact%>",
        buttons: {
            "<%=Resources.Resource.yes_erase_now%>": function () {
                $(this).dialog("close");
                deletePerson(true);
                return true;
            }
        }
    });

    $('#FileUploadExcel').ajaxfileupload({
        'action': 'excel.aspx',
        'valid_extensions': ['xls', 'xlsx','csv'],

        'params': { 'nameCategory': 'excel' },
        'onStart': function () {
           //alert("enter");
            //var a = 1;
            //var nameCategory=document.getElementById("TbCategoryNameExcel").value;
            // document.getElementById("response").innerHTML = "Uploading . . .";
        },
        'onComplete': function (response) {
            //alert("complete");
           //alert(response);
		 		   $('#spaceused1').show();
            $('#DivImportFromExcel').dialog("close");
            document.getElementById(nameMaster+"HFcategoryexcel").value = response;
             document.getElementById("ContentPlaceHolder1_ContentPlaceHolder2_HFcategoryexcel").value = response;
			setTimeout("checkuploadprogress("+response+")", 100);


		  
           
           
			
            //    document.getElementById("response").innerHTML = "הקובץ נשמר בהצלחה";
           // setTimeout("clickUpdateExcel()", 1000);
            //alert((response));
        }
    });



});


function checkuploadprogress(idCategory)
			{
				var urlReq="streamFile.aspx?progressuploadExcel=" + idCategory;					
				$.ajax({ type: "GET", url:urlReq , crossDomain: true, success: function (result) {
                       // alert(result);
						$('#spaceused1').progressBar(result);
                        if(result==100)
							setTimeout("clickUpdateExcel()", 200);//add in cs file: select last category in DDL and set in gridview
						else 
							setTimeout("checkuploadprogress("+idCategory+")", 1000);
                        
                    }, error: function (xhr, ajaxOptions, thrownError) {
                        alert("thrownError: " + thrownError);
                    }

                    });
			}
//	function uploadExcel()
//		//inputExcel.addEventListener("change", function (evt)
// 	 {
// 	 var inputExcel=document.getElementById("FileUploadExcel");
// 	 alert(1);
// 	 if (window.FormData) 
// 	    formdata2 = new FormData();
// 	    alert("ok");
// 	 		var i = 0, len = inputExcel.files.length, img, reader, file;
//	alert(2);
//		for ( ; i < len; i++ ) {
//			file = inputExcel.files[i];
//	//file.name.match('\.xls')
//			//if (!!file.type.match(/audio./*)) 
//			//{
//		alert(3);	    

//				if ( window.FileReader ) 
//				{
//					reader = new FileReader();
//					reader.onloadend = function (e)
//					 { 
//						//showUploadedItem(e.target.result, file.fileName);
//					};
//					reader.readAsDataURL(file);
//				}
//				if (formdata2) {
//					formdata2.append("images[]", file);
//				}
//			alert(4);
//		}
//		var nameCategory=document.getElementById(nameMaster+"TbCategoryNameExcel").value;
//	    //formdata.append("filename",);
//	    alert(5);
//		if (formdata2)
//		 {
//		 alert(formdata2);
//			$.ajax
//			({
//				url: "excel.aspx?nameCategory="+encodeURIComponent(nameCategory),
//				type: "POST",
//				data: formdata2,
//				processData: false,
//				contentType: false,
//				success: function (res) {
//				    //alert(res);
//				   // alert("enter to ajax");
//					//document.getElementById("response").innerHTML = res; 
//					
//					document.getElementById(nameMaster+"HFcategoryexcel").value=res;
//	               document.getElementById(nameMaster+"okExcel").focus();
//	                document.getElementById(nameMaster+"okExcel").click();
//				}
//				, error: function (xhr, ajaxOptions, thrownError) {
//                    alert(thrownError);
//                    //alert("Error");
//                }    
//			});
//		}
	//}

			function updatePerson() 
            {
			       
			        //1. read id+name+phone from div-dialog.
			        var idperson=document.getElementById(nameMaster+"HFidPerson").value;
			        var nameperson=document.getElementById(nameMaster+"namePerson").value;
			        var phonePerson=document.getElementById(nameMaster+"phonePerson").value;
			        var ddllist= window.document.getElementById(nameMaster+"DDLmailingList");
                    var idCategory= ddllist.options[ddllist.selectedIndex].value;
					var urlReq="streamFile.aspx?updatePerson=1&idPerson=" + idperson + "&namePerson=" + encodeURIComponent(nameperson) + "&phonePerson=" + phonePerson + "&idCategory=" + idCategory;
					
				   $.ajax({ type: "GET", url:urlReq , crossDomain: true, success: function (result) {
                        if (result == "true" || result == "True") {
                            var nameP = document.getElementById("name_" + idperson);
                            var phoneP = document.getElementById("phone_" + idperson);
                            //alert(idperson);
                            //alert(nameP);
                            nameP.innerHTML = nameperson;
                            phoneP.innerHTML = phonePerson;
                        }
                        else {
                            //alert(result);
                        }
                    }, error: function (xhr, ajaxOptions, thrownError) {
                        alert("thrownError: " + thrownError);
                    }

                    });
			}
			
            function addPerson()
			{
			        //1. read id+name+phone from div-dialog.
			    var idperson = document.getElementById(nameMaster + "HFidPerson").value;
			        var nameperson=document.getElementById(nameMaster+"namePerson").value;
			        var phonePerson=document.getElementById(nameMaster+"phonePerson").value;
			        var ddllist= window.document.getElementById(nameMaster+"DDLmailingList");
                    var idCategory= ddllist.options[ddllist.selectedIndex].value;
                   // alert(idCategory);
			        //4. ajax - upadte.
			         $.ajax({ type: "GET", url: "streamFile.aspx?addPerson=1&namePerson="+encodeURIComponent(nameperson)+"&phonePerson="+phonePerson+"&idCategory="+idCategory, crossDomain: true, success: function (result) {
                           if(result!=null&&result!="0")
                           {
                               var idperson=result;
			                  //alert("idPerson: "+result)
			                    var x='"';
			                    //Add
//			                    $("#GridView1").append("<tr id='rowid_" + idperson + "' onload=" + x + "this.style.display='none'" + x + " style=" + x + "height:25px;" + x + "><td id='id_296'>" + idperson + "</td><td id='phone_296'>" + phonePerson + "</td><td id='name_296'>" + nameperson + "</td><td><input type='button' class='editbtn' value='����' onclick=" + x + "openDialogEditMailList('" + idperson + "','" + phonePerson + "','" + nameperson + "')" + x + "</td><td><input type='button' class='delbtn' value='X' onclick=" + x + "opendivDeletePerson('" + idperson + "')" + x + "></td></tr></tr>  ");

			                    //$("#ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder2_GridView1").append("<tr id='rowid_" + idperson + "' onload=" + x + "this.style.display='none'" + x + " style='height:25px';" + x + "><td id='id_" + idperson + " '>" + idperson + "</td><td id='phone_" + idperson + "'>" + phonePerson + "</td><td id='name_" + idperson + "'>" + nameperson + "</td><td><input type='button'  class='editbtn' value='ערוך' onclick=" + x + "openDialogEditMailList('" + idperson + "','" + phonePerson + "','" + nameperson + "')" + x + "</td><td><input type='button'  class='delbtn'  value='x' onclick=" + x + "opendivDeletePerson('" + idperson + "')" + x + "></td></tr></tr>  ");
			                   // $("#ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder2_GridView1").prepend("<tr id='rowid_" + idperson + "' onload=" + x + "this.style.display='none'" + x + " style='height:25px';" + x + "><td id='id_" + idperson + " '" + x + " style='color: transparent';" + x + ">" + idperson + "</td><td id='phone_" + idperson + "'>" + phonePerson + "</td><td id='name_" + idperson + "'>" + nameperson + "</td><td><input type='button'  class='editbtn'  onclick=" + x + "openDialogEditMailList('" + idperson + "','" + phonePerson + "','" + nameperson + "')" + x + "</td><td><input type='button'  class='delbtn'   onclick=" + x + "opendivDeletePerson('" + idperson + "')" + x + "></td></tr></tr>  ");
                                $("#ContentPlaceHolder1_ContentPlaceHolder2_GridView1").prepend("<tr id='rowid_" + idperson + "' onload=" + x + "this.style.display='none'" + x + " style='height:25px';" + x + "><td id='id_" + idperson + " '" + x + " style='color: transparent';" + x + ">" + idperson + "</td><td id='phone_" + idperson + "'>" + phonePerson + "</td><td id='name_" + idperson + "'>" + nameperson + "</td><td><input type='button'  class='editbtn'  onclick=" + x + "openDialogEditMailList('" + idperson + "','" + phonePerson + "','" + nameperson + "')" + x + "</td><td><input type='button'  class='delbtn'   onclick=" + x + "opendivDeletePerson('" + idperson + "')" + x + "></td></tr></tr>  ");

        	                    //clear the input
			                    document.getElementById(nameMaster+"namePerson").value="";
			                    document.getElementById(nameMaster+"phonePerson").value="";
                            //Del
                             // $("#rowid_"+idCategory).remove();
                            }
                            }, error: function (xhr, ajaxOptions, thrownError) 
                                {
                                alert("thrownError: "+thrownError);
                                }
                                   
                         });
			//if(return true
			
			//2. find by id - gridview
			//3. innerHtml
			}
			 function deletePerson(deleteFromDB)
			{
			    var idperson=document.getElementById(nameMaster+"HFidPerson").value;
                var retStatus=false;
                var rowid=document.getElementById("rowid_"+idperson);
                var delDB=0;
                if(deleteFromDB)
                    delDB=1;
                     $.ajax({ type: "GET", url: "streamFile.aspx?deletePerson="+ delDB +"&idPerson="+idperson, crossDomain: true, success: function (result) {
                       if(result=="true"||result=="True")
                       {
                       //alert(result);
                         retStatus  =true;
                          $("#rowid_"+idperson).remove();
                        }
                        
                         }});
			}
		 function createNewListPersons()
		 {
			var nameNewList= document.getElementById("txtNewList").value;
			$.ajax({ type: "GET", url: "streamFile.aspx?addNewList=1&nameList="+encodeURIComponent(nameNewList), crossDomain: true, success: function (result) {
            if(result!=null)
           {
               var idList = result;
               setTimeout("clickUpdateDdl()", 1000);

                 /*var newList = document.createElement("option");
                          
                    document.getElementById(nameMaster+"DDLmailingList").options.add(newList);      
                        
                    var ddl=document.getElementById(nameMaster+"DDLmailingList");
                        
                    newList.text = nameNewList;
                    newList.value =idList ;
                   var elOptOld = ddl.options[ddl.selectedIndex];  
                     
                    try 
                    {
                  
                        ddl.add(newList, elOptOld); // standards compliant; doesn't work in IE
                    }
                         
                   catch(ex) 
                    {
                       
                        ddl.add(newList, ddl.selectedIndex); // IE only
                    }*/
            }
            }, error: function (xhr, ajaxOptions, thrownError) 
                {
                alert("thrownError: "+thrownError);
                }
                   
         });
         }

  </script>

   <asp:ScriptManager ID="ScriptManager1" runat="server" />
   <div id="divMaillist" class="tableDashboard"  >
   <asp:UpdatePanel ID="UpdatePanel3" runat="server"> 
                        <ContentTemplate>
						 <p> <%=Resources.Resource.when_uploading_file_%></p>  
                         <div  style=" background-image: url(images/step/table-top.jpg); height: 55px;padding-top:5px">
                                              <%-- <label class="Subtitle" style="margin-right:12px" >בחר רשימת תפוצה:</label>--%>
                             <asp:DropDownList ID="DDLmailingList" runat="server"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" style="width:170px;margin-right:7px" >

                                            </asp:DropDownList>
                                             <input  style="float:left;margin:10px 4px 10px 15px;width:105px" type="button" class="step-buttton" value="<%=Resources.Resource.add_a_contact%>" onclick="openDialogEditMailList()"/>
                                            	<input  type="button" class="step-buttton" value="<%=Resources.Resource.create_mailing_list%>" style="width:120px" onclick="openDialogNewList()"/>
                                            <input type="button"  onclick="openDialogImportList()" value="<%=Resources.Resource.upload_Excel_file%>" class="btexcel" style="margin-right:5px" />
                                           <asp:Button ID="Btn_delete" class="step-buttton" runat="server" style="width:82px"  onclick="Btn_delete_Click"   />
                                         
                            </div>
							<center><div  class="progressBar" id="spaceused1"></div></center>
    	                        <table   dir="<%=Resources.Resource.dir%>"  width="100%">
									<tr>
										<td colspan="2" align="center" >
											
                                             <asp:GridView   Width="100%" ID="GridView1" runat="server" Font-Italic="False"   
                                                     AutoGenerateColumns="False"  CssClass="gridview"
                                                   GridLines="Horizontal" OnRowDataBound="GridView1_RowDataBound"
															EmptyDataText="<center><h1><b></b></h1></center>" AllowPaging="True" 
                                                    onpageindexchanging="GridView1_PageIndexChanging" PageSize="20" >
                                                         <Columns>
                                                                <asp:BoundField  DataField ="id" HeaderText="id" ItemStyle-Width="10%"  HeaderStyle-ForeColor="Transparent"    />
                                                                  <asp:BoundField  DataField ="phone" ItemStyle-Width="30%"/>
                                                                  <asp:BoundField  DataField ="name"  ItemStyle-Width="30%"/>
                                                                  <asp:BoundField    ItemStyle-Width="15%"/>
                                                                  <asp:BoundField   ItemStyle-Width="15%"/>
																 <%--<asp:TemplateField>
            <ItemTemplate>
                <asp:CheckBox ID="chkSel" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>--%>
                                                         </Columns>
                                                             <HeaderStyle CssClass="gridviewLine-header"/>
            <PagerStyle CssClass="pagging-gv"/>
                     <RowStyle CssClass="gridviewLine" />
                                                         <AlternatingRowStyle CssClass="gridviewLine-alternative"/>
                                                 </asp:GridView>
                                             
										</td>
									</tr>
                                    <tr><td><asp:DropDownList   runat="server" ID="ddlPageSize" AutoPostBack="True" 
                                            onselectedindexchanged="ddlPageSize_SelectedIndexChanged"></asp:DropDownList></td></tr>
                                  
								
									
                                </table>
								
                                	<asp:Button style=" background-color:Transparent;outline:none;" ID="refreshDdl" Text="" runat="server" OnClick="refreshDdl_click" BorderStyle="None" />
											 <asp:Button style=" background-color:Transparent;outline:none;" ID="okExcel" Text="" runat="server" OnClick="okExcel_Click" BorderStyle="None" />
											 <asp:HiddenField ID="HFcategoryexcel" runat="server"  />
											
                                             
                                             
                                            <asp:HiddenField ID="HFcountRows" Value="0" runat="server" />
                        </ContentTemplate>
                        </asp:UpdatePanel>
    </div> 
                     <div id="DivImportFromExcel" class="txt-dialog-ml" style="height:500px" dir="<%=Resources.Resource.dir%>">
                                <table>
									<tr>
                                                <td>
                                                    <a href="phonebook.xls" target="_blank" style="outline:none; border:none"><img src="images/demoExcel.png" style="width:170px" /></a>
                                                   
                                                </td>
													<td colspan="1" align="center" class="txt-dialog-ml">
                                                    <div> <%=Resources.Resource.identify_the_names%>
                                                  
                                                    <ul style="text-align:<%=Resources.Resource.align%>;font-size:11pt">
                                                        <li><b><%=Resources.Resource.first_column%></b> <%=Resources.Resource.names_of_contacts%> </li>
                                                        <li><b><%=Resources.Resource.second_column%> </b> <%=Resources.Resource.telephone_numbers%> </li>
                                                    </ul>
                                                    </div>
                                                    <div><%=Resources.Resource.can_upload_Excel%>
													</div>
                                                    <div style="font-weight:bold"><%=Resources.Resource.to_view_demo_file%> <a href="phonebook.xls" target="_blank"><%=Resources.Resource.press_here%> </a></div>
												</td>
                                                </tr>
                                                <tr>
                                                 <td class="txt-dialog-ml">
                                                  <%=Resources.Resource.enter_contacts_group_name%>
                                                 </td>
                                                <td colspan="1"><asp:TextBox ID="TbCategoryNameExcel" runat="server" style="width:200px" CssClass="tbRegister"></asp:TextBox>
                                                &nbsp;<img src="images/Excel-icon.png" /></td>
                                           
                                            </tr>
                                            <tr>
                                            <td colspan="2">
                                            <br />
                                           
                                            
                                            <input style="width:400px;"  type="file" name="FileUploadExcel" id="FileUploadExcel"  />
                                         <%--   <input type="text" id="fileName" readonly="readonly" style="border:0px;font: 13px Arial" value="<%=Resources.Resource.no_file_selected%>" />
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
//								            "אישור": function () {
//								                $(this).dialog("close");
//								                document.getElementById("okExcel").focus();
//								                document.getElementById("okExcel").click();
//								                uploadExcel();
//								                return true;
//								            },
								            "<%=Resources.Resource.cancel%>": function () {
								                $(this).dialog("close");
								                return false;
								            }
								        }
								    });
								    //});
								</script>  
                    
								<div  id="editMailList" class="txt-dialog-ml">
                                <table width="100%" cellspacing="10">
												<tr>
													<td>
                                                        <asp:TextBox ID="namePerson" Width="200px" Text="" runat="server" class="tbRegister" ></asp:TextBox>
												
													</td>
                                                    <td class="txt-dialog-ml"><%=Resources.Resource.name_%> </td>
												</tr>
												<tr>
													<td>
                                                        <asp:TextBox ID="phonePerson" Width="200px" Text="" runat="server" class="tbRegister"></asp:TextBox><asp:HiddenField ID="HFidPerson" runat="server" />
                                                    </td>
                                                    <td class="txt-dialog-ml"><%=Resources.Resource.phone_%> </td>
												</tr>
											
											</table>
										</div>
										<div id="divDeletePerson" style="text-align:center">
                            <span class="txt-dialog-ml"><%=Resources.Resource.press_OK_to_erase_contact%></span>
                        </div>
                            <div id="dialogNew" title="<%=Resources.Resource.creat_list_of_contacts%>"><center>
        <table>
            <tr>
                <td align="center" class="txt-dialog-ml"><%=Resources.Resource.enter_name_of_contacts_list%></td>
            </tr>
            <tr>
                <td><input style="width:200px;" class="tbRegister" type="text" id="txtNewList" /></td>
            </tr>
        </table></center>
    </div>    
             
				     
</asp:Content>

