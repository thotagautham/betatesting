<%@ Page Title="" Language="VB" MasterPageFile="../../AdminBasePage.master" AutoEventWireup="false" Inherits="betatesting.Admin_NAdmin_cms_MenuManager" Codebehind="MenuManager.aspx.vb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse:collapse" bgcolor="#faf8ff">
        <tr>
            <td style=" padding : 25px 25px 25px 25px; ">
    <br />
 <table>
        <tr><td><strong><asp:Label ID="LblMsg" runat="server"></asp:Label></strong></td></tr>
        <tr class="RowStyle"><td><asp:DropDownList ID="DDLSection" runat="server" AutoPostBack="True">
        <asp:ListItem Value="0">-- Select Any Section --</asp:ListItem>
        <asp:ListItem Value="AboutGlobal">About Global</asp:ListItem>
        <asp:ListItem Value="ForPatients">For Patients</asp:ListItem>
        <asp:ListItem Value="ForDoctors">For Doctors</asp:ListItem>
        <asp:ListItem Value="KnowingCancer">Knowing Cancer</asp:ListItem>
        <asp:ListItem Value="TypesofCancer">Types of Cancer</asp:ListItem>
        <asp:ListItem Value="TherapiesTreatments">Therapies & Treatments</asp:ListItem>
        <asp:ListItem Value="DealingWithCancer">Dealing With Cancer</asp:ListItem>
        <asp:ListItem Value="AboutCancerCure">About Cancer Cure</asp:ListItem>
    </asp:DropDownList>
            </td></tr>
        <tr class="AlternateRowStyle"><td><strong>Select Any Page Listed Below And Click On The Respective Buttons</strong></td></tr>
        <tr><td>
        <table>
                    <tr class="RowStyle"><td><asp:Button ID="btnmoveup" runat="server" Text="Move Up" 
                            OnClientClick='return conf("Are You Sure You Want To Move Up");' 
                            onclick="btnmoveup_Click" /></td>
                            <td><asp:Button ID="btnmovedown" runat="server" Text="Move Down" 
                            OnClientClick='return conf("Are You Sure You Want To Move Down");' 
                            onclick="btnmovedown_Click" /></td>
                            <td><asp:Button ID="Delete" runat="server" Text="Delete" OnClientClick='return conf("Are You Sure You Want To Delete");' 
                            onclick="Delete_Click" />
                        </td>
                        <td><asp:Button ID="BtnShow" runat="server" Text="Show" 
                                OnClientClick='return conf("Are You Sure You Want To Show This Page In Menu");' onclick="BtnShow_Click" 
                             />
                        </td>
                        <td><asp:Button ID="BtnHide" runat="server" Text="Hide" 
                                OnClientClick='return conf("Are You Sure You Want To Hide This Page From Menu");' onclick="BtnHide_Click" 
                         />
                         <td><asp:Button ID="BtnShowURL" runat="server" Text="Show URL" 
                                 onclick="BtnShowURL_Click" />
                    </td>
                    </tr>    
                </table>
        </td></tr>
        <tr class="AlternateRowStyle">
            <td><asp:ListBox ID="LBPages" runat="server" Rows="15"></asp:ListBox></td>
            
        </tr>
        
    </table>
  
  
  
<br />
&nbsp;

</td>
        </tr>
    </table>
 </div>
    <script language="javascript">
        function conf(msg)
        {
            return confirm(msg);
        }
    </script>
</asp:Content>

