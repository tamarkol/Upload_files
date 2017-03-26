<%@ Page Language="C#" AutoEventWireup="true" CodeFile="projectDetails.aspx.cs" Inherits="projectDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.Triggersw3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

  
    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
</script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.3.min.js">
</script>

 <script src="player/audio-player.js" type="text/javascript"></script>
       <script type="text/javascript">
           AudioPlayer.setup("player.swf", {
               width: 290
           });  
       </script>
<script type ="text/javascript">
var iffound=false;
var startInterval;
var temp;
var numTemp=1;
function callByPhone()
{
numTemp++;
    var phoneNumber=document.getElementById("TBrecordNumPhone");
    //Ajax
   // alert("phoneNumber: "+phoneNumber.value);
    
     $.ajax({ type: "GET", url: "streamFile.aspx?record=1&number="+phoneNumber.value+"&temp="+numTemp, crossDomain: true, success: function (result) {
           // alert("result: "+result);
            temp=result;
        }, error: function (xhr, ajaxOptions, thrownError) {
            alert("thrownError: "+thrownError);
        }        });
    
    //2.
   
        //startInterval=setInterval("alert(temp)",5000);
    //alert(temp);
    startInterval=setInterval("ifFileExist(temp)",5000);

}
var filename;
function ifFileExist(temp)
{
//var nameFile=document.getElementById("HidNameFile");
     numTemp++;   
    //alert("begin");
        $.ajax({ type: "GET",
         url: "streamFile.aspx?check=1&nameFile="+temp+"&numTemp="+numTemp,
          crossDomain: true,
           success: function (result)
            {
            //alert(result);
            if(result=="true"||result=="True")
            {
            filename=result;
             alert("Record file OK");
             alert("file: "+temp);
             AudioPlayer.embed('audioplayer_N', { 
 soundFile: 'streamFile.aspx?streamFile='+ temp});
            clearInterval(startInterval);
            }
        }, error: function (xhr, ajaxOptions, thrownError) {
            alert(thrownError);
        }        });
    

}
function displayCalling() {
    var divRing = " <embed src='autop.swf' flashvars='streamFile.aspx?streamFile='"+ temp+" width='1' height='1' align='middle' type='application/x-shockwave-flash' ";
    divRing += "pluginspage='http://www.macromedia.com/go/getflashplayer' /></embed>";

        document.getElementById('divring').innerHTML = divRing;
}
function hideCalling() {


    document.getElementById('calling').style.display = "none";
    document.getElementById('divring').innerHTML = "";
    $(".rowSelected").removeClass("rowSelected");
}
</script>


 <%--<script type='text/javascript'>AudioPlayer.embed('audioplayer_N', { soundFile: 'http://pbx.easyhelp.co.il:90/name.mp3' });</script>";
--%>
 



<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <title>Untitled Page</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #form1
        {
            width: 500px;
            height: 450px;
        }
        </style>
</head>
<body onload="load()">
    

    <script type="text/javascript">
 
    function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;

    return true;
}

    function playMicrophone()
    {
        alert('playMicrophone');
    }
    function stopMicrophone()
    {
        alert('stopMicrophone');
    }
  function playFile(){
        var  file = document.form1.uploadFile.value ;
      
        //play (file);
    }
    function saveMicrophone()
    {
        alert("saveMicrophone");
    }
    var projectName="";
    var level=1;
    var levl_1;
    var levl_2;
    var levl_3;
    var levl_4;
    var levl_5;
    var levl_6;
    var levl_7;
    var levl_8;
    var levl_9;
    var hiddenField;
    function load()
    {
        levl_1=document.getElementById('projectDetails').style;
        levl_2=document.getElementById('recorde').style;
        levl_3=document.getElementById('microphoneRecord').style;
        levl_4=document.getElementById('recordPhone').style;   
        levl_5=document.getElementById('uploadAuodioFile').style;
        levl_6=document.getElementById('insertPhoneNumber').style;
        levl_7=document.getElementById('chooseMaillingList').style;
        levl_8=document.getElementById('postVoiceMail').style;
        //levl_9=document.getElementById('MailingList').style;
        document.getElementById ('back').visibility = 'hidden'; 
        levl_1.display="inline";
        levl_2.display="none";
        levl_3.display="none";
        levl_4.display="none";
        levl_5.display="none";
        levl_6.display="none";
        levl_7.display="none";
        levl_8.display="none";
        //levl_9.display="none";
    }
    function changeDiv(screenNumber)
    {   
    
         document.getElementById ('back').style .display="inline";
      /*  if(next&&level<10)
            level++;
        else 
            if(next==false&&level>1)
                level--;  */ 
            //    alert(screenNumber);  
        switch(screenNumber)
        {
            case 1:
           // tbnameProject
                document.getElementById('back').style .display="none";
                document.getElementById('next').style .display="inline";
                levl_1.display="inline";
                levl_2.display="none";
                levl_3.display="none";
                levl_4.display="none";
                levl_6.display="none";
                levl_7.display="none";
                levl_8.display="none";
              
                break;
            case 2:
                var projectName=document.getElementById('tbnameProject').value;
                document.getElementById('back').style .display="inline";
               document.getElementById('next').style .display="inline";
//                typeProject= document .getElementById ('typeProject').value ;
//                var projectNameText = new Array();
//                 projectNameText=document.getElementsByName('txtProjectName');
//                for(var i=0;i<projectNameText.length;i++)
//                {
//                    projectNameText[i].value=projectName;
//                }
                nameProject(projectName);
                levl_1.display="none";
                levl_2.display="inline";
                levl_3.display="none";
                levl_4.display="none";
                levl_5.display="none";
                levl_6.display="none";
                levl_7.display="none";
                levl_8.display="none";
               
                break;
           case 3:
//          var temp= chooseRadio();
//          if(temp!=3)
//            break;
//            else 
//            {
                document.getElementById('back').style .display="inline";
                document.getElementById('next').style .display="inline";
                levl_1.display="none";
                levl_2.display="none";
                levl_3.display="inline";
                levl_4.display="none";
                levl_5.display="none";
                levl_6.display="none";
                levl_7.display="none";
                levl_8.display="none";
               
                break;
//                }
           case 4:
                document.getElementById('back').style .display="inline";
                document.getElementById('next').style .display="inline";
                levl_1.display="none";
                levl_2.display="none";
                levl_3.display="none";
                levl_4.display="inline";
                levl_5.display="none";
                levl_6.display="none";
                levl_7.display="none";
                levl_8.display="none";
               
                break;
            case 5:
                document.getElementById('back').style .display="inline";
                document.getElementById('next').style .display="inline";
                levl_1.display="none";
                levl_2.display="none";
                levl_3.display="none";
                levl_4.display="none";
                levl_5.display="inline";
                levl_6.display="none";
                levl_7.display="none";
                levl_8.display="none";
                
                break;
            case 6:
                document.getElementById('back').style .display="inline";
                document.getElementById('next').style .display="inline";
                document .getElementById ('HfInsertOrChoose').value='1';
                hiddenField=1; 
                levl_1.display="none";
                levl_2.display="none";
                levl_3.display="none";
                levl_4.display="none";
                levl_5.display="none";
                levl_6.display="inline";
                levl_7.display="none";
                levl_8.display="none";
               
                break;
                case 7:
                document.getElementById('back').style .display="inline";
                 document.getElementById('next').style .display="inline";
                document .getElementById ('HfInsertOrChoose').value='2';
                hiddenField=2; 
                levl_1.display="none";
                levl_2.display="none";
                levl_3.display="none";
                levl_4.display="none";
                levl_5.display="none";
                levl_6.display="none";
                levl_7.display="inline";
                levl_8.display="none";
                
                break;
                    case 8:
                    document.getElementById('back').style .display="inline";
                    document.getElementById('next').style .display="none";
                levl_1.display="none";
                levl_2.display="none";
                levl_3.display="none";
                levl_4.display="none";
                levl_5.display="none";
                levl_6.display="none";
                levl_7.display="none";
                levl_8.display="inline";
                
                break;
//                         case 9:
//                levl_1.display="none";
//                levl_2.display="none";
//                levl_3.display="none";
//                levl_4.display="none";
//                levl_5.display="none";
//                levl_6.display="none";
//                levl_7.display="none";
//                levl_8.display="none";
//                
//                break;
            }
    }
    function nameProject(nameP)
    {
        document.getElementById('nameP1').innerHTML=nameP
        document.getElementById('nameP2').innerHTML=nameP
        document.getElementById('nameP3').innerHTML=nameP
        document.getElementById('nameP4').innerHTML=nameP
        document.getElementById('nameP5').innerHTML=nameP
        document.getElementById('nameP6').innerHTML=nameP
        document.getElementById('nameP7').innerHTML=nameP
    }
    function checkOkPass()
    {
        if(checkListPhone()==false )//if return false the list contain NumberPhone
            linkMailingList();
       else
       {
           var answer = confirm("האם אתה בטוח שברצונך למחוק את מספרי הטלפון?")
	            if (answer)
	            {
		            ListBoxClear();
		            linkMailingList();
                }
        }
    }
    function ListBoxDelete() 
    { 
    
        var list = document.getElementById("LBaddPhone"); 
        var len = list.options.length; 
        for(var i = 0; i < len; i++) 
        { 
        if(list.options[i].selected)
{
            list.options.remove(i); 
            len--;}
        } 
    }
    function checxboxlistChoose(a)
    {
        var i=0;
        var choose=false;
        var elementRef = document.getElementById("checkBoxList1");
        if(elementRef !=null)
        { 
            var checkBoxArray = elementRef.getElementsByTagName('input');
            for( i=0;i<checkBoxArray.length ;i++ )
                if(checkBoxArray[i].checked)
                    choose=true;
        }  
        return choose; 
    }
    function checkListPhone()
    {
        var listPhone= document.getElementById('LBaddPhone');
        if (listPhone!=null)
            return true;
        else 
            return false;
    }
    function linkMailingList()
    {
        changeDiv(7);
        //level++;
        scr=7;
        choosMailingList=true;
    }
    var level=1;//between 1 and 4.
    var scr=0;
    var levelMailingList=false;
    function nextLevel(next)
    {
        var screens=1;//between 1 and 10.
        
        if(next&&level<5)
            if(level==1)
                if(document.getElementById ('tbnameProject').value == "") 
                    alert("הכנס שם פרויקט!");
                else
                    level++;
            else
            {
                //level++;
                if(level==3)
                   /* if(document.getElementById ('FileUploadAuodio').value != "")
                        level++;
                        else;*/
                        level++;
                else
                    if(level==4)
                    {
                        if ( checxboxlistChoose(true )==true || checkListPhone()==true )
                        level++;
                        else;
                     }
                    else
                        level++;
                    }
        else 
            if(next==false&&level>1)
            { 
                if(level==4 && hiddenField==2) 
                    hiddenField=1;
                else          
                    level--;
             } 
             
       // alert(level);
        
        if(level<3  )
        {
            changeDiv(level);
            scr=level;
        }
        else if(level==3)
        {
            chooseRadio();
        } 
        else if(level==4)
        {   
            if(hiddenField!=null)
                if (hiddenField==1)
                 //if(document.getElementById ('HfInsertOrChoose').vaiue=='1')
                    changeDiv(6);//insertPhoneNumber
                 else 
                 {
                    changeDiv (7);//chooseMailingList
                    scr=6;
                    }
            
            else
                 changeDiv(6);//insertPhoneNumber
//            level=7;
        } 
//        else if(level==5)
//        {
//            changeDiv(7)//chooseMaillingList
//        } 
        else if(level==5)
        {
        
        changeDiv(8);//postVoiceMail
        scr=8;
        }
                 
        else
            changeDiv(level);    
    }
    var radioCheck=0;
function chooseRadio()
{
var valueR;
    var radio = document.getElementsByName('<%= CBrecrdType.ClientID %>');
      for (var j = 0; j < radio.length; j++)
            {
                if (radio[j].checked)
                    valueR= radio[j].value;
            }

    if(valueR==3)
    {
        changeDiv(3);
     }
    else if(valueR==4)
          {
             changeDiv(4); 
           }
         else if(valueR==5)
              {
                 changeDiv(5);
              }
            else
            {
                level --;
                  // changeDiv(6);
                 }
}
    function record()
    {
        alert("אינו פעיל זמנית")
    }
    function saveFile()
    {
    
    }
    function saveProject()
    {
    
    }
    function send()
    {
        saveProject();
    }
function b_saveFile_onclick() {

}

function Bdelete_onclick() {

}
function b(x)
{
x.style.height="64px";
x.style.width="64px";
}



    </script>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div class="bigDiv">
        <table width="100%"  class="bigtable">
            <tr>
                <td colspan="3">
                    <div class="divLevels" id="projectDetails">
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <Triggers>
                                <asp:PostBackTrigger ControlID="B_save" />
                            </Triggers>
                            <ContentTemplate>
                                <table cellpadding="15" cellspacing="10">
                                    <tr>
                                        <td colspan="2">
                                            <label class="div-title">
                                                VoiceMail שלב 1 צור:</label>
                                        </td>
                                        <%-- <td colspan="2"><input name="txtProjectName">שם פרויקט</input></td>--%>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="name">
                                                שם הפרויקט</label>
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="tbnameProject" CssClass="textbox" runat="server" Width="234px"></asp:TextBox>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <label>
                                                סוג הפרויקט</label>
                                        </td>
                                        <td align="right">
                                            <asp:DropDownList ID="DDLtypeProject"  CssClass="textbox" runat="server" 
                                                Width="234px" >
                                            </asp:DropDownList>
                                        </td>
                                       
                                    </tr>
                                    <tr>
                                        <td>
                                        
                                            <asp:CheckBox ID="chooseExistingProject" runat="server" Text="." 
                                                oncheckedchanged="chooseExistingProject_CheckedChanged" />
                                        
                                          <label>בחירת פרויקט קיים</label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DDLexistingProjects" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <p>
                                                צור פרוייקט בו תוכל להקליט הודעתך ולשלוח לרשימת חברים</p>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="divLevels" id="recorde">
                        <table cellpadding="15" cellspacing="10">
                            <tr>
                                <td>
                                    <label class="div-title">
                                        שלב 2 הקלט הודעתך:         שלב 2 הקלט הודעתך:</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label id="nameP1"></label>
                                    <%--<span name="txtProjectName">שם פרויקט</span>--%>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:RadioButtonList TextAlign="Right" ID="CBrecrdType" runat="server" Width="406px"
                                        Height="167px">
                                        <asp:ListItem Enabled="false" Text="<span class='radio' >הקלט באמצעות מיקרופון</span>"  Value="3" />
                                        <asp:ListItem Text="<span class='radio'>הקלט באמצעות שיחת טלפון</span>" Value="4" />
                                        <asp:ListItem Text="<span class='radio'>טען קובץ שמע</span>" Value="5" />
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="divLevels" id="microphoneRecord">
                        <table cellpadding="15" cellspacing="10">
                            <tr>
                                <td colspan="2">
                                    <label class="div-title ">
                                        שלב 2- הקלט באמצעות מיקרופון</label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                <label id="nameP2"></label>
                                   <%-- <span name="txtProjectName">שם פרויקט</span>--%>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    נא ודא שהמיקרופון אינו מרוחק, ושאינך במקום רועש ולחץ על הקלט
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Button ID="Bstop" CssClass="Cbutton" runat="server" Text="עצור" onclick="Bstop_Click" />
                                </td>
                                <td align="center">
                                    <asp:Button ID="Bplay" CssClass="Cbutton" runat="server" Text="הקלט" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" onclick="saveMicrophone()">
                                    <asp:Button ID="Bsave" CssClass="Cbutton" runat="server" Text="שמור" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="divLevels" id="recordPhone">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <table cellpadding="15" cellspacing="10">
                                    <tr>
                                        <td>
                                            <label class="div-title">
                                                שלב 2 – הקלט באמצעות הטלפון:</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        <label id="nameP3"></label>
                                           <%-- <span name="txtProjectName">שם פרויקט</span>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p>
                                                נא הזן את מספר הטלפון שברשותך כולל קידומת, הטלפון יצלצל מיידית</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <%--<asp:Button ID="sendCallrecord"  CssClass="Cbutton" runat="server" Text="Send"  />--%>
                                            <input id="Button1" type="button" value="button"  OnClick="callByPhone()"/>
                                            <asp:TextBox ID="TBrecordNumPhone" CssClass="textbox" runat="server"></asp:TextBox>
                                            <asp:HiddenField ID="HidNameFile" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                       
                                        -<%---<script src="player/audio-player.js" type="text/javascript"></script>
                                           <script type="text/javascript">
                                               AudioPlayer.setup("player.swf", {
                                                   width: 290
                                               });  
                                           </script>


<p id='audioplayer_N'>Alternative content</p>--%>

<%--<script type='text/javascript'>
 AudioPlayer.embed('audioplayer_N', { 
 soundFile: 'streamFile.aspx?streamFile=go'});
 </script>--%>
                                            <input type="button" value="השמעה" onclick="displayCalling(1)"/>
                                  
                                            <asp:Label runat="server" ID="lblCallRecoirdMsg" Text="ההקלטה בוצעה בהצלחה" Visible="False" />
                                            <div ID="divring"> </div>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="divLevels" id="uploadAuodioFile">
                        
                     
                        <table cellpadding="15" cellspacing="10">
                            <tr>
                                <td>
                                    <label class="div-title">
                                        שלב 2 – טען קובץ השמעה:
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                <label id="nameP4"></label>
                                    <%--<span name="txtProjectName">שם פרויקט</span>--%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    אנא טען את הקובץ הרצוי (בפורמט mp3 או wav)
                                </td>
                            </tr>
                            <tr>
                            
                                <td align="center">
                                <%--<input type="button" id="uploadFile" value="Upload File" onclick="return uploadFile_onclick()" />--%>&nbsp;
                                      <div id="Div1" >
		                                <h1>Upload Your Images</h1>
		                             
    		                                <input type="file" name="images" id="images"  />
    		                                <button type="submit" id="btn">Upload Files!</button>
    	                                
                                  	<div id="response"></div>
		                                <ul id="image-list">
                                 
		                                </ul>
	                                </div>
                                   <%-- <asp:FileUpload ID="FileUploadAuodio" class="uploadfile" runat="server" />--%>
         
		
                                </td>
                            </tr>
                        </table>
             
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script type="text/javascript" src="upload.js"></script>
                        
                    </div>
                    <div class="divLevels" id="insertPhoneNumber">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <table cellpadding="15" cellspacing="10">
                                    <tr>
                                        <td colspan="2">
                                            <label class="div-title">
                                                שלב 3 – בחר נמענים:</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                        <label id="nameP5"></label>
                                            <%--<span  name="txtProjectName">שם פרויקט</span>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <label>
                                                אנא הזן מספרי טלפון הנמענים או בחר
                                            </label>
                                          
                                            <span   onclick="linkMailingList()"<%--onclick ="checkOkPass()"--%>>
                                                <label style="color: Blue">
                                                    רשימת תפוצה</label></span>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td valign="top">
                                            <asp:TextBox ID="TBaddPhone" CssClass="textbox" runat="server"></asp:TextBox>
                                            
                                            <br />
                                            <asp:Button ID="b_addPhone" runat="server" CssClass="Cbutton" 
                                                OnClick="b_addPhone_Click" Text="הוסף" />
                                                <br />
                                                <asp:HiddenField ID="HfInsertOrChoose" runat="server" />
                                            <asp:HiddenField ID="hfNumAddressee" runat="server" />
                                        </td>
                                        <td  valign ="top">
                                            
                                            <asp:ListBox ID="LBaddPhone" runat="server" Height="106px" ></asp:ListBox>
                                            <br />
                                            <asp:Button ID="BdeleteItemListBox" runat="server" CssClass="Cbutton" 
                                                onclick="BdeleteItemListBox_Click" Text="מחק" />
                                        </td>
                                    </tr>
 
                                   <%-- <tr>
                                        <td>
                                            <asp:TextBox ID="TBaddPhone" CssClass="textbox" runat="server"></asp:TextBox>
                                        </td>
                                        <td rowspan="2" valign ="top">
                                            <asp:ListBox ID="LBaddPhone" runat="server" Height="106px" ></asp:ListBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:Button ID="b_addPhone" CssClass="Cbutton" runat="server" Text="הוסף" OnClick="b_addPhone_Click" />
                                        </td>
                                    </tr>--%>
     
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="divLevels" id="chooseMaillingList">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <table cellpadding="15" cellspacing="10">
                                    <tr>
                                        <td colspan="2">
                                            <label class="div-title">
                                                שלב 3 – בחר רשימת תפוצה
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <label id="nameP6"></label>
                                            <%--<span name="txtProjectName">שם פרויקט</span>--%>
                                        </td>
                                    </tr>
  
                                    <tr>
                                        <td valign="top" style="border:thin solid black">
                                            <label runat="server" >בחר רשימת תפוצה:</label>
                                            <br />
                                            <asp:DropDownList ID="DDLmailingList" runat="server" CssClass="textbox" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                                                AutoPostBack="True" OnTextChanged="DropDownList1_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <br />
                                            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" 
                                                OnCheckedChanged="CheckBox1_CheckedChanged" Text="בחר הכל" />
                                             <asp:Panel runat="server" ScrollBars="Auto">
                                                 <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" 
                                                OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged" 
                                                TextAlign="Right"  >
                                            </asp:CheckBoxList>
                                             </asp:Panel>
                                           
                                        </td>
                                        <td style="border:thin solid black" valign="top">
                                            <label runat="server" >הוסף רשימת תפוצה:</label>
                                            <br />
                                            <asp:Label ID="LinsertCategoryName"  runat="server" Text="שם:"></asp:Label>
                                            
                                            <asp:TextBox ID="TbCategoryNameExcel" runat="server" CssClass="textbox"></asp:TextBox>
                                            <br />
                                            <asp:FileUpload ID="FileUploadExcel" runat="server" Width="217px" />
                                        </td>
                                    </tr>
                                   
                                 
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="divLevels" id="postVoiceMail">
                        <table cellpadding="15" cellspacing="10">
                            <tr>
                                <td colspan="2">
                                    <label class="div-title">
                                        שלב 4 – שליחת voiceMail:</label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><label id="nameP7"></label></td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        שלח הודעה קולית עכשיו אל * נמענים</label>
                                </td>
                                <td>
                                    <label>
                                        או שמור ושלח מאוחר יותר</label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <label>שם הקובץ:<asp:Label ID="l_nameFile" runat="server" Text="Label"></asp:Label>
                                    <br />
                                    ישלח אל<asp:Label ID="l_numAddress" runat="server" Text="Label"></asp:Label>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="B_send" CssClass="Cbutton " runat="server" Text="שלח" OnClick="B_send_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="B_save" CssClass="Cbutton" runat="server" Text="שמור" OnClick="B_save_Click" />
                                </td>
                            </tr>
                            
                        </table>
                    </div>
                   <%-- <div class="divLevels" id="MailingList" title="רשימת תפוצה">
                        <table cellpadding="15" cellspacing="10">
                            <tr>
                                <td colspan="2">
                                    <span name="txtProjectName">שם פרויקט</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="addMailingList">
                                        הוסף רשימת תפוצה</label>
                                </td>
                                <td>
                                    <input type="text" id="addMailingList" name="addMailingList" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="upload">
                                        טען רשימת תפוצה מקובץ</label>
                                </td>
                                <td>
                                    <input type="text" id="upload" name="upload" />
                                </td>
                            </tr>
                        </table>
                    </div>--%>
                </td>
            </tr>
            <tr valign="bottom">
                <td>
                    <input type="button" id="back" onclick="nextLevel(false)" name="back" class="Cbutton"
                        value="הקודם" />
                </td>
                <td width="33%">
                    &nbsp;
                </td>
                <td width="33%" align="left">
                    <input type="button"  id="next"  onclick="nextLevel(true)" name="next" class="Cbutton"
                        value="הבא" />
                </td>
            </tr>
        </table>
    </div>
    </form>
    
    
</body>
</html>
