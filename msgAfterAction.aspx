<%@ Page Title="" Language="C#" MasterPageFile="~/innerMaster.master" AutoEventWireup="true" CodeFile="msgAfterAction.aspx.cs" Inherits="msgAfterAction" %>
<%@ MasterType VirtualPath="~/innerMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <div   style="height:200px;padding-top:50px">
    <asp:Panel ID="pPostMsg" align="center" runat="server" Visible="false">
        <label class="msgAfterAction">ההודעה נשלחה בהצלחה!</label>

    </asp:Panel>
    <asp:Panel ID="pSaveMsg" align="center" runat="server" Visible="false">
        <label class="msgAfterAction">ההודעה נשמרה בהצלחה!</label>
        <br />
        <asp:Button ID="btnEditProject" CssClass="edit-send" style="margin-top: 20px;" Text="ערוך ושלח" runat="server" PostBackUrl="~/editProject.aspx" />
    </asp:Panel>
       <asp:Panel ID="pUpdate" align="center" runat="server" Visible="false">
        <label class="msgAfterAction">פרטיך עודכנו בהצלחה</label>
    </asp:Panel>
	<asp:Panel ID="P_aker" align="center" runat="server" Visible="false">
        <label class="msgAfterAction">אל תנסה להתחכם!!</label>
    </asp:Panel>
    <asp:Panel ID="PErrorSend" align="center" runat="server" Visible="false">
        <label class="msgAfterAction">זמן סיום לא יכול להיות גדול מזמן התחלה</label>
    </asp:Panel>
    <asp:Panel ID="pGetPayment" runat="server" Visible="false">
        <table width="99%">
			<tr>
				<td rowspan="2">
					<asp:Image ID="imgPackage" runat="server" ImageUrl="~/images/packages/coins-icon.png"/>
				</td>
				<td align="center">
						<label class="msgAfterAction">התשלום נקלט בהצלחה!</label>
				</td>
			</tr>
			<tr>
				<td align="center"><asp:Button ID="btnSeeMore" CssClass="yellow-button" style="width:115px" runat="server" PostBackUrl="~/dashboard.aspx" Text="עבור לחשבון שלי"/></td>
			</tr>
		</table>
	
        
		
    </asp:Panel>

	</div>
</asp:Content>

