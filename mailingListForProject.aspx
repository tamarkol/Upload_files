<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mailingListForProject.aspx.cs" Inherits="mailingListForProject" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <asp:GridView ID="GVmailingList" runat="server"  
        EmptyDataText="אין נמענים לפרויקט זה" AutoGenerateColumns="False">
        <Columns>
                  <asp:BoundField  DataField ="status" HeaderText="סטטוס"/>
                                      <asp:BoundField  DataField ="phone" HeaderText="מספר"/>
                                      <asp:BoundField  DataField ="name" HeaderText="שם"/>
                                     <asp:BoundField  DataField ="categoryName" HeaderText="קטגוריה"/>
                                     
                                    
        
        </Columns>
    </asp:GridView>
    

    </form>
</body>
</html>
