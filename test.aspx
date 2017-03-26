<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       
                                        <script src="player/audio-player.js" type="text/javascript"></script>
                                          <script type="text/javascript">
                                              AudioPlayer.setup("player.swf", {
                                                  width: 390
                                              });  
                                      
                                               function aa() {
                                                   alert(123);
                                                   AudioPlayer.embed('audioplayer_N2', {
                                                       soundFile: 'streamFile.aspx?streamFile=endCall.mp3'
                                                   });
                                               
                                               }
                                           
                                           </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <input type="button" onclick="aa()"/>
    	<p id='audioplayer_N2'>dddddd</p>
    </div>
    </form>
</body>
</html>
                
