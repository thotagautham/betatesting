<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-stockist/innebasepage.master" CodeBehind="upload-file.aspx.vb" Inherits="betatesting.uploaf_file" %>



<asp:Content ID="Content1" ContentPlaceHolderID="NavigationPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">


    <div>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="btnImport" runat="server" Text="Import" OnClick="ImportExcel" />
        <hr />
       

         <asp:GridView ID="GvBannerImages" runat="server"  AllowPaging = "true"  >
        </asp:GridView>
    </div>


   


</asp:Content>
