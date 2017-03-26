<%@ Page  Language="C#" MasterPageFile="~/MasterHeader.master" AutoEventWireup="true" CodeFile="package_site.aspx.cs" Inherits="package_site" %>
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
        if (obj.value == "<%=Resources.Resource.pass%>" || obj.value == "<%=Resources.Resource.validate_pass%>")
            obj.type = "password";
        if (obj.value == "<%=Resources.Resource.email%>" || obj.value == "<%=Resources.Resource.password%>" || obj.value == "<%=Resources.Resource.validate_password%>" || obj.value == "<%=Resources.Resource.enter_telephone_number%>")
            obj.value = "";
    }
    var master = "ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder2_";
    var allowed = false;
     function validateEmail(str) {

		        var at = "@"
		        var dot = "."
		        var lat = str.indexOf(at)
		        var lstr = str.length
		        var ldot = str.indexOf(dot)
		        if (str.indexOf(at) == -1) {
		            // alert("Invalid E-mail ID")
		            return false
		        }

		        if (str.indexOf(at) == -1 || str.indexOf(at) == 0 || str.indexOf(at) == lstr) {
		            //alert("Invalid E-mail ID")
		            return false
		        }

		        if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) {
		            // alert("Invalid E-mail ID")
		            return false
		        }

		        if (str.indexOf(at, (lat + 1)) != -1) {
		            // alert("Invalid E-mail ID")
		            return false
		        }

		        if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
		            // alert("Invalid E-mail ID")
		            return false
		        }

		        if (str.indexOf(dot, (lat + 2)) == -1) {
		            // alert("Invalid E-mail ID")
		            return false
		        }

		        if (str.indexOf(" ") != -1) {
		            //   alert("Invalid E-mail ID")
		            return false
		        }

		        return true

		    }
		    function validateLogin() {
            var mail = $("#" + master + "txt_mail").val();
            var name = $("#" + master + "txt_name").val();
            var tell = $("#" + master + "txt_tell").val();
            var company = $("#" + master + "txt_company").val();
            var subject=  $("#" + master + "txt_msg").val();
		            //return false;
					var ret=true;
		        if (mail == "") {
		            $("#DivErrorMail").slideDown();
		            $("#DivErrorMail").html("<%=Resources.Resource.enter_email%>");

		            ret=false;
                    if (subject==null)
                        ret=false;

		        }
		        else{
		            if (validateEmail(mail) == false) {
		                $("#DivErrorMail").slideDown();
		                 $("#DivErrorMail").html("<%=Resources.Resource.email_is_not_in_order%>");
		                ret=false;
		            }
                    else  $("#DivErrorMail").slideUp();
				}
				
				 if (subject == "")
                    {
		            $("#DivErrorMsgmsg").slideDown();
		             $("#DivErrorMsg").html("<%=Resources.Resource.message_content_empty%>");

		            ret=false;
				    }
                 else  $("#DivErrorMsgmsg").slideUp();
                  if (name == "")
                    {
		            $("#DivErrorMsgname").slideDown();
		            $("#DivErrorMsgname").html("<%=Resources.Resource.enter_name%>");

		            ret=false;
				    }
                   else  $("#DivErrorMsgname").slideUp();
                     if (tell == "")
                    {
		            $("#DivErrorMsgtell").slideDown();
		            $("#DivErrorMsgtell").html("<%=Resources.Resource.phone%>");

		            ret=false;
				    }
                    else  $("#DivErrorMsgtell").slideUp();
                    if (company == "")
                    {
		            $("#DivErrorMsgcompany").slideDown();
		            $("#DivErrorMsgcompany").html("<%=Resources.Resource.enter_company%>");

		            ret=false;
				    }
                    else  $("#DivErrorMsgcompany").slideUp();



				return ret;
		    
		    }
</script>

<div id="outer" style="margin-right: -83px;">
 <div class="divRegister">
        <table width="100%" border="0">
		           
            <tr >    
            
               <td>
                                       <asp:DataList ID="DataList1" runat="server"  RepeatDirection="Horizontal" RepeatLayout="Table"  >
                            <HeaderStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" VerticalAlign="Middle" />

                            <ItemStyle  />
        
                            <ItemTemplate>
                                <div   class="package-div"    align="center"  onclick="window.location='register.aspx'">
                                    <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="center" style="height:65px"">
                                                <asp:Label Font-Bold="true" CssClass="title-package" ID="lNamePackage" runat="server" Text='<%# Eval("namePackage") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><div class="line-package"></div></td>
                                        </tr>
                                        <tr style="background-image:url('images/design/top-content.png');height:28px">
                                            <td align="center">
                                               <asp:Label ID="lAmount" CssClass="numMsg"  runat="server" Text='<%# Eval("amount") %>'></asp:Label>
                                               <label  class="numMsg"><%=Resources.Resource.voice_messages%></label> 
                                             </td>
                                        </tr>
                                         <tr>
                                            <td><div class="line-package"></div></td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="height:150px">
                                                <asp:Label ID="lPrice" CssClass="textPrice" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                                                <label class="textPrice" style="font-weight:normal;font-size:28px">₪</label>
                                            </td>
                                        </tr>
                                        <tr><td><div class="shadow-box"></div></td></tr>
					                    <tr style="background-color:#ffffff;height:80px">
						                    <td align="center">
							                    <input type="button" class="buy-package" value="<%=Resources.Resource.purchase_now%>" />
						                    </td>
					                    </tr>
                                    </table>
				
                                     </div>    
                            </ItemTemplate>
        
                        <SelectedItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/payment.aspx?id=" +  Eval("id") %>'></asp:HyperLink>
                        </SelectedItemTemplate>
                            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        </asp:DataList>
                
                </td>
            
                
                <td align="left">
                    <asp:Panel  ID="panel1" runat="server" >
                    <table   style="border:none"  cellspacing="5">
						<tr>
							 <td class="divs-home-title" align ="center">
							<%=Resources.Resource.business_price_list%>	
							 </td>
						</tr>
                         <tr>
							 <td align ="center">
								 <asp:TextBox ID="txt_name" CssClass="tbRegister"  runat="server" ></asp:TextBox>
									 <div class="tberror" id="DivErrorMsgname" style ="display:none">
										</div>
							 </td>
						</tr>

						 <tr>
							 <td align ="center">
								 <asp:TextBox ID="txt_mail" CssClass="tbRegister"  runat="server" ></asp:TextBox>
									 <div class="tberror" id="Div1" style ="display:none">
										</div>
                                         <div class="tberror" id="DivErrorMail" style ="display:none;"></div>
							 </td>
						</tr>
      
      
						<tr>
						
							<td  align ="center">
								<asp:TextBox ID="txt_tell" CssClass="tbRegister" runat="server"   ></asp:TextBox>
									 <div class="tberror"  style ="display:none" id="DivErrorMsgtell">
								 <label id="Label4"></label>

								</div>
							</td>
						   
							
						</tr>
                        <tr>
						
							<td  align ="center">
								<asp:TextBox ID="txt_company" CssClass="tbRegister" runat="server"   ></asp:TextBox>
									   <div class="tberror" id="DivErrorMsgcompany" style ="display:none;"></div>
								 <label id="Label1"></label>

								</div>
							</td>
						   
							
						</tr>

                         <tr>
						
							<td  align ="center">
								<asp:TextBox ID="txt_msg"  CssClass="tbRegister" runat="server"   ></asp:TextBox>
									    <div class="tberror" id="DivErrorMsgmsg" style ="display:none;"></div>
								 <label id="Label2"></label>

								</div>
							</td>
						   
							
						</tr>
					  
     

     
     
						<tr>
					 	   <td align="<%=Resources.Resource.align_opposite%>" colspan="2" > 
							<asp:Button ID="register" CssClass="yellow-button" style="margin-top:7px" 
                                   runat="server"   OnClientClick="return validateLogin()" onclick="register_Click" 
												/>
											
							</td>
						</tr>
                       
                 </table>
	           </asp:Panel>
                </td>
                
            </tr>
        </table>
        </div>




  
    </div>

      

</asp:Content>