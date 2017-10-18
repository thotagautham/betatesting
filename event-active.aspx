<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="event-active.aspx.vb" Inherits="betatesting.event_active" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:GridView ID="gvprofile" runat="server"  ForeColor="Black" BorderStyle="Solid" 
                                BorderColor="#404040" AutoGenerateColumns="False" DataKeyNames="ChecnnaidataID" 
                                AllowPaging="True" PageSize="15" CssClass="table table-hover table-bordered table-responsive">
                                <RowStyle CssClass="GridRowStyle" />
                                <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                                <HeaderStyle CssClass="GridHeaderStyle" />
        <Columns>
            
            <asp:BoundField DataField="ChecnnaidataID" HeaderText="ID" ReadOnly="True" SortExpression="ChecnnaidataID" Visible="False" />
            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
            <asp:BoundField DataField="mobile" HeaderText="mobile" SortExpression="mobile" />
            <asp:BoundField DataField="description" HeaderText="description" 
                SortExpression="description" />
            <asp:BoundField DataField="Active" HeaderText="Active Status" />
           
            <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LnkBtnActiveStatus" runat="server" CausesValidation="false" 
                                CommandName="CmdActive" Text='<%# Eval("ACTIVE") %>' ></asp:LinkButton>
                            </ItemTemplate>
                    </asp:TemplateField>
        </Columns>
        <RowStyle Height="30px"></RowStyle>

<HeaderStyle BackColor="white" ForeColor="Black"></HeaderStyle>
    </asp:GridView>

        <asp:Label ID="filename" runat="server" Text="" Visible="False"></asp:Label>
      <asp:Label ID="fileId" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblSearchStr" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblGridDataSource" runat="server" Text="" Visible="False"></asp:Label>
    </div>
    </form>
</body>
</html>
