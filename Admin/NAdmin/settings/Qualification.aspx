<%@ Page Language="VB" MasterPageFile="../../AdminBasePage.master" AutoEventWireup="false" Inherits="betatesting.Admin_Settings_Qualification" title="Untitled Page" Codebehind="Qualification.aspx.vb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align=center>
    <asp:Label ID="LblMsg" runat="server"></asp:Label><br />
    <br />
    &nbsp;</div>
<div align=center>
    <asp:GridView ID="GridView1" runat="server"  ForeColor="Black" BorderStyle="Solid" BorderColor="#404040" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="QUALIFICATIONID" DataSourceID="DsQual">
        <Columns>
            <asp:TemplateField HeaderText="Qualification" SortExpression="QUALIFICATIONVAL">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="50" Text='<%# Bind("QUALIFICATIONVAL") %>'></asp:TextBox><asp:RequiredFieldValidator
                        ID="RFVQual" runat="server" ControlToValidate="TextBox1" Display="None" ErrorMessage="Qualification Should Not Be Empty"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                            ID="REVQual" runat="server" ControlToValidate="TextBox1" Display="None" ErrorMessage="Invalid Characters in Qualification"
                            ValidationExpression="[a-zA-Z .]*"></asp:RegularExpressionValidator><asp:ValidationSummary
                                ID="VSQual" runat="server" ShowMessageBox="True" ShowSummary="False" />
                    <br />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("QUALIFICATIONVAL") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Active" SortExpression="ACTIVE">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="1" Text='<%# Bind("ACTIVE") %>'></asp:TextBox><asp:RequiredFieldValidator
                        ID="REFActive" runat="server" ControlToValidate="TextBox2" Display="None" ErrorMessage="Active Status Should Not Be Empty"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                            ID="REVActive" runat="server" ControlToValidate="TextBox2" Display="None" ErrorMessage="Only [Y/N] is Allowed For Active Status"
                            ValidationExpression="[YNyn]*"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ACTIVE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
        </Columns>
        <RowStyle Height="30px"></RowStyle>

<HeaderStyle BackColor="#7c5ccb" ForeColor="White"></HeaderStyle>
    </asp:GridView>
    <asp:ObjectDataSource ID="DsQual" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllData" TypeName=" betatesting.DataSetCareTableAdapters.QUALIFICATIONTableAdapter"
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_QUALIFICATIONID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="QUALIFICATIONVAL" Type="String" />
            <asp:Parameter Name="ACTIVE" Type="String" />
            <asp:Parameter Name="Original_QUALIFICATIONID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="QUALIFICATIONVAL" Type="String" />
            <asp:Parameter Name="ACTIVE" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    </div>
</asp:Content>

