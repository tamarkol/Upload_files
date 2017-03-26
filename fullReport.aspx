<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fullReport.aspx.cs" Inherits="fullReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<body onload="printpage()">
<script type="text/javascript">

    function printpage() {


        var prtContent = document.getElementById('GridViewProjects');
        prtContent.border = 0; //set no border here
        var WinPrint = window.open('', '', 'left=100,top=100,width=500,height=1000,toolbar=0,scrollbars=1,status=0,resizable=1');
        //var WinPrint = window.open('', '', 'left=100,top=100,width=500,height=500');
        WinPrint.document.write(prtContent.outerHTML);
       WinPrint.document.close();
        WinPrint.focus();
        window.close();
        WinPrint.print();
        WinPrint.close();
       
    }
</script>
    <form id="form1" runat="server">
    <div>
           <asp:GridView    Width="100%" ID="GridViewProjects" runat="server"
              Font-Italic="False"  
        Font-Size="10pt"  AutoGenerateColumns="False"  CssClass="gridview"
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        Font-Names="Arial" ForeColor="Black" GridLines="Horizontal" 
        EmptyDataText="אין נמענים לפרויקט זה" 
               onrowdatabound="GridViewProjects_RowDataBound" 
               EnableModelValidation="True"  
        >
            <Columns>                 
           
             <asp:BoundField  DataField ="idPersonOfList" ControlStyle-ForeColor="White" >
                       
<ControlStyle ForeColor="White"></ControlStyle>
                <ItemStyle ForeColor="Transparent" />
                </asp:BoundField>
             <asp:BoundField  DataField ="accept" HeaderText="אישור" Visible="false"/>
             <asp:BoundField  DataField ="play" HeaderText="השמעה"  Visible="false"/>
              <asp:BoundField  DataField ="phone" HeaderText="טלפון"/>
              <asp:BoundField  DataField ="name" HeaderText="שם"/>    
              <asp:BoundField  DataField ="status" HeaderText="סטאטוס"/>
                          
            </Columns>
            </asp:GridView>
    </div>
    </form>
</body>
</html>
