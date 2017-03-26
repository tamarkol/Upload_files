<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test_upload.aspx.cs" Inherits="test_upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<form action="http://api.spix.co.il/upload.aspx" enctype="multipart/form-data" method="post">

  <input  name="email">

  <input  name="password">

 <input type="file" name="datafile">

 <input  name="urlgood">

 <input  name="errorurl">
                   				        
  <input type="submit" value="Send">

</form>

     
</body>
</html>
