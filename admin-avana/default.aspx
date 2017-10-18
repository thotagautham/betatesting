<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-avana/innerbasepage.master" CodeBehind="default.aspx.vb" Inherits="betatesting._default21" %>

<%@ Register Src="~/avana-ascx/admin-login.ascx" TagPrefix="uc1" TagName="adminlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <uc1:adminlogin runat="server" id="adminlogin" />

</asp:Content>


