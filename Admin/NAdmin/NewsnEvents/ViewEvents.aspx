<%@ Page Language="VB" MasterPageFile="../../AdminBasePage.master" AutoEventWireup="false" Inherits="KimsHospitals.Admin_NAdmin_Miscellaneous_ViewEvents" title="Untitled Page" Codebehind="ViewEvents.aspx.vb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script language="javascript">

function DisplayMessage(s)
{
	window.open("MessageWindow.aspx?msgid="+s,"statuswin","top=" + screen.height + ",left=" + screen.width + ",toolbar=no,location=no,directories=no,status=no,menebar=no,resizable=no,width=400,height=110");
	return false;
	document.form.submit();
}

		</script>
		<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                          <ContentTemplate>
<TABLE width="100%"><TBODY><TR><td class="clstblnew" vAlign=middle align=center colSpan=2 height=25><asp:ImageButton id="imgBtnPrevious" runat="server" ToolTip="Previous Year" ImageUrl="~/Images/Left.gif"></asp:ImageButton> <asp:Label id="lblyear" CssClass="label" Runat="server" BackColor="Transparent" Width="50%"></asp:Label> <asp:ImageButton id="imgBtnNext" runat="server" ToolTip="Next Year" ImageUrl="~/Images/Right.gif"></asp:ImageButton> <asp:Label id="LblMonth" runat="server" Visible="False"></asp:Label> <asp:Label id="LblYr" runat="server" Visible="False"></asp:Label></td></TR><TR><td style="HEIGHT: 15px" vAlign=middle align=left colSpan=2><MARQUEE style="COLOR: navy" id="marMessage" scrollAmount=2><P>Move cursor over the dates in red to see the Event Title. Click the dates in Red to see the Description of the event.</P></MARQUEE></td></TR><TR><td align=center colSpan=2><asp:DataList id="DataList1" runat="server" BackColor="transparent" RepeatColumns="1" RepeatDirection="Horizontal"><ItemTemplate>
<asp:Calendar id="calmon" Height="300px" Runat="server" BackColor="White" Width="550px" ShowGridLines="True" BorderColor="black" ForeColor="Black" TitleFormat="Month" ShowNextPrevMonth="False" NextPrevFormat="ShortMonth" DayNameFormat="FirstLetter" Font-Size="35pt" Font-Names="Times New Roman" NextMonthText=" " PrevMonthText=" " SelectWeekText=" " VisibleDate='<%# Container.Dataitem("mon_name") %>' OnDayRender="caldayrender" __designer:wfdid="w4">
<SelectedDayStyle BackColor="#CC3333" ForeColor="White"></SelectedDayStyle>

<SelectorStyle BackColor="#CCCCCC" Width="1%" ForeColor="#333333" Font-Size="6pt" Font-Names="Verdana" Font-Bold="True"></SelectorStyle>

<DayStyle Width="12%"></DayStyle>

<OtherMonthDayStyle ForeColor="#999999"></OtherMonthDayStyle>

<NextPrevStyle ForeColor="White" Font-Size="6pt"></NextPrevStyle>

<DayHeaderStyle BackColor="#CCCCCC" Height="10px" ForeColor="#333333" Font-Size="7pt" Font-Names="Verdana" Font-Bold="True"></DayHeaderStyle>

<TitleStyle CssClass="clslabel" Font-Bold="True"></TitleStyle>
</asp:Calendar> 
</ItemTemplate>
</asp:DataList></td></TR></TBODY></TABLE>
</ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

