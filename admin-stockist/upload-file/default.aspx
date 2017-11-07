<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-stockist/stockistprofile.master" CodeBehind="default.aspx.vb" Inherits="betatesting._default39" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="btnImport" runat="server" Text="Import" OnClick="ImportExcel" />
        <hr />
       

         <asp:GridView ID="GvBannerImages" runat="server"  AllowPaging = "true"  >
        </asp:GridView>
    </div>
</asp:Content>