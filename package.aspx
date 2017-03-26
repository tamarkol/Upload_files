<%@ Page Title="Spix - Packages" Language="C#" MasterPageFile="~/innerMaster.master" AutoEventWireup="true" CodeFile="package.aspx.cs" Inherits="package" %>
<%@ MasterType VirtualPath="~/innerMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>--%>
 <%--   <link href="css/slider.css" rel="stylesheet" type="text/css" />--%>
  <%--   <script src="js/easypaginate.js" type="text/javascript"></script> --%>

  <asp:DataList ID="DataList1" runat="server"  RepeatDirection="Horizontal" RepeatLayout="Table"  >
        <HeaderStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" VerticalAlign="Middle" />
        <%--<HeaderTemplate > חבילות הודעות</HeaderTemplate>--%>
        <ItemStyle  />
        
        <ItemTemplate>
            <div   class="package-div"    align="center"   
               
                onclick="window.location='payment.aspx?id=<%# Eval("id") %>'">
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
                           <label  class="numMsg"><%=Resources.Resource.voice_messages%> </label> 
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
            <asp:HyperLink runat="server" NavigateUrl='<%# "~/payment.aspx?id=" +  Eval("id") %>'></asp:HyperLink>
        </SelectedItemTemplate>
        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
	

<%--

<%--    <asp:BulletedList runat="server" ID="listPackage">
   
 
</asp:BulletedList>--%>

<%--  <ol id="pagination">
        <li class="prev" style="display: none;">Previous</li>
        <li  data-index="1" class="current">1</li>
        <li data-index="2">2</li>
        <li data-index="3">3</li>
        <li data-index="4">4</li>
        <li class="next">next</li>
    </ol>--%>
	
</asp:Content>

