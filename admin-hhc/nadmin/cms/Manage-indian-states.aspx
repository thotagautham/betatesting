<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-hhc/adminbasepage.master" CodeBehind="Manage-indian-states.aspx.vb" Inherits="betatesting.Manage_indian_states" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script type = "text/javascript">
        function RadioCheck(rb) {
            var gv = document.getElementById("<%=GridView1.ClientID%>");
             var rbs = gv.getElementsByTagName("input");

             var row = rb.parentNode.parentNode;
             for (var i = 0; i < rbs.length; i++) {
                 if (rbs[i].type == "radio") {
                     if (rbs[i].checked && rbs[i] != rb) {
                         rbs[i].checked = false;
                         break;
                     }
                 }
             }
         }
    </script>
    
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:GridView ID="GridView1" runat="server"  HeaderStyle-CssClass = "header"
    AutoGenerateColumns = "false" Font-Names = "Arial"  OnPageIndexChanging = "OnPaging"
    Font-Size = "11pt" AlternatingRowStyle-BackColor = "#C2D69B" AllowPaging = "true">
    <Columns>
    <asp:TemplateField>
       <ItemTemplate>
           <asp:RadioButton ID="RadioButton1" runat="server"  onclick = "RadioCheck(this);"/>
           <asp:HiddenField ID="HiddenField1" runat="server" Value = '<%#Eval("STATENAME")%>' />
       </ItemTemplate> 
    </asp:TemplateField> 
    <asp:BoundField ItemStyle-Width="150px" DataField="STATENAME" HeaderText="STATENAME"  />
    <asp:BoundField ItemStyle-Width="150px" DataField="COUNTRYID" HeaderText="COUNTRYID" />
    <asp:BoundField ItemStyle-Width="150px" DataField="ACTIVE" HeaderText="ACTIVE"/>
    </Columns> 
    </asp:GridView>




</asp:Content>
