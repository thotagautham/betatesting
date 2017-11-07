<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="states.aspx.vb" Inherits="betatesting.states" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>GridView with RadioButtons</title>
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
</head>
<body>
    <form id="form1" runat="server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods = "true">
        </asp:ScriptManager>
    <div>
         <asp:GridView ID="GridView1" runat="server"  HeaderStyle-CssClass = "header"
    AutoGenerateColumns = "false" Font-Names = "Arial"  OnPageIndexChanging = "OnPaging"
    Font-Size = "11pt" AlternatingRowStyle-BackColor = "#C2D69B" AllowPaging = "true">
<AlternatingRowStyle BackColor="#C2D69B"></AlternatingRowStyle>
    <Columns>
    <asp:TemplateField>
       <ItemTemplate>
             <asp:RadioButton ID="RadioButton1" runat="server"   OnCheckedChanged="RadioButton1_CheckedChanged" AutoPostBack="True"/>
           <asp:HiddenField ID="HiddenField1" runat="server" Value = '<%#Eval("STATENAME")%>' />
       </ItemTemplate> 
    </asp:TemplateField> 
    <asp:BoundField ItemStyle-Width="150px" DataField="STATENAME" HeaderText="STATENAME"  >
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
    <asp:BoundField ItemStyle-Width="150px" DataField="COUNTRYID" HeaderText="COUNTRYID" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
    <asp:BoundField ItemStyle-Width="150px" DataField="ACTIVE" HeaderText="ACTIVE">
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
    </Columns> 

<HeaderStyle CssClass="header"></HeaderStyle>
    </asp:GridView>
    </div>


      
            <asp:TextBox ID="txtContactsSearch" runat="server" AutoPostBack="true" CausesValidation="True"></asp:TextBox>
        <cc1:AutoCompleteExtender ServiceMethod="SearchCustomers" MinimumPrefixLength="2"
            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10" TargetControlID="txtContactsSearch"
            ID="AutoCompleteExtender1" runat="server" FirstRowSelected = "false" >
        </cc1:AutoCompleteExtender>
            
            <asp:Button ID="Button1" runat="server" Text="Button" />

            <div>
        </div>
     
    </form>
</body>
</html>

