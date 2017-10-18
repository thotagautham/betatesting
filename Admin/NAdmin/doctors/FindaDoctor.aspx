<%@ Page Language="VB" MasterPageFile="../../AdminBasePage.master" AutoEventWireup="false" Inherits="KimsHospitals.Admin_NAdmin_Doctors_FindaDoctor" title="Untitled Page" Codebehind="FindaDoctor.aspx.vb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
<TABLE style="BORDER-COLLAPSE: collapse" cellSpacing=0 cellPadding=0 align=center border=1><TBODY><TR><td><TABLE cellSpacing=5 cellPadding=0 align=center><TBODY><TR><td style="HEIGHT: 19px; BACKGROUND-COLOR: #e9e9e9" class="boldgray" align=center colSpan=6>Find A Doctor</td></TR><TR><td vAlign=top>Country</td><td vAlign=top>:</td><td><asp:DropDownList id="Country" runat="server" AutoPostBack="True"><asp:ListItem Value="0">-- All --</asp:ListItem>
</asp:DropDownList></td><td>State</td><td>:</td><td><asp:DropDownList id="State" runat="server" AutoPostBack="True" OnSelectedIndexChanged="State_SelectedIndexChanged"><asp:ListItem Value="0">-- All --</asp:ListItem>
</asp:DropDownList></td></TR><TR><td>City</td><td>:</td><td><asp:DropDownList id="City" runat="server" AutoPostBack="True" OnSelectedIndexChanged="City_SelectedIndexChanged"><asp:ListItem Value="0">-- All --</asp:ListItem>
</asp:DropDownList></td><td>Branch</td><td>:</td><td><asp:DropDownList id="Branch" runat="server"><asp:ListItem Value="0">-- All --</asp:ListItem>
</asp:DropDownList></td></TR><TR><td align=center colSpan=6><BR />Select any [Country/State/City/Branch] and click on [Search] To Find A Doctor<BR /><BR /><asp:Button id="SearchByBranch" onclick="SearchByBranch_Click" runat="server" ValidationGroup="VGBranch" Text="Search"></asp:Button>&nbsp;&nbsp; <BR /></td></TR><TR><td style="HEIGHT: 1px" align=center bgColor=#e9e9e9 colSpan=6>&nbsp;</td></TR><TR><td>Disease/Problem</td><td>:</td><td><asp:DropDownList id="ddlDisease" runat="server"><asp:ListItem Value="0">-- All --</asp:ListItem>
</asp:DropDownList></td><td align=center colSpan=6><asp:Button id="SearchByDisease" onclick="SearchByDisease_Click" runat="server" ValidationGroup="VgDisease" Text="Search"></asp:Button>&nbsp;&nbsp; </td></TR><TR><td>Doctor Name</td><td>:</td><td><BR /><BR /><asp:ListBox id="LstDoctor" runat="server" DataSourceID="ObjDSDoctors" DataTextField="NAME" DataValueField="DOCTORID" __designer:wfdid="w8" Width="200px"></asp:ListBox> <cc1:ListSearchExtender id="LSE1" runat="server" TargetControlID="LstDoctor" PromptCssClass="ListSearchExtenderPrompt"></cc1:ListSearchExtender> <asp:ObjectDataSource id="ObjDSDoctors" runat="server" __designer:wfdid="w10" UpdateMethod="Update" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllActiveData" DeleteMethod="Delete" TypeName=" betatesting.DataSetCareTableAdapters.DOCTORSTableAdapter" InsertMethod="Insert"><DeleteParameters>
<asp:Parameter Type="Int32" Name="Original_DOCTORID"></asp:Parameter>
</DeleteParameters>
<UpdateParameters>
<asp:Parameter Type="String" Name="DOCTORCODE"></asp:Parameter>
<asp:Parameter Type="String" Name="SPECIALISATION"></asp:Parameter>
<asp:Parameter Type="String" Name="DEPARTMENT"></asp:Parameter>
<asp:Parameter Type="String" Name="QUALIFICATION"></asp:Parameter>
<asp:Parameter Type="Int32" Name="AGE"></asp:Parameter>
<asp:Parameter Type="String" Name="GENDER"></asp:Parameter>
<asp:Parameter Type="String" Name="ADDRESS"></asp:Parameter>
<asp:Parameter Type="Int32" Name="CITY"></asp:Parameter>
<asp:Parameter Type="Int32" Name="STATE"></asp:Parameter>
<asp:Parameter Type="Int32" Name="COUNTRY"></asp:Parameter>
<asp:Parameter Type="Int32" Name="ZIP"></asp:Parameter>
<asp:Parameter Type="String" Name="PADDRESS"></asp:Parameter>
<asp:Parameter Type="Int32" Name="PCITY"></asp:Parameter>
<asp:Parameter Type="Int32" Name="PSTATE"></asp:Parameter>
<asp:Parameter Type="Int32" Name="PCOUNTRY"></asp:Parameter>
<asp:Parameter Type="Int32" Name="PZIP"></asp:Parameter>
<asp:Parameter Type="Int32" Name="RESIDENCEPH"></asp:Parameter>
<asp:Parameter Type="Int32" Name="MOBILE"></asp:Parameter>
<asp:Parameter Type="Int32" Name="HOSPITALPH"></asp:Parameter>
<asp:Parameter Type="Int32" Name="HOSPITALPHEXT"></asp:Parameter>
<asp:Parameter Type="String" Name="EMAILID"></asp:Parameter>
<asp:Parameter Type="Int32" Name="ROOMINTEGER"></asp:Parameter>
<asp:Parameter Type="String" Name="ACTIVE"></asp:Parameter>
<asp:Parameter Type="String" Name="GRADE"></asp:Parameter>
<asp:Parameter Type="Int32" Name="BRANCH"></asp:Parameter>
<asp:Parameter Type="DateTime" Name="JOININGDATETIME"></asp:Parameter>
<asp:Parameter Type="String" Name="RELEIVINGDATETIME"></asp:Parameter>
<asp:Parameter Type="String" Name="PHOTO"></asp:Parameter>
<asp:Parameter Type="String" Name="PASSPORTINTEGER"></asp:Parameter>
<asp:Parameter Type="String" Name="PANNO"></asp:Parameter>
<asp:Parameter Type="String" Name="INSURANCECARDINTEGER"></asp:Parameter>
<asp:Parameter Type="Int32" Name="MAXPATIENTS"></asp:Parameter>
<asp:Parameter Type="String" Name="SURGEON"></asp:Parameter>
<asp:Parameter Type="String" Name="BILLINGSERVICECODE"></asp:Parameter>
<asp:Parameter Type="String" Name="SALUTATION"></asp:Parameter>
<asp:Parameter Type="String" Name="NAME"></asp:Parameter>
<asp:Parameter Type="String" Name="BLDGRP"></asp:Parameter>
<asp:Parameter Type="String" Name="BUILDING"></asp:Parameter>
<asp:Parameter Type="String" Name="FLOOR"></asp:Parameter>
<asp:Parameter Type="String" Name="DOCPWD"></asp:Parameter>
<asp:Parameter Type="Int32" Name="Section"></asp:Parameter>
<asp:Parameter Type="Int32" Name="SubSection"></asp:Parameter>
<asp:Parameter Type="Int32" Name="Original_DOCTORID"></asp:Parameter>
</UpdateParameters>
<InsertParameters>
<asp:Parameter Type="String" Name="DOCTORCODE"></asp:Parameter>
<asp:Parameter Type="String" Name="SPECIALISATION"></asp:Parameter>
<asp:Parameter Type="String" Name="DEPARTMENT"></asp:Parameter>
<asp:Parameter Type="String" Name="QUALIFICATION"></asp:Parameter>
<asp:Parameter Type="Int32" Name="AGE"></asp:Parameter>
<asp:Parameter Type="String" Name="GENDER"></asp:Parameter>
<asp:Parameter Type="String" Name="ADDRESS"></asp:Parameter>
<asp:Parameter Type="Int32" Name="CITY"></asp:Parameter>
<asp:Parameter Type="Int32" Name="STATE"></asp:Parameter>
<asp:Parameter Type="Int32" Name="COUNTRY"></asp:Parameter>
<asp:Parameter Type="Int32" Name="ZIP"></asp:Parameter>
<asp:Parameter Type="String" Name="PADDRESS"></asp:Parameter>
<asp:Parameter Type="Int32" Name="PCITY"></asp:Parameter>
<asp:Parameter Type="Int32" Name="PSTATE"></asp:Parameter>
<asp:Parameter Type="Int32" Name="PCOUNTRY"></asp:Parameter>
<asp:Parameter Type="Int32" Name="PZIP"></asp:Parameter>
<asp:Parameter Type="Int32" Name="RESIDENCEPH"></asp:Parameter>
<asp:Parameter Type="Int32" Name="MOBILE"></asp:Parameter>
<asp:Parameter Type="Int32" Name="HOSPITALPH"></asp:Parameter>
<asp:Parameter Type="Int32" Name="HOSPITALPHEXT"></asp:Parameter>
<asp:Parameter Type="String" Name="EMAILID"></asp:Parameter>
<asp:Parameter Type="Int32" Name="ROOMINTEGER"></asp:Parameter>
<asp:Parameter Type="String" Name="ACTIVE"></asp:Parameter>
<asp:Parameter Type="String" Name="GRADE"></asp:Parameter>
<asp:Parameter Type="Int32" Name="BRANCH"></asp:Parameter>
<asp:Parameter Type="DateTime" Name="JOININGDATETIME"></asp:Parameter>
<asp:Parameter Type="String" Name="RELEIVINGDATETIME"></asp:Parameter>
<asp:Parameter Type="String" Name="PHOTO"></asp:Parameter>
<asp:Parameter Type="String" Name="PASSPORTINTEGER"></asp:Parameter>
<asp:Parameter Type="String" Name="PANNO"></asp:Parameter>
<asp:Parameter Type="String" Name="INSURANCECARDINTEGER"></asp:Parameter>
<asp:Parameter Type="Int32" Name="MAXPATIENTS"></asp:Parameter>
<asp:Parameter Type="String" Name="SURGEON"></asp:Parameter>
<asp:Parameter Type="String" Name="BILLINGSERVICECODE"></asp:Parameter>
<asp:Parameter Type="String" Name="SALUTATION"></asp:Parameter>
<asp:Parameter Type="String" Name="NAME"></asp:Parameter>
<asp:Parameter Type="String" Name="BLDGRP"></asp:Parameter>
<asp:Parameter Type="String" Name="BUILDING"></asp:Parameter>
<asp:Parameter Type="String" Name="FLOOR"></asp:Parameter>
<asp:Parameter Type="String" Name="DOCPWD"></asp:Parameter>
<asp:Parameter Type="Int32" Name="Section"></asp:Parameter>
<asp:Parameter Type="Int32" Name="SubSection"></asp:Parameter>
</InsertParameters>
</asp:ObjectDataSource> </td><td align=center colSpan=6><asp:Button id="SearchByName" onclick="SearchByName_Click" runat="server" ValidationGroup="VGName" Text="Search"></asp:Button>&nbsp;<BR />&nbsp; <asp:RequiredFieldValidator id="RFVDoctor" runat="server" ValidationGroup="VGName" __designer:wfdid="w11" ErrorMessage="Select Any Doctor" ControlToValidate="LstDoctor" Display="Dynamic"></asp:RequiredFieldValidator></td></TR></TBODY></TABLE></td></TR></TBODY></TABLE><BR /><DIV align=center><asp:Label id="LblMsg" runat="server"></asp:Label></DIV><BR /><DIV align=center><asp:GridView id="GVDoctors" runat="server"></asp:GridView></DIV>
</ContentTemplate>

                   </asp:UpdatePanel>
</asp:Content>

