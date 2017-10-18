<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/innerbasepage.master" CodeBehind="default.aspx.vb" Inherits="betatesting._default12" %>
<%@ Register TagName="team" TagPrefix="expertsteam" Src="~/expertsteam.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="metatagscontent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div>
        <table>
            <tr>
                <td> blog</td>
                <td>     </td>
                <td>  <div class="welcompagtext">
    <expertsteam:team runat="server" ID="team1" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
  </div>
   </td>

            </tr>

        </table>

    </div>
</asp:Content>