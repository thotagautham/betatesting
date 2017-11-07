<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-hhc/admininner.master" CodeBehind="default.aspx.vb" Inherits="betatesting._default31" %>

<%@ Register Src="~/ascx-hhc/admins/login.ascx" TagPrefix="uc1" TagName="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container">
    <uc1:login runat="server" id="login" />
    </div>
    
</asp:Content>
