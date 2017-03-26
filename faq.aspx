<%@ Page Language="C#" MasterPageFile="~/MasterHeader.master" AutoEventWireup="true" CodeFile="faq.aspx.cs" Inherits="about" %>
<%@ MasterType VirtualPath="~/MasterHeader.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
           
        });
        $(document).ready(function () {
            $("#b1").click(function () {                
                $('html, body').animate({
                    scrollTop: $("#p1").offset().top
                }, 2000);
            });

            $("#b2").click(function () {
                $('html, body').animate({
                    scrollTop: $("#p2").offset().top
                }, 2000);
            });

            $("#b3").click(function () {
                $('html, body').animate({
                    scrollTop: $("#p3").offset().top
                }, 2000);
            });

            $("#b4").click(function () {
                $('html, body').animate({
                    scrollTop: $("#p4").offset().top
                }, 2000);
            });

            $("#b5").click(function () {
                $('html, body').animate({
                    scrollTop: $("#p5").offset().top
                }, 2000);
            });

            $("#b6").click(function () {
                $('html, body').animate({
                    scrollTop: $("#p6").offset().top
                }, 2000);
            });

            $("#b7").click(function () {
                $('html, body').animate({
                    scrollTop: $("#p7").offset().top
                }, 2000);
            });

            $("#b8").click(function () {
                $('html, body').animate({
                    scrollTop: $("#p8").offset().top
                }, 2000);
            });

            $("#b9").click(function () {
                $('html, body').animate({
                    scrollTop: $("#p9").offset().top
                }, 2000);
            });
                       

            $("#b10").click(function () {
                $('html, body').animate({
                    scrollTop: $("#p10").offset().top
                }, 2000);
            });
        });
</script>


<table width="100%">
 
    <tr>
        <td>
            <div class="about-div" >
                <table width="100%" dir="<%=Resources.Resource.dir%>">
                    <tr>
                       
                   
                        
                   
                        <td>
                       <style>
                       h2{cursor:pointer;font-size: 18px;}
                       </style>
                       <h2 id="b1"><%=Resources.Resource.what_are_we_offering%> </h2> 
                       <h2 id="b2"><%=Resources.Resource.how_do_you_create%>  </h2>
                       <h2 id="b3"><%=Resources.Resource.how_do_I_pay%> </h2>
                       <h2 id="b4"><%=Resources.Resource.do_I_need_to_upload%> </h2>
                       <h2 id="b5"><%=Resources.Resource.can_message_sent%> </h2>
                       <h2 id="b6"><%=Resources.Resource.how_create_message%> </h2>
                       <h2 id="b7"><%=Resources.Resource.what_kind_of_follow%> </h2>
                       
                       <h2 id="b9"><%=Resources.Resource.how_receive_receipt%>  </h2>
                       <h2 id="b10"><%=Resources.Resource.are_the_data_secure%></h2>



                       </td>
                        <td >
                            <div  class="about-icon about-NewMsg" style="cursor:default"></div>
                        </td>
                       </tr>
                       <tr>
                        <td colspan="2">
                        

 <div id="p1">
  <h3><%=Resources.Resource.what_are_we_offering%> </h3> 
<%=Resources.Resource.spix_is_a_website%></div>
      </div>              
<div id="p2">
 <h3><%=Resources.Resource.how_do_you_create%>   </h3>
<%=Resources.Resource.the_list_can_uploaded%>
</div>
  
                     
<div id="p3">
 <h3><%=Resources.Resource.how_do_I_pay%>  </h3>
<%=Resources.Resource.system_is_secure%>
   </div>
     
                     
   <div id="p4">
   <h3> <%=Resources.Resource.do_I_need_to_upload%> </h3>
<%=Resources.Resource.website_allows_manage_lists%> 
</div>
<div id="p5">
  <h3><%=Resources.Resource.can_message_sent%>   </h3>
                     <%=Resources.Resource.spix_allows_send_voice_messaged%>  
</div>
<div id="p6">
 <h3><%=Resources.Resource.how_create_message%>    </h3>
                     
<%=Resources.Resource.there_are_two_options%> 
</div>
<div id="p7">
  <h3><%=Resources.Resource.what_kind_of_follow%>  </h3>
                    
<%=Resources.Resource.spix_allows_you_follow%> 
</div>

   <div id="p9">
                       <h3> <%=Resources.Resource.how_receive_receipt%>  </h3>                     
<%=Resources.Resource.receipts_are_sent_by_email%> 
</div>
<div id="p10">
 <h3><%=Resources.Resource.are_the_data_secure%> </h3>
<%=Resources.Resource.website_is_protected%>
</div>


                        </td>
                       </tr>

                                          
                        </td>
                    </tr>
                </table>
            </div>
        </td>
           
    </tr>
     

    <tr>
        <td colspan="1" align="<%=Resources.Resource.align_opposite%>">
           <input style="float:<%=Resources.Resource.align_opposite%>;margin-left:30px" type="button" class="yellow-button" value="<%=Resources.Resource.to_registration%>" onclick="location.href='https://spix.co.il/register.aspx'"/>
           
        </td>
    </tr>
</table>

</asp:Content>